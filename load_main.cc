#include <assert.h>
#include <stdint.h>

extern "C" int func_0(int64_t**, int);

int main()
{
  int64_t inner_A[] = { 1L };
  int64_t *A[] = { inner_A };

  assert(func_0(A, 0) == 1);
}
