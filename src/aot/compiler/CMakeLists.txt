
set(WABTAOT_SC_FILES "" CACHE INTERNAL "The computed list of SC wabtoat files")
set(WABTAOT_ELF_FILES "" CACHE INTERNAL "The computed list of ELF wabtoat files")
set(WABTAOT_SC_EXTRA_INCLUDES "" CACHE INTERNAL "The computed list of wabtoat includes")
set(WABTAOT_ELF_EXTRA_INCLUDES "" CACHE INTERNAL "The computed list of wabtoat includes")

# Used inside added subdirectories to help
# fill in the object list
macro(wabtaot_sc_files)
	set(WABTAOT_SC_FILES ${WABTAOT_SC_FILES} ${ARGN} CACHE INTERNAL "The computed list of wabtoat files")
	message(STATUS "Added SC File" ${ARGN})
endmacro(wabtaot_sc_files)

macro(wabtaot_elf_files)
	set(WABTAOT_ELF_FILES ${WABTAOT_ELF_FILES} ${ARGN} CACHE INTERNAL "The computed list of wabtoat files")
endmacro(wabtaot_elf_files)

macro(add_wabtaot_sc_subdirectory dir)
	include("${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt")
    message(STATUS "sc_include_dir='${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt'")
endmacro(add_wabtaot_sc_subdirectory)

macro(add_wabtaot_elf_subdirectory dir)
	include("${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt")
    message(STATUS "elf_include_dir='${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt'")
endmacro(add_wabtaot_elf_subdirectory)

omr_detect_system_information()

# pick up OS info
include(platform/os/${OMR_HOST_OS})

# pick up architecture Info
include(platform/arch/${OMR_HOST_ARCH})

# pick up toolconfig based on platform
include(platform/toolcfg/${OMR_TOOLCONFIG})

set(TR_TARGET_ARCH ${TR_HOST_ARCH})
set(TR_TARGET_SUBARCH ${TR_HOST_SUBARCH})
set(TR_TARGET_BITS ${TR_HOST_BITS})

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
	add_wabtaot_elf_subdirectory(elfso/env)
	add_wabtaot_elf_subdirectory(${TR_TARGET_ARCH})
	set(WABTAOT_ELF_INCLUDES
		${WABTAOT_ELF_INCLUDES}
		${WABTAOT_SOURCE_DIR}/compiler/elfso
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${WABTAOT_SOURCE_DIR}/compiler/runtime
		${WABTAOT_SOURCE_DIR}/compiler
		${WABTAOT_SOURCE_DIR}/
		${omr_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${omr_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${omr_SOURCE_DIR}/compiler
		${omr_SOURCE_DIR}
		${WABTAOT_EXTRA_INCLUDES}
		CACHE INTERNAL "Include header list for ${COMPILER}")
endif()









target_compile_definitions(jitbuilder PUBLIC OMR_AOT)

if (WASM_SHARED_CACHE)
	foreach( Thing ${WABTAOT_SC_FILES})
		message(STATUS "wabtaot sc files:" ${Thing})
	endforeach()

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


if(OMR_ELF_SHARED_OBJECT)
	foreach( Thing ${WABTAOT_ELF_FILES})
		message(STATUS "wabtaot elf files:" ${Thing})
	endforeach()
	target_sources(jitbuilder
		PRIVATE
		${WABTAOT_ELF_FILES})

	target_include_directories(jitbuilder  BEFORE PRIVATE
		${WABTAOT_SOURCE_DIR}/compiler/elfso
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${WABTAOT_SOURCE_DIR}/compiler/runtime
		${WABTAOT_SOURCE_DIR}/compiler
		${WABTAOT_SOURCE_DIR}/
	)
endif()
