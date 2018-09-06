#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdint.h>

union d_to_u_union {
  double orig;
  int64_t cast;
};

union f_to_u_union {
  float orig;
  int32_t cast;
};

int compare_for(float f, float cmp) {
  f_to_u_union u;
  u.orig = f;

  static f_to_u_union inf;
  inf.orig = cmp;

  return inf.cast == u.cast;
}

int compare_for(double d, double cmp) {
  d_to_u_union u;
  u.orig = d;
      
  d_to_u_union nan;
  nan.orig = cmp;

  return u.cast == nan.cast;
}

extern "C" int func_0(int);
extern "C" int64_t func_1(int64_t);
extern "C" float func_2(float);
extern "C" double func_3(double);
extern "C" int func_4();
extern "C" int func_5();
extern "C" int func_6();
extern "C" int func_7();
extern "C" int64_t func_8();
extern "C" int64_t func_9();
extern "C" int64_t func_10();
extern "C" int64_t func_11();
extern "C" float func_12();
extern "C" float func_13();
extern "C" float func_14();
extern "C" float func_15();
extern "C" float func_16();
extern "C" float func_17();
extern "C" float func_18();
extern "C" float func_19();
extern "C" float func_20();
extern "C" double func_21();
extern "C" double func_22();
extern "C" double func_23();
extern "C" double func_24();
extern "C" double func_25();
extern "C" double func_26();
extern "C" double func_27();
extern "C" double func_28();
extern "C" double func_29();
extern "C" int func_30();
extern "C" int func_31();
extern "C" int func_32();
extern "C" int func_33();
extern "C" int64_t func_34();
extern "C" int64_t func_35();
extern "C" int64_t func_36();
extern "C" int64_t func_37();
extern "C" float func_38();
extern "C" float func_39();
extern "C" float func_40();
extern "C" float func_41();
extern "C" float func_42();
extern "C" float func_43();
extern "C" float func_44();
extern "C" float func_45();
extern "C" float func_46();
extern "C" double func_47();
extern "C" double func_48();
extern "C" double func_49();
extern "C" double func_50();
extern "C" double func_51();
extern "C" double func_52();
extern "C" double func_53();
extern "C" double func_54();
extern "C" double func_55();

int main() {
  assert(func_0(1) == 1);
  assert(func_0(-1) == -1);
  assert(func_0(0) == 0);

  assert(func_1(-1L) == -1L);
  assert(func_1(1L << 62L) == 1L << 62L);
  assert(func_1(-1L << 62L) == -1L << 62L);

  assert(func_2(1.0f) == 1.0f);
  assert(func_2(-1.0f) == -1.0f);
  assert(func_2(2342.02342f) == 2342.02342f);

  assert(func_3(2.0) == 2.0);
  assert(func_3(1.0) == 1.0);
  assert(func_3(-1.0) == -1.0);
  assert(func_3(19203.1231213) == 19203.1231213);

  assert(func_4() == 0);
  assert(func_5() == 1);
  assert(func_6() == 42);
  assert(func_7() == -1);

  assert(func_8() == 0L);
  assert(func_9() == 1L);
  assert(func_10() == 42L);
  assert(func_11() == -1L);

  assert(func_12() == 0.0f);
  assert(func_13() == -0.0f);
  assert(func_14() == 1.0f);
  assert(func_15() == -1.0f);

  assert(func_16() == 4.2f);
  assert(func_17() == -4.2f);
  assert(compare_for(func_18(), INFINITY));
  assert(compare_for(func_19(), -INFINITY));

  assert(compare_for(func_20(), NAN));
  assert(func_21() == 0.0);
  assert(func_22() == -0.0);
  assert(func_23() == 1.0);
  assert(func_24() == -1.0);
  assert(func_25() == 4.2);
  assert(func_26() == -4.2);
  assert(compare_for(func_27(), (double) INFINITY));
  assert(compare_for(func_28(), (double) -INFINITY));
  assert(compare_for(func_29(), (double) NAN));
  
  assert(func_30() == 0);
  assert(func_31() == 1);
  assert(func_32() == 42);
  assert(func_33() == -1);
  
  assert(func_34() == 0L);
  assert(func_35() == 1L);
  assert(func_36() == 42L);
  assert(func_37() == -1L);

  assert(func_38() == 0.0f);
  assert(func_39() == -0.0f);
  assert(func_40() == 1.0f);
  assert(func_41() == -1.0f);
  assert(func_42() == 4.2f);
  assert(func_43() == -4.2f);
  assert(compare_for(func_44(), INFINITY));
  assert(compare_for(func_45(), -INFINITY));
  assert(compare_for(func_46(), NAN));
  
  assert(func_47() == 0.0);
  assert(func_48() == -0.0);
  assert(func_49() == 1.0);
  assert(func_50() == -1.0);
  assert(func_51() == 4.2);
  assert(func_52() == -4.2);
  assert(compare_for(func_53(), (double) INFINITY));
  assert(compare_for(func_54(), (double) -INFINITY));
  assert(compare_for(func_55(), (double) NAN));
}
