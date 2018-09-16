#include <assert.h>
#include <stdint.h>
#include <stdio.h>

union double_to_int64 {    
  int64_t i;
  double d;
  
  double_to_int64(float f) {
    d = f;
  }

  double_to_int64(double d_) {
    d = d_;
  }
};

int64_t convertToInt(float f) {
  double_to_int64 u(f);
  return u.i;
}

int64_t convertToInt(double d) {
  double_to_int64 u(d);
  return u.i;
}

extern "C" int func_0(int64_t**, int);
extern "C" int func_1(int64_t**, int);
extern "C" int64_t func_2(int64_t**, int);
extern "C" int64_t func_3(int64_t**, int);
extern "C" float func_4(int64_t**, int);
extern "C" float func_5(int64_t**, int);
extern "C" double func_6(int64_t **, int);
extern "C" double func_7(int64_t **, int);

int main()
{
  int64_t inner_A1[] = { 1L };
  int64_t inner_A9[] = { 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L };
  int64_t *A1[] = { inner_A1 };
  int64_t *A9[] = { inner_A9 };

  int64_t inner_F9[] = { convertToInt(1.0f),
			 convertToInt(2.2f),
			 convertToInt(3.2f),
			 convertToInt(3.1415926f),
			 convertToInt(-3.0f),
			 convertToInt(-1101.1f) };
  int64_t* F9[] = { inner_F9 };

  int64_t inner_D9[] = { convertToInt(1.0),
			 convertToInt(2.2),
			 convertToInt(3.2),
			 convertToInt(3.1415926),
			 convertToInt(-3.0),
			 convertToInt(-1101.1),
			 convertToInt(0.0),
			 convertToInt(0.0),
			 convertToInt(-1.12) };
  int64_t* D9[] = { inner_D9 };
  
  assert(func_0(A1, 0) == 1);
  
  assert(func_0(A9, 0) == 1);
  assert(func_0(A9, 1) == 2);
  assert(func_0(A9, 2) == 3);
  assert(func_0(A9, 3) == 4);
  assert(func_0(A9, 4) == 5);
  assert(func_0(A9, 5) == 6);
  assert(func_0(A9, 6) == 7);
  assert(func_0(A9, 7) == 8);
  assert(func_0(A9, 8) == 9);

  assert(func_1(A9, 0) == 5);
  assert(func_1(A9, 1) == 6);
  assert(func_1(A9, 2) == 7);
  assert(func_1(A9, 3) == 8);
  assert(func_1(A9, 4) == 9);

  assert(func_2(A9, 0) == 1L);
  assert(func_2(A9, 1) == 2L);
  assert(func_2(A9, 2) == 3L);
  assert(func_2(A9, 3) == 4L);
  assert(func_2(A9, 4) == 5L);
  assert(func_2(A9, 5) == 6L);
  assert(func_2(A9, 6) == 7L);
  assert(func_2(A9, 7) == 8L);
  assert(func_2(A9, 8) == 9L);

  assert(func_3(A9, 0) == 9L);
  
  assert(func_4(F9, 0) == 1.0f);
  assert(func_4(F9, 1) == 2.2f);
  assert(func_4(F9, 2) == 3.2f);
  assert(func_4(F9, 3) == 3.1415926f);
  assert(func_4(F9, 4) == -3.0f);
  assert(func_4(F9, 5) == -1101.1f);

  assert(func_5(F9, 0) == -3.0f);
  assert(func_5(F9, 1) == -1101.1f);

  assert(func_6(D9, 0) == 1.0);
  assert(func_6(D9, 1) == 2.2);
  assert(func_6(D9, 2) == 3.2);
  assert(func_6(D9, 3) == 3.1415926);
  assert(func_6(D9, 4) == -3.0);
  assert(func_6(D9, 5) == -1101.1);
  
  assert(func_7(D9, 0) == -1.12);
}
