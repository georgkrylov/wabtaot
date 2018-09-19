#include "assert.h"
#include "stdio.h"
#include "stdlib.h"

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

extern "C" void func_0(int64_t**, int, int);
extern "C" void func_1(int64_t**, int, int);
extern "C" void func_2(int64_t**, int, int64_t);
extern "C" void func_3(int64_t**, int, int64_t);
extern "C" void func_4(int64_t**, int, float);
extern "C" void func_5(int64_t**, int, float);
extern "C" void func_6(int64_t**, int, double);
extern "C" void func_7(int64_t**, int, double);

int main()
{
  int64_t inner_A9[] = { 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L };
  int64_t *A9[] = { inner_A9 };

  func_0(A9, 0, 23);
  func_0(A9, 1, 15);
  func_0(A9, 8, 10);
  
  assert(A9[0][0] == 23);
  assert(A9[0][1] == 15);
  assert(A9[0][8] == 10);

  func_1(A9, 1, 5);
  func_1(A9, 2, 6);
  func_1(A9, 3, 7);
  
  assert(A9[0][5] == 5);
  assert(A9[0][6] == 6);
  assert(A9[0][7] == 7);

  func_2(A9, 0, 100L);
  func_2(A9, 1, 200L);
  func_2(A9, 2, 300L);

  assert(A9[0][0] == 100L);
  assert(A9[0][1] == 200L);
  assert(A9[0][2] == 300L);

  func_3(A9, 0, 8L);
  assert(A9[0][8] == 8L);

  func_4(A9, 0, -1.1f);
  func_4(A9, 1, 1.1f);
  func_4(A9, 2, 3.1415926f);
  
  assert(A9[0][0] == convertToInt(-1.1f));
  assert(A9[0][1] == convertToInt(1.1f));
  assert(A9[0][2] == convertToInt(3.1415926f));

  func_5(A9, 0, 4.22f);
  func_5(A9, 1, 1.001f);

  assert(A9[0][4] == convertToInt(4.22f));
  assert(A9[0][5] == convertToInt(1.001f));

  func_6(A9, 0, 3.14159269);
  func_6(A9, 1, -1.123);
  func_6(A9, 2, 1e100);

  assert(A9[0][0] == convertToInt(3.14159269));
  assert(A9[0][1] == convertToInt(-1.123));
  assert(A9[0][2] == convertToInt(1e100));
}
