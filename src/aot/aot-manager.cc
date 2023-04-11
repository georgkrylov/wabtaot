#include "aot-manager.h"
#include "aot-compiler-lib.hpp"
#include "aot-function-builder.h"
#include "env/AOTLoadStoreDriver.hpp"
#include "env/AOTMethodHeader.hpp"
#include "src/aot/StaticAnalyzer.hpp"
#include "src/jit/environment.h"
void wabt::aot::AOTManager::broadcastNames()
   {
   for (auto &builder_kv : func_index_)
      {
      for (auto &inner_kv : func_index_)
         {
         auto &builder_fn = builder_kv.second.first;
         std::string const &funcName = builder_fn->getName();
         inner_kv.second.first->defineFunction(funcName,
                                               builder_fn->getFn());
         }
      }
   }

void wabt::aot::AOTManager::defineExternalFunctionToJit(std::string const funcName, unsigned int index)
   {
   for (auto &builder_kv : func_index_)
      {
      for (auto &inner_kv : func_index_)
         {
         inner_kv.second.first->defineFunction(funcName, reinterpret_cast<DefinedFunc *>(envPointer->GetFunc(index)));
         }
      }
   }
void wabt::aot::AOTManager::setFunctionThatManagerWasCreatedFor(unsigned int funcIndex)
   {
   _indexOfAFuncStartedAOTManager = funcIndex;
   }

unsigned int wabt::aot::AOTManager::getFunctionThatManagerWasCreatedFor()
   {
   return _indexOfAFuncStartedAOTManager;
   }

void wabt::aot::AOTManager::broadcastImports()
   {
   for (auto &builder : func_index_)
      {
      for (auto &import : import_index_)
         {
         builder.second.first->defineImportFunction(import.first, import.second);
         }
      }
   }

bool wabt::aot::AOTManager::AOTGetCompiledFunction(wabt::interp::Environment *env, wabt::Index ind)
   {
   Func *func = env->GetFunc(ind);

   if (!func->is_loaded)
      {
      /** General Idea Maybe should cache values of the function previously being compiled or previously
       * being loaded in the AOTMethodHeader? */
      if (!func->is_compiled)
         {
         DefinedFunc *fn = reinterpret_cast<DefinedFunc *>(func);
         if (strcmp(func->dbg_name_.c_str(), "???") == 0)
            {
            /** If the function is not loaded, try loading it*/
            std::string name;
            WABTAOTCompilerLib::generateFunctionName(env, ind, name);

            fn->dbg_name_ = name;
            func->dbg_name_ = name;
            }
         void *function = NULL;
         function = getCodeEntry(const_cast<char *>(func->dbg_name_.c_str()));
         if (function == NULL)
            {
            /** The function was NOT previously compiled names are set*/
            return false;
            }
         else
            {
            fn->is_compiled = true;
            func->is_compiled = true;
            /** The function was compiled just now, names are set*/
            fn->aot_fn_ = reinterpret_cast<wabt::interp::AOTedFunction>(function);
            return true;
            }
         }
      else
         {
         /** The function was previously compiled and retreived, names are set*/
         return true;
         }
      }
   else
      {
      /** The function was compiled and loaded, names are set*/
      return true;
      }
   }

int wabt::aot::AOTManager::CheckDependenciesCompiled(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *func, interp::Thread *t)
   {
   TR::AOTMethodHeader *header = _loadStoreDriver->getRegisteredAOTMethodHeader(func->dbg_name_.c_str());

   /** 0 -yes, should fail, 1 - we're good to load */
   int shouldFailCheck = 0;
   if (std::find(visited_this_traversal.begin(), visited_this_traversal.end(), ind) != visited_this_traversal.end())
      return 1;
   char *thisFuncName = header->getMethodName();
   visited_this_traversal.emplace_back(ind);
   if (header != NULL)
      {
      /** Naively trying to check if dependencies are compiled */
      unsigned int dependenciesMaxSize = header->getDependenciesArraySize();
      unsigned int *dependenciesArray = header->getDependenciesArray();
      shouldFailCheck = 1;

      if (header->dependenciesCompiled == 1)
         {
         return 0;
         }
      else if (header->dependenciesCompiled == 0)
         {
         for (unsigned int i = 0; i < dependenciesMaxSize; i++)
            {
            /* to prevent stack overflow traversing the methods that depend on one another
             * visited_this_traversal.emplace_back(dependenciesArray[i]);
             * there should be like a find too
             */

            Func *func = (env->GetFunc(dependenciesArray[i]));
            if (func->is_host)
               {
               continue;
               }
            if (func->is_compiled == false)
               {
               /** Need to do that, maybe it was not fetched just yet, but compiled before */
               bool loadingResult = AOTGetCompiledFunction(env, dependenciesArray[i]);
               if (func->is_compiled == false)
                  {
                  /* dependencies were not compiled */
                  /* is this store operation necessary tho */
                  char *fn_name = strdup(func->dbg_name_.c_str());
                  _loadStoreDriver->storeHeaderForCompiledMethod(fn_name);
                  // /* to prevent further traversal from this thing*/
                  header->dependenciesCompiled = 1;
                  return 0;
                  }
               else if (func->is_loaded == true)
                  {
                  return 1;
                  }
               else if (func->is_loaded == false && func->is_compiled == true)
                  {
                  DefinedFunc *funcc = reinterpret_cast<DefinedFunc *>(env->GetFunc(dependenciesArray[i]));
                  if (CheckDependenciesCompiled(env, dependenciesArray[i], funcc, t) == 0)
                     return 0;
                  shouldFailCheck &= 1;
                  }
               }
            else
               {
               if (func->is_loaded == false && func->is_compiled == true)
                  {
                  /** When a method is compiled we know its dependencies */
                  /** Idea here is to add for loading only if the dependencies are not compiled */
                  DefinedFunc *funcc = reinterpret_cast<DefinedFunc *>(env->GetFunc(dependenciesArray[i]));
                  if (CheckDependenciesCompiled(env, dependenciesArray[i], funcc, t) == 0)
                     return 0;
                  shouldFailCheck &= 1;
                  }
               }
            }
         }
      }

#ifndef WASM_SHARED_CACHE // This is an ELF-enabled runtime
   // TODO verify if should set it here and or somewhere else?
   if (shouldFailCheck == 1)
      {
      WABTAOTCompilerLib::shouldReEmitELF = 1;
      }
#endif

   return shouldFailCheck;
   }

bool wabt::aot::AOTManager::AOTLoadAFunction(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::Thread *t)
   {
   if (_loadStoreDriver == NULL)
      {
      _loadStoreDriver = reinterpret_cast<TR::AOTLoadStoreDriver *>(getLoadStoreDriver());
      WABTAOTCompilerLib::setLoadStoreDriver(_loadStoreDriver);
      visited_this_traversal.clear();
      }
   AOTGetCompiledFunction(env, ind);
   Func *func = (env->GetFunc(ind));
   DefinedFunc *fn = reinterpret_cast<DefinedFunc *>(func);
   if (!func->is_loaded)
      {
      /** General Idea Maybe should cache values of the function previously being compiled or previously
       * being loaded in the AOTMethodHeader? */
      if (func->is_compiled) /* was able to find a compiled code for the function */
         {
         // if (std::find(visited_this_traversal.begin(),visited_this_traversal.end(),ind) == visited_this_traversal.end())

         if (CheckDependenciesCompiled(env, ind, fn, t) != 0) /* This if statement could possibly contain compilation strategies???*/
            {
            /** This section is a loop checking that we loaded all
             * the functions we traversed, in the case of when we first compiled all of the methods
             * that have circular dependencies, can be a separate function
             * */
            bool loadingResult = true;
            for (auto it = visited_this_traversal.begin(); it < visited_this_traversal.end(); it++)
               {
               int next_index = *it;
               loadingResult &= AOTGetCompiledFunction(env, next_index);
               }
            /** Should not ever be false, as checking dependencies will fail*/
            if (loadingResult == false)
               return false;
            for (auto it = visited_this_traversal.begin(); it < visited_this_traversal.end(); it++)
               {
               auto fn = env->GetFunc(*it);
               _loadStoreDriver->relocateRegisteredMethod(const_cast<char *>(fn->dbg_name_.c_str()));
               fn->is_loaded = true;
               }
            visited_this_traversal.clear();

            /** Function was loaded now, also meaning all the dependencies were resolved*/
            return true;
            }
         }
      else
         {
         /** We have assumed we need to load a function that wasn't even compiled*/
         /** How come?*/
         visited_this_traversal.erase(std::remove(visited_this_traversal.begin(), visited_this_traversal.end(), ind), visited_this_traversal.end());
         return false;
         }
      }
   else
      {
      bool loadingResult = true;
      /** Function was loaded before, meaning all the dependencies are resolved?*/

      return loadingResult;
      }
   /** Reached in the case when function was not compiled, or the dependencies are not compiled  */
   return false;
   };

void *wabt::aot::AOTManager::AOTCompileAFunction(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *fn, wabt::interp::Thread *t)
   {
   if (env->aot_compile_all == false)
      {
      return AOTCompileAFunctionUsingDependencies(env, ind, fn, t);
      }
   }

void *wabt::aot::AOTManager::AOTCompileAFunctionUsingDependencies(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *fn, wabt::interp::Thread *t)
   {
   /** If we haven't acquired a LoadStoreDriver yet */
   if (_loadStoreDriver == NULL)
      {
      _loadStoreDriver = reinterpret_cast<TR::AOTLoadStoreDriver *>(getLoadStoreDriver());
      WABTAOTCompilerLib::setLoadStoreDriver(_loadStoreDriver);
      WABTAOTCompilerLib::envPointer = env;
      visited_this_traversal.clear();
      }
   if (envPointer == NULL)
      {
      envPointer = env;
      }
   Func *func = (env->GetFunc(ind));

   if (!func->is_loaded && fn->jit_fn_==nullptr)
      {
      /** First, try loading a function, the result of the function is ignored **/

      TR::AOTMethodHeader *header = _loadStoreDriver->getRegisteredAOTMethodHeader(fn->dbg_name_.c_str());
      if (header == NULL)
         {
         _loadStoreDriver->createAndRegisterAOTMethodHeader(fn->dbg_name_.c_str(), NULL, 0, NULL, 0);
         _loadStoreDriver->storeHeaderForCompiledMethod(fn->dbg_name_.c_str());
         header = _loadStoreDriver->getRegisteredAOTMethodHeader(fn->dbg_name_.c_str());
         }
      if (header->isDependenciesScanned() == false && env->enable_aot_analysis)
         {
         wabt::aot::StaticAnalyzer::ForwardPassForCalls(this, env, ind, t);
         _loadStoreDriver->storeHeaderForCompiledMethod(fn->dbg_name_.c_str());
         }
      if (header->isCompilationSupported() == false)
         {
         return NULL;
         }
      bool loadingResult = AOTGetCompiledFunction(env, ind);
      if (func->is_compiled == false && func->is_host == false)
         {
         /**Have to call this because it creates function builders
          * within aot manager at appropriate offset
          * Some things may be cached by not recreating AOTManagers, huh?
          */
         visited_this_traversal.clear();
         if (CheckDependenciesCompiled(env, ind, fn, t) != 0 || (env->aot_resolved_to_load) )
            {
            CreateAndDefineBuilder(env, ind, fn, t);
            /** This could be an idea for a compilation queue -it is a queue after all */
            /** Questionable, if I should fail check, do I try to define?
             * Yes for rtl, but not for rtc?
             * TODO FIX ME
             */
            unsigned int dependenciesMaxSize = header->getDependenciesArraySize();
            unsigned int *dependenciesArray = header->getDependenciesArray();
            if (header->getCompiledCodeSize() == 0)
               {
               for (unsigned int i = 0; i < dependenciesMaxSize; i++)
                  {
                  DefinedFunc *depFn = reinterpret_cast<DefinedFunc *>(envPointer->GetFunc(dependenciesArray[i]));
                  header->dependenciesCompiled = 0;
                  CreateAndDefineBuilder(env, dependenciesArray[i], depFn, t);
                  Func *fn = envPointer->GetFunc(dependenciesArray[i]);
                  char *fn_name2;

                  fn_name2 = strdup(depFn->dbg_name_.c_str());
                  defineExternalFunctionToJit(fn_name2, dependenciesArray[i]);
                  }
               }

            /** If the function was not compiled, then try compiling it*/
            auto &builder = this->getFB(fn->offset);
            void *function = nullptr;
            internal_compileMethodBuilder(&builder, &function);

#ifndef WASM_SHARED_CACHE // This is an ELF-enabled runtime
            // TODO verify if should set it here and or somewhere else?
            WABTAOTCompilerLib::shouldReEmitELF = 1;
#endif
            if (function == NULL)
               {                                                                      /* was not able to compile, for example the dependencies were not resolved */
               _loadStoreDriver->storeHeaderForCompiledMethod(fn->dbg_name_.c_str()); /* Update the dependencies */
               /** in the version where we do not fail compilation when dependencies are
                * not resolved, should be unreachable.
                * If it reaches here, check if dependenciesCompiled is not cached
                */
               return NULL;
               }
            else /* compilation was a success */
               {
               /** This line is necessary as the memory in the OMR method to method header
                * map is not managed by std::string, and to be able to do a lookup by key,
                * we need to have the memory allocated longer than the original string exists
                */
               char *fn_name = strdup(fn->dbg_name_.c_str());
               /** An optimization, in the case we compiled a method, we can try loading the method, right?
                */
               TR::AOTMethodHeader *header = _loadStoreDriver->getRegisteredAOTMethodHeader(fn->dbg_name_.c_str());
               header->dependenciesCompiled = 0;
               /* store the compiled function and header */
               storeCodeEntry(fn_name);
               AOTGetCompiledFunction(env, ind);
               /** If need to generate an entry point */
               if (this->needsEntryPointGeneration == true)
                  {
                  CompileEntryFunction(env, ind, fn, t);
                  }
               }
            }
         }
      if (func->is_compiled == true && fn->jit_fn_==nullptr)
         {
         /** If function is compiled (either before or just now)*/
         visited_this_traversal.clear();
         /* try loading the function */
         loadingResult = AOTLoadAFunction(env, ind, t);

         fn->entry_fn_ = reinterpret_cast<wabt::interp::AOTedFunction>(fn);
         if (this->needsEntryPointGeneration == true)
            {
            // FOR AOT-ENTRY and JIT compatibility
            if (fn->tried_jit_ == true)
               {
               return NULL;
               }
            char *entryPointName = WABTAOTCompilerLib::generateEntryPointName(fn);
            void *entryFunction = getCodeEntry(entryPointName);
            bool loadingResult = AOTGetCompiledFunction(env, ind);
            _loadStoreDriver->relocateRegisteredMethod(entryPointName);
            /** Created a separate entry for entry function */
            fn->entry_fn_ = reinterpret_cast<wabt::interp::AOTedFunction>(entryFunction);
            }
         }
      }
   else
      {
      /*The function was loaded*/
      return NULL;
      }
   }
wabt::aot::AOTTypeDictionary *wabt::aot::AOTManager::types_ = NULL;

void wabt::aot::AOTManager::CreateAndDefineBuilder(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *fn, wabt::interp::Thread *t)
   {
   /**This line is used to construct debug name, limited to 8 symbols as relocation infrastructure does not
    * support longer names
    */
   std::string name;
   if (!fn->is_host)
      {
      if (strcmp(fn->dbg_name_.c_str(), "???") == 0)
         {
         std::string name;
         WABTAOTCompilerLib::generateFunctionName(env, ind, name);
         fn->dbg_name_ = name;
         }
      }
   WABTAOTCompilerLib::generateFunctionName(env, ind, name);
   if (types_ == NULL)
      {
      types_ = new (PERSISTENT_NEW) AOTTypeDictionary();
      }
   AOTFunctionBuilder *thisbuilder = new (PERSISTENT_NEW) AOTFunctionBuilder(t, fn,
                                                                             std::move(name),
                                                                             types_,
                                                                             *env, *this);

   this->push_back_FB(fn->offset, thisbuilder, types_);
   }

void wabt::aot::AOTManager::CompileEntryFunction(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *fn, wabt::interp::Thread *t)
   {
   void *entryFunction = nullptr;
   char *entryPointName = WABTAOTCompilerLib::generateEntryPointName(fn);
   char *entryPointNameForString = strdup(entryPointName);
   std::string entryFunctionNameForBuilder = std::string(entryPointNameForString);
   entryFunction = getCodeEntry(entryPointName);
   if (!entryFunction) /* was not able to load the function */
      {
      /**
       * @brief Create a function builder for the entry point. Probably need
       * to separate it to an individual function, as this code appears in
       * many places
       */
      AOTFunctionBuilder *entryBuilder = new (PERSISTENT_NEW) AOTFunctionBuilder(t, fn,
                                                                                 std::move(entryFunctionNameForBuilder),
                                                                                 types_,
                                                                                 *env, *this, true);
      internal_compileMethodBuilder(entryBuilder, &entryFunction);
      /* was not able to compile the entry point, for example the dependencies were not resolved */
      assert(entryFunction != NULL);
      /* compilation was a success */
      char *fn_name = strdup(entryPointName);
      /* store the compiled function */
      storeCodeEntry(fn_name);
      /* load the function, to double check it was actually stored */
      entryFunction = getCodeEntry(entryPointName);
      assert(entryFunction != NULL);
      }
   }