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

#include "aot-function-builder.h"
#include "aot-type-dictionary.h"
#include "trap-with.h"
#include "src/cast.h"
#include "src/interp.h"
//#include "/home/petar/wasmjit-omr/third_party/omr/compiler/ilgen/VirtualMachineOperandStack.hpp"
//#include "infra/Assert.hpp"
//#include "ilgen/VirtualMachineState.hpp"

#include <cmath>
#include <limits>
#include <type_traits>
#include <string.h>

namespace wabt {

namespace aot {

using namespace wabt::interp;

// The following functions are required to be able to properly parse opcodes. However, their
// original definitions are defined with static linkage in src/interp.cc. Because of this, the only
// way to use them is to simply copy their definitions here.

template <typename T>
inline T ReadUxAt(const uint8_t* pc) {
  T result;
  memcpy(&result, pc, sizeof(T));
  return result;
}

template <typename T>
inline T ReadUx(const uint8_t** pc) {
  T result = ReadUxAt<T>(*pc);
  *pc += sizeof(T);
  return result;
}

inline uint8_t ReadU8(const uint8_t** pc) {
  return ReadUx<uint8_t>(pc);
}

inline uint32_t ReadU32(const uint8_t** pc) {
  return ReadUx<uint32_t>(pc);
}

inline uint64_t ReadU64(const uint8_t** pc) {
  return ReadUx<uint64_t>(pc);
}

inline Opcode ReadOpcode(const uint8_t** pc) {
  uint8_t value = ReadU8(pc);
  if (Opcode::IsPrefixByte(value)) {
    // For now, assume all instructions are encoded with just one extra byte
    // so we don't have to decode LEB128 here.
    uint32_t code = ReadU8(pc);
    return Opcode::FromCode(value, code);
  } else {
    // TODO(binji): Optimize if needed; Opcode::FromCode does a log2(n) lookup
    // from the encoding.
    return Opcode::FromCode(value);
  }
}

inline Opcode ReadOpcodeAt(const uint8_t* pc) {
  return ReadOpcode(&pc);
}

#define CHECK_TRAP_IN_HELPER(...)                \
  do {                                           \
    wabt::interp::Result result = (__VA_ARGS__); \
    if (result != wabt::interp::Result::Ok) {    \
      return static_cast<Result_t>(result);      \
    }                                            \
  } while (0)
#define TRAP(type) return static_cast<Result_t>(wabt::interp::Result::Trap##type)
#define TRAP_UNLESS(cond, type) TRAP_IF(!(cond), type)
#define TRAP_IF(cond, type)  \
  do {                       \
    if (WABT_UNLIKELY(cond)) \
      TRAP(type);            \
  } while (0)


/*
FunctionBuilder::Result_t AOTFunctionBuilder::CallHostHelper(wabt::interp::Thread* th, Index func_index) {
  return static_cast<Result_t>(th->CallHost(cast<wabt::interp::HostFunc>(th->env_->funcs_[func_index].get())));
}
*/


/*
FunctionBuilder::Result_t AOTFunctionBuilder::CallHostHelper(wabt::interp::Thread* th, Index func_index) {
  return static_cast<Result_t>(th->CallHost(cast<wabt::interp::HostFunc>(th->env_->funcs_[func_index].get())));
}
*/
/*
void* AOTFunctionBuilder::MemoryTranslationHelper(interp::Thread* th, uint32_t memory_id, uint64_t address, uint32_t size) {
  auto* memory = &th->env_->memories_[memory_id];

  if (address + size > memory->data.size()) {
    return nullptr;
  } else {
    return memory->data.data() + address;
  }
}
*/
/*
 Build a struct containing the return types of the function, as its fields.
 */

OMR::JitBuilder::IlType* AOTFunctionBuilder::functionReturnType(interp::Func* fn)
{
    const auto& result_types = env_.GetFuncSignature(fn->sig_index)->result_types;

    if(result_types.empty()) {
      return NoType;
    } else {
      return TypeFieldType(result_types.front());
    }
}

AOTFunctionBuilder::AOTFunctionBuilder(interp::Thread* thread, interp::DefinedFunc* fn,
                                       std::string&& fn_name, AOTTypeDictionary* types,
                                       Environment& env, AOTManager& aotManager)
  : OMR::JitBuilder::MethodBuilder(types),
    types_(types),
    thread_(thread),
    fn_(fn),
    fn_name_(std::move(fn_name)),
    env_(env),
    aotManager_(aotManager),
    valueType_(Int64),
    pValueType_(types_->PointerTo(Int64)),
    ppValueType_(types_->PointerTo(pValueType_))
{
  DefineLine(__LINE__);
  DefineFile(__FILE__);
  DefineName(fn_name_.c_str());

  DefineFunction("sqrtf", __FILE__, "0",
                 reinterpret_cast<void*>(static_cast<float (*)(float)>(sqrtf)),
                 Float,
                 1,
                 Float);
  DefineFunction("copysignf", __FILE__, "0",
                 reinterpret_cast<void*>(static_cast<float (*)(float, float)>(copysignf)),
                 Float,
                 2,
                 Float,
                 Float);
  DefineFunction("sqrt", __FILE__, "0",
                 reinterpret_cast<void*>(static_cast<double (*)(double)>(sqrt)),
                 Double,
                 1,
                 Double);
  DefineFunction("copysign", __FILE__, "0",
                 reinterpret_cast<void*>(static_cast<double (*)(double, double)>(copysign)),
                 Double,
                 2,
                 Double,
                 Double);
  DefineFunction("trapWith", __FILE__, "0",
		 reinterpret_cast<void*>(static_cast<void (*)(Result_t)>(trapWith)),
		 NoType,
		 1,
		 Int32);
//  DefineLocal("glbl",Int64);
  returnType_ = functionReturnType(fn_);

  auto memories_size = env_.GetMemoryCount();
  auto globals_size = env_.GetGlobalCount();
  auto param_count = env_.GetFuncSignature(fn_->sig_index)->param_types.size();
  int total_size = param_count;

  if (memories_size > 0)
  		total_size++;
  if (globals_size > 0)
  		total_size++;
  param_names_.reserve(total_size);

  if(memories_size > 0) {
    // reserve to prevent a reallocation if the vector grows, and its
    // data area is too small, causing the data within to be relocated
    // (relocations are not made known to the MethodBuilder)
    param_names_.push_back("memories");
    DefineParameter(param_names_.back().data(), ppValueType_);
  }
//  if(globals_size>0) {
//    param_names_.push_back("globals");
//    DefineParameter(param_names_.back().data(), ppValueType_);
//  }

  int arg = 0;

  for(const auto& t: env_.GetFuncSignature(fn_->sig_index)->param_types) {
    char param[6]; // ie, "p6" is the sixth parameter.
    sprintf(param, "p%d", arg++);

    param_names_.push_back(param);
    OMR::JitBuilder::IlType* tt = TypeFieldType(t);

    DefineParameter(param_names_.back().data(), tt);
    param_types_.push_back(tt);
  }
  
  arg = 0;
  global_names_.reserve(globals_size);
  for(const auto& g: env_.globals_) {
    char global_name[6];
    sprintf(global_name,"g%d",arg);
    OMR::JitBuilder::IlType *gt = TypeFieldType(g.typed_value.type);

    global_names_.push_back(global_name);
    DefineGlobal(global_names_.back().data(),gt,arg++);
  }

  DefineReturnType(returnType_);
}

void AOTFunctionBuilder::pushParams() {
  
  auto memories_size = env_.GetMemoryCount();
  auto globals_size = env_.GetGlobalCount();
  int arg = 0;
  if (memories_size > 0)
  		arg++;
 // if (globals_size > 0)
 // 		arg++;
  
  for(const auto& t: env_.GetFuncSignature(fn_->sig_index)->param_types) {
    Push(this, TypeFieldName(t), Load(param_names_[arg++].data()));
  }

  /*
  for(const auto& t: env_.GetFuncSignature(fn_->sig_index)->param_types) {
    char param[6]; // ie, "p6" is the sixth parameter.
    sprintf(param, "p%d", arg++);

    Push(this, TypeFieldName(t), Load(param));
  }
  */
}

void AOTFunctionBuilder::defineFunction(const std::string& name, interp::DefinedFunc* fn)
{
  if(fn == fn_) return;

  OMR::JitBuilder::IlType* result_type = fn == fn_ ? returnType_ : functionReturnType(fn);
  auto& builder_fn = aotManager_.getFB(fn->offset);

  DefineFunction(name.c_str(), __FILE__, "0",
		 reinterpret_cast<void*>(18), // this is a magic number that makes trampoline lookup work.
		 result_type,
		 builder_fn.param_types_.size(),
		 static_cast<OMR::JitBuilder::IlType**>(builder_fn.param_types_.data()));
}

void AOTFunctionBuilder::defineImportFunction(const std::string& name, FunctionImport &import)
{

  OMR::JitBuilder::IlType* result_type = functionReturnType(import.fn_);
  for(const auto& t: env_.GetFuncSignature(import.fn_->sig_index)->param_types) {
    
    OMR::JitBuilder::IlType* tt = TypeFieldType(t);

    import.param_types_.push_back(tt);
  }

  DefineFunction(name.c_str(), __FILE__, "0",
		 reinterpret_cast<void*>(18), // this is a magic number that makes trampoline lookup work.
		 result_type,
		 import.param_types_.size(),
		 static_cast<OMR::JitBuilder::IlType**>(import.param_types_.data()));
}

bool AOTFunctionBuilder::buildIL() {
  setVMState(new OMR::JitBuilder::VirtualMachineState());

  // expects a non-NULL Compilation object to exist, so must be
  // constructed here, at compile time
  stack_ = new OMR::JitBuilder::VirtualMachineOperandStack(this, 64, valueType_, nullptr);

  pushParams();

  const uint8_t* istream = thread_->GetIstream();

  workItems_.emplace_back(OrphanBytecodeBuilder(0,
						const_cast<char*>(ReadOpcodeAt(&istream[fn_->offset]).GetName())),
                          &istream[fn_->offset]);
  AppendBuilder(workItems_[0].builder);

  int32_t next_index;

  for(;;) {
    if ((next_index = GetNextBytecodeFromWorklist()) != -1) {
      auto& work_item = workItems_[next_index];

      if (!Emit(work_item.builder, istream, work_item.pc))
	return false;
    } else if(!stackOfStacks_.empty()) {
      auto prev_state = stackOfStacks_.back();
      stackOfStacks_.pop_back();

      int32_t next_index = static_cast<int32_t>(workItems_.size());

      workItems_.emplace_back(OrphanBytecodeBuilder(next_index,
						    const_cast<char*>(ReadOpcodeAt(prev_state.pc).GetName())),
			      prev_state.pc);

      prev_state.b->AddFallThroughBuilder(workItems_[next_index].builder);
      stack_ = prev_state.stack;
      stackCount_ = prev_state.stack_count;
    } else {
      break;
    }
  }

  return true;
}

/**
 * @brief Generate push to the interpreter stack
 *
 * The generated code should be equivalent to:
 *
 * auto stack_top = *stack_top_addr;
 * stack_base_addr[stack_top] = value;
 * *stack_top_addr = stack_top + 1;
 */
void AOTFunctionBuilder::Push(OMR::JitBuilder::IlBuilder* b, const char* type, OMR::JitBuilder::IlValue* value)
{
  //TODO: should probably compare to valueType_ here, if that's
  //possible. I'm not sure if a simple pointer comparison will
  //work. IlTypes* for primitives might not be singleton values.
  auto* value_wrapper = strcmp(type, "i64") ? b->BitcastTo(valueType_, value) : value;
  stackCount_++;
  stack_->Push(b, value_wrapper);
}

/**
 * @brief Generate pop from the interpreter stack
 *
 * The generated code should be equivalent to:
 *
 * auto new_stack_top = *stack_top_addr - 1;
 * *stack_top_addr = new_stack_top;
 * return stack_base_addr[new_stack_top];
 */
OMR::JitBuilder::IlValue* AOTFunctionBuilder::Pop(OMR::JitBuilder::IlBuilder* b, const char* type) {
  auto* value = stack_->Pop(b);
  stackCount_--;
  return strcmp("i64", type) ? b->BitcastTo(TypeFieldType(type), value) : value;
}

/**
 * @brief Generate a drop-x from the interpreter stack, optionally keeping the top value
 *
 * The generated code should be equivalent to:
 *
 * auto stack_top = *stack_top_addr;
 * auto new_stack_top = stack_top - drop_count;
 *
 * if (keep_count == 1) {
 *   stack_base_addr[new_stack_top - 1] = stack_base_addr[stack_top - 1];
 * }
 *
 * *stack_top_addr = new_stack_top;
 */
void AOTFunctionBuilder::DropKeep(OMR::JitBuilder::IlBuilder* b, uint32_t drop_count, uint8_t keep_count) {
  //TR_ASSERT(keep_count <= 1, "Invalid keep count");
  //TR_ASSERT(stackCount_ >= drop_count + keep_count, "Invalid drop count");

  if(keep_count == 1) {
      auto* top = stack_->Pop(b);
      stack_->Drop(b, drop_count);
      stack_->Push(b, top);
  } else {
    stack_->Drop(b, drop_count);
  }

  stackCount_ -= drop_count;
}

/**
 * @brief Generate load from the interpreter stack by an index
 *
 * The generate code should be equivalent to:
 *
 * return &value_stack_[value_stack_top_ - depth];
 */
OMR::JitBuilder::IlValue* AOTFunctionBuilder::Pick(Index depth) {
  return stack_->Pick(depth-1);
}

template <>
const char* AOTFunctionBuilder::TypeFieldName<int32_t>() const {
  return "i32";
}

template <>
const char* AOTFunctionBuilder::TypeFieldName<uint32_t>() const {
  return "i32";
}

template <>
const char* AOTFunctionBuilder::TypeFieldName<int64_t>() const {
  return "i64";
}

template <>
const char* AOTFunctionBuilder::TypeFieldName<uint64_t>() const {
  return "i64";
}

template <>
const char* AOTFunctionBuilder::TypeFieldName<float>() const {
  return "f32";
}

template <>
const char* AOTFunctionBuilder::TypeFieldName<double>() const {
  return "f64";
}

const char* AOTFunctionBuilder::TypeFieldName(Type t) const {
  switch (t) {
    case Type::I32:
      return TypeFieldName<int32_t>();
    case Type::I64:
      return TypeFieldName<int64_t>();
    case Type::F32:
      return TypeFieldName<float>();
    case Type::F64:
      return TypeFieldName<double>();
    default:
      //TR_ASSERT_FATAL(false, "Invalid primitive type");
      return nullptr;
  }
}

OMR::JitBuilder::IlType* AOTFunctionBuilder::TypeFieldType(Type t) const {
  switch (t) {
    case Type::I32:
      return types_->toIlType<int32_t>();
    case Type::I64:
      return types_->toIlType<int64_t>();
    case Type::F32:
      return types_->toIlType<float>();
    case Type::F64:
      return types_->toIlType<double>();
    default:
      //TR_ASSERT_FATAL(false, "Invalid primitive type");
      return nullptr;
  }
}

OMR::JitBuilder::IlType* AOTFunctionBuilder::TypeFieldType(const char* t) const {
  if(strcmp(t, "i32") == 0) {
      return types_->toIlType<int32_t>();
  } else if(strcmp(t, "i64") == 0) {
      return types_->toIlType<int64_t>();
  } else if(strcmp(t, "f32") == 0) {
      return types_->toIlType<float>();
  } else if(strcmp(t, "f64") == 0) {
      return types_->toIlType<double>();
  }

  //TR_ASSERT_FATAL(false, "Invalid primitive type");
  return nullptr;
}

OMR::JitBuilder::IlValue* AOTFunctionBuilder::Const(OMR::JitBuilder::IlBuilder* b, const interp::TypedValue* v) const {
  switch (v->type) {
    case Type::I32:
      return b->ConstInt32(v->value.i32);
    case Type::I64:
      return b->ConstInt64(v->value.i64);
    case Type::F32:
      return b->ConstFloat(Bitcast<float>(v->value.f32_bits));
    case Type::F64:
      return b->ConstDouble(Bitcast<double>(v->value.f64_bits));
    default:
      //TR_ASSERT_FATAL(false, "Invalid primitive type");
      return nullptr;
  }
}

template <typename T, typename TResult, typename TOpHandler>
void AOTFunctionBuilder::EmitBinaryOp(OMR::JitBuilder::IlBuilder* b, TOpHandler h) {
  auto* rhs = Pop(b, TypeFieldName<T>());
  auto* lhs = Pop(b, TypeFieldName<T>());

  Push(b, TypeFieldName<TResult>(), h(lhs, rhs)); //, pc);
}

template <typename T, typename TResult, typename TOpHandler>
void AOTFunctionBuilder::EmitUnaryOp(OMR::JitBuilder::IlBuilder* b, TOpHandler h) {
  Push(b, TypeFieldName<TResult>(), h(Pop(b, TypeFieldName<T>())));//, pc);
}

template <typename T>
void AOTFunctionBuilder::EmitIntDivide(OMR::JitBuilder::IlBuilder* b) {
  static_assert(std::is_integral<T>::value,
                "EmitIntDivide only works on integral types");

  EmitBinaryOp<T>(b, [&](OMR::JitBuilder::IlValue* dividend, OMR::JitBuilder::IlValue* divisor) {
    EmitTrapIf(b,
    b->        EqualTo(divisor, b->Const(static_cast<T>(0))),
	       interp::Result::TrapIntegerDivideByZero);

    EmitTrapIf(b,
    b->        And(
    b->            EqualTo(dividend, b->Const(std::numeric_limits<T>::min())),
    b->            EqualTo(divisor, b->Const(static_cast<T>(-1)))),
	       interp::Result::TrapIntegerOverflow);

    return b->Div(dividend, divisor);
  });
}

template <typename T>
void AOTFunctionBuilder::EmitIntRemainder(OMR::JitBuilder::IlBuilder* b) {//, const uint8_t* pc) {
  static_assert(std::is_integral<T>::value,
                "EmitIntRemainder only works on integral types");

  EmitBinaryOp<T>(b, [&](OMR::JitBuilder::IlValue* dividend, OMR::JitBuilder::IlValue* divisor) {
    EmitTrapIf(b,
    b->        EqualTo(divisor, b->Const(static_cast<T>(0))),
	       interp::Result::TrapIntegerDivideByZero);

    OMR::JitBuilder::IlValue* return_value = b->Const(static_cast<T>(0));

    OMR::JitBuilder::IlBuilder* div_no_ovf_path = nullptr;
    b->IfThen(&div_no_ovf_path,
    b->       Or(
    b->           NotEqualTo(dividend, b->Const(std::numeric_limits<T>::min())),
    b->           NotEqualTo(divisor, b->Const(static_cast<T>(-1)))));
    div_no_ovf_path->StoreOver(return_value,
                               div_no_ovf_path->Rem(dividend, divisor));

    return return_value;
  });
}

OMR::JitBuilder::IlValue* AOTFunctionBuilder::calculateMemoryIndex(OMR::JitBuilder::IlBuilder* b, const uint8_t** pc)
{
  OMR::JitBuilder::IlType *pMemoryType = types_->PointerTo(Int8);
  OMR::JitBuilder::IlType *ppMemoryType = types_->PointerTo(pMemoryType);
  auto mem_id = b->ConstInt64(static_cast<uint64_t>(ReadU32(pc)));
  auto memory = b->IndexAt(ppMemoryType, b->Load("memories"), mem_id);
  auto offset = b->ConstInt64(static_cast<uint64_t>(ReadU32(pc)));

  auto address = b->Add(Pop(b, "i64"), offset);
  auto location = b->IndexAt(pMemoryType, b->LoadAt(ppMemoryType, memory), address);
  EmitTrapIf(b,b->EqualTo(location,b->ConstAddress(nullptr)),
	     interp::Result::TrapMemoryAccessOutOfBounds);

  return location;
}

OMR::JitBuilder::IlValue* AOTFunctionBuilder::calculateGlobalIndex(OMR::JitBuilder::IlBuilder* b, const uint8_t** pc)
{
  auto glob_id = b->ConstInt64(static_cast<uint64_t>(ReadU32(pc)));
  auto global = b->IndexAt(ppValueType_, b->Load("globals"), glob_id);

  return b->IndexAt(pValueType_, b->LoadAt(ppValueType_, global), b->ConstInt64(0));
}


/*
template <typename T>
TR::IlValue* AOTFunctionBuilder::EmitMemoryPreAccess(TR::IlBuilder* b) { //, const uint8_t** pc) {
  throw std::runtime_error("AOTFunctionBuilder: EmitMemoryPreAccess not supported!");

  auto th_addr = b->ConstAddress(thread_);
  auto mem_id = b->ConstInt32(ReadU32(pc));
  auto offset = b->ConstInt64(static_cast<uint64_t>(ReadU32(pc)));

  auto address = b->Call("MemoryTranslationHelper",
                         4,
                         th_addr,
                         mem_id,
                         b->Add(b->UnsignedConvertTo(Int64, Pop(b, "i32")), offset),
                         b->ConstInt32(sizeof(T)));

  EmitTrapIf(b,
  b->        EqualTo(address, b->ConstAddress(nullptr)),
  b->        Const(static_cast<Result_t>(interp::Result::TrapMemoryAccessOutOfBounds)),
             *pc);

  return address;
}
*/

void AOTFunctionBuilder::returnWithError(OMR::JitBuilder::IlBuilder* b) {
  const auto& return_types = env_.GetFuncSignature(fn_->sig_index)->result_types;

  if(return_types.empty()) {
    b->Return();
  } else {
    const auto& return_type = return_types.front();

    switch (return_type) {
    case Type::I32:
      return b->Return(b->ConstInt32(-1));
    case Type::I64:
      return b->Return(b->ConstInt64(-1));
    case Type::F32:
      return b->Return(b->ConstFloat(-1.0f));
    case Type::F64:
      return b->Return(b->ConstDouble(-1.0));
    default:
      throw std::runtime_error("invalid WASM return type!");
    }
  }
}

void AOTFunctionBuilder::EmitTrap(OMR::JitBuilder::IlBuilder* b, interp::Result r) {
  b->Call("trapWith", 1, b->Const(static_cast<int32_t>(r)));
  returnWithError(b);
}

/*
void AOTFunctionBuilder::EmitCheckTrap(TR::IlBuilder* b, TR::IlValue* result) { //, const uint8_t* pc) {
  TR::IlBuilder* trap_handler = nullptr;

  b->IfThen(&trap_handler,
  b->       NotEqualTo(result, b->Const(static_cast<Result_t>(interp::Result::Ok))));

  EmitTrap(trap_handler, result); //, pc);
}
*/

void AOTFunctionBuilder::EmitTrapIf(OMR::JitBuilder::IlBuilder* b, OMR::JitBuilder::IlValue* condition,
				    interp::Result result)
{ //, const uint8_t* pc) {
  OMR::JitBuilder::IlBuilder* trap_handler = nullptr;

  b->IfThen(&trap_handler, condition);
  EmitTrap(trap_handler, result); //, pc);
}

template <>
OMR::JitBuilder::IlValue* AOTFunctionBuilder::EmitIsNan<float>(OMR::JitBuilder::IlBuilder* b, OMR::JitBuilder::IlValue* value) {
  return b->GreaterThan(
         b->           And(
         b->               BitcastTo(Int32, value),
         b->               ConstInt32(0x7fffffffU)),
         b->           ConstInt32(0x7f800000U));
}

template <>
OMR::JitBuilder::IlValue* AOTFunctionBuilder::EmitIsNan<double>(OMR::JitBuilder::IlBuilder* b, OMR::JitBuilder::IlValue* value) {
  return b->GreaterThan(
         b->           And(
         b->               BitcastTo(Int64, value),
         b->               ConstInt64(0x7fffffffffffffffULL)),
         b->           ConstInt64(0x7ff0000000000000ULL));
}

template <typename ToType, typename FromType>
void AOTFunctionBuilder::EmitTruncation(OMR::JitBuilder::IlBuilder* b) {//, const uint8_t* pc) {
  static_assert(std::is_floating_point<FromType>::value,
		"FromType in EmitTruncation call must be a floating point type");

  auto* value = Pop(b, TypeFieldName<FromType>());

  // TRAP_IF is NaN
  EmitTrapIf(b,
             EmitIsNan<FromType>(b, value),
	     interp::Result::TrapInvalidConversionToInteger);

  // TRAP_UNLESS conversion is in range
  EmitTrapIf(b,
  b->        Or(
  b->           LessThan(value,
  b->                    Const(static_cast<FromType>(std::numeric_limits<ToType>::lowest()))),
  b->           GreaterThan(value,
  b->                       Const(static_cast<FromType>(std::numeric_limits<ToType>::max())))),
	     interp::Result::TrapIntegerOverflow);

  auto* target_type = b->typeDictionary()->toIlType<ToType>();

  // this could be optimized using templates or constant expressions,
  // but the compiler should be able to simplify this anyways
  auto* new_value = std::is_unsigned<ToType>::value ? b->BitcastTo(target_type, value)
    : b->ConvertTo(target_type, value);
  //auto new_value = b->BitcastTo(target_type,value);

  Push(b, TypeFieldName<ToType>(), new_value);
}

/**
 * @brief Special case of EmitTruncation for unsigned integers as target type
 *
 * This function is designed to handle the case of truncating to an unsigned integer type.
 * When the target type is an unsigned integer type smaller than 64-bits, the floating-point
 * value can be safely truncated to a *signed* 64-bit integer and then converted to
 * the target type.
 */
template <typename ToType, typename FromType>
void AOTFunctionBuilder::EmitUnsignedTruncation(OMR::JitBuilder::IlBuilder* b) { // , const uint8_t* pc) {
  static_assert(std::is_floating_point<FromType>::value, "FromType in EmitTruncation call must be a floating point type");
  static_assert(std::is_integral<ToType>::value, "ToType in EmitUnsignedTruncation call must be an integer type");
  static_assert(std::is_unsigned<ToType>::value, "ToType in EmitUnsignedTruncation call must be unsigned");

  auto* value = Pop(b, TypeFieldName<FromType>());

  // TRAP_IF is NaN
  EmitTrapIf(b,
             EmitIsNan<FromType>(b, value),
	     interp::Result::TrapInvalidConversionToInteger);

  // TRAP_UNLESS conversion is in range
  EmitTrapIf(b,
  b->        Or(
  b->           LessThan(value,
  b->                    Const(static_cast<FromType>(std::numeric_limits<ToType>::lowest()))),
  b->           GreaterThan(value,
  b->                       Const(static_cast<FromType>(std::numeric_limits<ToType>::max())))),
	     interp::Result::TrapIntegerOverflow);

  auto* target_type = b->typeDictionary()->toIlType<ToType>();
  auto* new_value = b->UnsignedConvertTo(target_type, b->ConvertTo(Int64, value));

  Push(b, TypeFieldName<ToType>(), new_value);
}

// return a struct of type (fn_name_ + "_return_type").
OMR::JitBuilder::IlValue* AOTFunctionBuilder::popReturnValue(OMR::JitBuilder::IlBuilder* b) {
  const auto& result_types = env_.GetFuncSignature(fn_->sig_index)->result_types;

  if(result_types.empty())
    return nullptr;
  else {
    return Pop(b, TypeFieldName(result_types.front()));
  }
}

void AOTFunctionBuilder::pushReturnValue(Func* builder, OMR::JitBuilder::IlBuilder* b,
					 OMR::JitBuilder::IlValue* returnValue)
{
  const auto& result_types = env_.GetFuncSignature(builder->sig_index)->result_types;

  if(result_types.empty())
    return;
  else {
    Push(b, TypeFieldName(result_types.front()), returnValue);
  }
}

template <typename T>
OMR::JitBuilder::IlValue* AOTFunctionBuilder::CalculateShiftAmount(OMR::JitBuilder::IlBuilder* b, OMR::JitBuilder::IlValue* amount) {
  return b->UnsignedConvertTo(Int32,
         b->                  And(amount, b->Const(static_cast<T>(sizeof(T) * 8 - 1))));
}

bool AOTFunctionBuilder::Emit(OMR::JitBuilder::BytecodeBuilder* b,
			      const uint8_t* istream,
			      const uint8_t* pc) {
  Opcode opcode = ReadOpcode(&pc);
  //TR_ASSERT(!opcode.IsInvalid(), "Invalid opcode");

  switch (opcode) {
    case Opcode::Select: {
      OMR::JitBuilder::IlBuilder* true_path = nullptr;
      OMR::JitBuilder::IlBuilder* false_path = nullptr;

      b->IfThenElse(&true_path, &false_path, Pop(b, "i32"));
      DropKeep(true_path, 1, 0);
      DropKeep(false_path, 1, 1);
      break;
    }

    case Opcode::Br: {
      auto target = &istream[ReadU32(&pc)];
      auto it = std::find_if(workItems_.cbegin(), workItems_.cend(),
			     [&](const BytecodeWorkItem& b) {
			       return target == b.pc;
			     });
      if (it != workItems_.cend()) {
        b->AddFallThroughBuilder(it->builder);
      } else {
        int32_t next_index = static_cast<int32_t>(workItems_.size());
        workItems_.emplace_back(OrphanBytecodeBuilder(next_index,
                                                      const_cast<char*>(ReadOpcodeAt(target).GetName())),
                                target);
        b->AddFallThroughBuilder(workItems_[next_index].builder);
      }
      return true;
    }

    // case Opcode::BrIf: This opcode is never generated as it's always
    // transformed into a BrUnless. So, there's no need to handle it.

    case Opcode::Return: {
      auto* value = popReturnValue(b); // of type fn_name + "_return_type"
      //auto* value = Pop(b, TypeFieldName(result_type.front()));

      if(value == nullptr) {
	b->Return();
      } else {
        b->Return(value);
      }

      return true;
    }

    case Opcode::Unreachable:
      EmitTrap(b, interp::Result::TrapUnreachable);
      return true;

    case Opcode::I32Const: {
      auto* val = b->ConstInt32(ReadU32(&pc));
      Push(b, "i32", val);
      break;
    }

    case Opcode::I64Const: {
      auto* val = b->ConstInt64(ReadU64(&pc));
      Push(b, "i64", val);
      break;
    }

    case Opcode::F32Const: {
      auto* val = b->ConstFloat(ReadUx<float>(&pc));
      Push(b, "f32", val);
      break;
    }

    case Opcode::F64Const: {
      auto* val = b->ConstDouble(ReadUx<double>(&pc));
      Push(b, "f64", val);
      break;
    }

    case Opcode::GetGlobal: {
      //throw std::runtime_error("AOTFunctionBuilder: get_global not supported");
      /*
      interp::Global* g = thread_->env()->GetGlobal(ReadU32(&pc));

      // The type of value stored in a global will never change, so we're safe
      // to use the current type of the global.
      const char* type_field = TypeFieldName(g->typed_value.type);

      if (g->mutable_) {
        // TODO(thomasbc): Can the address of a Global change at runtime?
        auto* addr = b->Const(&g->typed_value.value);
        Push(b, type_field, b->LoadIndirect("Value", type_field, addr));//, pc);
      } else {
        // With immutable globals, we can just substitute their actual value as
        // a constant at compile-time.
        Push(b, type_field, Const(b, &g->typed_value));//, pc);
      }
      */
//      auto* addr = calculateGlobalIndex(b, &pc); // comes out as i64.//need this as it moves the wasm bytecode cursor(goes to next instruction)
//      Push(b, "i64", b->LoadAt(pValueType_, addr));
      auto index = ReadU32(&pc);
      Push(b,TypeFieldName(env_.globals_[index].typed_value.type),b->Load(global_names_[index].data()));

      break;
    }

    case Opcode::SetGlobal: {
      //auto* address = calculateGlobalIndex(b, &pc); 
      //TODO FIX ONLY TYPE, SHOULD BE MORE TYPES
      auto index = ReadU32(&pc);
      auto* value = Pop(b, TypeFieldName(env_.globals_[index].typed_value.type));
//  	  b->StoreAt(address, value);
      b->Store(global_names_[index].data(),value);
      /*
      interp::Global* g = thread_->env()->GetGlobal(ReadU32(&pc));
      assert(g->mutable_);

      // See note for get_global
      const char* type_field = TypeFieldName(g->typed_value.type);

      // TODO(thomasbc): Can the address of a Global change at runtime?
      auto* addr = b->Const(&g->typed_value.value);

      b->StoreIndirect("Value", type_field, addr, Pop(b, type_field));
      */
      break;
    }

    case Opcode::GetLocal: {
      // note: to work around JitBuilder's lack of support unions as value types,
      // just copy a field that's the size of the entire union
      auto* local_addr = Pick(ReadU32(&pc));
      Push(b, "i64", local_addr); //b->LoadIndirect("Value", "i64", local_addr));
      
      break;
    }

    case Opcode::SetLocal: {
      // see note for GetLocal
      auto* value = Pop(b, "i64");
      auto* local_addr = Pick(ReadU32(&pc));
      b->StoreOver(local_addr, value);
      // b->StoreIndirect("Value", "i64", local_addr, value);
      break;
    }

    case Opcode::TeeLocal: {
      auto* local_addr = Pick(ReadU32(&pc));
      b->StoreOver(local_addr, Pick(1));
      break;
    }

    case Opcode::InterpCallHost:
    case Opcode::Call: {
      auto offset = ReadU32(&pc);
      auto meta_it = env_.jit_meta_.find(offset);

      if(meta_it != env_.jit_meta_.end()) {
	auto* fn = meta_it->second.wasm_fn;
	auto& builder = aotManager_.getFB(fn->offset);

	std::vector<OMR::JitBuilder::IlValue*> args;

	if(env_.GetMemoryCount() > 0) {
	  args.push_back(b->Load("memories"));
	}

	for(const auto& t: env_.GetFuncSignature(fn->sig_index)->param_types) {
	  args.push_back(Pop(b, TypeFieldName(t)));
	}

 	auto* value = b->Call(fn->dbg_name_.c_str(), args.size(), args.data());
	pushReturnValue(fn, b, value);
	//aotManager_.addCallToRegistry(fn_name_,builder.fn_name_);
      } else {
	throw std::runtime_error("Call: function not found!");
      }

      break;
    }

  case Opcode::CallIndirect: {
    throw std::runtime_error("indirect calls not supported");
    /*
      auto th_addr = b->ConstAddress(thread_);
      auto table_index = b->ConstInt32(ReadU32(&pc));
      auto sig_index = b->ConstInt32(ReadU32(&pc));
      auto entry_index = Pop(b, "i32");
      auto current_pc = b->Const(pc);

      // TODO: again, more of the same.
      b->Store("result",
      b->      Call("CallIndirectHelper", 5, th_addr, table_index, sig_index, entry_index, current_pc));

      // Don't pass the pc since a trap in a called function should not update the thread's pc
      EmitCheckTrap(b, b->Load("result"));
      */
      break;
    }

    // case Opcode::InterpCallHost: {
    //   throw std::runtime_error("interpreted host calls not supported");
    //   //    Index func_index = ReadU32(&pc);

    //   // TODO: again, more of the same.

    //   /*
    //   b->Store("result",
    //   b->      Call("CallHostHelper", 2,
    //   b->           ConstAddress(thread_),
    //   b->           ConstInt32(func_index)));

    //   EmitCheckTrap(b, b->Load("result"), nullptr);
    //   */
    //   break;
    // }

    case Opcode::I32Load8S: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int8_t>(b, &pc);
      Push(b,
           "i32",
      b->  ConvertTo(Int32,
      b->            LoadAt(typeDictionary()->PointerTo(Int8), addr)));
           //pc);
	   */
      break;
    }

    case Opcode::I32Load8U: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int8_t>(b, &pc);
      Push(b,
           "i32",
      b->  UnsignedConvertTo(Int32,
      b->                    LoadAt(typeDictionary()->PointerTo(Int8), addr)));
      */
      break;
    }

    case Opcode::I32Load16S: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int16_t>(b, &pc);
      Push(b,
           "i32",
      b->  ConvertTo(Int32,
      b->            LoadAt(typeDictionary()->PointerTo(Int16), addr)));
           //pc);
	   */
      break;
    }

    case Opcode::I32Load16U: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int16_t>(b, &pc);
      Push(b,
           "i32",
      b->  UnsignedConvertTo(Int32,
      b->                    LoadAt(typeDictionary()->PointerTo(Int16), addr)));
      // pc);
      */
      break;
    }

    case Opcode::I64Load8S: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int8_t>(b, &pc);
      Push(b,
           "i64",
      b->  ConvertTo(Int64,
      b->            LoadAt(typeDictionary()->PointerTo(Int8), addr)));
	   //           pc);
	   */
      break;
    }

    case Opcode::I64Load8U: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int8_t>(b, &pc);
      Push(b,
           "i64",
      b->  UnsignedConvertTo(Int64,
      b->                    LoadAt(typeDictionary()->PointerTo(Int8), addr)));
	   //      pc);
	   */
      break;
    }

    case Opcode::I64Load16S: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int16_t>(b, &pc);
      Push(b,
           "i64",
      b->  ConvertTo(Int64,
      b->            LoadAt(typeDictionary()->PointerTo(Int16), addr)));
      */
      break;
    }

    case Opcode::I64Load16U: {
      throw std::runtime_error("linear memory access not supported");
      // TODO: again, more of the same.
      /*
      auto* addr = EmitMemoryPreAccess<int16_t>(b, &pc);
      Push(b,
           "i64",
      b->  UnsignedConvertTo(Int64,
      b->                    LoadAt(typeDictionary()->PointerTo(Int16), addr)));
      */
      break;
    }

    case Opcode::I64Load32S: {
      throw std::runtime_error("linear memory access not supported");
      /*
      auto* addr = EmitMemoryPreAccess<int32_t>(b, &pc);
      Push(b,
           "i64",
      b->  ConvertTo(Int64,
      b->            LoadAt(typeDictionary()->PointerTo(Int32), addr)));
      */
      break;
    }

    case Opcode::I64Load32U: {
      throw std::runtime_error("linear memory access not supported");
      /*
      auto* addr = EmitMemoryPreAccess<int32_t>(b, &pc);
      Push(b,
           "i64",
      b->  UnsignedConvertTo(Int64,
      b->                    LoadAt(typeDictionary()->PointerTo(Int32), addr)));
	   //     pc);
      */
      break;
    }

    case Opcode::I32Load:
    case Opcode::I64Load:
    case Opcode::F32Load:
    case Opcode::F64Load: {
      auto* addr = calculateMemoryIndex(b, &pc); // comes out as i64.
      Push(b, "i64", b->LoadAt(pValueType_, addr));

      break;
    }

    case Opcode::I32Store8: {
      throw std::runtime_error("linear memory access not supported");
      /*
      auto value = b->ConvertTo(Int8, Pop(b, "i32"));
      b->StoreAt(EmitMemoryPreAccess<int8_t>(b, &pc), value);
      */
      break;
    }

    case Opcode::I32Store16: {
      throw std::runtime_error("linear memory access not supported");
      /*
      auto value = b->ConvertTo(Int16, Pop(b, "i32"));
      b->StoreAt(EmitMemoryPreAccess<int16_t>(b, &pc), value);
      */
      break;
    }

    case Opcode::I64Store8: {
      throw std::runtime_error("linear memory access not supported");
      /*
      auto value = b->ConvertTo(Int8, Pop(b, "i64"));
      b->StoreAt(EmitMemoryPreAccess<int8_t>(b, &pc), value);
      */
      break;
    }

    case Opcode::I64Store16: {
      throw std::runtime_error("linear memory access not supported");
      /*
      auto value = b->ConvertTo(Int16, Pop(b, "i64"));
      b->StoreAt(EmitMemoryPreAccess<int16_t>(b, &pc), value);
      */
      break;
    }

    case Opcode::I64Store32: {
      throw std::runtime_error("linear memory access not supported");
      /*
      auto value = b->ConvertTo(Int32, Pop(b, "i64"));
      b->StoreAt(EmitMemoryPreAccess<int32_t>(b, &pc), value);
      */
      break;
    }

    case Opcode::I32Store:
    case Opcode::I64Store:
    case Opcode::F32Store:
    case Opcode::F64Store: {
      auto* value = Pop(b, "i64");
      b->StoreAt(calculateMemoryIndex(b, &pc), value);
      break;
    }

    case Opcode::I32Add:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Add(lhs, rhs);
      });
      break;

    case Opcode::I32Sub:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Sub(lhs, rhs);
      });
      break;

    case Opcode::I32Mul:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Mul(lhs, rhs);
      });
      break;

    case Opcode::I32DivS:
      EmitIntDivide<int32_t>(b);
      break;

    case Opcode::I32RemS:
      EmitIntRemainder<int32_t>(b);
      break;

    case Opcode::I32And:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->And(lhs, rhs);
      });
      break;

    case Opcode::I32Or:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Or(lhs, rhs);
      });
      break;

    case Opcode::I32Xor:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Xor(lhs, rhs);
      });
      break;

    case Opcode::I32Shl:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->ShiftL(lhs, CalculateShiftAmount<int32_t>(b, rhs));
      });
      break;

    case Opcode::I32ShrS:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->ShiftR(lhs, CalculateShiftAmount<int32_t>(b, rhs));
      });
      break;

    case Opcode::I32ShrU:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedShiftR(lhs, CalculateShiftAmount<int32_t>(b, rhs));
      });
      break;

    case Opcode::I32Rotl:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        auto* amount = CalculateShiftAmount<int32_t>(b, rhs);

        return b->Or(
        b->          ShiftL(lhs, amount),
        b->          UnsignedShiftR(lhs, b->Sub(b->ConstInt32(32), amount)));
      });
      break;

    case Opcode::I32Rotr:
      EmitBinaryOp<int32_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        auto* amount = CalculateShiftAmount<int32_t>(b, rhs);

        return b->Or(
        b->          UnsignedShiftR(lhs, amount),
        b->          ShiftL(lhs, b->Sub(b->ConstInt32(32), amount)));
      });
      break;

    case Opcode::I32Eqz:
      EmitUnaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* val) {
        return b->EqualTo(val, b->ConstInt32(0));
      });
      break;

    case Opcode::I32Eq:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->EqualTo(lhs, rhs);
      });
      break;

    case Opcode::I32Ne:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->NotEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I32LtS:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessThan(lhs, rhs);
      });
      break;

    case Opcode::I32LtU:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedLessThan(lhs, rhs);
      });
      break;

    case Opcode::I32GtS:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterThan(lhs, rhs);
      });
      break;

    case Opcode::I32GtU:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedGreaterThan(lhs, rhs);
      });
      break;

    case Opcode::I32LeS:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I32LeU:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedLessOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I32GeS:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I32GeU:
      EmitBinaryOp<int32_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedGreaterOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I64Add:
        EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
          return b->Add(lhs, rhs);
        });
        break;

    case Opcode::I64Sub:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Sub(lhs, rhs);
      });
      break;

    case Opcode::I64Mul:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Mul(lhs, rhs);
      });
      break;

    case Opcode::I64DivS: // RETURN
      EmitIntDivide<int64_t>(b); //, pc);
      break;

    case Opcode::I64RemS:
      EmitIntRemainder<int64_t>(b);//, pc);
      break;

    case Opcode::I64And:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->And(lhs, rhs);
      });
      break;

    case Opcode::I64Or:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Or(lhs, rhs);
      });
      break;

    case Opcode::I64Xor:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Xor(lhs, rhs);
      });
      break;

    case Opcode::I64Shl:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->ShiftL(lhs, CalculateShiftAmount<int64_t>(b, rhs));
      });
      break;

    case Opcode::I64ShrS:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->ShiftR(lhs, CalculateShiftAmount<int64_t>(b, rhs));
      });
      break;

    case Opcode::I64ShrU:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedShiftR(lhs, CalculateShiftAmount<int64_t>(b, rhs));
      });
      break;

    case Opcode::I64Rotl:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        auto* amount = CalculateShiftAmount<int64_t>(b, rhs);

        return b->Or(
        b->          ShiftL(lhs, amount),
        b->          UnsignedShiftR(lhs, b->Sub(b->ConstInt32(64), amount)));
      });
      break;

    case Opcode::I64Rotr:
      EmitBinaryOp<int64_t>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        auto* amount = CalculateShiftAmount<int64_t>(b, rhs);

        return b->Or(
        b->          UnsignedShiftR(lhs, amount),
        b->          ShiftL(lhs, b->Sub(b->ConstInt32(64), amount)));
      });
      break;

    case Opcode::I64Eqz:
      EmitUnaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* val) {
        return b->EqualTo(val, b->ConstInt64(0));
      });
      break;

    case Opcode::I64Eq:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->EqualTo(lhs, rhs);
      });
      break;

    case Opcode::I64Ne:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->NotEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I64LtS:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessThan(lhs, rhs);
      });
      break;

    case Opcode::I64LtU:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedLessThan(lhs, rhs);
      });
      break;

    case Opcode::I64GtS:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterThan(lhs, rhs);
      });
      break;

    case Opcode::I64GtU:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedGreaterThan(lhs, rhs);
      });
      break;

    case Opcode::I64LeS:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I64LeU:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedLessOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I64GeS:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I64GeU:
      EmitBinaryOp<int64_t, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->UnsignedGreaterOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::F32Abs:
      EmitUnaryOp<float>(b, [&](OMR::JitBuilder::IlValue* value) {
        auto* return_value = b->Copy(value);

        OMR::JitBuilder::IlBuilder* zero_path = nullptr;
        OMR::JitBuilder::IlBuilder* nonzero_path = nullptr;
        OMR::JitBuilder::IlBuilder* neg_path = nullptr;

        // We have to check explicitly for 0.0, since abs(-0.0) is 0.0.
        b->IfThenElse(&zero_path, &nonzero_path, b->EqualTo(value, b->ConstFloat(0)));
        zero_path->StoreOver(return_value, zero_path->ConstFloat(0));

        nonzero_path->IfThen(&neg_path,
	nonzero_path->       LessThan(value, nonzero_path->ConstFloat(0)));
        neg_path->           StoreOver(return_value,
	neg_path->                     Mul(value,
        neg_path->                         ConstFloat(-1)));

        return return_value;
      });
      break;

    case Opcode::F32Neg:
      EmitUnaryOp<float>(b, [&](OMR::JitBuilder::IlValue* value) {
        return b->Mul(value, b->ConstFloat(-1));
      });
      break;

    case Opcode::F32Sqrt:
      EmitUnaryOp<float>(b, [&](OMR::JitBuilder::IlValue* value) {
        return b->Call("sqrtf", 1, value);
      });
      break;

    case Opcode::F32Add:
      EmitBinaryOp<float>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Add(lhs, rhs);
      });
      break;

    case Opcode::F32Sub:
      EmitBinaryOp<float>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Sub(lhs, rhs);
      });
      break;

    case Opcode::F32Mul:
      EmitBinaryOp<float>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Mul(lhs, rhs);
      });
      break;

    case Opcode::F32Div:
      EmitBinaryOp<float>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Div(lhs, rhs);
      });
      break;

    case Opcode::F32Copysign:
      EmitBinaryOp<float>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Call("copysignf", 2, lhs, rhs);
      });
      break;

    case Opcode::F32Eq:
      EmitBinaryOp<float, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->EqualTo(lhs, rhs);
      });
      break;

    case Opcode::F32Ne:
      EmitBinaryOp<float, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->NotEqualTo(lhs, rhs);
      });
      break;

    case Opcode::F32Lt:
      EmitBinaryOp<float, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessThan(lhs, rhs);
      });
      break;

    case Opcode::F32Le:
      EmitBinaryOp<float, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::F32Gt:
      EmitBinaryOp<float, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterThan(lhs, rhs);
      });
      break;

    case Opcode::F32Ge:
      EmitBinaryOp<float, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::F64Abs:
      EmitUnaryOp<double>(b, [&](OMR::JitBuilder::IlValue* value) {
        auto* return_value = b->Copy(value);

        OMR::JitBuilder::IlBuilder* zero_path = nullptr;
        OMR::JitBuilder::IlBuilder* nonzero_path = nullptr;
        OMR::JitBuilder::IlBuilder* neg_path = nullptr;

        // We have to check explicitly for 0.0, since abs(-0.0) is 0.0.
        b->IfThenElse(&zero_path, &nonzero_path,
	b->           EqualTo(value, b->ConstDouble(0)));
        zero_path->   StoreOver(return_value, zero_path->ConstDouble(0));

        nonzero_path->IfThen(&neg_path,
        nonzero_path->       LessThan(value,
        nonzero_path->       ConstDouble(0)));

        neg_path->StoreOver(return_value,
        neg_path->          Mul(value,
	neg_path->          ConstDouble(-1)));

        return return_value;
      });
      break;

    case Opcode::F64Neg:
      EmitUnaryOp<double>(b, [&](OMR::JitBuilder::IlValue* value) {
        return b->Mul(value, b->ConstDouble(-1));
      });
      break;

    case Opcode::F64Sqrt:
      EmitUnaryOp<double>(b, [&](OMR::JitBuilder::IlValue* value) {
        return b->Call("sqrt", 1, value);
      });
      break;

    case Opcode::F64Add:
      EmitBinaryOp<double>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Add(lhs, rhs);
      });
      break;

    case Opcode::F64Sub:
      EmitBinaryOp<double>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Sub(lhs, rhs);
      });
      break;

    case Opcode::F64Mul:
      EmitBinaryOp<double>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Mul(lhs, rhs);
      });
      break;

    case Opcode::F64Div:
      EmitBinaryOp<double>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Div(lhs, rhs);
      });
      break;

    case Opcode::F64Copysign:
      EmitBinaryOp<double>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->Call("copysign", 2, lhs, rhs);
      });
      break;

    case Opcode::F64Eq:
      EmitBinaryOp<double, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->EqualTo(lhs, rhs);
      });
      break;

    case Opcode::F64Ne:
      EmitBinaryOp<double, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->NotEqualTo(lhs, rhs);
      });
      break;

    case Opcode::F64Lt:
      EmitBinaryOp<double, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessThan(lhs, rhs);
      });
      break;

    case Opcode::F64Le:
      EmitBinaryOp<double, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->LessOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::F64Gt:
      EmitBinaryOp<double, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterThan(lhs, rhs);
      });
      break;

    case Opcode::F64Ge:
      EmitBinaryOp<double, int>(b, [&](OMR::JitBuilder::IlValue* lhs, OMR::JitBuilder::IlValue* rhs) {
        return b->GreaterOrEqualTo(lhs, rhs);
      });
      break;

    case Opcode::I32WrapI64: {
      auto* value = Pop(b, "i64");
      Push(b, "i32",
      b->  ConvertTo(Int32, value));
	   //           pc);
      break;
    }

    case Opcode::I64ExtendSI32: {
      auto* value = Pop(b, "i32");
      Push(b, "i64",
      b->  ConvertTo(Int64, value));
      break;
    }

    case Opcode::I64ExtendUI32: {
      auto* value = Pop(b, "i32");
      Push(b, "i64",
      b->  UnsignedConvertTo(Int64, value));
	   //     pc);
      break;
    }

    case Opcode::F32DemoteF64: {
      auto* value = Pop(b, "f64");
      Push(b, "f32",
      b->  ConvertTo(Float, value));
	   //     pc);
      break;
    }

    case Opcode::F64PromoteF32: {
      auto* value = Pop(b, "f32");
      Push(b, "f64",
      b->  ConvertTo(Double, value));
	   //           pc);
      break;
    }

    case Opcode::I32Extend8S: {
      auto* value = b->ConvertTo(Int32, b->ConvertTo(Int8, Pop(b, "i32")));
      Push(b, "i32", value);//, pc);
      break;
    }

    case Opcode::I32Extend16S: {
      auto* value = b->ConvertTo(Int32, b->ConvertTo(Int16, Pop(b, "i32")));
      Push(b, "i32", value);//, pc);
      break;
    }

    case Opcode::I64Extend8S: {
      auto* value = b->ConvertTo(Int32, b->ConvertTo(Int8, Pop(b, "i32")));
      Push(b, "i32", value);//, pc);
      break;
    }

    case Opcode::I64Extend16S: {
      auto* value = b->ConvertTo(Int32, b->ConvertTo(Int16, Pop(b, "i32")));
      Push(b, "i32", value);//, pc);
      break;
    }

    case Opcode::I64Extend32S: {
      auto* value = b->ConvertTo(Int64, b->ConvertTo(Int32, Pop(b, "i64")));
      Push(b, "i64", value);//, pc);
      break;
    }

    case Opcode::F32ConvertSI32: {
      auto* value = b->ConvertTo(Float, Pop(b, "i32"));
      Push(b, "f32", value);//, pc);
      break;
    }

    case Opcode::F32ConvertUI32: {
      auto* value = b->UnsignedConvertTo(Float, Pop(b, "i32"));
      Push(b, "f32", value);//, pc);
      break;
    }

    case Opcode::F32ConvertSI64: {
      auto* value = b->ConvertTo(Float, Pop(b, "i64"));
      Push(b, "f32", value);//, pc);
      break;
    }

    case Opcode::F32ConvertUI64: {
      auto* value = b->UnsignedConvertTo(Float, Pop(b, "i64"));
      Push(b, "f32", value);//, pc);
      break;
    }

    case Opcode::F64ConvertSI32: {
      auto* value = b->ConvertTo(Double, Pop(b, "i32"));
      Push(b, "f64", value);//, pc);
      break;
    }

    case Opcode::F64ConvertUI32: {
      auto* value = b->UnsignedConvertTo(Double, Pop(b, "i32"));
      Push(b, "f64", value);//, pc);
      break;
    }

    case Opcode::F64ConvertSI64: {
      auto* value = b->ConvertTo(Double, Pop(b, "i64"));
      Push(b, "f64", value);//, pc);
      break;
    }

    case Opcode::F64ConvertUI64: {
      auto* value = b->UnsignedConvertTo(Double, Pop(b, "i64"));
      Push(b, "f64", value);//, pc);
      break;
    }

    case Opcode::F32ReinterpretI32: {
      //auto* value = b->ConvertTo(Float, Pop(b, "i32"));
      auto* value = b->BitcastTo(Float, Pop(b, "i32"));
      Push(b, "f32", value);//, pc);
      break;
    }

    case Opcode::I32ReinterpretF32: {
      //auto* value = b->ConvertTo(Int32, Pop(b, "f32"));
      auto* value = b->BitcastTo(Int32, Pop(b, "f32"));
      Push(b, "i32", value);//, pc);
      break;
    }

    case Opcode::F64ReinterpretI64: {
      //auto* value = b->ConvertTo(Double, Pop(b, "i64"));
      auto* value = b->BitcastTo(Double, Pop(b, "i64"));
      Push(b, "f64", value);//, pc);
      break;
    }

    case Opcode::I64ReinterpretF64: {
      //auto* value = b->ConvertTo(Int64, Pop(b, "f64"));
      auto* value = b->BitcastTo(Int64, Pop(b, "f64"));
      Push(b, "i64", value);//, pc);
      break;
    }

    case Opcode::I32TruncSF32:
      EmitTruncation<int32_t, float>(b);//pc);
      break;

    case Opcode::I32TruncUF32:
      EmitUnsignedTruncation<uint32_t, float>(b);//pc);
      break;

    case Opcode::I32TruncSF64:
      EmitTruncation<int32_t, double>(b);//pc);
      break;

    case Opcode::I32TruncUF64:
      EmitUnsignedTruncation<uint32_t, double>(b);//pc);
      break;

    case Opcode::I64TruncSF32:
      EmitTruncation<int64_t, float>(b);//pc);
      break;

//    UNSIGNED TYPE NOT HANDLED
//    case Opcode::I64TruncUF32:
//      EmitTruncation<uint64_t, float>(b, pc);
//      break;

    case Opcode::I64TruncSF64:
      EmitTruncation<int64_t, double>(b);//pc);
      break;

//    UNSIGNED TYPE NOT HANDLED
//    case Opcode::I64TruncUF64:
//      EmitTruncation<uint64_t, double>(b, pc);
//      break;

    case Opcode::InterpAlloca: {
      auto count = ReadU32(&pc);

      for(Index i = 0; i < count; ++i) {
	Push(b, "i64", b->ConstInt64(0));
	localsCount_++;
      }

      break;

      /*
      auto pInt32 = typeDictionary()->PointerTo(Int32);
      auto* stack_top_addr = b->ConstAddress(&thread_->value_stack_top_);
      auto* stack_base_addr = b->ConstAddress(thread_->value_stack_->data());

      auto* old_value_stack_top = b->LoadAt(pInt32, stack_top_addr);
      auto* count = b->ConstInt32(ReadU32(&pc));
      auto* stack_top =  b->Add(old_value_stack_top, count);
      b->StoreAt(stack_top_addr, stack_top);

      EmitTrapIf(b,
      b->        UnsignedGreaterOrEqualTo(
                     stack_top,
      b->            Const(static_cast<int32_t>(thread_->value_stack_.size()))),
      b->        Const(static_cast<Result_t>(interp::Result::TrapValueStackExhausted)));
		 //                 pc);

      OMR::JitBuilder::IlBuilder* set_zero = nullptr;
      b->ForLoopUp("i", &set_zero, old_value_stack_top, stack_top, b->Const(1));
      set_zero->StoreIndirect("Value", "i64",
      set_zero->              IndexAt(pValueType_, stack_base_addr,
      set_zero->                      Load("i")),
      set_zero->              ConstInt64(0));

      break;
      */
    }

    case Opcode::InterpBrUnless: {
      auto target = &istream[ReadU32(&pc)];
      auto condition = Pop(b, "i32");
      auto it = std::find_if(workItems_.begin(), workItems_.end(),
			     [&](const BytecodeWorkItem& b) {
			       return target == b.pc;
			     });

      if (it != workItems_.end()) {
        b->IfCmpEqualZero(&it->builder, condition);
      } else {
        int32_t next_index = static_cast<int32_t>(workItems_.size());
        workItems_.emplace_back(OrphanBytecodeBuilder(next_index,
                                                      const_cast<char*>(ReadOpcodeAt(target).GetName())),
                                target);
        b->IfCmpEqualZero(&workItems_[next_index].builder, condition);
      }

      OMR::JitBuilder::VirtualMachineOperandStack *prev_stack = new OMR::JitBuilder::VirtualMachineOperandStack((void*)(stack_->_impl));
      stackOfStacks_.emplace_back(b, prev_stack, pc, stackCount_);

      return true;
    }

    case Opcode::Drop:
      DropKeep(b, 1, 0);
      break;

    case Opcode::InterpDropKeep: {
      uint32_t drop_count = ReadU32(&pc);
      uint8_t keep_count = *pc++;
      DropKeep(b, drop_count, keep_count);
      break;
    }

    case Opcode::Nop:
      break;

    default:
      return false;
  }

  int32_t next_index = static_cast<int32_t>(workItems_.size());

  workItems_.emplace_back(OrphanBytecodeBuilder(next_index,
						const_cast<char*>(ReadOpcodeAt(pc).GetName())),
                          pc);
  b->AddFallThroughBuilder(workItems_[next_index].builder);

  return true;
}

}

}
