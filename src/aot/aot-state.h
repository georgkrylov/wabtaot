#ifndef AOTSTATE_HPP
#define AOTSTATE_HPP

#include "src/common.h"
#include "ilgen/VirtualMachineState.hpp"
#include "ilgen/VirtualMachineOperandStack.hpp"
#include "ilgen/VirtualMachineRegister.hpp"

namespace wabt {
namespace aot {

class State: public TR::VirtualMachineState {
  public:
   State(TR::MethodBuilder *b, AOTTypeDictionary &types)
     : stack_(nullptr), stackTop_(nullptr) {
    stackTop_ = new TR::VirtualMachineRegister(b,"stackTop",types.stackTop,
					       4,b->Load("stackTop"));
    stack_ = new TR::VirtualMachineOperandStack(b,64,types.stackElement,stackTop_,
					       true,-1);
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

   TR::VirtualMachineOperandStack *stack_;
   TR::VirtualMachineRegister *stackTop_;
};
  
}
}

#endif // AOTSTATE_HPP
