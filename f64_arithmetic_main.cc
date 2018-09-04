#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>


extern "C" double f64_sqrt(double);

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
  assert(func_0() == 1.0);
  assert(func_1() == 1.0);
  assert(func_2() == 0.0);
  assert(func_3() == 0.0);

  assert(compare_for_nan(func_4())); // IEEE: comparisons involving NaN are always false
  assert(compare_for_inf(func_5()));
  assert(compare_for_inf(func_6()));
  assert(func_7() == -1.0);
  assert(func_8() == 1.0);
  assert(compare_for_neg_inf(func_9()));
  assert(compare_for_inf(func_10()));
  assert(func_11() == -0.0);
  assert(func_12() == 0.0);
  assert(compare_for_nan(func_13()));

  assert(func_14() == sqrt(2.0));
  assert(func_15() == sqrt(0.0));
  assert(func_16() == sqrt(-0.0));
  assert(compare_for_inf(func_17()));
  assert(compare_for_neg_nan(func_18()));
  assert(compare_for_nan(func_19()));
  assert(func_20() == 3.5);
  assert(func_21() == -1.0);
  assert(func_22() == 1.0);
  assert(compare_for_nan(func_23()));
  assert(compare_for_nan(func_24()));
  assert(compare_for_inf(func_25()));
  assert(compare_for_neg_inf(func_26()));
  assert(compare_for_neg_nan(func_27()));
  assert(compare_for_inf(func_28()));
  assert(compare_for_neg_inf(func_29()));
  assert(func_30() == 1.25 - 2.25);
  assert(func_31() == -3.0);
  assert(func_32() == 1.0);
  assert(compare_for_nan(func_33()));
  assert(compare_for_nan(func_34()));
  assert(compare_for_inf(func_35()));
  assert(compare_for_inf(func_36()));
  assert(compare_for_inf(func_37()));
  assert(compare_for_neg_inf(func_38()));  
  assert(compare_for_neg_nan(func_39()));
  assert(func_40() == 6.0);
  assert(func_41() == -6.0);
  assert(func_42() == 0.0);
  assert(func_43() == -0.0);
  assert(compare_for_inf(func_44()));
  assert(compare_for_neg_inf(func_45()));
  assert(compare_for_neg_nan(func_46()));
  assert(compare_for_inf(func_47()));
  assert(compare_for_neg_inf(func_48()));
  assert(compare_for_nan(func_49()));
  assert(func_50() == 2.0);
  assert(func_51() == -2.0);
  assert(compare_for_inf(func_52()));
  assert(compare_for_neg_inf(func_53()));
  assert(compare_for_inf(func_54()));
  assert(compare_for_neg_inf(func_55()));
  assert(func_56() == 0.0);
  assert(func_57() == -0.0);
  assert(compare_for_inf(func_58()));
  assert(compare_for_neg_inf(func_59()));
  assert(func_60() == 0.0);
  assert(func_61() == -0.0);
  assert(compare_for_neg_nan(func_62()));
  assert(compare_for_neg_nan(func_63()));
  assert(compare_for_neg_nan(func_64()));
  assert(compare_for_neg_nan(func_65()));
  assert(compare_for_nan(func_66()));
  assert(compare_for_nan(func_67()));

  // copysign
  assert(func_68() == 2.0);
  assert(func_69() == -2.0);
  assert(func_70() == 2.0);
  assert(func_71() == -2.0);
  assert(func_72() == 0.0);
  assert(func_73() == -0.0);
  assert(func_74() == 0.0);
  assert(func_75() == 0.0);
  assert(func_76() == 1.0);
  assert(func_77() == -1.0);
  assert(func_78() == 1.0);
  assert(func_79() == -1.0);
}
