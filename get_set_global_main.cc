#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <iostream>
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


extern "C" int32_t func_0(int64_t**);
extern "C" int64_t func_1(int64_t**);
extern "C" float func_2(int64_t**);
extern "C" double func_3(int64_t**);
extern "C" int func_4(int64_t**);
extern "C" void func_5(int64_t**, int32_t);
extern "C" int func_6(int64_t**);
extern "C" void func_7(int64_t**, int64_t);
extern "C" float func_8(int64_t**);
extern "C" void func_9(int64_t**,float);
extern "C" double func_10(int64_t**);
extern "C" void func_11(int64_t**,double);
int main(){

  int64_t innerA1[] = {10};
  int64_t innerA2[] = {10L};
  int64_t innerA3[] = {convertToInt(10.0F)};
  int64_t innerA4[] = {convertToInt(10.0)};
  int64_t innerA5[] = {0};
  int64_t innerA6[] = {0L};
  int64_t innerA7[] = {convertToInt(0.0F)};
  int64_t innerA8[] = {convertToInt(0.0)};
  int64_t *A2[] = {innerA1,innerA2,innerA3,innerA4,innerA5,
		   innerA6,innerA7,innerA8};
  int valueToStoreQ = 32;
  int64_t isfVTS = 10;
  float fVTS = 10.0F;
  double dVTS = 10.0;
  assert(func_0(A2)==10);
  assert(func_1(A2)==10L);
  assert(func_2(A2)==10.F);
  assert(func_3(A2)==10.0);
  assert(func_4(A2)==0);
  func_5(A2,valueToStoreQ);
  assert(func_4(A2)==valueToStoreQ);
  assert(func_6(A2)==0.0F);
  func_7(A2,isfVTS);
  assert(func_6(A2)==isfVTS);  

  assert(func_8(A2)==0.0F);
  func_9(A2,fVTS);  
  assert(func_8(A2)==fVTS);

  assert(func_10(A2)==0.0);
  func_11(A2,dVTS);  
  assert(func_10(A2)==dVTS);
}
