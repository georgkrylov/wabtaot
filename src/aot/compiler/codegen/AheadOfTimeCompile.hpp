#ifndef TR_AHEADOFTIMECOMPILE_INCL
#define TR_AHEADOFTIMECOMPILE_INCL

#include "codegen/WASMAheadOfTimeCompile.hpp"

namespace TR
{

class OMR_EXTENSIBLE AheadOfTimeCompile : public WASM::AheadOfTimeCompileConnector
    {
    public:
    AheadOfTimeCompile(uint32_t* t,TR::Compilation * c)
       : WASM::AheadOfTimeCompileConnector(t, c) {}
    };

}

#endif