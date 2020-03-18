#include <iostream>
#include "RelocationRecord.hpp"
#include "runtime/RelocationTarget.hpp"

WASM::RelocationRecord::RelocationRecord():OMR::RelocationRecordConnector(){
    std::cout<<"Hello from WASMRelocationRecord, with kind"<<std::endl;
}
WASM::RelocationRecord::RelocationRecord(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):OMR::RelocationRecordConnector(reloRuntime, record){
    std::cout<<"Hello from WASMRelocationRecord, with kind"<<std::endl;
}
WASM::RelocationRecordTwo::RelocationRecordTwo():WASM::RelocationRecord(){
    std::cout<<"Hello from WASMRelocationRecord, with kind"<<std::endl;
}
WASM::RelocationRecordTwo::RelocationRecordTwo(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):WASM::RelocationRecord(reloRuntime, record){
    std::cout<<"Hello from WASMRelocationRecordTwo, with kind"<<std::endl;
}
/*
WASM::RelocationRecordThree::RelocationRecordThree(int kind):WASM::RelocationRecord(kind){
    std::cout<<"Hello from WASMRelocationRecordThree, with kind"<<kind<<std::endl;
}*/
TR::RelocationRecord* WASM::RelocationRecord::create(TR::RelocationRecord *storage, TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, TR::RelocationRecordBinaryTemplate *record){
    TR::RelocationRecord* reloRecord;
    switch (record->type(reloTarget))
    {
        case 2 : reloRecord =reinterpret_cast<TR::RelocationRecord*>(new (storage) WASM::RelocationRecordTwo());
        break;
        case TR_MethodCallAddress : reloRecord =reinterpret_cast<TR::RelocationRecord*>( new (storage) WASM::RelocationRecordMethodCallAddress(reloRuntime,record));
        break;
        default:
            std::cout<<"CANNOT CREATE WASM RELOCATION RECORD WITH KIND"<<std::endl;
            reloRecord = nullptr;
    }
    return reloRecord;
}
void WASM::RelocationRecordTwo::initialize(int dataOne,int dataTwo){
    std::cout<<"A wasm relocationRecordTwo was generated with dataOne="<<dataOne<<" and dataTwo="<<dataTwo<<std::endl;
}

WASM::RelocationRecordMethodCallAddress::RelocationRecordMethodCallAddress():WASM::RelocationRecord(){
    std::cout<<"Hello from WASMRelocationRecordTwo, with kind"<<std::endl;
}

WASM::RelocationRecordMethodCallAddress::RelocationRecordMethodCallAddress(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):WASM::RelocationRecord(reloRuntime, record){
    std::cout<<"Hello from WASMRelocationRecordTwo, with kind"<<std::endl;
}

void TR::RelocationRecordWithOffset::setOffset(TR::RelocationTarget *reloTarget, UDATA offset) { reloTarget->storePointer(reinterpret_cast<uint8_t *>(offset), reinterpret_cast<uint8_t *>(&reinterpret_cast<WASM::RelocationRecordWithOffsetBinaryTemplate*>(_record)->_offset)); }

TR::RelocationRecord* TR::RelocationRecord::create(TR::RelocationRecord *storage, TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, TR::RelocationRecordBinaryTemplate *record){
  return WASM::RelocationRecord::create(storage,reloRuntime,reloTarget,record);
}
