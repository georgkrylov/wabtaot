#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

//extern "C" double f64_sqrt(double);

extern "C" int func_0();
extern "C" int func_1();
extern "C" int func_2();
/*
extern "C" double func_0();
extern "C" double func_1();
extern "C" double func_2();
extern "C" double func_3();
extern "C" double func_4();
extern "C" double func_5();
extern "C" double func_6();
extern "C" double func_7();
extern "C" double func_8();
extern "C" double func_9();
extern "C" double func_10();
extern "C" double func_11();
extern "C" double func_12();
extern "C" double func_13();
extern "C" double func_14();
extern "C" double func_15();
extern "C" double func_16();
extern "C" double func_17();
extern "C" double func_18();
extern "C" double func_19();
extern "C" double func_20();
extern "C" double func_21();
extern "C" double func_22();
extern "C" double func_23();
extern "C" double func_24();
extern "C" double func_25();
extern "C" double func_26();
extern "C" double func_27();
extern "C" double func_28();
extern "C" double func_29();
extern "C" double func_30();
extern "C" double func_31();
extern "C" double func_32();
extern "C" double func_33();
extern "C" double func_34();
extern "C" double func_35();
extern "C" double func_36();
extern "C" double func_37();
extern "C" double func_38();
extern "C" double func_39();
extern "C" double func_40();
extern "C" double func_41();
extern "C" double func_42();
extern "C" double func_43();
extern "C" double func_44();
extern "C" double func_45();
extern "C" double func_46();
extern "C" double func_47();
extern "C" double func_48();
extern "C" double func_49();
extern "C" double func_50();
extern "C" double func_51();
extern "C" double func_52();
extern "C" double func_53();
extern "C" double func_54();
extern "C" double func_55();
extern "C" double func_56();
extern "C" double func_57();
extern "C" double func_58();
extern "C" double func_59();
extern "C" double func_60();
extern "C" double func_61();
extern "C" double func_62();
extern "C" double func_63();
extern "C" double func_64();
extern "C" double func_65();
extern "C" double func_66();
extern "C" double func_67();
extern "C" double func_68();
extern "C" double func_69();
extern "C" double func_70();
extern "C" double func_71();
extern "C" double func_72();
extern "C" double func_73();
extern "C" double func_74();
extern "C" double func_75();
extern "C" double func_76();
extern "C" double func_77();
extern "C" double func_78();
extern "C" double func_79();
*/

union d_to_u_union {
  double orig;
  int64_t cast;
};

int compare_for_nan(double d) {
  d_to_u_union u;
  u.orig = d;
      
  d_to_u_union nan;
  nan.orig = SNANF64X;

  return u.cast == nan.cast;
}

int compare_for_neg_nan(double d) {
  d_to_u_union u;
  u.orig = d;
      
  d_to_u_union nan;
  nan.orig = -SNANF64X;

  return u.cast == nan.cast;
}

int compare_for_inf(double d) {
  d_to_u_union u;
  u.orig = d;
      
  d_to_u_union nan;
  nan.orig = INFINITY;

  return u.cast == nan.cast;
}

int compare_for_neg_inf(double d) {
  d_to_u_union u;
  u.orig = d;
      
  d_to_u_union nan;
  nan.orig = -INFINITY;

  return u.cast == nan.cast;
}

int main() {
  assert(func_0() == 1);
  assert(func_1() == 1);
  assert(func_2() == 1);
}
