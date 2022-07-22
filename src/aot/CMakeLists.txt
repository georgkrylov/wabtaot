# To allow modifying jitbuilder/wasm_cache sources
# in compiler folder
cmake_minimum_required(VERSION 3.13)
set(WABTAOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# Like a forward declaration for the includes to enable extending
# OMR AOT classes using extensible classes mechanism, specific
# to storage implementation
if(OMR_ELF_SHARED_OBJECT)
  set(WABTAOT_ELF_INCLUDES "")
endif()

if(WASM_SHARED_CACHE)
  set(WABTAOT_SC_INCLUDES "")
endif()

add_library(wabtaotcomp STATIC
  trap-with.cc
  aot-type-dictionary.cc
  aot-function-builder.cc
  aot-compiler-lib.cc
  aot-manager.cc)

# To build jitbuilder before wabtaot, as it is crucial for example,
# since it needs to run API generation first before wabtaot is built
add_dependencies(wabtaotcomp jitbuilder)

# To be able to use compiler defines in wabtaotcomp target
make_compiler_target(wabtaotcomp  PUBLIC  COMPILER jitbuilder)
# wabtaotcomp uses binary-reader-interp, hence linking with wabt
target_link_libraries(wabtaotcomp PUBLIC jitbuilder wabt)

add_executable(wabtaot
  aot-cd.cc)

# To build jitbuilder before wabtaot, as it is crucial for example,
# since it needs to run API generation first before wabtaot is built
add_dependencies(wabtaot jitbuilder)

# This if statement should preceed add_subdirectory (compiler),
# see the reasoning below.
if (WASM_SHARED_CACHE)
  add_subdirectory(runtime/shared_common/modifications/wasm)
  add_subdirectory(runtime/shared_common/modifications)
endif ()

# This line should follow after wasm_shared_cache target is defined
# as we are adding sources to this target in compiler subdirectory
# wasm_shared_cache is defined in the add_subdirectory above
add_subdirectory(compiler)

# This line should follow after compiler is added as subdirectory,
# because both WABTAOT_SC_INCLUDES and WABTAOT_ELF_INCLUDES
# are populated there
if (WASM_SHARED_CACHE)
  # To propagate WASM specific methods of the extensible classes
  target_include_directories(wabtaotcomp BEFORE PUBLIC  ${WABTAOT_SC_INCLUDES})
  # wabtaot uses some interpreter features, hence linking with wabt
  target_link_libraries(wabtaot PUBLIC jitbuilder wabt emclibrary)
endif ()

if(OMR_ELF_SHARED_OBJECT)
  # To build all the other targets before wabtaot
  # Crucial for example for jitbuilder, as it needs to run
  # API generation first before aotelfcomp is built
  add_dependencies(wabtaot aotelfcomp aotelf)
  # To propagate all definitions like OS, target atchitecture, etc.
  # defined by OMR. Allows using TR_ASSERT in the same environment
  # as OMR compiler uses (TR_ASSERT is a no-op in production)
  make_compiler_target(wabtaot PUBLIC COMPILER aotelfcomp)
  # To propagate WASM specific methods of the extensible classes
  target_include_directories(wabtaotcomp BEFORE PUBLIC  ${WABTAOT_ELF_INCLUDES})
  # wabtaotcomp uses binary-reader-interp, hence linking with wabt
  target_link_libraries(wabtaotcomp PUBLIC aotelfcomp)

  # wabtaot uses some interpreter features, hence linking with wabt, and apparently
  # as aotelf is linked with aotelfcomp that's linked with jitbuilder,
  # we also ought to link it here. A bit unclear why, as they are linked
  # in another target (when aotelf is created)
  target_link_libraries(wabtaot PUBLIC wabtaotcomp aotelfcomp aotelf jitbuilder wabt emclibrary)
endif()




