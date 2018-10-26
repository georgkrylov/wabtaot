#include <assert.h>
#include <stdio.h>
#include <stdint.h>

// Add
extern "C" int64_t func_2();
/*extern "C" int64_t func_3();
extern "C" int64_t func_4();
extern "C" int64_t func_5();
extern "C" int64_t func_6();
extern "C" int64_t func_7();
extern "C" int64_t func_8();
extern "C" int64_t func_9();

// Sub
extern "C" int64_t func_10();
extern "C" int64_t func_11();
extern "C" int64_t func_12();
extern "C" int64_t func_13();
extern "C" int64_t func_14();
extern "C" int64_t func_15();
extern "C" int64_t func_16();
extern "C" int64_t func_17();

// Mul
extern "C" int64_t func_18();
extern "C" int64_t func_19();
extern "C" int64_t func_20();
extern "C" int64_t func_21();
extern "C" int64_t func_22();
extern "C" int64_t func_23();
extern "C" int64_t func_24();
extern "C" int64_t func_25();
extern "C" int64_t func_26();

// Div
extern "C" int64_t func_27();
extern "C" int64_t func_28();
extern "C" int64_t func_29();
extern "C" int64_t func_30();
extern "C" int64_t func_31();
extern "C" int64_t func_32();
extern "C" int64_t func_33();
extern "C" int64_t func_34();
extern "C" int64_t func_35();
extern "C" int64_t func_36();
extern "C" int64_t func_37();
extern "C" int64_t func_38();
extern "C" int64_t func_39();
extern "C" int64_t func_40();
extern "C" int64_t func_41();
extern "C" int64_t func_42();
extern "C" int64_t func_43();
extern "C" int64_t func_44();
extern "C" int64_t func_45();
extern "C" int64_t func_46();
extern "C" int64_t func_47();
extern "C" int64_t func_48();
extern "C" int64_t func_49();
extern "C" int64_t func_50();
extern "C" int64_t func_51();
extern "C" int64_t func_52();
extern "C" int64_t func_53();
extern "C" int64_t func_54();
extern "C" int64_t func_55();
extern "C" int64_t func_56();
extern "C" int64_t func_57();
extern "C" int64_t func_58();
extern "C" int64_t func_59();
extern "C" int64_t func_60();
extern "C" int64_t func_61();
extern "C" int64_t func_62();
extern "C" int64_t func_63();
extern "C" int64_t func_64();
extern "C" int64_t func_65();*/

int main() {
  int64_t result = func_2();
/*  int64_t result_3 = func_3();
  int64_t result_4 = func_4();*/

  assert(func_2() == 3);

/*  assert(func_3() == 1);

  assert(func_4() == -2);

  assert(func_5() == 0);
  
  assert(func_6() == 0x8000000000000000L);  

  assert(func_7() == 0x7fffffffffffffffL);

  assert(func_8() == 0);

  assert(func_9() == 0x3fffffffL + 1);

  assert(func_10() == 0);
  assert(func_11() == 1);
  assert(func_12() == 0);
  assert(func_13() == -2);
  assert(func_14() == 0x8000000000000000L);
  assert(func_15() == 0x7fffffffffffffffL);
  assert(func_16() == 0);
  assert(func_17() == 0x40000000);

  assert(func_18() == 1);
  assert(func_19() == 0);
  assert(func_20() == 1);
  assert(func_21() == 0x1000000000000000L * 4096L);
  assert(func_22() == 0);
  assert(func_23() == 0x8000000000000000L * -1L);
  assert(func_24() == 0x7fffffffffffffffL * -1L);
  assert(func_25() == 0x0123456789abcdefL *
	 0xfedcba9876543210L);
  assert(func_26() == 0x7fffffffffffffffL * 0x7fffffffffffffffL);

  assert(func_27() == -1); // -1 is an error value for a trap.
  // also, there should be a message printed to stdout.
  assert(func_28() == -1);
  assert(func_29() == -1);
  assert(func_30() == 1);
  assert(func_31() == 0);
  assert(func_32() == 0);
  assert(func_33() == 1);
  assert(func_34() == -4611686018427387904);
  assert(func_35() == -9223372036854775);
  assert(func_36() == 2);
  assert(func_37() == -2);
  assert(func_38() == -2);
  assert(func_39() == 2);
  assert(func_40() == 2);
  assert(func_41() == -2);
  assert(func_42() == -2);
  assert(func_43() == 2);
  assert(func_44() == 2);
  assert(func_45() == 2);

  assert(func_46() == -1);
  assert(func_47() == -1);
  assert(func_48() == 0);
  //assert(func_48() == -9223372036854775807L);
  assert(func_49() == 0);
  assert(func_50() == 0);
  assert(func_51() == 0);
  assert(func_52() == 0);
  assert(func_53() == 0);
  assert(func_54() == 0);
  assert(func_55() == -807);
  assert(func_56() == 1);
  assert(func_57() == -1);
  assert(func_58() == 1);
  assert(func_59() == -1);
  assert(func_60() == 1);
  assert(func_61() == -1);
  assert(func_62() == 1);
  assert(func_63() == -1);
  assert(func_64() == 1);
  assert(func_65() == 3);*/
}
