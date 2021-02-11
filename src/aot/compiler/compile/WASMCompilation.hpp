#ifndef WASM_COMPILATION_INCL
#define WASM_COMPILATION_INCL

/*
 * The following #define and typedef must appear before any #includes in this file
 */
#ifndef WASM_COMPILATION_CONNECTOR
#define WASM_COMPILATION_CONNECTOR
namespace WASM { class Compilation; }
namespace WASM { typedef WASM::Compilation CompilationConnector; }
#endif

#include "compile/OMRCompilation.hpp"
namespace WASM
{



class OMR_EXTENSIBLE Compilation : public OMR::CompilationConnector
   {
        public:

   Compilation(
         int32_t compThreadId,
         OMR_VMThread *omrVMThread,
         TR_FrontEnd *fe,
         TR_ResolvedMethod *method,
         TR::IlGenRequest &request,
         TR::Options &options,
         TR::Region &heapMemoryRegion,
         TR_Memory *memory,
         TR_OptimizationPlan *optimizationPlan,
         TR::Environment *target = NULL) :
      OMR::CompilationConnector(
         compThreadId,
         omrVMThread,
         fe,
         method,
         request,
         options,
         heapMemoryRegion,
         memory,
         optimizationPlan,
         target)
      {}
    bool compileRelocatableCode() {
        return true;
    } 
   ~Compilation() {}

   };

}
#endif