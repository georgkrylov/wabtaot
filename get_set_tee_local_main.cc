#include <assert.h>
#include <stdio.h>
#include <stdint.h>

extern "C" int func_0(int);
extern "C" int64_t func_1(int64_t);
extern "C" float func_2(float);
extern "C" double func_3(double);
extern "C" int func_4();

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
}
