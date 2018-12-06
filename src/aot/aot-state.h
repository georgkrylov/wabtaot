#ifndef AOTSTATE_HPP
#define AOTSTATE_HPP

#include "src/common.h"
#include "ilgen/VirtualMachineState.hpp"
#include "ilgen/VirtualMachineOperandStack.hpp"
#include "ilgen/VirtualMachineRegisterInStruct.hpp"

namespace wabt {
namespace aot {

class State: public TR::VirtualMachineState {
  public:
 State(TR::MethodBuilder *b, AOTTypeDictionary &types, int32_t numpar)
     : stack_(nullptr), stackTop_(nullptr) {
    stackTop_ = new TR::VirtualMachineRegisterInStruct(
		b,"Thread","sp","vs_top_","stackTop");
    stack_ = new TR::VirtualMachineOperandStack(b,64,types.stackElement,stackTop_,
						true,-1,numpar-1); //1 as intialoffset works for me...
    stack_->Reload(b);
   }

   void pushValue(TR::IlBuilder *b, TR::IlValue *value) {
     return stack_->Push(b,value);
   }

   TR::IlValue *popValue(TR::IlBuilder *b) {
     return stack_->Pop(b);
   }

   TR::IlValue *pickValue(Index depth) {
     return stack_->Pick(depth-1);//what about this??
   } 

   void Commit(TR::IlBuilder *b) override {
     stack_->Commit(b);
     stackTop_->Commit(b);
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

   void MergeInto(State *other, TR::IlBuilder *b) {
    stack_->MergeInto(other->stack_, b);
    stackTop_->MergeInto(other->stackTop_, b);
  }

   TR::VirtualMachineOperandStack *stack_;
   TR::VirtualMachineRegister *stackTop_;
};
  
}
}

#endif // AOTSTATE_HPP
