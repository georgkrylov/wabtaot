cmake_minimum_required(VERSION 3.13)
set(WABTAOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})


add_library(wabtaotcomp STATIC
trap-with.cc
aot-type-dictionary.cc
aot-function-builder.cc
aot-compiler-lib.cc
aot-manager.cc
../interp/binary-reader-interp.cc

)
add_executable(wabtaot
aot-cd.cc
)
target_link_libraries(wabtaotcomp PUBLIC wabtjit)
target_link_libraries(wabtaot PUBLIC wabtaotcomp)
target_link_libraries(wabtaot PUBLIC wabtjit)

# This if statement should preceed add_subdirectory (compiler),
# see the reasoning below.
if (WASM_SHARED_CACHE)
  add_subdirectory(runtime/shared_common/modifications/wasm)
  add_subdirectory(runtime/shared_common/modifications)
  target_link_libraries(wabtaot PUBLIC jitbuilder wabt)
endif ()

# This line should follow after wasm_shared_cache target is defined
# as we are adding sources to this target in compiler subdirectory
# wasm_shared_cache is defined in the add_subdirectory above
add_subdirectory(compiler)

if(OMR_ELF_SHARED_OBJECT)
target_link_libraries(wabtaot PUBLIC jitbuilder aotelfcomp wabt)
endif()



# add_library(aotcompiler
#   trap-with.cc
#   aot-type-dictionary.cc
#   aot-function-builder.cc
# )




