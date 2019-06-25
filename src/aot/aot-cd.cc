#include "../common.h" // for ReadFile, DataOrNull.

#include "../binary-reader-interp.h"
#include "../binary-reader.h"
#include "../cast.h"
#include "../error-handler.h"
#include "../feature.h"
#include "../interp.h"
#include "../literal.h"
#include "../option-parser.h"
#include "../resolve-names.h"
#include "../stream.h"
#include "../validator.h"
#include "../wast-lexer.h"
#include "../wast-parser.h"

#include "aot-type-dictionary.h"
#include "aot-function-builder.h"
#include "trap-with.h"

#include "JitBuilder.hpp"

#include <algorithm>
#include <iostream>
#include <memory>
#include <math.h>
#include <string>

using namespace wabt;
using namespace wabt::interp;

// from wasm-interp.cc in wasmjit-omr/src/tools.
static wabt::Result ReadModule(const char* module_filename,
                               Environment* env,
                               ErrorHandler* error_handler,
                               DefinedModule** out_module)
{
  wabt::Result result;
  std::vector<uint8_t> file_data;

  *out_module = nullptr;

  result = ReadFile(module_filename, &file_data);
  if (Succeeded(result)) {
    const bool kReadDebugNames = true;
    const bool kStopOnFirstError = true;

    Features features;
    FileStream* log_stream = nullptr;

    ReadBinaryOptions options(features, log_stream, kReadDebugNames, kStopOnFirstError);
    result = ReadBinaryInterp(env, DataOrNull(file_data), file_data.size(),
                              &options, error_handler, out_module);
  }

  return result;
}

wabt::Result compileAOT(interp::Environment& env, DefinedModule* module)
{
  using namespace wabt::aot;

  interp::Thread thread(&env);
  
  auto func_count = env.GetFuncCount();
  
  AOTManager aotManager;

  for(Index i = 0; i < func_count; ++i) {
    if(auto* fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i))) {
      std::unique_ptr<AOTTypeDictionary> types(new AOTTypeDictionary());
      std::string name = "func_" + std::to_string(i);

      AOTFunctionBuilder* builder = new AOTFunctionBuilder(&thread, fn,
							   std::move(name),
							   types.get(),
							   env, aotManager);

      std::unique_ptr<AOTFunctionBuilder> builder_ptr(builder);

      aotManager.push_back_FB(fn->offset, std::move(builder_ptr), std::move(types));
    }
  }

  aotManager.broadcastNames();
  module->compiled_functions.reserve(func_count);

  for(Index i = 0; i < func_count; ++i) {
    if(auto* fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i))) {
      auto& builder = aotManager.getFB(fn->offset);
      void* function = nullptr;
      function = getCodeEntry(const_cast<char*>(fn->dbg_name_.c_str()));
      if(!function) {
        compileMethodBuilder(&builder, &function);
        storeCodeEntry((char *)fn->dbg_name_.c_str(),function);
	function = getCodeEntry(const_cast<char*>(fn->dbg_name_.c_str()));
      }
      module->compiled_functions.push_back(function);
    }
  }
  return wabt::Result::Ok;
}

void relocateAOT(interp::Environment& env,DefinedModule *module)
{
  auto func_count = env.GetFuncCount();
  setCodeEntry("trapWith",reinterpret_cast<void*>(trapWith));
  double(*sqr)(double) = sqrt;
  setCodeEntry("sqrt",reinterpret_cast<void*>(sqr));
  double(*cpsign)(double,double) = copysign;
  setCodeEntry("copysign",reinterpret_cast<void*>(cpsign));
  setCodeEntry("sqrtf",reinterpret_cast<void*>(sqrtf));
  setCodeEntry("copysignf",reinterpret_cast<void*>(copysignf));
  Value *globals = new Value[env.GetGlobalCount()]();
  std::vector<std::string> global_names;
  for(int i=0;i<env.GetGlobalCount();i++) {
    globals[i] = env.GetGlobal(i)->typed_value.value;
    char global_name[6];
    sprintf(global_name,"gl_%d",i);
    global_names.emplace_back(global_name);
    setCodeEntry(const_cast<char*>(global_names.back().data()),reinterpret_cast<void*>(globals+i));
  }
  for(Index i = 0; i < func_count; ++i) {
    if(auto* fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i))) {
      relocateCodeEntry(const_cast<char *>(cast<wabt::interp::DefinedFunc>(env.GetFunc(i))->dbg_name_.c_str()),module->compiled_functions[i]);
     
    }
  }
}

void runExports(interp::Environment& env,DefinedModule *module)
{
  for(auto exported:module->exports){
    if(env.GetFuncSignature(env.GetFunc(exported.index)->sig_index)->result_types.front() == Type::F32) {
      float a = reinterpret_cast<float(*)()>(module->compiled_functions[exported.index])();
      std::cout<<"Export "<<exported.name<<" : "<<a<<"\n";
      }
    else if(env.GetFuncSignature(env.GetFunc(exported.index)->sig_index)->result_types.front() == Type::F64) {
      double a = reinterpret_cast<double(*)()>(module->compiled_functions[exported.index])();
      std::cout<<"Export "<<exported.name<<" : "<<a<<"\n";
      }
    else {
     uint64_t a = reinterpret_cast<uint64_t(*)()>(module->compiled_functions[exported.index])();
     std::cout<<"Export "<<exported.name<<" : "<<a<<"\n";
    }
  }
}

int main(int argc, char** argv) {
  if(argc < 2) {
    std::cout << "usage: wabtaot <filename>\n";
    return -1;
  }

  Environment env;
  
  for(uint32_t i = 1;i<argc;i++) {
    const char* src_filename = argv[i];
   
    DefinedModule* module = nullptr; //new DefinedModule();
    ErrorHandlerFile error_handler(Location::Type::Binary);
    
    wabt::Result result = ReadModule(src_filename, &env, &error_handler, &module);

    if(Succeeded(result)) {
      compileAOT(env, module);
      relocateAOT(env, module);
      runExports(env, module);
    }
  }
}
