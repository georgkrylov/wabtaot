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

#include "aot-start-function.h"
#include "aot-type-dictionary.h"
#include "aot-function-builder.h"

#include "Jit.hpp"

#include <algorithm>
#include <iostream>
#include <memory>

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

  auto func_count = env.GetFuncCount();

  interp::Thread thread(&env);
  AOTManager aotManager(func_count);

  for(Index i = 0; i < func_count; ++i) {
    if(auto* fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i))) {
      std::unique_ptr<AOTTypeDictionary> types(new AOTTypeDictionary());
      std::string name = "$$func_" + std::to_string(i);
      
      AOTFunctionBuilder* builder = new AOTFunctionBuilder(&thread, fn, std::move(name),
							   types.get(), aotManager);
            
      std::unique_ptr<AOTFunctionBuilder> builder_ptr(builder);
      
      aotManager.push_back_FB(fn->offset, std::move(builder_ptr), std::move(types));
    }
  }

  aotManager.broadcastNames();

  // create start method.
  {
    auto startFnName = aotManager.getFB(module->start_func_index).getName();
    AOTStartFunctionBuilder start_fn_builder(startFnName.c_str());
    uint8_t* fn_ptr = nullptr;
    
    compileMethodBuilder(&start_fn_builder, &fn_ptr);
  }
  
  for(Index i = 0; i < func_count; ++i) {
    if(auto* fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i))) {
      auto& builder = aotManager.getFB(fn->offset);
      uint8_t* function = nullptr;
      
      compileMethodBuilder(&builder, &function);
    }
  }

  return wabt::Result::Ok;
}

int main(int argc, char** argv) {
  if(argc != 2) {
    std::cout << "usage: wabtaot <filename>\n";
    return -1;
  }

  const char* src_filename = argv[1];
  wabt::Result result;

  Environment env;
  
  DefinedModule* module = nullptr; //new DefinedModule();
  ErrorHandlerFile error_handler(Location::Type::Binary);

  result = ReadModule(src_filename, &env, &error_handler, &module);

  if(Succeeded(result)) {
    compileAOT(env, module);
  }
}
