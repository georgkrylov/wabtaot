
add_executable(mixwabtaot
  trap-with.cc
  reg_addr.cpp
  aot-compiler.cc
  aot-type-dictionary.cc
  aot-function-builder.cc
  ../binary-reader-interp.cc
)

target_link_libraries(mixwabtaot PUBLIC jitbuilder libwabt)	
get_property(JITBUILDER_INCLUDE TARGET jitbuilder PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
target_include_directories(mixwabtaot SYSTEM PUBLIC "${JITBUILDER_INCLUDE}")
