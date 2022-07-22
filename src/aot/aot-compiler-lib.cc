
#include "aot-compiler-lib.hpp"
#include "../cast.h" // cast
#include "src/interp/interp.h"
#include "env/AOTLoadStoreDriver.hpp"
#include <iostream>
#include <math.h>   // for relocating math functions
#include <unistd.h> // F_OK, access

#ifndef WASM_SHARED_CACHE // This basically is only used in ELF-enabled runtime
int wabt::aot::WABTAOTCompilerLib::build_type = 0;
int wabt::aot::WABTAOTCompilerLib::no_of_modules = 1;
int wabt::aot::WABTAOTCompilerLib::shouldReEmitELF = 0;
#endif
namespace wabt
   {
namespace aot
   {
int WABTAOTCompilerLib::registeredImportsOnce = 0;
void WABTAOTCompilerLib::getCompiledFunction(const char *name, void (**fn)())
   {
   *fn = reinterpret_cast<void (*)()>(getCodeEntry(const_cast<char *>(name)));
   }

void WABTAOTCompilerLib::registerModuleNameForAOT(const char *module_filename, DefinedModule *module)
   {
   std::string module_name(module_filename);
   module->name = module_name.substr(module_name.find_last_of('/') + 1, module_name.find_last_of('.') - module_name.find_last_of('/') - 1);
   }

int WABTAOTCompilerLib::approximateFirstFunctionInAModule(interp::Environment &env, unsigned int Index)
   {
   unsigned int moduleIndex = 0;
   unsigned int exportsSoFar = -1;
   int result = 0;
   /* First part - compute module index */
   int currentModule = getModuleIndexByFunctionIndex(env, Index);
   /* After computing module index, go back and compute stuff*/
   for (moduleIndex = 0; moduleIndex < currentModule; moduleIndex++)
      {
      auto allExports = env.GetModule(moduleIndex)->exports;
      for (unsigned int i = 0; i < allExports.size(); i++)
         {
         if (allExports.at(i).kind == ExternalKind::Func)
            {
            result += 1;
            }
         }
      }
   return result;
   }

void WABTAOTCompilerLib::preSetCodeEntries(wabt::interp::Executor *executor, wabt::interp::Thread *thread)
   {

   if (thread == nullptr)
      {
      if (executor != nullptr)
         {
         thread = &(executor->thread_);
         }
      else
         {
         printf("Both thread and executor are null\n");
         exit(-1);
         }
      }
   wabt::interp::Environment &env(*thread->env_);
   /** Setting utility functions */
   setCodeEntry("trapWith", reinterpret_cast<void *>(trapWith));
   double (*sqr)(double) = sqrt;
   setCodeEntry("sqrt", reinterpret_cast<void *>(sqr));
   setCodeEntry("sqrtf", reinterpret_cast<void *>(sqrtf));
   double (*cpsign)(double, double) = copysign;
   setCodeEntry("copysign", reinterpret_cast<void *>(cpsign));
   setCodeEntry("copysignf", reinterpret_cast<void *>(copysignf));
   setCodeEntry("GrowMem", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::GrowMemory));
   setCodeEntry("MemSize", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::CalculateMemorySize));
   setCodeEntry("CallIndi", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::AOTCallIndirectHelper));
   uint8_t *ptr = reinterpret_cast<uint8_t *>(&(thread->value_stack_top_));
   uint8_t *pptr = reinterpret_cast<uint8_t *>(malloc(sizeof(void *)));
   memcpy(pptr, &ptr, sizeof(void *));

   setCodeEntry("vstop", pptr);
   ptr = reinterpret_cast<uint8_t *>(thread->value_stack_.data());
   pptr = reinterpret_cast<uint8_t *>(malloc(sizeof(void *)));
   memcpy(pptr, &ptr, sizeof(void *));
   setCodeEntry("vsdata", pptr);

   // Setting up global variables to be available for relocations
   Value **globals = (Value**)malloc(sizeof(Value*)*env.GetGlobalCount());
   std::vector<std::string> global_names;
   for (int i = 0; i < env.GetGlobalCount(); i++)
      {
      globals[i] = (Value*)malloc(sizeof(Value*));
      auto tmp = &env.GetGlobal(i)->typed_value.value;
      memcpy(globals+i,&tmp,sizeof(Value*));

      char *global_name = (char *)calloc(6, sizeof(char));
      sprintf(global_name, "g%d", i);
      global_names.emplace_back(global_name);
      setCodeEntry(global_name, reinterpret_cast<void *>(globals[i]));
      global_name = NULL;
      }

   // Setting up memories to be avaliable for relocations
   env.FillMemories();
   char *memory_name;
   for (unsigned int i = 0; i < env.GetMemoryCount(); i++)
      {
      memory_name = (char *)calloc(6, sizeof(char));
      sprintf(memory_name, "m%d", i);
      // global_names.emplace_back(global_name);
      setCodeEntry(memory_name, reinterpret_cast<void *>(env.GetMems() + i));
      memory_name = NULL;
      }

   setCodeEntry(const_cast<char *>("Params"), reinterpret_cast<void *>(&env.indirectCallParams));
   }

TR::AOTLoadStoreDriver* WABTAOTCompilerLib::_loadStoreDriver = NULL;

void WABTAOTCompilerLib::setLoadStoreDriver(TR::AOTLoadStoreDriver* driver){
   WABTAOTCompilerLib::_loadStoreDriver = driver;
}

TR::AOTLoadStoreDriver* WABTAOTCompilerLib::getLoadStoreDriver(){
   return WABTAOTCompilerLib::_loadStoreDriver;
}

int WABTAOTCompilerLib::getModuleIndexByFunctionIndex(wabt::interp::Environment &env, unsigned int Index)
   {
   unsigned int moduleIndex = 0;
   unsigned int exportsSoFar = -1;
   int result = 0;
   for (moduleIndex = 0; moduleIndex < env.GetModuleCount(); moduleIndex++)
      {
      auto allExports = env.GetModule(moduleIndex)->exports;
      // Functions are sometimes not exported, accessible by GetFunc i guess?
      // Either I need to assign debug names in every variation of the runtime (including bin/wasm-interp)
      // OR I need to enable TryAOT only in the AOT-enabled runtimes

      // If it is the module in which we are working, we might need  DefinedMoudle instead (although not
      // much more information added??)
      // auto allFunctions = cast<DefinedModule>(env.GetModule(moduleIndex))->funcs;
      // As there are multiple export kinds (tables, functions, memories, need only count functions)

      for (unsigned int i = 0; i < allExports.size(); i++)
         {
         if (allExports.at(i).kind == ExternalKind::Func)
            {
            exportsSoFar += 1;
            result = moduleIndex;
            // This function might be imprecise in case there are two modules and the first has one export
            // and multiple local functions, and we are compiling a non-exported function
            if (exportsSoFar > Index)
               {
               result = moduleIndex - 1;
               break;
               }
            if (exportsSoFar == Index)
               {

               break;
               }
            }
         }
      }
   return result;
   }

void WABTAOTCompilerLib::relocateAOT(interp::Environment &env, DefinedModule *module)
   {
   setCodeEntry("trapWith", reinterpret_cast<void *>(trapWith));
   setCodeEntry("CallIndi", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::AOTCallIndirectHelper));
   setCodeEntry("GrowMem", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::GrowMemory));
   setCodeEntry("MemSize", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::CalculateMemorySize));
   setCodeEntry("PrintSt", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::PrintSomething));
   // setCodeEntry("fd_write",reinterpret_cast<void*>(printaa));
   setCodeEntry("__lock", reinterpret_cast<void *>(1));
   setCodeEntry("__unlock", reinterpret_cast<void *>(1));
   setCodeEntry("emscripten_memcpy_big", reinterpret_cast<void *>(1));
   setCodeEntry("emscripten_resize_heap", reinterpret_cast<void *>(1));
   setCodeEntry("setTempRet0", reinterpret_cast<void *>(1));
   setCodeEntry("memory", reinterpret_cast<void *>(1));
   setCodeEntry("table", reinterpret_cast<void *>(1));
   // setCodeEntry("emscript",reinterpret_cast<void*>(clus));
   setCodeEntry("setTempR", reinterpret_cast<void *>(1));
   setCodeEntry("Popcount", reinterpret_cast<void *>(static_cast<int (*)(unsigned)>(wabt::Popcount)));
   setCodeEntry("Popcountll", reinterpret_cast<void *>(static_cast<int (*)(unsigned long long)>(wabt::Popcount)));
   // setCodeEntry("args_siz",reinterpret_cast<void*>(args_size_get));
   // setCodeEntry("args_get",reinterpret_cast<void*>(args_get));
   // setCodeEntry("proc_exi",reinterpret_cast<void*>(clus));
   // setCodeEntry("fd_seek",reinterpret_cast<void*>(seek));
   // setCodeEntry("fd_close",reinterpret_cast<void*>(clos));
   // setCodeEntry("funpr",reinterpret_cast<void*>(funpr));
   // setCodeEntry("gettimeo",reinterpret_cast<void*>(gettimeod));
   // for(Index i = 0; i < func_count; ++i) {
   //   if(env.GetFunc(i)->is_host) {
   //     setCodeEntry()
   //   }
   // }
   // setCodeEntry(const_cast<char*>(env.GetFunc(0)->dbg_name_.data()),reinterpret_cast<void*>(print));
   // setCodeEntry(const_cast<char*>(env.GetFunc(1)->dbg_name_.data()),reinterpret_cast<void*>(print1));
   // setCodeEntry("print1",reinterpret_cast<void*>(print1));
   /*for(int i=0;i<env.GetFuncCount();i++){
     interp::Func *func = env.GetFunc(i);
     if(func->is_host){
       void *handle = dlopen("libc.so.6",RTLD_LAZY);
       if(!handle){
         std::cerr<<"Cannot open libc!"<<"\n";
         exit(-1);
       }
       void *cfunc = dlsym(handle,func->dbg_name_.c_str());
       if(!cfunc){
         std::cerr<<"Cannot find "<<func->dbg_name_<<"\n";
         exit(-1);
       }
       setCodeEntry(const_cast<char*>(func->dbg_name_.data()),cfunc);
     }
     }*/

   // uint16_t compiled_function_index = 0;
   for (Index i = 0; i < module->aot_compiled_functions.size(); ++i)
      {
      // if(!env.GetFunc(i)->is_host) {
      if (module->aot_compiled_functions[i])
         {
         auto *fn = static_cast<DefinedFunc *>(module->funcs[i]);
         relocateCodeEntry(const_cast<char *>(fn->dbg_name_.c_str()));
         // compiled_function_index++;
         }
      // }
      }
   }

void WABTAOTCompilerLib::compileEverything(interp::Environment &env, wabt::aot::AOTManager &aotManager, DefinedModule *module)
   {
   auto func_count = env.GetFuncCount();
   int someFunctionsCompiled = 0;

   for (Index i = 0; i < func_count; ++i)
      {

      if (!env.GetFunc(i)->is_compiled && !env.GetFunc(i)->is_host)
         {
         auto *fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i));
         auto &builder = aotManager.getFB(fn->offset);
         void *function = nullptr;
         char *functionNameSpace = (char *)calloc(fn->dbg_name_.size() + 1, sizeof(char));
         memcpy(functionNameSpace, fn->dbg_name_.c_str(), fn->dbg_name_.size());
         function = getCodeEntry(functionNameSpace);
         if (!function)
            {
            someFunctionsCompiled = 1;
            internal_compileMethodBuilder(&builder, &function);
            storeCodeEntry(functionNameSpace);
            function = getCodeEntry(functionNameSpace);
            assert(function != NULL);
            }
         // free(functionNameSpace);
         module->aot_compiled_functions.push_back(function);
         env.GetFunc(i)->is_compiled = true;
         }
      }
#ifndef WASM_SHARED_CACHE
   if (someFunctionsCompiled == 1)
      {
      shouldReEmitELF = 1;
      }
   else
      {
      shouldReEmitELF = 0;
      }
#endif
   }

void WABTAOTCompilerLib::registerMethods(wabt::aot::AOTManager &aotManager, interp::Environment &env, DefinedModule *module, char *filename, interp::Thread &thread)
   {
   using namespace wabt::aot;

   auto func_count = env.GetFuncCount();
   env.FillMemories();
   int j = 0;
   for (int i = 0; i < func_count; ++i)
      {
      auto functionInQuestion = env.GetFunc(i);
      if (functionInQuestion->is_compiled == false && functionInQuestion->is_host == false)
         {
         auto *fn = dynamic_cast<wabt::interp::DefinedFunc *>(env.GetFunc(i));
         AOTTypeDictionary *types = new (PERSISTENT_NEW) AOTTypeDictionary();
         // static AOTTypeDictionary types;
         std::string name = "f" + std::to_string(i + env.getOffsetForAOTFunctionNaming()) + "m" + module->name.substr(0, 3);
         AOTFunctionBuilder *builder = new (PERSISTENT_NEW) AOTFunctionBuilder(&thread, fn,
                                                                               std::move(name),
                                                                               types,
                                                                               env, aotManager);

         aotManager.push_back_FB(fn->offset, builder, types);

         env.GetFunc(i)->dbg_name_ = "f" + std::to_string(i + env.getOffsetForAOTFunctionNaming()) + "m" + module->name.substr(0, 3);
         //** Trying to assign debug name, might be problematic if that's an import **/
         reinterpret_cast<DefinedFunc *>(env.GetFunc(i))->dbg_name_ = "f" + std::to_string(i + env.getOffsetForAOTFunctionNaming()) + "m" + module->name.substr(0, 3);
         module->funcs.emplace_back(env.GetFunc(i));
         }
      else
         {
         registerAllImports(aotManager, env);
         // aotManager.push_back_import(env.GetFunc(i)->dbg_name_,env.GetFunc(i));
         }
      }

   aotManager.broadcastNames();
   aotManager.broadcastImports();
   module->aot_compiled_functions.reserve(func_count);
   auto module_func_count = module->funcs.size();
   }
/**
 * @brief Now should be called after reading the binary: no matter how many
 * emscripten entries we support, we want to index only the ones that we actuallly
 * imported
 * @param aotManager
 * @param env
 */
void WABTAOTCompilerLib::registerAllImports(wabt::aot::AOTManager &aotManager, interp::Environment &env)
   {
   auto func_count = env.GetFuncCount();
   if (registeredImportsOnce == 0)
      {
      /* By design, it can be called multiple times. Maybe need to change the bad design */
      for (Index i = 0; i < func_count; ++i)
         {
         auto functionInQuestion = env.GetFunc(i);
         if (!(functionInQuestion->is_compiled == false && functionInQuestion->is_host == false))
            {
            for (int ii = 0; ii < env.GetModuleCount(); ii++)
               {
               for (int j = 0; j < env.GetModule(ii)->exports.size(); j++)
                  {
                  if (env.GetModule(ii)->exports[j].kind == wabt::ExternalKind::Func && env.GetModule(ii)->exports[j].index == i)
                     {
                     env.GetFunc(i)->dbg_name_ = env.GetModule(ii)->exports[j].name;
                     // Consider if this call should only be made on the IMPORT CALLBACK in binary-reader interp
                     // AOTMeta::offsetForDefinedFunctions++;
                     env.addToOffsetForDefinedFunctions();
                     }
                  }
               }
            }
         }
      registeredImportsOnce = 1;
      }
   /* Consider adding this as many AOT managers might need it
   else
   {
      aotManager.push_back_import(env.GetFunc(i)->dbg_name_,env.GetFunc(i));
   }
   */
   /** This code was before I started working on the code */
   // for(Index j = 0;j<env.GetModuleCount();j++){
   //   for(auto exp:env.GetModule(j)->exports){
   //     if(!exp.name.compare(dynamic_cast<HostFunc*>(env.GetFunc(i))->field_name)){
   //       aotManager.push_back_import("f" + std::to_string(exp.index) +"m"+env.GetModule(j)->name.substr(0,3),env.GetFunc(i));
   //       env.GetFunc(i)->dbg_name_ = "f" + std::to_string(exp.index) +"m"+env.GetModule(j)->name.substr(0,3),env.GetFunc(i);
   //     }
   //   }
   // }
   }
#ifndef WASM_SHARED_CACHE

void WABTAOTCompilerLib::loadELFToMemory(const char *moduleFilename)
   {

   char *soFilename = WABTAOTCompilerLib::getSOFilename(const_cast<char *>(moduleFilename));
   if (access(static_cast<const char *>(soFilename), F_OK) == 0)
      {
      loadFileInMemory(soFilename);
      WABTAOTCompilerLib::build_type = 1;
      }
   }

void WABTAOTCompilerLib::createELFFile(const char *moduleFilename)
   {
   // TODO: make sure the values are properly set
   if (build_type != 1 || shouldReEmitELF == 1)
      {
      if (no_of_modules == 1)
         {
         char *soFilename = WABTAOTCompilerLib::getSOFilename(const_cast<char *>(moduleFilename));
         storeCodeEntries(soFilename);
         }
      else
         {
         char *soFilename = "wasmaot.so";
         storeCodeEntries(soFilename);
         }
      }
   }
char *WABTAOTCompilerLib::getSOFilename(char *filename)
   {
   size_t last_dot = 0, last_dot_flag = 0, last_path = 0, last_path_flag = 0;
   for (int i = strlen(filename); i >= 0; i--)
      {
      if (filename[i] == '.' && last_dot_flag == 0)
         {
         last_dot = i;
         last_dot_flag++;
         }
      if (filename[i] == '/' && last_path_flag == 0)
         {
         last_path = i + 1;
         last_path_flag++;
         }
      if (last_dot_flag == 1 && last_path_flag == 1)
         break;
      }
   size_t lenFilename = last_dot - last_path;
   char *substr = (char *)malloc(lenFilename + 1);
   strncpy(substr, filename + last_path, lenFilename);
   substr[lenFilename] = '\0';
   char *so = ".so";
   char *soFilename = (char *)malloc(1 + strlen(substr) + strlen(so));
   strcpy(soFilename, substr);
   strcat(soFilename, so);
   char *pre = "./";
   char *slashFilename = static_cast<char *>(malloc(1 + strlen(soFilename) + strlen(pre)));
   strcpy(slashFilename, pre);
   strcat(slashFilename, soFilename);
   free(soFilename);
   return slashFilename;
   }
#endif // ifndef WASM_SHARED_CACHE
   }   // namespace aot
   }   // namespace wabt