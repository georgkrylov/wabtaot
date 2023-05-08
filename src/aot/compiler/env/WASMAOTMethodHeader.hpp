/*******************************************************************************
 * Copyright (c) 2022, 2022 IBM Corp. and others
 *
 * This program and the accompanying materials are made available under
 * the terms of the Eclipse Public License 2.0 which accompanies this
 * distribution and is available at http://eclipse.org/legal/epl-2.0
 * or the Apache License, Version 2.0 which accompanies this distribution
 * and is available at https://www.apache.org/licenses/LICENSE-2.0.
 *
 * This Source Code may also be made available under the following Secondary
 * Licenses when the conditions for such availability set forth in the
 * Eclipse Public License, v. 2.0 are satisfied: GNU General Public License,
 * version 2 with the GNU Classpath Exception [1] and GNU General Public
 * License, version 2 with the OpenJDK Assembly Exception [2].
 *
 * [1] https://www.gnu.org/software/classpath/license.html
 * [2] http://openjdk.java.net/legal/assembly-exception.html
 *
 * SPDX-License-Identifier: EPL-2.0 OR Apache-2.0 OR GPL-2.0 WITH Classpath-exception-2.0 OR LicenseRef-GPL-2.0 WITH Assembly-exception
 *******************************************************************************/
#ifndef WASM_AOT_METHOD_HEADER
#define WASM_AOT_METHOD_HEADER

#ifndef WASM_AOTMETHODHEADER_CONNECTOR
#define WASM_AOTMETHODHEADER_CONNECTOR
namespace WASM
   {
class AOTMethodHeader;
   }
namespace WASM
   {
typedef WASM::AOTMethodHeader AOTMethodHeaderConnector;
   }
#endif
#include "env/OMRAOTMethodHeader.hpp"
/** Probably, needs to be moved to env*/
#include "env/aot-meta.hpp"

namespace TR
   {
class AOTMethodHeader;
class RelocationRecordBinaryTemplate;
   } // namespace TR

namespace WASM
   {

/**
 * @brief  The AOTMethodHeader files
 * are extensible class hierarchy proposed to be used for serialization and
 * deserialization of relocations buffer to and from the storage, alongside
 * of the compiled code. This class is supposed to be extended for caching
 * more data on the level of compiled code.
 *
 */
class OMR_EXTENSIBLE AOTMethodHeader : public OMR::AOTMethodHeaderConnector
   {
public:
   AOTMethodHeader(uint8_t *compiledCodeStart, uint32_t compiledCodeSize, TR::RelocationRecordBinaryTemplate *relocationsBinaryTemplate, uint32_t relocationsSize)
       : OMR::AOTMethodHeaderConnector(compiledCodeStart, compiledCodeSize, relocationsBinaryTemplate, relocationsSize)
      {
      dependencies = NULL;
      dependenciesMaxSize = 0;
      lastUsedIdxInDependenciesArray = 0;
      dependenciesCompiled = 0;
      dependenciesScanned = false;
      compilationIsSupported = true;
      methodName[0]=0;
      methodCost = 0; 
      chainCost = -1;
      };

   AOTMethodHeader(uint8_t *serializedMethodData);

   ~AOTMethodHeader();

   /**
    * @brief Serializes contents of the WASM AOT Method Header
    * to a specified memory location. Currently is not different
    * from OMR version, but altering this function shows that it
    * overloads the OMR version properly
    * @param buffer
    * The memory location to serialize AOTMethodHeader into
    * @param bufferSize
    * The memory the size of the buffer allocated for serialization
    */
   void serializeMethod(uint8_t *buffer, size_t bufferSize);

   /**
    * @brief Method that computes the size of the WASM header
    * based on its internal "size" fields
    *
    * @return size_t
    */
   size_t sizeOfSerializedVersion();

   /**
    * @brief get the Additional Data : a prototype
    * method to load a previously stored int
    * @return the wabt::aot::AOTMeta*
    */
   wabt::aot::AOTMeta *getAdditionalData();

   /**
    * @brief return is compilation supported
    * 
    * @return true 
    * @return false 
    */
   bool isCompilationSupported();

   /**
    * @brief Get the Method Name object
    * 
    * @return char* 
    */
   char* getMethodName(){return methodName;}

   /**
    * @brief Set the Compilation Is Supported object
    * 
    * @param value 
    */
   void setCompilationIsSupported(bool value);

   /**
    * @brief return is dependenciesScanned
    * 
    * @return true 
    * @return false 
    */
   bool isDependenciesScanned();

      /**
    * @brief Set the Compilation Is Supported object
    * 
    * @param value 
    */
   void setDependenciesScanned(bool value);

   /**
    * @brief Set the Method Cost object
    * 
    * @param value 
    */
   void setMethodCost(int value);

   /**
    * @brief Get the Method Cost object
    * 
    * @return int 
    */
   int getMethodCost();

      /**
    * @brief Set the Method Chain Cost
    * 
    * @param value 
    */
   void setMethodChainCost(int value);

   /**
    * @brief Get the Method Chain Cost
    * 
    * @return int 
    */
   int getMethodChainCost();
   
   void assignName(const char* methodName);
   /**
    * @brief To build a graph, adds a dependency to the calling AOT Meta.
    *
    * @param dep - callee
    */
   void addDependency(unsigned int dep);

   /**
    * @brief Get the Dependencies Array Size
    *
    */
   unsigned int getDependenciesArraySize(){return lastUsedIdxInDependenciesArray;}

   unsigned int *getDependenciesArray(){return dependencies;}
   /**
    * @brief Checks if dependency was previously recorded
    *
    * @param dep index of the dependency to look up
    * @return int 0 if it was, 1 if it wasnt
    */
   int containsDependency(unsigned int dep);
      /**
    * @brief Index of a function the AOT meta is created for. At the moment of initialization is off by some value
    * (depending on the number of modules are read and their exports (which are imports to other modules?)).
    * The proper value (for now) can be computed by subtracting AOTMeta::numberOfImports
    */
   unsigned int index;
   /**
    * @brief If the header has dependencies compiled, then we don't need 
    * to recursively traverse the rest of the methods
    * 0 - unknown
    * 1 - not compiled
    * 2 - compiled
    */
   uint8_t dependenciesCompiled;

protected:

   TR::AOTMethodHeader *self();
   char methodName[8];

   unsigned int *dependencies = NULL;
   /**
    * @brief As we are going to serialize and deserialize the dependencies array,
    * we want to keep track of the maximum size of the array.
    */
   unsigned int dependenciesMaxSize;
   /**
    * @brief As we are going to serialize and deserialize the dependencies array,
    * we want to know if the dependencies were scanned
    */
   bool dependenciesScanned;
   /**
    * @brief As we are going to serialize and deserialize the dependencies array,
    * we want to keep track of the last used index in dependencies array.
    */
   unsigned int lastUsedIdxInDependenciesArray;

   /**
    * @brief This variable is to indicate that the process of compilation should not
    * be reattempted as we're not supporting this compilation
    * 
    */
   bool compilationIsSupported;

   /**
    * @brief Cost of the method, for example in bytecodes
    * should be zero if the method is compiled and assigned
    * by the static analyzer pass if not
    */
   int methodCost;

   /**
    * @brief a value that is not cached, defaults to cost of the
    * method and then is updated by all dependencies cost
    */
   int chainCost;
   };
   } // namespace WASM
#endif
