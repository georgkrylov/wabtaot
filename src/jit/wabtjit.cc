/*
 * Copyright 2017 wasmjit-omr project participants
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "../interp.h"
#include "wabtjit.h"
#include "type-dictionary.h"
#include "function-builder.h"

#include "Jit.hpp"
#include "control/Options.hpp"
#include "control/Options_inlines.hpp"

namespace wabt {
namespace jit {

interp::Result compileAOT(interp::Thread* thread, interp::Environment& env) {
  initializeJit();
  
  TypeDictionary types;
  TR::OptionSet elfOptionSet = OptionSet("enableRelocatableELFGeneration,"
                                         "objectFile=aot_compile.o");

  TR::Options::getCmdLineOptions()->addOptionSet(&elfOptionSet);

  for(Index i = 0; i < env.GetFuncCount(); ++i) {
    auto fn = env.GetFunc(i);
    FunctionBuilder builder(thread, fn, &types);
    compileMethodBuilder(&builder, fn);
  }

  shutdownJIT();
  
  return interp::Result::Ok;
}

JITedFunction compile(interp::Thread* thread, interp::DefinedFunc* fn) {
  TypeDictionary types;
  FunctionBuilder builder(thread, fn, &types);
  uint8_t* function = nullptr;

  if (compileMethodBuilder(&builder, &function) == 0) {
    return reinterpret_cast<JITedFunction>(function);
  } else {
    return nullptr;
  }
}

}
}
