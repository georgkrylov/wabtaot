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
    /**
     * @brief This method should be used after the module is read to generate method representations
     * (MethodBuilders) and make JitBuilder aware of the methods
     * @param aotManager the more internal class that is concerned with compilation
     * @param env the runtime environment
     * @param module the module/class description
     * @param filename - file names for describing the methods and distinguishing between them.
     * Functions are currently named using an 8-byte-long name composed of file name, index and module name
     * @param thread because methodBuilder apparently needs one
     */
    static void registerMethods(wabt::aot::AOTManager& aotManager,interp::Environment& env, DefinedModule* module, char * filename,interp::Thread& thread);

    /**
     * @brief Module filename is needed for distinguishing between functions loaded,
     * when doing aot compilation, as we cannot guarantee the module name is always
     * the same. The function defines the module name for other threads to access it
     * later
     * @param module_filename essentially, string filename
     * @param module to update the name
     */
    static void registerModuleNameForAOT(const char* module_filename, DefinedModule* module);
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