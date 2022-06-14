#include "env/AOTMethodHeader.hpp"
#include "infra/Assert.hpp"
#include "runtime/TRRelocationRecord.hpp"
#include <stdlib.h>
#include <string.h>

TR::AOTMethodHeader*
WASM::AOTMethodHeader::self()
   {
   return reinterpret_cast<TR::AOTMethodHeader*> (this);
   }


void
WASM::AOTMethodHeader::serializeMethod(uint8_t* buffer,size_t bufferSize)
   {
   size_t allocSize = self()->sizeOfSerializedVersion();
   TR_ASSERT(bufferSize >= allocSize, "Insufficient memory allocated for AOT Method serialization.\n");

   uint8_t* ptr = buffer;

   // Copy the size of the header to the buffer
   memcpy(ptr,&allocSize,sizeof(size_t));

   // Skip the bytes just copied
   ptr += sizeof(size_t);

   uint32_t compiledCodeSize = self()->getCompiledCodeSize();
   // Copy the size of compiled code to the buffer
   memcpy(ptr,&compiledCodeSize,sizeof(uint32_t));

   // Skip the bytes just copied
   ptr += sizeof(uint32_t);

   // Copy the compiled code to the buffer
   memcpy(ptr,self()->getCompiledCodeStart(),compiledCodeSize);

   // Skip the bytes just copied
   ptr += compiledCodeSize;

   uint32_t relocationsSize = self()->getRelocationsSize();
   // Copy the size of relocations data to the buffer
   memcpy(ptr,&relocationsSize,sizeof(uint32_t));

   // Skip the bytes just copied
   ptr += sizeof(uint32_t);
   // Copy the relocations data to the buffer
   memcpy(ptr,reinterpret_cast<uint8_t*>(self()->getRelocationsStart()),relocationsSize);
   // Now the buffer contains all the data relevant to the
   // method header.
   }

WASM::AOTMethodHeader::AOTMethodHeader(uint8_t* serializedMethodData) : OMR::AOTMethodHeaderConnector(serializedMethodData)
   {
   // This is an examplar implementation of a creating AOTMethodHeader
   // class from the raw data received from the storage container
   // The first sizeof(uintptr_t) bytes
   // stores the size of the AOTMethodHeader , we will use them
   // to assert the size computed by the header function matches
   // the stored size

   size_t storedSize = *((size_t*) serializedMethodData);
   serializedMethodData += sizeof(size_t);

   // The next sizeof(uint32_t) bytes contain the
   // size of compiled code
   self()->setCompiledCodeSize(*((uint32_t*) serializedMethodData));
   serializedMethodData += sizeof(uint32_t);

   // Right after the compliedCodeSize, the codeSize of bytes
   // are the code itself, we should record that as a part
   // of a header
   self()->setCompiledCodeStart(serializedMethodData);

   // We should skip size of compiled code in bytes
   // to get to next element of the header
   serializedMethodData += self()->getCompiledCodeSize();

   // That is relocation size, occupying the next uint32_t bytes
   self()->setRelocationsSize(*((uint32_t*) serializedMethodData));

   // We should skip the sizeof(uint32_t) in bytes to get
   // to the relocations information
   serializedMethodData += sizeof(uint32_t);

   // We take note of the relocationsStart to use the
   // relocations related information in future
   self()->setRelocationsStart(serializedMethodData);

   size_t computedSize = self()->sizeOfSerializedVersion();

   TR_ASSERT(computedSize == storedSize, "Stored and Computed MethodHeader sizes mismatch, possible message corruption \n");

   }