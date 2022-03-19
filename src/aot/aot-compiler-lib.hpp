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
     * @brief Method that allows compiling all methods.
     *
     * @param env - reference to the environment
     */
    static void compileEverything(interp::Environment& env,wabt::aot::AOTManager& aotManager,DefinedModule* module);
    /**
     * @brief Module filename is needed for distinguishing between functions loaded,
     * when doing aot compilation, as we cannot guarantee the module name is always
     * the same. The function defines the module name for other threads to access it
     * later
     * @param module_filename essentially, string filename
     * @param module to update the name
     */
    static void registerModuleNameForAOT(const char* module_filename, DefinedModule* module);

    static void getCompiledFunction(const char *name, void (**fn)());

    /**
     * @brief This function currently serves double purpose, first it defines
     * math functions and globals, and memories and alike, second it runs relocations using OMR
     * relocation infrastructure
     * @param env: pointer to the environment
     * @param module: Defined module
     */
    static void relocateAOT(interp::Environment& env,DefinedModule *module);

#ifndef WASM_SHARED_CACHE // This basically is only used in ELF-enabled runtime
    /**
     * @brief Attempt to load an SO file by filename
     *
     * @param moduleFilename
     */
    static void loadELFToMemory(const char* moduleFilename);

    /**
     * @brief If an so file does not exist and the compilation was successful,
     * save the results into an .so file
     * @param moduleFilename
     */
    static void createELFFile(const char* moduleFilename);

    /**
    * @brief Transform module file name into a shared object file name
    *
    * @param filename - module name
    * @return char* -  newly-allocated string containing the filename
    */
    static char* getSOFilename(char * filename);
    /**
     * @brief Three variables controlling ELF compilation
     * and loading
     */
    static int build_type;
    static int no_of_modules;
    /**
     * @brief this variable is set to 1 when code
     * for some function was not found
     */
    static int shouldReEmitELF;
#endif

};