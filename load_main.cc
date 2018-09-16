#include <assert.h>
#include <stdint.h>
#include <stdio.h>

extern "C" int func_0(int64_t**, int);
extern "C" int func_1(int64_t**, int);
extern "C" int64_t func_2(int64_t**, int);
extern "C" int64_t func_3(int64_t**, int);
extern "C" float func_4(int64_t**, int);
extern "C" float func_5(int64_t**, int);

union float_to_int64 {    
  int64_t i;
  struct { float f; int32_t _padding; } inner;

  float_to_int64() {
    i = 0;
  }
};

int64_t convertToInt(float f) {
  float_to_int64 u;
  u.inner.f = f;
  return u.i;
}
  
int main()
{
  int64_t inner_A1[] = { 1L };
  int64_t inner_A9[] = { 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L };
  int64_t *A1[] = { inner_A1 };
  int64_t *A9[] = { inner_A9 };

  int64_t inner_F9[] = { convertToInt(1.0f),
			 convertToInt(2.2f),
			 convertToInt(3.2f),
			 convertToInt(3.1415926f) };
  int64_t* F9[] = { inner_F9 };
  
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

  printf("func_4(F9, 0) = %f", func_4(F9, 0));
  //assert(func_4(F9, 0) == 1.0f);
}
