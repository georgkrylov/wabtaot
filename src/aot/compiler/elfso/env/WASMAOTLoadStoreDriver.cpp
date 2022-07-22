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

#include "env/AOTLoadStoreDriver.hpp"
#include "env/AOTMethodHeader.hpp"

TR::AOTLoadStoreDriver *
WASM::AOTLoadStoreDriver::self()
   {
   return reinterpret_cast<TR::AOTLoadStoreDriver *>(this);
   }

TR::AOTMethodHeader *
WASM::AOTLoadStoreDriver::createAndRegisterAOTMethodHeader(const char *methodName, uint8_t *codeStart,
                                                           uint32_t codeSize, TR::RelocationRecordBinaryTemplate *dataStart, uint32_t dataSize)
   {
   TR::AOTMethodHeader *hdr = getRegisteredAOTMethodHeader(methodName);
   if (hdr == NULL)
      {
      hdr = new TR::AOTMethodHeader(codeStart, codeSize, dataStart, dataSize);
      }
   else if (codeStart != NULL && codeSize != 0) /** There might be code without relocations, but code without code makes little sense */
      {
      hdr->setCompiledCodeStart(codeStart);
      hdr->setCompiledCodeSize(codeSize);
      hdr->setRelocationsStart(dataStart);
      hdr->setRelocationsSize(dataSize);
      }
   else
      {
      TR_ASSERT(false, "Error creating header");
      }
   self()->registerAOTMethodHeader(methodName, hdr);
   return hdr;
   }
