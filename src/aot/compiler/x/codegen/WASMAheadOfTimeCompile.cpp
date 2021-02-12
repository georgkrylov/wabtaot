
#include "codegen/AheadOfTimeCompile.hpp"
#include "runtime/TRRelocationTarget.hpp"
#include "runtime/TRRelocationRecord.hpp"
#include "runtime/AOTRelocationRuntime.hpp"


TR::AheadOfTimeCompile *
WASM::X86::AheadOfTimeCompile::self(){
   return reinterpret_cast<TR::AheadOfTimeCompile *>(this);
}
uint8_t* WASM::X86::AheadOfTimeCompile::initializeAOTRelocationHeader(TR::IteratedExternalRelocation *relocation)
   {
   TR::RelocationRuntime *reloRuntime =self()->reloRuntime();
   TR::RelocationTarget *reloTarget = reloRuntime->reloTarget();
   TR::RelocationRecordBinaryTemplate* binaryTemplate = reinterpret_cast<TR::RelocationRecordBinaryTemplate *>(relocation->getRelocationData());
   uint16_t sizeOfRelocationData = relocation->getSizeOfRelocationData();
   binaryTemplate->setSize(reloTarget,sizeOfRelocationData);
   uint8_t targetKind = relocation->getTargetKind();
   binaryTemplate->setType(reloTarget,targetKind);
   uint8_t  wideOffsets = relocation->needsWideOffsets() ? RELOCATION_TYPE_WIDE_OFFSET : 0;
   binaryTemplate->setFlags(reloTarget,wideOffsets);

   // This has to be created after the kind has been written into the header
   TR::RelocationRecord storage;
   TR::RelocationRecord *reloRecord = TR::RelocationRecord::create(&storage, 
                                       reloRuntime, reloTarget,
                                       reinterpret_cast<TR::RelocationRecordBinaryTemplate *>
                                       (relocation->getRelocationData()));
   switch (targetKind)
      {
         case TR_BranchTable:
         {
         auto target = relocation->getTargetAddress();
         UDATA branchLocation = reinterpret_cast<UDATA>((*(reinterpret_cast<uint64_t*>(target)) - reinterpret_cast<uint64_t>(target)));
	 reinterpret_cast<TR::RelocationRecordWithOffset *>(reloRecord)->setOffset(reloTarget, branchLocation);
	 break;
	 }
	 case 2:
	 {
	   printf("AAAAA");
      break;
	 }
         default:
         // initializeCommonAOTRelocationHeader is currently in the process
         // of becoming the canonical place to initialize the platform agnostic
         // relocation headers; new relocation records' header should be
         // initialized here.
         //cursor = self()->initializeCommonAOTRelocationHeader(relocation, reloRecord);
	 reinterpret_cast<TR::RelocationRecordWithOffset *>(reloRecord)->setOffset(reloTarget, 
						      *reinterpret_cast<UDATA*>(relocation->getTargetAddress()));
      }
      return relocation->getRelocationData()+ sizeof(TR::RelocationRecordBinaryTemplate)+sizeof(UDATA);
   }