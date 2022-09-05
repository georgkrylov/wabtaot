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
#ifndef WASM_AOT_LOAD_STORE_DRIVER
#define WASM_AOT_LOAD_STORE_DRIVER

#ifndef WASM_AOT_LOAD_STORE_DRIVER_CONNECTOR
#define WASM_AOT_LOAD_STORE_DRIVER_CONNECTOR
namespace WASM { class AOTLoadStoreDriver; }
namespace WASM { typedef WASM::AOTLoadStoreDriver AOTLoadStoreDriverConnector; }
#endif
#include "env/ELFAdapter.hpp"

namespace TR { class AOTLoadStoreDriver;}
namespace WASM
   {

/**
 * @brief  AOTLoadStoreDriver to be extended to WASM, as storing methodHeaders
 * is a different process
 */
class OMR_EXTENSIBLE AOTLoadStoreDriver : public ELF::AOTLoadStoreDriverConnector
   {
 public:
   AOTLoadStoreDriver()
       : ELF::AOTLoadStoreDriverConnector(){};
   /**
    * @brief Create a And Register A O T Method Header object.
    * Unless it was previously defined. This could happen in WABTAOT runtime that
    * also may contain AOTMethodHeaders with metadata. In such case, WABTAOT load
    * store driver will merge the header's data with the compiler's data.
    * @param methodName
    * @param codeStart
    * @param codeSize
    * @param dataStart
    * @param dataSize
    * @return TR::AOTMethodHeader*
    */
   TR::AOTMethodHeader *createAndRegisterAOTMethodHeader(const char *methodName, uint8_t *codeStart,
                                                         uint32_t codeSize, TR::RelocationRecordBinaryTemplate *dataStart, uint32_t dataSize);

   void storeHeaderForCompiledMethod(const char* methodName);
 protected:
   TR::AOTLoadStoreDriver *self();
   };
   }   // namespace WASM
#endif // ifndef WASM_AOT_LOAD_STORE_DRIVER