#include "aot-manager.h"
#include "aot-function-builder.h"
#include "aot-compiler-lib.hpp"

void wabt::aot::AOTManager::broadcastNames()
 {
    for(auto& builder_kv: func_index_) {
      for(auto& inner_kv: func_index_) {
        auto& builder_fn = builder_kv.second.first;
        inner_kv.second.first->defineFunction(builder_fn->getName(),
                      builder_fn->getFn());
      }
    }
  }

void  wabt::aot::AOTManager::broadcastImports()
  {
    for(auto& builder: func_index_) {
      for(auto& import: import_index_) {
        builder.second.first->defineImportFunction(import.first,import.second);
      }
    }
  }

void*  wabt::aot::AOTManager::AOTCompileAFunction(wabt::interp::Environment* env, wabt::Index ind,wabt::interp::DefinedFunc* fn){
  if(!env->GetFunc(ind)->is_compiled) {
      auto& builder = this->getFB(fn->offset);
      void* function = nullptr;
      function = getCodeEntry(const_cast<char*>(fn->dbg_name_.c_str()));
      if(!function) {
       internal_compileMethodBuilder(&builder, &function);
       char* fn_name = strdup(fn->dbg_name_.c_str());
        storeCodeEntry(fn_name);
	      function = getCodeEntry(const_cast<char*>(fn->dbg_name_.c_str()));
        assert(function!=NULL);
      }
      fn->is_compiled = true;
    }
}
