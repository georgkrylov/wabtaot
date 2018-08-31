#include <assert.h>
#include <stdio.h>
#include <stdint.h>

// Add
int64_t func_2();
int64_t func_3();
int64_t func_4();
int64_t func_5();
int64_t func_6();
int64_t func_7();
int64_t func_8();
int64_t func_9();

// Sub
int64_t func_10();
int64_t func_11();
int64_t func_12();
int64_t func_13();
int64_t func_14();
int64_t func_15();
int64_t func_16();
int64_t func_17();

// Mul
int64_t func_18();
int64_t func_19();
int64_t func_20();
int64_t func_21();
int64_t func_22();
int64_t func_23();
int64_t func_24();
int64_t func_25();
int64_t func_26();

// Div
int64_t func_27();
int64_t func_28();
int64_t func_29();
int64_t func_30();
int64_t func_31();
int64_t func_32();
int64_t func_33();
int64_t func_34();
int64_t func_35();
int64_t func_36();
int64_t func_37();
int64_t func_38();
int64_t func_39();
int64_t func_40();
int64_t func_41();
int64_t func_42();
int64_t func_43();
int64_t func_44();
int64_t func_45();
int64_t func_46();
int64_t func_47();
int64_t func_48();
int64_t func_49();
int64_t func_50();
int64_t func_51();
int64_t func_52();
int64_t func_53();
int64_t func_54();
int64_t func_55();
int64_t func_56();
int64_t func_57();
int64_t func_58();
int64_t func_59();
int64_t func_60();
int64_t func_61();
int64_t func_62();
int64_t func_63();
int64_t func_64();
int64_t func_65();

int main() {
  int64_t result = func_2();
  int64_t result_3 = func_3();
  int64_t result_4 = func_4();

  assert(func_2() == 3);

  assert(func_3() == 1);

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
  assert(func_65() == 3);
}
