################################################################################
# Copyright (c) 2017, 2019 IBM Corp. and others
#
# This program and the accompanying materials are made available under
# the terms of the Eclipse Public License 2.0 which accompanies this
# distribution and is available at https://www.eclipse.org/legal/epl-2.0/
# or the Apache License, Version 2.0 which accompanies this distribution and
# is available at https://www.apache.org/licenses/LICENSE-2.0.
#
# This Source Code may also be made available under the following
# Secondary Licenses when the conditions for such availability set
# forth in the Eclipse Public License, v. 2.0 are satisfied: GNU
# General Public License, version 2 with the GNU Classpath
# Exception [1] and GNU General Public License, version 2 with the
# OpenJDK Assembly Exception [2].
#
# [1] https://www.gnu.org/software/classpath/license.html
# [2] http://openjdk.java.net/legal/assembly-exception.html
#
# SPDX-License-Identifier: EPL-2.0 OR Apache-2.0 OR GPL-2.0 WITH Classpath-exception-2.0 OR LicenseRef-GPL-2.0 WITH Assembly-exception
################################################################################

# omr_add_tracegen(omrshr_mods.tdf)

add_library(wasm_shared_cache STATIC
  WASMOSCache.cpp
  WASMOSCacheHeader.cpp
  WASMOSCacheConfig.cpp
  WASMCompositeCache.cpp
  WASMDataSectionEntryIterator.cpp
)
target_link_libraries(
	jitbuilder PUBLIC wasm_shared_cache
)
# Create shared class library.
# create_omr_compiler_library(
# 	NAME    shared_cache
# 	OBJECTS ${OMR_SHR_COMMON_OBJECTS}
# #	DEFINES PROD_WITH_ASSUMES JITTEST
# )

target_include_directories(wasm_shared_cache
  PRIVATE
		${j9vm_SOURCE_DIR}/shared
		${j9vm_SOURCE_DIR}/shared_util
		${j9vm_SOURCE_DIR}/verbose
		${WABTAOT_SOURCE_DIR}/nls
		${WABTAOT_SOURCE_DIR}/compiler
		${WABTAOT_SOURCE_DIR}/include_core
		${WABTAOT_SOURCE_DIR}/runtime/port/sysvipc
		${WABTAOT_SOURCE_DIR}/port/sysvipc	
		${WABTAOT_SOURCE_DIR}/port/unix
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/modifications
		${WABTAOT_SOURCE_DIR}/runtime/shared_common
		${omr_SOURCE_DIR}/compiler
	PUBLIC
		${CMAKE_CURRENT_BINARY_DIR}
		include
		.
)

target_include_directories(wasm_shared_cache
INTERFACE
	${CMAKE_CURRENT_SOURCE_DIR}
)
target_link_libraries(wasm_shared_cache 
PUBLIC
	${OMR_PORT_LIB}
	)

target_link_libraries(jitbuilder 
PUBLIC
	wasm_shared_cache
			${OMR_PORT_LIB})
 target_link_libraries(wasm_shared_cache
   PRIVATE
		shared_cache_modifications
 		j9pool
 		j9hashtable
)
