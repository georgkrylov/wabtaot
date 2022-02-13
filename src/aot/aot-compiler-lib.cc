
#include "aot-compiler-lib.hpp"

void WABTAOTCompilerLib::getCompiledFunction(const char *name, void (**fn)())
{
  *fn = reinterpret_cast<void(*)()>(getCodeEntry(const_cast<char*>(name)));
}
