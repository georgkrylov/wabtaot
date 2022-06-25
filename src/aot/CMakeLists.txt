# To allow modifying jitbuilder/wasm_cache sources
# in compiler folder
cmake_minimum_required(VERSION 3.13)
set(WABTAOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})


add_library(wabtaotcomp STATIC
  trap-with.cc
  aot-type-dictionary.cc
  aot-function-builder.cc
  aot-compiler-lib.cc
  aot-manager.cc)

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
  # wabtaot uses some interpreter features, hence linking with wabt
  target_link_libraries(wabtaot PUBLIC jitbuilder wabt)
endif ()

# This line should follow after wasm_shared_cache target is defined
# as we are adding sources to this target in compiler subdirectory
# wasm_shared_cache is defined in the add_subdirectory above
add_subdirectory(compiler)

if(OMR_ELF_SHARED_OBJECT)
  # To build all the other targets before wabtaot
  # Crucial for example for jitbuilder, as it needs to run
  # API generation first before aotelfcomp is built
  add_dependencies(wabtaot aotelfcomp aotelf)
  # To propagate all definitions like OS, target atchitecture, etc.
  # defined by OMR. Allows using TR_ASSERT in the same environment
  # as OMR compiler uses (TR_ASSERT is a no-op in production)
  make_compiler_target(wabtaot PUBLIC COMPILER aotelfcomp)
  # wabtaot uses some interpreter features, hence linking with wabt, and apparently
  # as aotelf is linked with aotelfcomp that's linked with jitbuilder,
  # we also ought to link it here. A bit unclear why, as they are linked
  # in another target (when aotelf is created)
  target_link_libraries(wabtaot PUBLIC aotelfcomp aotelf jitbuilder wabt)
endif()




