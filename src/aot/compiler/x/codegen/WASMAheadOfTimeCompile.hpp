#ifndef WASM_X86_AHEAD_OF_TIME_COMPILE_INCL
#define WASM_X86_AHEAD_OF_TIME_COMPILE_INCL

#ifndef WASM_AHEAD_OF_TIME_COMPILE_CONNECTOR
#define WASM_AHEAD_OF_TIME_COMPILE_CONNECTOR
namespace WASM { namespace X86 { class AheadOfTimeCompile; } }
namespace WASM { typedef WASM::X86::AheadOfTimeCompile AheadOfTimeCompileConnector; }
#else
   #error WASM::X86::AheadOfTimeCompile expected to be a primary connector, but another connector is already defined
#endif // WASM_AHEADOFTIMECOMPILE_CONNECTOR
#include "compiler/codegen/WASMAheadOfTimeCompile.hpp"

namespace WASM{

namespace X86{
class OMR_EXTENSIBLE AheadOfTimeCompile : public  WASM::AheadOfTimeCompile
   {
   public:
   TR::AheadOfTimeCompile* self();
   AheadOfTimeCompile(uint32_t* t , TR::Compilation *c)
      : WASM::AheadOfTimeCompile(t, c)
      {
      }
   uint8_t* initializeAOTRelocationHeader(TR::IteratedExternalRelocation *relocation);

};
} // namespace X86
} // namespace WASM
#endif // WASM_X86_AHEAD_OF_TIME_COMPILE_INCL