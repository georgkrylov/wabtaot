#include <assert.h>
#include <stdint.h>
#include <stdio.h>
extern "C" int func_0(int64_t**);
extern "C" int func_1(int64_t**);
extern "C" int func_2(int64_t**);
extern "C" int func_3(int64_t**);
extern "C" int func_4(int64_t**);
extern "C" int func_5(int64_t**, int);
extern "C" int func_6(int64_t**);
extern "C" int func_8(int64_t**);
extern "C" int func_10(int64_t**);
int main(){

  int64_t innerA1[] = {1L};
  int64_t innerA2[] = {2L};
  int64_t innerA3[] = {3L};
  int64_t innerA4[] = {4L};
  int64_t innerA5[] = {5L};
  int64_t innerA6[] = {6L};
  int64_t innerA7[] = {7L};
  int64_t innerA8[] = {8L};
  int64_t *A2[] = {innerA1,innerA2,innerA3,innerA4,innerA5,
		   innerA6,innerA7,innerA8};

  assert(func_0(A2)==1);
  assert(func_1(A2)==2);
  assert(func_2(A2)==3);
  assert(func_3(A2)==4);
  assert(func_4(A2)==5);
  int valueToStoreQ = 32;
  func_5(A2,valueToStoreQ);
  assert(func_4(A2)==valueToStoreQ);
  assert(func_6(A2)==6);
  assert(func_8(A2)==7);
  assert(func_10(A2)==8);
}
