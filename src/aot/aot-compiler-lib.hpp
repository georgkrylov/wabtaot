#include "JitBuilder.hpp"
#include "../interp/interp.h"
#include "aot-type-dictionary.h"
#include "aot-function-builder.h"
#include "trap-with.h"

using namespace wabt;
using namespace wabt::interp;
extern int32_t internal_compileMethodBuilder(TR::MethodBuilder * methodBuilder, void ** entryPoint);

/**
 * @brief This class is for compiler utility functions
 *
 */
class WABTAOTCompilerLib{
public:
    WABTAOTCompilerLib(){};
#ifndef WASM_SHARED_CACHE
    /**
    * @brief Transform module file name into a shared object file name
    *
    * @param filename - module name
    * @return char* -  newly-allocated string containing the filename
    */
    static char* getSOFilename(char * filename);
#endif

    static void getCompiledFunction(const char *name, void (**fn)());
};