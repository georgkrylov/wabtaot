#ifndef WASM_RELO_RECORD
#define WASM_RELO_RECORD
#include <time.h>
#include "runtime/OMRRelocationRecord.hpp"
#ifndef WASM_RELOCATION_RECORD_CONNECTOR
#define WASM_RELOCATION_RECORD_CONNECTOR
namespace WASM { class RelocationRecord;}
namespace WASM { typedef WASM::RelocationRecord WASMRelocationRecordConnector;}
#endif
namespace TR { 
  class RelocationRecord; 
  class RelocationRecordWithOffset;
  class RelocationRecordBinaryTemplate;
}

namespace WASM{
class RelocationRecord:public OMR::RelocationRecordConnector{
    public:
        RelocationRecord();
        RelocationRecord(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record);
        static TR::RelocationRecord* create(TR::RelocationRecord *storage, TR::RelocationRuntime *reloRuntime,
					    TR::RelocationTarget *reloTarget, 
					    TR::RelocationRecordBinaryTemplate *record);
};

class RelocationRecordTwo : public WASM::RelocationRecord{
    public:
        RelocationRecordTwo();
        RelocationRecordTwo(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record);
        virtual void initialize(int dataOne,int dataTwo);
};

/*
class RelocationRecordThree : public WASM::RelocationRecord{
    public:
        RelocationRecordThree(int kind);
};
/*
class RelocationRecordMethodCallAddressBinaryTemplate : public RelocationRecordBinaryTemplate{
    public:
        void setMethodAddress(TR::RelocationTarget*, UDATA address);
	UDATA _methodAddress;
};*/

class RelocationRecordMethodCallAddress : public WASM::RelocationRecord{
    public:
        RelocationRecordMethodCallAddress();
        RelocationRecordMethodCallAddress(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record);
};

class RelocationRecordWithOffsetBinaryTemplate : public OMR::RelocationRecordBinaryTemplateConnector{
     public:
         //void setOffset(TR::RelocationTarget*, UDATA offset);
	 UDATA _offset;
};

}

namespace TR{
class RelocationRecord:public WASM::WASMRelocationRecordConnector{
    public:
        RelocationRecord();
        RelocationRecord(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record);
        static TR::RelocationRecord* create(TR::RelocationRecord *storage, TR::RelocationRuntime *reloRuntime, 
					    TR::RelocationTarget *reloTarget, 
					    TR::RelocationRecordBinaryTemplate *record);
};
class RelocationRecordWithOffset:public WASM::WASMRelocationRecordConnector{
    public:
        RelocationRecordWithOffset();
        RelocationRecordWithOffset(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record);
        static TR::RelocationRecord* create(TR::RelocationRecord *storage, TR::RelocationRuntime *reloRuntime, 
					    TR::RelocationTarget *reloTarget, 
					    TR::RelocationRecordBinaryTemplate *record);
	void setOffset(TR::RelocationTarget *reloTarget, UDATA offset); 
};
class RelocationRecordBinaryTemplate: public OMR::RelocationRecordBinaryTemplateConnector{
    public:
       RelocationRecordBinaryTemplate(){};
};
}
#endif
