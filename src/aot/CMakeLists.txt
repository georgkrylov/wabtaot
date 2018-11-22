
add_executable(wabtaot
  trap-with.cc
  reg_addr.cpp
  aot-compiler.cc
  aot-type-dictionary.cc
  aot-function-builder.cc
  ../binary-reader-interp.cc
)

target_link_libraries(wabtaot PUBLIC jitbuilder libwabt)	
get_property(JITBUILDER_INCLUDE TARGET jitbuilder PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
target_include_directories(wabtaot SYSTEM PUBLIC "${JITBUILDER_INCLUDE}")
