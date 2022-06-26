#include "aot-manager.h"
#include "aot-function-builder.h"
#include "aot-compiler-lib.hpp"
#include "compiler/env/AOTLoadStoreDriver.hpp"

void wabt::aot::AOTManager::broadcastNames()
 {
    for(auto& builder_kv: func_index_) {
      for(auto& inner_kv: func_index_) {
        auto& builder_fn = builder_kv.second.first;
        std::string const& funcName = builder_fn->getName();
        inner_kv.second.first->defineFunction(funcName,
                      builder_fn->getFn());
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

void  wabt::aot::AOTManager::broadcastImports()
  {
    for(auto& builder: func_index_) {
      for(auto& import: import_index_) {
        builder.second.first->defineImportFunction(import.first,import.second);
      }
    }
  }
int  wabt::aot::AOTManager::CheckDependenciesCompiled(wabt::interp::Environment* env, wabt::Index ind,wabt::interp::DefinedFunc* func){
  TR::AOTMethodHeader* header = _loadStoreDriver->getRegisteredAOTMethodHeader(const_cast<char*>(func->dbg_name_.c_str()));
  return 1;
}
void*  wabt::aot::AOTManager::AOTCompileAFunction(wabt::interp::Environment* env, wabt::Index ind,wabt::interp::DefinedFunc* fn){
  _loadStoreDriver = reinterpret_cast<TR::AOTLoadStoreDriver*>(getLoadStoreDriver());
  if(!env->GetFunc(ind)->is_compiled) {
      auto& builder = this->getFB(fn->offset);
      void* function = nullptr;
      if (CheckDependenciesCompiled (env,ind,fn) != 0){ /* This if statement could possibly contain compilation strategies???*/
      function = getCodeEntry(const_cast<char*>(fn->dbg_name_.c_str()));
      if(!function) { /* was not able to load the function */
       internal_compileMethodBuilder(&builder, &function);

       if (function == NULL){ /* was not able to compile, for example the dependencies were not resolved */
        return NULL;
       } else { /* compilation was a success */
          char* fn_name = strdup(fn->dbg_name_.c_str());
          /* store the compiled function */
          storeCodeEntry(fn_name);
          /* load the function, to double check it was actually stored */
          function = getCodeEntry(const_cast<char*>(fn->dbg_name_.c_str()));
          assert(function!=NULL);
       }
      }
      fn->is_compiled = true;
      } else /* the dependencies were not compiled, failing the compilation*/
      {
      return NULL;
      }
    }
}
