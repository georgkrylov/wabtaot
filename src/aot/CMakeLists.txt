
add_executable(wabtaot
  aot-compiler.cc
  aot-type-dictionary.cc
  aot-function-builder.cc
  ../binary-reader-interp.cc
)

target_link_libraries(wabtaot PUBLIC wabtjit jitbuilder)	
get_property(JITBUILDER_INCLUDE TARGET jitbuilder PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
target_include_directories(wabtaot SYSTEM PUBLIC "${JITBUILDER_INCLUDE}")
