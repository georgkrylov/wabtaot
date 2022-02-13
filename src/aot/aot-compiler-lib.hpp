#include "JitBuilder.hpp"
#include "../interp/interp.h"
class WABTAOTCompilerLib{
public:
    WABTAOTCompilerLib(){};
    static void getCompiledFunction(const char *name, void (**fn)());
};