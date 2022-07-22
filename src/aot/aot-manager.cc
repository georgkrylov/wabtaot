#include "aot-manager.h"
#include "aot-compiler-lib.hpp"
#include "aot-function-builder.h"
#include "compiler/env/AOTLoadStoreDriver.hpp"
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
   TR::AOTMethodHeader *header = _loadStoreDriver->getRegisteredAOTMethodHeader(const_cast<char *>(func->dbg_name_.c_str()));
   return 1;
   }

char* wabt::aot::AOTManager::generateEntryPointName( wabt::interp::DefinedFunc *func)
   {
   char* result = (char*) calloc(1,8);
   result = strncpy(result,func->dbg_name_.c_str(),8);
   result[0]='e';
   return result;
   }


void *wabt::aot::AOTManager::AOTCompileAFunction(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *fn, wabt::interp::Thread* t)
   {
   /** If we haven't acquired a LoadStoreDriver yet */
   if (_loadStoreDriver == NULL)
      {
      _loadStoreDriver = reinterpret_cast<TR::AOTLoadStoreDriver *>(getLoadStoreDriver());
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
            char* entryPointName = generateEntryPointName(fn);
            char* entryPointNameForString =  strdup(entryPointName);
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
                                                                            *env, *this,true);
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
   }
