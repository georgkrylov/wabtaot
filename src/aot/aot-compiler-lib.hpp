#include "JitBuilder.hpp"
#include "../interp/interp.h"
#include "aot-type-dictionary.h"
#include "aot-function-builder.h"
#include "trap-with.h"
#include "env/aot-meta.hpp"

namespace TR {class AOTLoadStoreDriver;}
using namespace wabt;
using namespace wabt::interp;
extern int32_t internal_compileMethodBuilder(TR::MethodBuilder *methodBuilder, void **entryPoint);

namespace wabt{
namespace aot{
/**
 * @brief This class is for compiler utility functions
 *
 */
class WABTAOTCompilerLib
   {
 public:
   WABTAOTCompilerLib(){};
   /**
    * @brief This method should be used after the module is read to generate method representations
    * (MethodBuilders) and make JitBuilder aware of the methods. Applicable for the full-aot runtime
    * aot-cd.cc only
    * @param aotManager the more internal class that is concerned with compilation
    * @param env the runtime environment
    * @param module the module/class description
    * @param filename - file names for describing the methods and distinguishing between them.
    * Functions are currently named using an 8-byte-long name composed of file name, index and module name
    * @param thread because methodBuilder apparently needs one
    */
   static void registerMethods(wabt::aot::AOTManager &aotManager, interp::Environment &env, DefinedModule *module, char *filename, interp::Thread &thread);

   /**
    * @brief Method that allows compiling all methods.Applicable for the full-aot runtime
    * aot-cd.cc only
    * @param env - reference to the environment
    */
   static void compileEverything(interp::Environment &env, wabt::aot::AOTManager &aotManager, DefinedModule *module);

   /**
    * @brief For functions requiring entry point generation, based on
    * the function that the AOTManager was created for, creates a char*
    * with entrypoint name in it.
    * @param fn - the defined function, potentially should be the function index
    * @return char* - entry point function name. Freeing the memory
    * is the responsibility of the user
    */
   static char* generateEntryPointName(interp::DefinedFunc* fn);

   /**
    * @brief For functions requiring AOT compilation, based on
    * the function index in the environment and sets the string to
    * the third variable
    * @param *env - environment pointer
    * @param Index - index of a function within environment
    * @param name - string with the function name
    */
   static void generateFunctionName(wabt::interp::Environment* env,unsigned int Index, std::string& name);

   /**
    * @brief Module filename is needed for distinguishing between functions loaded,
    * when doing aot compilation, as we cannot guarantee the module name is always
    * the same. The function defines the module name for other threads to access it
    * later
    * @param module_filename essentially, string filename
    * @param module to update the name
    */
   static void registerModuleNameForAOT(const char *module_filename, DefinedModule *module);

   /**
    * @brief To account with imports and externally defined functions and be able to properly
    * calculate function indexes and offsets, we need to register imports. Potentailly it needs to
    * define imports to every AOTManager that starts the compilation.
    * This function now differentiates between the first and subsequent invocations of registerAllImports,
    * depending on the value of registeredImportsOnce.
    * This function is currently buggy, as it does define all exports as imports, which is true (?)
    * for all other modules, but not within the module
    * @param aotManager
    * @param env
    */
   static void registerAllImports(wabt::aot::AOTManager &aotManager, interp::Environment &env);

   /**
    * @brief To define some necessary methods for Emscripten functionality, as well as memories
    * and globals when using relocation infrastructure. As aot-cd.cc does not define executor,
    * a special case is created for it.
    * @param executor  - parameter that is passed from the em-interp
    * @param thread  - parameter that is passed from aot-cd.cc
    */
   static void preSetCodeEntries(wabt::interp::Executor* executor = nullptr, wabt::interp::Thread* thread = nullptr);

   /**
    * @brief Computes (hopefully correctly, still need to verify) the offset to index in the compiling environment to
    * be able to use while compilng Opcode::Call. This offset is due to other modules loaded.
    * @param env  environment pointer
    * @param Index the index of the current function
    * @return int - an offset, how many were exported before (or somehow else defined in the environment, for instance,
    * through the AppendExport).
    */
   static int approximateFirstFunctionInAModule(interp::Environment &env, unsigned int Index);

   /**
    * @brief This function is to be used when interpreter calls AOT function
    * the goal is to get a memory containing list of arguments and turn them
    * into OMR::ILValue, for pushing them onto method stack.
    * Another design complication that this function is to be defined to jitbuilder,
    * so it has to be written having JitBuilder types compiliance in mind.
    * This function is also supposed to free the memory allocated for its arguments
    * Index can be used to fetch the function signature for parameter type
    * Finally, to do so, an environment pointer is supplied.
    * This function is supposed to be defined to JITBuilder through defineFunction?
    *
    * @param numOfArgs  - number of arguments in the function call, could be removed if we
    * use the environment more extensibely
    * @param args - array of arguments
    * @param index - function index in the environment, for type handling
    * @param env - for querying environment, void* to comply with JitBuilder types
    */
   static void prepareAOTCall(long numOfArgs, long *args, unsigned int index, void *env);

   static void getCompiledFunction(const char *name, void (**fn)());

   /**
    * @brief Get the Module Index By Function Index
    * Works by iterating through all modules in the environment and looking up
    * their exports. The assumption is that if a module exists it defines exports.
    * if the current index is greater than sum of previous export counts but less
    * than the sum of exports in the previous + next, we are looking at the right module.
    * @param env - environment module to get modules and sizes of exports in particular
    * @param Index  - index of the function in question
    * @return unsigned int - computed index of the module
    */
   static int getModuleIndexByFunctionIndex(interp::Environment &env, unsigned int Index);

   /**
    * @brief This function currently serves double purpose, first it defines
    * emscripten counterparts to be used in full-aot, second it runs relocations using OMR
    * relocation infrastructure
    * @param env: pointer to the environment
    * @param module: Defined module
    */
   static void relocateAOT(interp::Environment &env, DefinedModule *module);

   static void setLoadStoreDriver(TR::AOTLoadStoreDriver* driver);
   static TR::AOTLoadStoreDriver* getLoadStoreDriver();
#ifndef WASM_SHARED_CACHE // This basically is only used in ELF-enabled runtime
   /**
    * @brief Attempt to load an SO file by filename
    *
    * @param moduleFilename
    */
   static void loadELFToMemory(const char *moduleFilename);

   /**
    * @brief If an so file does not exist and the compilation was successful,
    * save the results into an .so file
    * @param moduleFilename
    */
   static void createELFFile(const char *moduleFilename);

   /**
    * @brief Transform module file name into a shared object file name
    *
    * @param filename - module name
    * @return char* -  newly-allocated string containing the filename
    */
   static char *getSOFilename(char *filename);

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
   static int registeredImportsOnce;
   static TR::AOTLoadStoreDriver* _loadStoreDriver;
   };
}
}