cmake_minimum_required(VERSION 3.13)
set(WABTAOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
add_subdirectory(compiler)

add_executable(wabtaot
  trap-with.cc
  aot-type-dictionary.cc
  aot-function-builder.cc
  ../interp/binary-reader-interp.cc
  aot-cd.cc
)


target_link_libraries(wabtaot PUBLIC jitbuilder wabt)
