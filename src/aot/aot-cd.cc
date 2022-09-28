#include "../common.h" // for ReadFile, DataOrNull.

#include "../binary-reader.h"
#include "../cast.h"
#include "../error-formatter.h"
#include "../feature.h"
#include "../interp/binary-reader-interp.h"

#include "../em-interp/em-module.hpp"
#include "../literal.h"
#include "../option-parser.h"
#include "../resolve-names.h"
#include "../stream.h"
#include "../validator.h"
#include "../wast-lexer.h"
#include "../wast-parser.h"

#include "aot-compiler-lib.hpp"
#include "aot-function-builder.h"
#include "aot-manager.h"
#include "aot-type-dictionary.h"
#include "trap-with.h"

#include <algorithm>
#include <dlfcn.h>
#include <iomanip> // for the precision, for testing purposes
#include <iostream>
#include <math.h>
#include <memory>
#include <string>
#include <time.h>
#include <unistd.h>

int realArgc;
char **realArgv;
using namespace wabt;
using namespace wabt::interp;
/*
 public:
class WasmInterpHostImportDelegate : public HostImportDelegate {
  wabt::Result ImportFunc(interp::FuncImport* import,
                          interp::Func* func,
                          interp::FuncSignature* func_sig,
                          const ErrorCallback& callback) override {
    if (import->field_name!="") {
      cast<HostFunc>(func)->callback = PrintCallback;
      return wabt::Result::Ok;
    } else {

      return wabt::Result::Error;
    }
  }

  wabt::Result ImportTable(interp::TableImport* import,
                           interp::Table* table,
                           const ErrorCallback& callback) override {
    return wabt::Result::Error;
  }

  wabt::Result ImportMemory(interp::MemoryImport* import,
                            interp::Memory* memory,
                            const ErrorCallback& callback) override {
    return wabt::Result::Error;
  }

  wabt::Result ImportGlobal(interp::GlobalImport* import,
                            interp::Global* global,
                            const ErrorCallback& callback) override {
    return wabt::Result::Error;
  }

 private:
  static interp::Result PrintCallback(const HostFunc* func,
                                      const interp::FuncSignature* sig,
                                      Index num_args,
                                      TypedValue* args,
                                      Index num_results,
                                      TypedValue* out_results,
                                      void* user_data) {
    memset(out_results, 0, sizeof(TypedValue) * num_results);
    for (Index i = 0; i < num_results; ++i)
      out_results[i].type = sig->result_types[i];

    TypedValues vec_args(args, args + num_args);
    TypedValues vec_results(out_results, out_results + num_results);

    printf("called host ");

    return interp::Result::Ok;
  }

  void PrintError(const ErrorCallback& callback, const char* format, ...) {
    WABT_SNPRINTF_ALLOCA(buffer, length, format);
    callback(buffer);
  }
};*/

extern int32_t internal_compileMethodBuilder(TR::MethodBuilder *methodBuilder, void **entryPoint);

int numOfArgs;
char **args_arr;

static std::unique_ptr<FileStream> s_stdout_stream;
static std::unique_ptr<FileStream> s_log_stream;

static interp::Result PrintCallback(const HostFunc *func,
                                    const interp::FuncSignature *sig,
                                    const TypedValues &args,
                                    TypedValues &results)
   {
   printf("called host ");
   WriteCall(s_stdout_stream.get(), func->module_name, func->field_name, args,
             results, interp::Result::Ok);
   return interp::Result::Ok;
   }

// from wasm-interp.cc in wasmjit-omr/src/tools.
static wabt::Result ReadModule(const char *module_filename,
                               Environment *env,
                               Errors *errors,
                               DefinedModule **out_module)
   {
   wabt::Result result;
   std::vector<uint8_t> file_data;

   // HostModule *host_module = env->AppendHostModule("host");
   // host_module->on_unknown_func_export =
   //     [](Environment *env, HostModule *host_module, string_view name,
   //        Index sig_index) -> Index
   // {
   //    if (name != "")
   //       {
   //       std::pair<HostFunc *, Index> pair =
   //           host_module->AppendFuncExport(name, sig_index, PrintCallback);
   //       return pair.second;
   //       }

   //    return kInvalidIndex;
   // };

   // HostModule *wasi = env->AppendHostModule("wasi_unstable");
   // wasi->on_unknown_func_export =
   //     [](Environment *env, HostModule *host_module, string_view name,
   //        Index sig_index) -> Index
   // {
   //    if (name != "")
   //       {
   //       std::pair<HostFunc *, Index> pair =
   //           host_module->AppendFuncExport(name, sig_index, PrintCallback);
   //       return pair.second;
   //       }

   //    return kInvalidIndex;
   // };

   // HostModule *envi = env->AppendHostModule("env");
   // envi->on_unknown_func_export =
   //     [](Environment *env, HostModule *host_module, string_view name,
   //        Index sig_index) -> Index
   // {
   //    if (name != "")
   //       {
   //       std::pair<HostFunc *, Index> pair =
   //           host_module->AppendFuncExport(name, sig_index, PrintCallback);
   //       return pair.second;
   //       }

   //    return kInvalidIndex;
   // };

   // envi->on_unknown_export =
   //     [](Environment *env, HostModule *module, string_view name, ExternalKind kind)
   //     -> Index
   // {
   //    if (name != "")
   //       {

   //       switch (kind)
   //          {
   //       case ExternalKind::Memory:
   //          {
   //          auto pair = module->AppendMemoryExport(name, Limits(256, 256));
   //          return pair.second;
   //          }
   //       case ExternalKind::Table:
   //          {
   //          auto pair = module->AppendTableExport(name, Type::Funcref, Limits(6));
   //          return pair.second;
   //          }
   //          }
   //       }

   //    return kInvalidIndex;
   // };

   // *out_module = nullptr;

   result = ReadFile(module_filename, &file_data);
   if (Succeeded(result))
      {
      const bool kReadDebugNames = true;
      const bool kStopOnFirstError = true;
      const bool kFailOnCustomSectionError = true;

      Features s_features;
      ReadBinaryOptions options(s_features, s_log_stream.get(), kReadDebugNames,
                                kStopOnFirstError, kFailOnCustomSectionError);
      result = ReadBinaryInterp(env, file_data.data(), file_data.size(),
                                options, errors, out_module);
      /*
          if (Succeeded(result)) {
            if (s_verbose) {
              env->DisassembleModule(s_stdout_stream.get(), out_module);
            }
          }*/
      }
   return result;
   }

int compileAOT(interp::Environment &env, DefinedModule *module, char *filename)
   {
   using namespace wabt::aot;
   AOTManager aotManager;
   interp::Thread thread(&env);
   WABTAOTCompilerLib::registerMethods(aotManager, env, module, filename, thread);
   auto func_count = env.GetFuncCount();
   int flag = 0;
   for (Index i = 0; i < func_count; ++i)
      {

      if (!env.GetFunc(i)->is_compiled)
         {
         auto *fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i));
         auto &builder = aotManager.getFB(fn->offset);
         void *function = nullptr;
         function = getCodeEntry(const_cast<char *>(fn->dbg_name_.c_str()));
         if (!function)
            {
            flag = 1;
            internal_compileMethodBuilder(&builder, &function);
            storeCodeEntry((char *)fn->dbg_name_.c_str());
            function = getCodeEntry(const_cast<char *>(fn->dbg_name_.c_str()));
            assert(function != NULL);
            }
         module->aot_compiled_functions.push_back(function);
         env.GetFunc(i)->is_compiled = true;
         }
      }
   if (flag == 1)
      {
      return 2;
      }
   else
      {
      return 0;
      }
   }

// void preSetCodeEntries(){
//    setCodeEntry("trapWith", reinterpret_cast<void *>(trapWith));
//    double (*sqr)(double) = sqrt;
//    setCodeEntry("sqrt", reinterpret_cast<void *>(sqr));
//    double (*cpsign)(double, double) = copysign;
//    setCodeEntry("copysign", reinterpret_cast<void *>(cpsign));
//    setCodeEntry("sqrtf", reinterpret_cast<void *>(sqrtf));
//    setCodeEntry("copysignf", reinterpret_cast<void *>(copysignf));
//    setCodeEntry("CallIndi", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::AOTCallIndirectHelper));
//    setCodeEntry("GrowMem", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::GrowMemory));
//    setCodeEntry("MemSize", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::CalculateMemorySize));
//    setCodeEntry("PrintSt", reinterpret_cast<void *>(wabt::aot::AOTFunctionBuilder::PrintSomething));
//    setCodeEntry("fd_write", reinterpret_cast<void *>(printaa));
//    setCodeEntry("__lock", reinterpret_cast<void *>(1));
//    setCodeEntry("__unlock", reinterpret_cast<void *>(1));
//    setCodeEntry("emscripten_memcpy_big", reinterpret_cast<void *>(1));
//    setCodeEntry("emscripten_resize_heap", reinterpret_cast<void *>(1));
//    setCodeEntry("setTempRet0", reinterpret_cast<void *>(1));
//    setCodeEntry("memory", reinterpret_cast<void *>(1));
//    setCodeEntry("table", reinterpret_cast<void *>(1));
//    setCodeEntry("emscript", reinterpret_cast<void *>(clus));
//    setCodeEntry("setTempR", reinterpret_cast<void *>(1));
//    setCodeEntry("Popcount", reinterpret_cast<void *>(static_cast<int (*)(unsigned)>(wabt::Popcount)));
//    setCodeEntry("Popcountll", reinterpret_cast<void *>(static_cast<int (*)(unsigned long long)>(wabt::Popcount)));
//    setCodeEntry("args_siz", reinterpret_cast<void *>(args_size_get));
//    setCodeEntry("args_get", reinterpret_cast<void *>(args_get));
//    setCodeEntry("proc_exi", reinterpret_cast<void *>(clus));
//    setCodeEntry("fd_seek", reinterpret_cast<void *>(seek));
//    setCodeEntry("fd_close", reinterpret_cast<void *>(clos));
//    setCodeEntry("funpr", reinterpret_cast<void *>(funpr));
//    setCodeEntry("gettimeo", reinterpret_cast<void *>(gettimeod));
// }
void relocateAOT(interp::Environment &env, DefinedModule *module)
   {
   auto func_count = env.GetFuncCount();
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
   Value *globals = new Value[env.GetGlobalCount()]();
   std::vector<std::string> global_names;
   for (int i = 0; i < env.GetGlobalCount(); i++)
      {
      globals[i] = env.GetGlobal(i)->typed_value.value;
      char *global_name = (char *)calloc(6, sizeof(char));
      sprintf(global_name, "g%d", i);
      global_names.emplace_back(global_name);
      setCodeEntry(global_name, reinterpret_cast<void *>(globals + i));
      global_name = NULL;
      }
   env.FillMemories();
   char *memory_name = (char *)calloc(6, sizeof(char));
   for (unsigned int i = 0; i < env.GetMemoryCount(); i++)
      {
      sprintf(memory_name, "m%d", i);
      // global_names.emplace_back(global_name);
      setCodeEntry(memory_name, reinterpret_cast<void *>(env.GetMems() + i));
      memory_name = NULL;
      }
   setCodeEntry(const_cast<char *>("Params"), reinterpret_cast<void *>(&env.indirectCallParams));
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

void runExports(interp::Environment &env, DefinedModule *module, int run_all_exports)
   {
   if (run_all_exports == 1)
      std::cout << std::setprecision(6) << std::fixed;
   for (auto exported : module->exports)
      {
      if (exported.kind != ExternalKind::Func)
         {
         continue;
         }
      std::string index = std::to_string(exported.index);
      std::string funcname = reinterpret_cast<DefinedFunc *>(env.GetFunc(exported.index))->dbg_name_;
      // std::cout<<"Funcname is:"<<funcname<<std::endl;
      void *fn = nullptr;
      if (run_all_exports != 1)
         if (exported.name != "_start")
            continue;

      for (uint32_t i = 0; i < module->funcs.size(); i++)
         {
         if (!funcname.compare(module->funcs[i]->dbg_name_))
            {
            fn = module->aot_compiled_functions[i];
            break;
            }
         if (!funcname.compare(reinterpret_cast<DefinedFunc *>(module->funcs[i])->dbg_name_))
            {
            fn = module->aot_compiled_functions[i];
            break;
            }
         }

      // void *fun = module->compiled_functions[exported.index];
      if (env.GetFuncSignature(env.GetFunc(exported.index)->sig_index)->result_types.size())
         {
         if (env.GetFuncSignature(env.GetFunc(exported.index)->sig_index)->result_types.front() == Type::F32)
            {
            float a = reinterpret_cast<float (*)()>(fn)();
            std::cout << exported.name << "() => f32:" << a << "\n";
            }
         else if (env.GetFuncSignature(env.GetFunc(exported.index)->sig_index)->result_types.front() == Type::F64)
            {
            std::cout << std::setprecision(6) << std::fixed;
            double a = reinterpret_cast<double (*)()>(fn)();
            std::cout << exported.name << "() => f64:" << a << "\n";
            }
         else if (env.GetFuncSignature(env.GetFunc(exported.index)->sig_index)->result_types.front() == Type::I32)
            {
            uint32_t a = reinterpret_cast<uint64_t (*)()>(fn)();
            std::cout << exported.name << "() => i32:" << a << "\n";
            }
         else
            {
            uint64_t a = reinterpret_cast<uint64_t (*)()>(fn)();
            std::cout << exported.name << "() => i64:" << a << "\n";
            }
         }
      else
         {
         reinterpret_cast<void (*)()>(fn)();
         }
      }
   }

void registerModules(std::string module_name, Environment *env)
   {
   // env->AppendHostModule(module.substr(0,module.find(".")))->import_delegate.reset(new WasmInterpHostImportDelegate());
   DefinedModule *module = new DefinedModule();
   module->name = module_name.substr(module_name.find_last_of('/') + 1, module_name.find_last_of('.') - module_name.find_last_of('/') - 1);
   // module->name = module_name.substr(0,module_name.find_last_of('.'));
   // module->name = module_name;//.substr(module_name.find_last_of('/')+1,3);
   env->AppendDefModule(module);
   }

int main(int argc, char **argv)
   {
   if (argc < 2)
      {
      std::cout << "usage: wabtaot <filename>\n";
      return -1;
      }
   // TODO rewrite using the infrastructure
   int run_all_exports = 0;
   std::vector<std::string> module_names;
   if (argc >= 2)
      {
      for (int i = 0; i < argc; i++)
         {
         std::string last_argument(argv[i]);
         if (last_argument.substr(last_argument.find_last_of(".") + 1) == "wasm")
            {
            module_names.push_back(last_argument);
            }
         if (last_argument.compare("--run-all-exports") == 0)
            {
            run_all_exports = 1;
            }
         }
      }
   numOfArgs = argc - 1;
   args_arr = argv;

   Environment env;
   s_stdout_stream = FileStream::CreateStdout();
   s_log_stream = nullptr;
   wabt::Result compile_result;
   AppendEmscriptenModule(&env);
   /** Adding emscripten adds two modules, should count them in */
   module_names.emplace(module_names.begin(), "wasi_unstable");
   module_names.emplace(module_names.begin(), "env");
   
   uint32_t no_of_modules =  module_names.size();
   for (uint32_t i = 2; i < no_of_modules; i++)
      {
      registerModules(module_names[i], &env);
      }
   envPointer = &env;
   wabt::aot::WABTAOTCompilerLib compilerLib = wabt::aot::WABTAOTCompilerLib();
   char *src_filename;

   uint32_t build_type = 0;
#ifndef WASM_SHARED_CACHE
   /** Adding emscripten adds two modules, hence affects value of i */
   if (no_of_modules > 3)
      {

      char *soFilename = "./wasmaot.so";
      if (access(static_cast<const char *>(soFilename), F_OK) == 0)
         {
         /** The load wasmaot.so (multiple files into memory)
          * was not tested after introducing WABTAOTCompilerLib
          */
         wabt::aot::WABTAOTCompilerLib::loadELFToMemory(soFilename);
         build_type = 1;
         }
      }
#endif
   /** Adding emscripten adds two modules, hence affects value of i */
   for (uint32_t i = 2; i < no_of_modules; i++)
      {
      src_filename = (char*) calloc(sizeof(char),module_names[i].length()+1);
      strcpy(src_filename,module_names[i].c_str());
#ifndef WASM_SHARED_CACHE
      if (no_of_modules == 3) /* One plus two added by including emscripten */
         {
         wabt::aot::WABTAOTCompilerLib::getSOFilename(src_filename);
         wabt::aot::WABTAOTCompilerLib::loadELFToMemory(src_filename);
         }
#endif

      DefinedModule *module = nullptr; // new DefinedModule();
      // ErrorHandlerFile error_handler(Location::Type::Binary);
      Errors errors;
      module = dynamic_cast<DefinedModule *>(env.GetModule(i));
      wabt::Result result = ReadModule(src_filename, &env, &errors, &module);

      if (Succeeded(result))
         {
         wabt::aot::AOTManager aotManager;
         interp::Thread thread(&env);
         wabt::aot::WABTAOTCompilerLib::preSetCodeEntries(nullptr,&thread);
         wabt::aot::WABTAOTCompilerLib::registerMethods(aotManager, env, module, const_cast<char *>(src_filename), thread);
         wabt::aot::WABTAOTCompilerLib::compileEverything(env, aotManager, module);
         }
      else
         {
         std::cout << "read failure\n";
         }
      }

   /** Adding emscripten adds two modules, hence affects value of i */
   for (uint32_t i = 2; i < no_of_modules; i++)
      {
      wabt::aot::WABTAOTCompilerLib::relocateAOT(env, dynamic_cast<DefinedModule *>(env.GetModule(i)));
      }
   /** Adding emscripten adds two modules, hence affects value of i */
   for (uint32_t i = 2; i < no_of_modules; i++)
      {
      runExports(env, dynamic_cast<DefinedModule *>(env.GetModule(i)), run_all_exports);
      }

#ifndef WASM_SHARED_CACHE
   wabt::aot::WABTAOTCompilerLib::createELFFile(src_filename);
#endif
   }
