#include "assert.h"
#include "stdlib.h"

extern "C" void func_0(int64_t**, int);

int main() {
  int64_t inner_fib[] = { 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
			  0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L };
  int64_t* fib[] = { inner_fib };

  func_0(fib, 20);
}
