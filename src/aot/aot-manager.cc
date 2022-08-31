#include "aot-manager.h"
#include "aot-compiler-lib.hpp"
#include "aot-function-builder.h"
#include "env/AOTLoadStoreDriver.hpp"
#include "env/AOTMethodHeader.hpp"
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

// void wabt::aot::AOTManager::defineExternalFunctionToJit(std::string const funcName, void *Function)
//    {
//    for (auto &builder_kv : func_index_)
//       {
//       for (auto &inner_kv : func_index_)
//          {
//          inner_kv.second.first->defineFunction(funcName, Function);
//          }
//       }
//    }
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
int wabt::aot::AOTManager::CheckDependenciesCompiled(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *func)
   {
   TR::AOTMethodHeader *header = _loadStoreDriver->getRegisteredAOTMethodHeader(func->dbg_name_.c_str());
   /** 0 -yes, should fail, 1 - we're good to compile */
   int shouldFailCompilation = 0;
   if (header != NULL)
      {
      /** Naively trying to check if dependencies are compiled */
      unsigned int dependenciesMaxSize = header->getDependenciesArraySize();
      unsigned int *dependenciesArray = header->getDependenciesArray();
      shouldFailCompilation = 1;
      for (unsigned int i = 0; i < dependenciesMaxSize; i++)
         {
         if (env->aot_meta_.at(dependenciesArray[i]).wasm_fn->is_compiled == false)
            {
            shouldFailCompilation = 0;
            }
         }
      }
   else
      {
      // printf("Created  additional data with for the method %s\n", func->dbg_name_.c_str());
      /**
       * @brief When created a header - never compile, don't have enough info
       * When method was created - look up
       */
      _loadStoreDriver->createAndRegisterAOTMethodHeader(func->dbg_name_.c_str(), NULL, 0, NULL, 0);
      shouldFailCompilation = 0;
      }
#ifndef WASM_SHARED_CACHE // This is an ELF-enabled runtime
   if (shouldFailCompilation == 1)
      {
      WABTAOTCompilerLib::shouldReEmitELF = 1;
      }
#endif

   return shouldFailCompilation;
   }

char *wabt::aot::AOTManager::generateEntryPointName(wabt::interp::DefinedFunc *func)
   {
   char *result = (char *)calloc(1, 8);
   result = strncpy(result, func->dbg_name_.c_str(), 8);
   result[0] = 'e';
   return result;
   }

bool wabt::aot::AOTManager::AOTLoadAFunction(wabt::interp::Environment *env, wabt::Index ind)
   {
   if (_loadStoreDriver == NULL)
      {
      _loadStoreDriver = reinterpret_cast<TR::AOTLoadStoreDriver *>(getLoadStoreDriver());
      WABTAOTCompilerLib::setLoadStoreDriver(_loadStoreDriver);
      }
   Func *func = (env->GetFunc(ind));
   if (!func->is_compiled)
      {
      DefinedFunc *fn = reinterpret_cast<DefinedFunc *>(func);
      if (CheckDependenciesCompiled(env, ind, fn) != 0) /* This if statement could possibly contain compilation strategies???*/
         {
         assert(strcmp("???", fn->dbg_name_.c_str()));
         void *function = nullptr;
         function = getCodeEntry(const_cast<char *>(fn->dbg_name_.c_str()));

         if (function != nullptr) /* was able to load the function */
            {
            _loadStoreDriver->relocateRegisteredMethod(const_cast<char *>(fn->dbg_name_.c_str()));
            /**
             * @brief Maybe should be united with the lines setting the same value
             * for function entry point
             */
            fn->is_compiled = true;
            fn->aot_fn_ = reinterpret_cast<wabt::jit::AOTedFunction>(function);
            /** should I insert into aot meta? */
            return true;
            }
         }
      }
   else
      {
      return true;
      }
   return false;
   };

void *wabt::aot::AOTManager::AOTCompileAFunction(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *fn, wabt::interp::Thread *t)
   {
   /** If we haven't acquired a LoadStoreDriver yet */
   if (_loadStoreDriver == NULL)
      {
      _loadStoreDriver = reinterpret_cast<TR::AOTLoadStoreDriver *>(getLoadStoreDriver());
      WABTAOTCompilerLib::setLoadStoreDriver(_loadStoreDriver);
      }
   if (!env->GetFunc(ind)->is_compiled)
      {
      auto &builder = this->getFB(fn->offset);
      if (CheckDependenciesCompiled(env, ind, fn) != 0) /* This if statement could possibly contain compilation strategies???*/
         {
         void *function = nullptr;
         function = getCodeEntry(const_cast<char *>(fn->dbg_name_.c_str()));
         if (!function) /* was not able to load the function */
            {
            internal_compileMethodBuilder(&builder, &function);
#ifndef WASM_SHARED_CACHE // This is an ELF-enabled runtime
            WABTAOTCompilerLib::shouldReEmitELF = 1;
#endif
            if (function == NULL)
               { /* was not able to compile, for example the dependencies were not resolved */
               return NULL;
               }
            else /* compilation was a success */
               {
               /** This line is necessary as the memory in the OMR method to method header
                * map is not managed by std::string, and to be able to do a lookup by key,
                * we need to have the memory allocated longer than the original string exists
                */
               char *fn_name = strdup(fn->dbg_name_.c_str());
               /* store the compiled function */
               storeCodeEntry(fn_name);
               /* load the function, to double check it was actually stored */
               function = getCodeEntry(const_cast<char *>(fn->dbg_name_.c_str()));
               assert(function != NULL);
               }
            }
         _loadStoreDriver->relocateRegisteredMethod(const_cast<char *>(fn->dbg_name_.c_str()));
         /**
          * @brief Maybe should be united with the lines setting the same value
          * for function entry point
          */
         fn->is_compiled = true;
         fn->aot_fn_ = reinterpret_cast<wabt::jit::AOTedFunction>(function);
         /** If need to generate an entry point */
         if (this->needsEntryPointGeneration == true)
            {
            void *entryFunction = nullptr;
            char *entryPointName = generateEntryPointName(fn);
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
               AOTTypeDictionary *types = new (PERSISTENT_NEW) AOTTypeDictionary();
               AOTFunctionBuilder *entryBuilder = new (PERSISTENT_NEW) AOTFunctionBuilder(t, fn,
                                                                                          std::move(entryFunctionNameForBuilder),
                                                                                          types,
                                                                                          *env, *this, true);
               internal_compileMethodBuilder(entryBuilder, &entryFunction);
               if (entryFunction == NULL)
                  { /* was not able to compile the entry point, for example the dependencies were not resolved */
                  return NULL;
                  }
               else /* compilation was a success */
                  {
                  char *fn_name = strdup(entryPointName);
                  /* store the compiled function */
                  storeCodeEntry(fn_name);
                  /* load the function, to double check it was actually stored */
                  entryFunction = getCodeEntry(entryPointName);
                  assert(entryFunction != NULL);
                  }
               }
            _loadStoreDriver->relocateRegisteredMethod(entryPointName);
            fn->is_compiled = true;
            fn->aot_fn_ = reinterpret_cast<wabt::jit::AOTedFunction>(entryFunction);
            }
         }
      else /* the dependencies were not compiled, failing the compilation*/
         {
         /** TODO: Something more meaningful **/
         return NULL;
         }
      }
   else
      {
      /*The function was compiled*/
      return NULL;
      }
   }
