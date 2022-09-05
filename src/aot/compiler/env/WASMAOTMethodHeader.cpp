#include "env/AOTMethodHeader.hpp"
#include "infra/Assert.hpp"
#include "runtime/TRRelocationRecord.hpp"
#include <stdlib.h>
#include <string.h>

TR::AOTMethodHeader *
WASM::AOTMethodHeader::self()
   {
   return reinterpret_cast<TR::AOTMethodHeader *>(this);
   }


WASM::AOTMethodHeader::~AOTMethodHeader()
   {
   if (dependencies != NULL && dependenciesMaxSize != 0)
      {
      delete[] dependencies;
      dependencies = NULL;
      dependenciesMaxSize = 0;
      lastUsedIdxInDependenciesArray = 0;
      }
   }


size_t WASM::AOTMethodHeader::sizeOfSerializedVersion()
   {
   // An examplar computation of size  of serialized version
   // of an AOTMethodHeader, required for memory allocation purposes
   // The size should generally be composed of
   // A size_t to hold whole message size,
   // 2 elements of type uint32_t to store the size of the compiled code and
   // relocation data
   // compiledCodeSize of bytes (uint8_t) for compiledcode,
   // RelocationsSize of bytes (uint8_t) for relocation data.
   // unsigned int: index of the function
   // size of dependencies array - int
   // lastUsedIdxInDependenciesArray * int  for the prototype of additional data
   // sizeof(char)*8 - name of the method
   return sizeof(size_t) + 2 * sizeof(uint32_t) + self()->getCompiledCodeSize() + self()->getRelocationsSize() + sizeof(unsigned int) + sizeof(int) + lastUsedIdxInDependenciesArray * sizeof(int)+sizeof(char)*8;
   }

void WASM::AOTMethodHeader::serializeMethod(uint8_t *buffer, size_t bufferSize)
   {
   size_t allocSize = self()->sizeOfSerializedVersion();
   TR_ASSERT(bufferSize >= allocSize, "Insufficient memory allocated for AOT Method serialization.\n");

   uint8_t *ptr = buffer;

   // Copy the size of the header to the buffer
   memcpy(ptr, &allocSize, sizeof(size_t));

   // Skip the bytes just copied
   ptr += sizeof(size_t);

   uint32_t compiledCodeSize = self()->getCompiledCodeSize();
   // Copy the size of compiled code to the buffer
   memcpy(ptr, &compiledCodeSize, sizeof(uint32_t));

   // Skip the bytes just copied
   ptr += sizeof(uint32_t);

   // Copy the compiled code to the buffer
   memcpy(ptr, self()->getCompiledCodeStart(), compiledCodeSize);

   // Skip the bytes just copied
   ptr += compiledCodeSize;

   uint32_t relocationsSize = self()->getRelocationsSize();
   // Copy the size of relocations data to the buffer
   memcpy(ptr, &relocationsSize, sizeof(uint32_t));

   // Skip the bytes just copied
   ptr += sizeof(uint32_t);
   // Copy the relocations data to the buffer
   memcpy(ptr, reinterpret_cast<uint8_t *>(self()->getRelocationsStart()), relocationsSize);
   // skip size of relocation bytes
   ptr += relocationsSize;

   // Store index of aot function
   memcpy(ptr, &index, sizeof(unsigned int));
   ptr += sizeof(unsigned int);

   // Store size of dependencies array
   memcpy(ptr, &lastUsedIdxInDependenciesArray, sizeof(int));
   ptr += sizeof(int);

   if (lastUsedIdxInDependenciesArray != 0)
      {
      // store additional data, this could be a method promoted to omr
      memcpy(ptr, dependencies, lastUsedIdxInDependenciesArray * sizeof(unsigned int));
      ptr+=lastUsedIdxInDependenciesArray * sizeof(unsigned int);
      }
   memcpy(ptr,self()->methodName,8*sizeof(char));
   // Now the buffer contains all the data relevant to the
   // method header.
   }

WASM::AOTMethodHeader::AOTMethodHeader(uint8_t *serializedMethodData)
    : OMR::AOTMethodHeaderConnector(serializedMethodData)
   {
   /** The parent constructor sets all the fields in OMR::AOTMethodHeader*/
   size_t storedSize = *((size_t *)serializedMethodData);

   /** To set the additional data, we skip the size of the entire header
    */
   serializedMethodData += sizeof(size_t) + 2 * sizeof(uint32_t) + self()->getCompiledCodeSize() + self()->getRelocationsSize();

   // Deserialize index of the function in the environment
   self()->index = *(reinterpret_cast<unsigned int *>(serializedMethodData));
   serializedMethodData += sizeof(unsigned int);

   // Deserialize the maximum dependencies size
   self()->dependenciesMaxSize = *(reinterpret_cast<unsigned int *>(serializedMethodData));
   serializedMethodData += sizeof(unsigned int);

   // malloc array of elements plus five extra
   dependencies = new unsigned int[dependenciesMaxSize + 5];
   // copy exactly the stored number. Maybe nothing to copy
   memcpy(dependencies, serializedMethodData, sizeof(unsigned int) * dependenciesMaxSize);
   self()->lastUsedIdxInDependenciesArray = dependenciesMaxSize;
   // offset the method data and by the size of dependencies array times type
   serializedMethodData+=sizeof(unsigned int) * dependenciesMaxSize;
   // copy method name
   memcpy(self()->methodName,serializedMethodData,sizeof(char)*8);
   // adjust index to be zero based again indicate that max size was updated
   self()->dependenciesMaxSize += 5;
   size_t computedSize = self()->sizeOfSerializedVersion();

   TR_ASSERT(computedSize == storedSize, "Stored and Computed MethodHeader sizes mismatch, possible message corruption \n");
   }

void WASM::AOTMethodHeader::addDependency(unsigned int dep)
   {
   if (dependenciesMaxSize == lastUsedIdxInDependenciesArray)
      {
      /* We have used up all the space in our dependencies array*/
      if (dependenciesMaxSize == 0)
         {
         /* Very first entry, will allocate space for 5 */
         dependenciesMaxSize = 5;
         dependencies = new unsigned int[dependenciesMaxSize];
         }
      else if (lastUsedIdxInDependenciesArray <= 20)
         {
         /* we assume that if there aren't that many dependencies we can
         increment array size by 5, otherwise we will grow it by doubling.*/
         dependenciesMaxSize = dependenciesMaxSize + 5;
         unsigned int *temp = new unsigned int[dependenciesMaxSize];
         for (int i = 0; i < lastUsedIdxInDependenciesArray; i++)
            {
            temp[i] = dependencies[i];
            }
         delete[] dependencies;
         dependencies = temp;
         /*Does realloc automatically copy?*/
         /* realloc(dependencies,(dependenciesMaxSize)*sizeof(unsigned int));*/
         }
      else
         {
         /* Unimplemented, more than 20 dependencies */
         dependenciesMaxSize = dependenciesMaxSize * 2;
         unsigned int *temp = new unsigned int[dependenciesMaxSize];
         for (int i = 0; i < lastUsedIdxInDependenciesArray; i++)
            {
            temp[i] = dependencies[i];
            }
         delete[] dependencies;
         dependencies = temp;
         // fprintf(stderr,"More than 20 dependencies encountered, need to fix in %s,%d\n",__FILE__,__LINE__);
         // assert(false);
         }
      }
   dependencies[lastUsedIdxInDependenciesArray] = dep;
   lastUsedIdxInDependenciesArray++;
   }

void WASM::AOTMethodHeader::assignName(const char* methodName)
   {
   memcpy(self()->methodName,methodName,8*sizeof(char));
   self()->methodName[7]=0;
   }

int WASM::AOTMethodHeader::containsDependency(unsigned int dep)
   {
   int result = 1;
   for (int i = 0; i < lastUsedIdxInDependenciesArray; i++)
      {
      if (dependencies[i] == dep)
         {
         result = 0;
         }
      }
   return result;
   }
