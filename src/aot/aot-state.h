#ifndef AOTSTATE_HPP
#define AOTSTATE_HPP

#include "src/common.h"
#include "src/interp.h"
#include "aot-type-dictionary.h"
#include "ilgen/VirtualMachineState.hpp"
#include "ilgen/VirtualMachineOperandStack.hpp"
#include "ilgen/VirtualMachineRegister.hpp"
#include "ilgen/VirtualMachineRegisterInStruct.hpp"

namespace wabt {
namespace aot {


struct OperandStack {
  interp::Value *top_;
  interp::Value *stack_;
};
  
class State: public TR::VirtualMachineState {
  public:
   State(TR::MethodBuilder *b, AOTTypeDictionary &types)
     : stack_(nullptr), stackTop_(nullptr) {
    stackTop_ = new TR::VirtualMachineRegisterInStruct(b,"AOTOperandStack",
						       "stack","top_","stackTop");
    stack_ = new TR::VirtualMachineOperandStack(b,64,types.stackElement,stackTop_,
					       true,0);
   }

   void pushValue(TR::IlBuilder *b, TR::IlValue *value) {
     return stack_->Push(b,value);
   }

   TR::IlValue *popValue(TR::IlBuilder *b) {
     return stack_->Pop(b);
   }

   TR::IlValue *pickValue(Index depth) {
     return stack_->Pick(depth-1);
   } 

   void Commit(TR::IlBuilder *b) override {
     stackTop_->Commit(b);
     stack_->Commit(b);
   }

   void Reload(TR::IlBuilder *b) override {
     stackTop_->Reload(b);
     stack_->Reload(b);
   }

   TR::VirtualMachineState *MakeCopy() override {
     return new State(*this);
   }

   void MergeInto(TR::VirtualMachineState *other, TR::IlBuilder *b) override {
     MergeInto(dynamic_cast<State *>(other), b);
   }

   TR::VirtualMachineOperandStack *stack_;
   TR::VirtualMachineRegister *stackTop_;
};

class AState: public TR::VirtualMachineState {
  public:
   AState(TR::MethodBuilder *b, AOTTypeDictionary &types)
     : types_(types) {
   }

   void pushValue(TR::IlBuilder *b, TR::IlValue *value) {
     TR::IlValue *stackTop = 
       b->StructFieldInstanceAddress("AOTOperandStack","top_",b->Load("stack"));
     b->StoreAt(
		b->UnionFieldInstanceAddress("Value","i64",b->LoadAt(types_.stackElementPtr,stackTop))
		,value);
     TR::IlValue *newStackTop = 
       b->IndexAt(types_.stackElementPtr,stackTop,b->ConstInt32(1));
     b->StoreAt(
	   b->StructFieldInstanceAddress("AOTOperandStack","top_",b->Load("stack")),
	   newStackTop);
   }

   TR::IlValue *popValue(TR::IlBuilder *b) {
     TR::IlValue *stackTop = 
       b->StructFieldInstanceAddress("AOTOperandStack","top_",b->Load("stack"));
     TR::IlValue *newStackTop =
        b->IndexAt(types_.stackElementPtr, stackTop, b->ConstInt32(-1));
     b->StoreAt(
	   b->StructFieldInstanceAddress("AOTOperandStack","top_",b->Load("stack")),
	   newStackTop);
     auto ste = b->LoadAt(types_.stackElementPtr,stackTop);
     TR::IlValue *value = b->LoadAt(types_.PointerTo(types_.toIlType<int64_t>()),b->UnionFieldInstanceAddress("Value","i64",ste));
     return value;
   }

   void Commit(TR::IlBuilder *b) override {
     
   }

   void Reload(TR::IlBuilder *b) override {
     
   }

   TR::VirtualMachineState *MakeCopy() override {
     return new AState(*this);
   }

   void MergeInto(TR::VirtualMachineState *other, TR::IlBuilder *b) override {

   }

   TR::IlValue *stack(TR::IlBuilder *b) {
     return b->StructFieldInstanceAddress("AOTOperandStack","stack_",b->Load("stack"));
   }
   AOTTypeDictionary &types_;
};
  
}
}

#endif // AOTSTATE_HPP
