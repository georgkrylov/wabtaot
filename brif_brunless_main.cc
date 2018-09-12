#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

//extern "C" double f64_sqrt(double);

extern "C" int func_0();
extern "C" int func_1();
extern "C" int func_2(int);
extern "C" int func_3(); // always_true
extern "C" int func_4(); // always false
extern "C" int func_5(int); // branch on arg

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
  assert(func_1() == 0);
  
  assert(func_2(1) == 1);
  assert(func_2(-1) == 1);
  assert(func_2(0) == 0);

  assert(func_3() == 1);
  assert(func_4() == 0);

  assert(func_5(1) == 1);
  assert(func_5(-1) == 1);
  assert(func_5(0) == 0);
}
