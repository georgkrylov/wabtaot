
set(WABTAOT_SC_FILES "" CACHE INTERNAL "The computed list of SC wabtoat files")
set(WABTAOT_ELF_FILES "" CACHE INTERNAL "The computed list of ELF wabtoat files")
set(WABTAOT_SC_EXTRA_INCLUDES "" CACHE INTERNAL "The computed list of wabtoat includes")
set(WABTAOT_ELF_EXTRA_INCLUDES "" CACHE INTERNAL "The computed list of wabtoat includes")

# Used inside added subdirectories to help
# fill in the object list
macro(wabtaot_sc_files)
	set(WABTAOT_SC_FILES ${WABTAOT_SC_FILES} ${ARGN} CACHE INTERNAL "The computed list of wabtoat files")
endmacro(wabtaot_sc_files)

macro(wabtaot_elf_files)
	set(WABTAOT_ELF_FILES ${WABTAOT_ELF_FILES} ${ARGN} CACHE INTERNAL "The computed list of wabtoat files")
endmacro(wabtaot_elf_files)

macro(add_wabtaot_sc_subdirectory dir)
	include("${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt")
endmacro(add_wabtaot_sc_subdirectory)

macro(add_wabtaot_elf_subdirectory dir)
	include("${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt")
endmacro(add_wabtaot_elf_subdirectory)


if (WASM_SHARED_CACHE)
	add_wabtaot_sc_subdirectory(codegen)
	add_wabtaot_sc_subdirectory(runtime)
	add_wabtaot_sc_subdirectory(env)
	add_wabtaot_sc_subdirectory(${TR_TARGET_ARCH})
	set(WABTAOT_SC_INCLUDES
		${WABTAOT_SC_INCLUDES}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/modifications/include
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/modifications/wasm
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/modifications/
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/include
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/
		${WABTAOT_SOURCE_DIR}/runtime/
		${WABTAOT_SOURCE_DIR}/compiler/runtime
		${WABTAOT_SOURCE_DIR}/compiler
		${WABTAOT_SOURCE_DIR}/
		${omr_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${omr_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${omr_SOURCE_DIR}/compiler
		${omr_SOURCE_DIR}
		${WABTAOT_EXTRA_INCLUDES}
		CACHE INTERNAL "Include header list for ${COMPILER}")
endif ()

if(OMR_ELF_SHARED_OBJECT)
	add_wabtaot_elf_subdirectory(codegen)
	add_wabtaot_elf_subdirectory(runtime)
	add_wabtaot_elf_subdirectory(compile)
	add_wabtaot_elf_subdirectory(env)
	add_wabtaot_elf_subdirectory(elfso/env)
	add_wabtaot_elf_subdirectory(${TR_TARGET_ARCH})
	# Everything else will be added by make_compiler_target
	# By including elfso before anything else we make sure
	# AOTStorageInterface is properly included
	set(WABTAOT_ELF_INCLUDES
		${WABTAOT_SOURCE_DIR}/compiler/elfso
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${WABTAOT_SOURCE_DIR}/compiler
		${WABTAOT_SOURCE_DIR}/
		CACHE INTERNAL "Include header list for ${COMPILER}")
endif()

target_compile_definitions(jitbuilder PUBLIC OMR_AOT)

if (WASM_SHARED_CACHE)
	foreach( Thing ${WABTAOT_SC_FILES})
		message(STATUS "wabtaot sc files:" ${Thing})
	endforeach()

	# This is needed to add new changes to AOTMethodHeader
	# to wasm_shared_cache target
	target_sources(wasm_shared_cache
		PRIVATE
		${WABTAOT_SC_FILES})

	# As we've just added several source files to the wasm_shared_cache
	# target, we need to update the include directories to "shadow"
	# the  includes defined by OMR and facilitate extensible classes
	# functionality
	target_include_directories(wasm_shared_cache
		BEFORE PRIVATE
		${WABTAOT_SC_INCLUDES})

	target_sources(jitbuilder
		PRIVATE
		${WABTAOT_SC_FILES})
	target_include_directories(jitbuilder  BEFORE PRIVATE
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/modifications/include
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/modifications/wasm
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/modifications/
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/include
		${WABTAOT_SOURCE_DIR}/runtime/shared_common/
		${WABTAOT_SOURCE_DIR}/runtime/
		${WABTAOT_SOURCE_DIR}/compiler/runtime
		${WABTAOT_SOURCE_DIR}/compiler
		${WABTAOT_SOURCE_DIR}/)
endif ()
get_property(JITBUILDER_INCLUDE TARGET jitbuilder PROPERTY INTERFACE_INCLUDE_DIRECTORIES)

if(OMR_ELF_SHARED_OBJECT)
	# Create a library using the set of pre-defined files
	add_library(aotelfcomp
		${WABTAOT_ELF_FILES})

	# This line will make aotelfcomp to use jitbuilder as a backend, the include directores
	# for jitbuilder include will appear first, breaking extensible classes
	make_compiler_target(aotelfcomp PUBLIC COMPILER jitbuilder)

	# This line should re-introduce include directories before jitbuilder includes,
	# hence re-enabling extensible classes. CRUCIAL: BEFORE, to modify the include 
	# path and properly follow extensible classes. PUBLIC is also important
	# to let every other target linking with jitbuilder to use these headers
	# targets linking with jitbuilder will also need to link with aotelfcomp
	# (probably handled by target_link_libraries jitbuilder aotelfcomp and 
	# target_link_libraries  aotelfcomp jitbuilder  combo that follows a bit later)
	target_include_directories(aotelfcomp BEFORE PUBLIC ${WABTAOT_ELF_INCLUDES})
	# This line makes jitbuilder look for our extensible classes headers when compiled
	target_include_directories(jitbuilder BEFORE PUBLIC ${WABTAOT_ELF_INCLUDES})
	# This line makes aotelf look for our extensible classes headers when compiled
	target_include_directories(aotelf BEFORE PUBLIC ${WABTAOT_ELF_INCLUDES})

	# To be able to call jitbuilder and aotelf methods from aotelfcomp
	target_link_libraries(aotelfcomp PUBLIC aotelf jitbuilder )
	# For jitbuilder to resolve symbols from newly appended headers
	target_link_libraries(jitbuilder PUBLIC aotelfcomp)
	# For aotelf to resolve symbols from newly appended headers
	target_link_libraries(aotelf PUBLIC  aotelfcomp )
endif()
