#include <cstdio>

#include "src/interp.h"
#include "src/aot/trap-with.h"

extern "C" void trapWith(int32_t r) {
  using namespace wabt::interp;
  Result result = static_cast<Result>(r);
  trapResult = result;
  trapFlag = true;
  
  switch(result) {
    case Result::TrapIntegerDivideByZero :
      //printf("trap: division by zero\n");
      trapResult = result;
      break;
    case Result::TrapIntegerOverflow :
      //printf("trap: integer overflow\n");
      trapResult = result;
      break;
    default:
      break;
  }
}
