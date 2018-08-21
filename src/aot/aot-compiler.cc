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

#include "aot-manager.h"
#include "aot-type-dictionary.h"
#include "aot-function-builder.h"

#include "Jit.hpp"

#include <iostream>

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
  AOTManager aot_manager(func_count);

  interp::Thread thread(&env);

  for(Index i = 0; i < func_count; ++i) {
    if(auto* fn = cast<wabt::interp::DefinedFunc>(env.GetFunc(i))) {
      AOTTypeDictionary types;
      AOTFunctionBuilder builder(&thread, fn, &types, aot_manager);
      uint8_t* function = nullptr;

      aot_manager.getFB(i) = &builder;

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
  // InitEnvironment(&env);
  DefinedModule* module = nullptr; //new DefinedModule();
  ErrorHandlerFile error_handler(Location::Type::Binary);

  result = ReadModule(src_filename, &env, &error_handler, &module);

  if(Succeeded(result)) {

  }
}
