#include "trap-with.h"

void trapWith(int32_t r) { //interp::Result r) {
  interp::Result result = static_cast<interp::Result>(r);
  
  switch(result) {
    case interp::Result::TrapIntegerDivideByZero :
      printf("trap: division by zero\n");
      // exit(-1);
      break;
    default:
//    printf("as yet unidentified trap condition!\n");
//    exit(-1);
      break;
  }
}
