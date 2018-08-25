#ifndef AOT_START_FUNCTION_BUILDER_H
#define AOT_START_FUNCTION_BUILDER_H

#include "constants.h"
#include "aot-function-builder.h"
#include "src/cast.h"
#include "src/interp.h"
#include "infra/Assert.hpp"
#include "ilgen/VirtualMachineState.hpp"

#include <cmath>
#include <limits>
#include <type_traits>

namespace wabt {

namespace aot {

class AOTStartFunctionBuilder : public TR::MethodBuilder {
 public:
    AOTStartFunctionBuilder(const char* start_fn_name)
      : types_(AOTTypeDictionary()),
        fn_name_("$_bootstrap"),
        start_fn_name_(start_fn_name),
        valueType_(types_.LookupUnion("Value")),
        pValueType_(types_.PointerTo(valueType))
    {
      DefineLine(__LINE__);
      DefineFile(__FILE__);
      DefineName(fn_name_.c_str());

      DefineReturnType(types_.toIlType<void>());

      DefineFunction(start_fn_name_,
		     "aot-function-builder.cc",
		     "0",
		     (void*) 18,
		     types_.toIlType<void>(),
		     1,
		     types_.LookupStruct("ValueStack"));
    }

    bool buildIL() override {
      auto* stack = CreateLocalArray(STACK_SIZE, valueType_);

      auto* stack_top_value  = IndexAt(stack->getType(), stack, ConstInt32(0));
      auto* stack_base_value = IndexAt(stack->getType(), stack, ConstInt32(0));

      auto* value_stack = CreateLocalStruct(types_.LookupStruct("ValueStack"));

      StoreIndirect("ValueStack", "stack_top" , value_stack, stack_top_value);
      StoreIndirect("ValueStack", "stack_base", value_stack, stack_base_value);

      Call(start_fn_name_, 1, value_stack);

      return true;
    }
  private:
    AOTTypeDictionary types_;
    TR::IlType* pValueType_;
    TR::IlType* valueType_;

    const char* start_fn_name_;
    std::string fn_name_;
};

}
}
#endif
