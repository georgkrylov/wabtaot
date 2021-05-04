
#ifndef TR_RELOCATION_RECORD_INCL
#define TR_RELOCATION_RECORD_INCL

#include "runtime/WASMRelocationRecord.hpp"

namespace TR{
class RelocationRecord:public WASM::WASMRelocationRecordConnector{
    public:
        RelocationRecord();
        RelocationRecord(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record);
  /*using WASM::WASMRelocationRecordConnector::create;*/
       /* typedef WASM::WASMRelocationRecordConnector::create TR::RelocationRecord::create;*/
      
};
class RelocationRecordWithOffset:public WASM::RelocationRecordWithOffset{
    public:
        RelocationRecordWithOffset(){}
        RelocationRecordWithOffset(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record){}
        /*static TR::RelocationRecord* create(TR::RelocationRecord *storage, TR::RelocationRuntime *reloRuntime, 
					    TR::RelocationTarget *reloTarget, 
					    TR::RelocationRecordBinaryTemplate *record);*/
	void setOffset(TR::RelocationTarget *reloTarget, UDATA offset);
};
class RelocationRecordBinaryTemplate: public WASM::RelocationRecordWithOffsetBinaryTemplate{
    public:
       RelocationRecordBinaryTemplate(){};
};

class RelocationRecordGroup: public OMR::RelocationRecordGroup
   {
public:
   RelocationRecordGroup(TR::RelocationRecordBinaryTemplate *groupData)
    : OMR::RelocationRecordGroup(groupData)
      { };
   };

}

#endif