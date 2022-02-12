cmake_minimum_required(VERSION 3.13)
set(WABTAOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})


add_executable(wabtaot
trap-with.cc
aot-type-dictionary.cc
aot-function-builder.cc
../interp/binary-reader-interp.cc
  aot-cd.cc
)
target_link_libraries(wabtaot PUBLIC wabtjit)
add_subdirectory(compiler)
if (WASM_SHARED_CACHE)
  add_subdirectory(runtime/shared_common/modifications/wasm)
  add_subdirectory(runtime/shared_common/modifications)
  target_link_libraries(wabtaot PUBLIC jitbuilder wabt)
endif ()
if(OMR_ELF_SHARED_OBJECT)
target_link_libraries(wabtaot PUBLIC jitbuilder aotelfcomp wabt)
endif()



# add_library(aotcompiler
#   trap-with.cc
#   aot-type-dictionary.cc
#   aot-function-builder.cc
# )




