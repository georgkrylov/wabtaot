
#include "aot-compiler-lib.hpp"
#include <iostream>
#include "src/interp/interp.h"

void WABTAOTCompilerLib::getCompiledFunction(const char *name, void (**fn)())
{
  *fn = reinterpret_cast<void(*)()>(getCodeEntry(const_cast<char*>(name)));
}

void  WABTAOTCompilerLib::registerModuleNameForAOT(const char* module_filename, DefinedModule* module)
{
  std::string module_name(module_filename);
  module->name = module_name.substr(module_name.find_last_of('/')+1,module_name.find_last_of('.')-module_name.find_last_of('/')-1);
}

void WABTAOTCompilerLib::registerMethods(wabt::aot::AOTManager& aotManager,interp::Environment& env, DefinedModule* module, char * filename,interp::Thread& thread)
{
  using namespace wabt::aot;

  auto func_count = env.GetFuncCount();
  env.FillMemories();
  Index j = 0;
  for(Index i = 0; i < func_count; ++i) {
    if(!env.GetFunc(i)->is_compiled) {
      auto* fn = dynamic_cast<wabt::interp::DefinedFunc*>(env.GetFunc(i));
      std::unique_ptr<AOTTypeDictionary> types(new (PERSISTENT_NEW) AOTTypeDictionary());
      //static AOTTypeDictionary types;
      std::string name = "f" + std::to_string(j) +"m" +module->name.substr(0,3);
      AOTFunctionBuilder* builder = new (PERSISTENT_NEW) AOTFunctionBuilder(&thread, fn,
							   std::move(name),
							   types.get(),
							   env, aotManager);

      std::unique_ptr<AOTFunctionBuilder> builder_ptr(builder);

      aotManager.push_back_FB(fn->offset, std::move(builder_ptr), std::move(types));

      env.GetFunc(i)->dbg_name_ = "f" + std::to_string(j) +"m"+module->name.substr(0,3);
      //** Trying to assign debug name, might be problematic if that's an import **/
      reinterpret_cast<DefinedFunc*>(env.GetFunc(i))->dbg_name_ = "f" + std::to_string(j) +"m"+module->name.substr(0,3);
      j++;
      module->funcs.emplace_back(env.GetFunc(i));

    }else{
      aotManager.push_back_import(env.GetFunc(i)->dbg_name_,env.GetFunc(i));

      // for(Index j = 0;j<env.GetModuleCount();j++){
      //   for(auto exp:env.GetModule(j)->exports){
      //     if(!exp.name.compare(dynamic_cast<HostFunc*>(env.GetFunc(i))->field_name)){
      //       aotManager.push_back_import("f" + std::to_string(exp.index) +"m"+env.GetModule(j)->name.substr(0,3),env.GetFunc(i));
      //       env.GetFunc(i)->dbg_name_ = "f" + std::to_string(exp.index) +"m"+env.GetModule(j)->name.substr(0,3),env.GetFunc(i);
      //     }
      //   }
      // }

    }

  }

    aotManager.broadcastNames();
    aotManager.broadcastImports();
    module->aot_compiled_functions.reserve(func_count);
    auto module_func_count = module->funcs.size();
}

#ifndef WASM_SHARED_CACHE
char* WABTAOTCompilerLib::getSOFilename(char * filename)
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
              last_path = i+1;
              last_path_flag++;
            }
            if(last_dot_flag == 1 && last_path_flag == 1)
              break;
         }
         size_t lenFilename = last_dot - last_path;
        char *substr = (char *)malloc(lenFilename+1);
        strncpy(substr, filename + last_path, lenFilename);
        substr[lenFilename] = '\0';
        char *so = ".so";
        char *soFilename = (char *) malloc(1 + strlen(substr)+ strlen(so));
        strcpy(soFilename, substr);
        strcat(soFilename, so);
        char *pre = "./";
        char *slashFilename = static_cast<char *>( malloc(1 + strlen(soFilename)+ strlen(pre)));
        strcpy(slashFilename, pre);
        strcat(slashFilename, soFilename);
        free(soFilename);
        return slashFilename;
}
#endif // WASM_SHARED_CACHE