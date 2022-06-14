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
namespace WASM { class AOTMethodHeader; }
namespace WASM { typedef WASM::AOTMethodHeader AOTMethodHeaderConnector; }
#endif
#include "env/OMRAOTMethodHeader.hpp"

namespace TR {
   class AOTMethodHeader;
   class RelocationRecordBinaryTemplate;
   }

namespace WASM{

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

   AOTMethodHeader(uint8_t* compiledCodeStart, uint32_t compiledCodeSize, uint8_t* relocationsStart, uint32_t relocationsSize)
   : OMR::AOTMethodHeaderConnector(compiledCodeStart,compiledCodeSize,relocationsStart,relocationsSize){};

   AOTMethodHeader(uint8_t* serializedMethodData);

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
   void serializeMethod(uint8_t* buffer,size_t bufferSize);

protected:
      TR::AOTMethodHeader* self();

   };
}
#endif
