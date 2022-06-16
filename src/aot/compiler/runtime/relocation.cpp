#include <iostream>
#include "runtime/TRRelocationRecord.hpp"
#include "runtime/TRRelocationRuntime.hpp"
#include "runtime/TRRelocationTarget.hpp"

WASM::RelocationRecord::RelocationRecord():OMR::RelocationRecordConnector(){

}
WASM::RelocationRecord::RelocationRecord(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):OMR::RelocationRecordConnector(reloRuntime, record){

}
WASM::RelocationRecordTwo::RelocationRecordTwo():WASM::RelocationRecord(){

}
WASM::RelocationRecordTwo::RelocationRecordTwo(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):WASM::RelocationRecord(reloRuntime, record){

}

WASM::RelocationRecordWithOffset::RelocationRecordWithOffset(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):WASM::RelocationRecord(reloRuntime, record){
}

/*
WASM::RelocationRecordThree::RelocationRecordThree(int kind):WASM::RelocationRecord(kind){
    std::cout<<"Hello from WASMRelocationRecordThree, with kind"<<kind<<std::endl;
}*/
TR::RelocationRecord* WASM::RelocationRecord::create(TR::RelocationRecord *storage, TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, TR::RelocationRecordBinaryTemplate *record){
    TR::RelocationRecord* reloRecord;
    switch (record->type(reloTarget))
    {

        case TR_MethodCallAddress : 
	  reloRecord =reinterpret_cast<TR::RelocationRecord*>( new (storage) WASM::RelocationRecordMethodCallAddress(reloRuntime,record)); 
	  break;
	case TR_DataAddress : 
	  reloRecord = reinterpret_cast<TR::RelocationRecord*>( new (storage) WASM::RelocationRecordDataAddress(reloRuntime,record)); 
	  break;
	case TR_BranchTable : 
	  reloRecord = reinterpret_cast<TR::RelocationRecord*>( new (storage) WASM::RelocationRecordBranchTable(reloRuntime,record)); 
	  break;
        break;
        default:
            std::cout<<"CANNOT CREATE WASM RELOCATION RECORD WITH KIND"<<std::endl;
            reloRecord = nullptr;
    }
    return reloRecord;
}
void WASM::RelocationRecordTwo::initialize(int dataOne,int dataTwo){

}

WASM::RelocationRecordMethodCallAddress::RelocationRecordMethodCallAddress():WASM::RelocationRecord(){

}

WASM::RelocationRecordMethodCallAddress::RelocationRecordMethodCallAddress(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):WASM::RelocationRecord(reloRuntime, record){

}

void 
WASM::RelocationRecordMethodCallAddress::preparePrivateData(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget){
  TR::RelocationRecordMethodCallPrivateData *reloPrivateData = reinterpret_cast< TR::RelocationRecordMethodCallPrivateData*>(privateData());
   uint8_t *baseLocation = 0;
   uint8_t *callTargetAddress = computeTargetMethodAddress(reloRuntime, reloTarget, baseLocation);
   //reloPrivateData->callTargetOffset = (callTargetAddress - baseLocation);
   reloPrivateData->callTargetOffset = reinterpret_cast<uintptr_t>(callTargetAddress);
}

uint8_t *
WASM::RelocationRecordDataAddress::computeTargetMethodAddress(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *baseLocation)
   {
   uint8_t *callTargetAddress = address(reloTarget);
   char methodName[8]{};
   memset(methodName,0,8*sizeof(char));
   memcpy(methodName,&callTargetAddress,8);
   callTargetAddress = reinterpret_cast<uint8_t*>(reinterpret_cast<TR::RelocationRuntime *>(reloRuntime)->runtimeItemAddress(methodName));
   if (!callTargetAddress) throw std::runtime_error(std::string("symbol not defined: ")+std::string(reinterpret_cast<char*>(methodName)));
   return callTargetAddress;
   }
uint8_t *
WASM::RelocationRecordMethodCallAddress::computeTargetMethodAddress(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *baseLocation)
   {
   uint8_t *callTargetAddress = address(reloTarget);
   char methodName[8]{};
   memset(methodName,0,8*sizeof(char));
   memcpy(methodName,&callTargetAddress,8);
   callTargetAddress = reinterpret_cast<uint8_t*>(reinterpret_cast<TR::RelocationRuntime *>(reloRuntime)->runtimeItemAddress(methodName));
   if (!callTargetAddress) throw std::runtime_error(std::string("symbol not defined: ")+std::string(reinterpret_cast<char*>(methodName)));
   return callTargetAddress;
   }

int32_t WASM::RelocationRecord::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocation)
   {      
   int32_t result = -1 ;
   switch (self()->type(reloTarget))
      {
      case TR_MethodCallAddress : 
         result = reinterpret_cast<WASM::RelocationRecordMethodCallAddress*>(self())->applyRelocation(reloRuntime,reloTarget,reloLocation); 
         break;
      case TR_DataAddress : 
         result = reinterpret_cast<WASM::RelocationRecordDataAddress*>(self())->applyRelocation(reloRuntime,reloTarget,reloLocation);
         break;
      case TR_BranchTable : 
         result = reinterpret_cast<WASM::RelocationRecordBranchTable*>(self())->applyRelocation(reloRuntime,reloTarget,reloLocation);
         break;
      default:
         std::cout<<"CANNOT APPLY WASM RELOCATION RECORD WITH KIND"<<std::endl;
      }
   return result;
   }


void WASM::RelocationRecord::preparePrivateData(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget)
   {      
   switch (self()->type(reloTarget))
      {
      case TR_MethodCallAddress : 
         reinterpret_cast<WASM::RelocationRecordMethodCallAddress*>(self())->preparePrivateData(reloRuntime,reloTarget); 
         break;
      case TR_DataAddress : 
         reinterpret_cast<WASM::RelocationRecordDataAddress*>(self())->preparePrivateData(reloRuntime,reloTarget); 
         break;
      case TR_BranchTable : 
         reinterpret_cast<WASM::RelocationRecordBranchTable*>(self())->preparePrivateData(reloRuntime,reloTarget);
         break;
      default:
         std::cout<<"CANNOT APPLY WASM RELOCATION RECORD WITH KIND"<<std::endl;
      }
   }

int32_t WASM::RelocationRecord::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocationLow, uint8_t *reloLocationHigh)
   {      
      TR_UNIMPLEMENTED();
   }

int32_t WASM::RelocationRecordMethodCallAddress::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocation)
   {      
     uint8_t* addressOfTheFunction =reinterpret_cast<uint8_t*>(reinterpret_cast<TR::RelocationRecordMethodCallPrivateData*>(privateData())->callTargetOffset);
      reloTarget->storePointer( addressOfTheFunction, reloLocation);
      return 0;
   }

int32_t WASM::RelocationRecordMethodCallAddress::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocationLow, uint8_t *reloLocationHigh)
   {      
      return -1;
   }
uint8_t*
WASM::RelocationRecordDataAddress::address(TR::RelocationTarget *reloTarget)
   {
   RelocationRecordWithOffsetBinaryTemplate *reloData = reinterpret_cast<RelocationRecordWithOffsetBinaryTemplate *>(_record);
   return reloTarget->loadPointer(reinterpret_cast<uint8_t *>(&reloData->_offset));
   }

uint8_t*
WASM::RelocationRecordMethodCallAddress::address(TR::RelocationTarget *reloTarget)
   {
   RelocationRecordWithOffsetBinaryTemplate *reloData = reinterpret_cast<RelocationRecordWithOffsetBinaryTemplate *>(_record);
   return reloTarget->loadPointer(reinterpret_cast<uint8_t *>(&reloData->_offset));
   }

void
WASM::RelocationRecordMethodCallAddress::setAddress(TR::RelocationTarget *reloTarget, uint8_t *callTargetAddress)
   {
   RelocationRecordWithOffsetBinaryTemplate *reloData = reinterpret_cast<RelocationRecordWithOffsetBinaryTemplate *>(_record);
   reloTarget->storePointer(callTargetAddress, reinterpret_cast<uint8_t *>(&reloData->_offset));
   }

uint8_t*
WASM::RelocationRecordWithOffset::offset(TR::RelocationTarget *reloTarget)
   {
   return reloTarget->loadPointer(reinterpret_cast<uint8_t *>( &(reinterpret_cast<RelocationRecordWithOffsetBinaryTemplate *>(_record))->_offset));
   }

uint8_t*
WASM::RelocationRecordBranchTable::offset(TR::RelocationTarget *reloTarget)
   {
   return reloTarget->loadPointer(reinterpret_cast<uint8_t *>( &(reinterpret_cast<RelocationRecordWithOffsetBinaryTemplate *>(_record))->_offset));
   }
/**
 * @brief Needs to be updated with store relocation record value.
 * 
 * @param reloTarget 
 * @param offset 
 */
void WASM::RelocationRecordWithOffset::setOffset(TR::RelocationTarget *reloTarget, UDATA offset) { reloTarget->storePointer(reinterpret_cast<uint8_t *>(offset), reinterpret_cast<uint8_t *>(&reinterpret_cast<WASM::RelocationRecordWithOffsetBinaryTemplate*>(_record)->_offset)); }


WASM::RelocationRecordDataAddress::RelocationRecordDataAddress():WASM::WASMRelocationRecordConnector(){

}

WASM::RelocationRecordDataAddress::RelocationRecordDataAddress(TR::RelocationRuntime *reloRuntime, TR::RelocationRecordBinaryTemplate *record):WASMRelocationRecordConnector(reloRuntime, record){

}

void 
WASM::RelocationRecordDataAddress::preparePrivateData(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget){
  TR::RelocationRecordMethodCallPrivateData *reloPrivateData = reinterpret_cast<TR::RelocationRecordMethodCallPrivateData*>(privateData());
   uint8_t *baseLocation = 0;
   uint8_t *callTargetAddress = computeTargetMethodAddress(reloRuntime, reloTarget, baseLocation);
   //reloPrivateData->callTargetOffset = (callTargetAddress - baseLocation);
   reloPrivateData->callTargetOffset = reinterpret_cast<uintptr_t>(callTargetAddress);
}

void 
WASM::RelocationRecordBranchTable::preparePrivateData(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget){
   // Does nothing for now, can potentially save up some  time by caching the value
}
void 
WASM::RelocationRecordWithOffset::preparePrivateData(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget){
   // Does nothing for now, can potentially save up some  time by caching the value
}
int32_t
WASM::RelocationRecordDataAddress::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocation)
   {
   char *name = reinterpret_cast<char *>(&reinterpret_cast<WASM::RelocationRecordWithOffsetBinaryTemplate*>(_record)->_offset);
   reloTarget->storePointer(reinterpret_cast<uint8_t*>(reloRuntime->runtimeItemAddress(name)), reloLocation);
   return 0;
   }

int32_t WASM::RelocationRecordDataAddress::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocationLow, uint8_t *reloLocationHigh)
   {
      return -1;
   }

int32_t
WASM::RelocationRecordBranchTable::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocation)
   {
   reloTarget->storePointer(reloLocation+reinterpret_cast<UDATA>(offset(reloTarget)),reloLocation);
   return 0;
   }

int32_t WASM::RelocationRecordBranchTable::applyRelocation(TR::RelocationRuntime *reloRuntime, TR::RelocationTarget *reloTarget, uint8_t *reloLocationLow, uint8_t *reloLocationHigh)
   {
      return -1;
   }

void TR::RelocationRecordWithOffset::setOffset(TR::RelocationTarget *reloTarget, UDATA offset) { WASM::RelocationRecordWithOffset::setOffset(reloTarget, offset); }

TR::RelocationRecord::RelocationRecord() {}

