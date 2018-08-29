#include <cstdio>

#include "src/interp.h"
#include "trap-with.h"

void trapWith(int32_t r) { //interp::Result r) {
  using namespace wabt::interp;
  Result result = static_cast<Result>(r);
  
  switch(result) {
    case Result::TrapIntegerDivideByZero :
      printf("trap: division by zero\n");
      // exit(-1);
      break;
    default:
//    printf("as yet unidentified trap condition!\n");
//    exit(-1);
      break;
  }
}
