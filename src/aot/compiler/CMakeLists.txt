
set(WABTAOT_FILES "" CACHE INTERNAL "The computed list of wabtoat files")
set(WABTAOT_EXTRA_INCLUDES "" CACHE INTERNAL "The computed list of wabtoat includes")

# Used inside added subdirectories to help
# fill in the object list
macro(wabtaot_files)
	set(WABTAOT_FILES ${WABTAOT_FILES} ${ARGN} CACHE INTERNAL "The computed list of wabtoat files")
endmacro(wabtaot_files)

macro(add_wabtaot_subdirectory dir)
	include("${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt")
    message(STATUS "include_dir='${WABTAOT_SOURCE_DIR}/compiler/${dir}/CMakeLists.txt'")
endmacro(add_wabtaot_subdirectory)

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

add_wabtaot_subdirectory(codegen)
add_wabtaot_subdirectory(runtime)
if(WASM_SHARED_CACHE)
	add_wabtaot_subdirectory(env)
endif()
if(OMR_ELF_SHARED_OBJECT)
	add_wabtaot_subdirectory(elfso/env)
endif()

add_wabtaot_subdirectory(${TR_TARGET_ARCH})

set(WABTAOT_INCLUDES
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${WABTAOT_SOURCE_DIR}/
		${omr_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${omr_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${omr_SOURCE_DIR}/compiler
		${omr_SOURCE_DIR}
		${WABTAOT_EXTRA_INCLUDES}
		CACHE INTERNAL "Include header list for ${COMPILER}"
	)


foreach( Thing ${WABTAOT_FILES})
message(STATUS ${Thing})
endforeach()


target_sources(jitbuilder
PRIVATE  
     ${WABTAOT_FILES})

target_compile_definitions(jitbuilder PUBLIC OMR_AOT)
target_include_directories(jitbuilder  BEFORE PRIVATE   
 		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}/${TR_TARGET_SUBARCH}
		${WABTAOT_SOURCE_DIR}/compiler/${TR_TARGET_ARCH}
		${WABTAOT_SOURCE_DIR}/compiler
		${WABTAOT_SOURCE_DIR}/
)

if(OMR_ELF_SHARED_OBJECT)
	target_include_directories(jitbuilder BEFORE PRIVATE 
		${WABTAOT_SOURCE_DIR}/compiler/elfso)
endif()
