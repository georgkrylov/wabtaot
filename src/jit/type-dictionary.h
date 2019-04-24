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

#ifndef TYPEDICTIONARY_HPP
#define TYPEDICTIONARY_HPP
#include <stddef.h>
#include "JitBuilder.hpp"

namespace wabt {
namespace jit {

class TypeDictionary : public OMR::JitBuilder::TypeDictionary {
 public:
  TypeDictionary();
  OMR::JitBuilder::IlType *stackElement;
  OMR::JitBuilder::IlType *stackElementPtr;
  //OMR::JitBuilder::IlType *instruction;
  //OMR::JitBuilder::IlType *instructionPtr;

  //OMR::JitBuilder::IlType *operandStack;
  //OMR::JitBuilder::IlType *operandStackPtr;
  OMR::JitBuilder::IlType *thread;
  OMR::JitBuilder::IlType *threadPtr;
  OMR::JitBuilder::IlType *stackTop;
};

class AOTTypeDictionary : public OMR::JitBuilder::TypeDictionary {
 public:
  AOTTypeDictionary();
  OMR::JitBuilder::IlType *stackElement;
  OMR::JitBuilder::IlType *stackElementPtr;
  //TR::IlType *instruction;
  //TR::IlType *instructionPtr;

  //TR::IlType *operandStack;
  //TR::IlType *operandStackPtr;
  OMR::JitBuilder::IlType *thread;
  OMR::JitBuilder::IlType *threadPtr;
  OMR::JitBuilder::IlType *stackTop;
};

}
}

#endif // TYPEDICTIONARY_HPP
