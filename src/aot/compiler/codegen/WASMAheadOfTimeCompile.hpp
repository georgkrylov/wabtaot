#ifndef WASM_AHEAD_OF_TIME_COMPILE
#define WASM_AHEAD_OF_TIME_COMPILE


#ifndef WASM_AHEAD_OF_TIME_COMPILE_CONNECTOR
#define WASM_AHEAD_OF_TIME_COMPILE_CONNECTOR
namespace WASM { class AheadOfTimeCompile;}
namespace WASM { typedef WASM::AheadOfTimeCompile AheadOfTimeCompileConnector;}
#endif

#include "codegen/OMRAheadOfTimeCompile.hpp"
namespace TR { class Compilation; }

namespace WASM{

class OMR_EXTENSIBLE AheadOfTimeCompile : public OMR::AheadOfTimeCompileConnector
   {
   public:
   static const size_t SIZEPOINTER = sizeof(uintptr_t);

   AheadOfTimeCompile(uint32_t* ,TR::Compilation * c) :
      OMR::AheadOfTimeCompileConnector(NULL, c)
      {
      }

};
}
#endif // WASM_AHEADOFTIMECOMPILE_HPP