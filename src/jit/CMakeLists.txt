#
# Copyright 2017 wasmjit-omr project participants
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Disable warnings when building all OMR components since OMR is more lax about some warnings.
# Since this logic is inside a function, this only applies within the scope of the OMR CMake
# files.
cmake_policy(SET CMP0012 NEW)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w")
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../third_party/omr/cmake/modules" ${CMAKE_MODULE_PATH})
include(OmrTargetSupport)
include(OmrPlatform)
include(OmrCompilerSupport)
add_subdirectory(../../third_party/omr/example/glue omr/example/glue EXCLUDE_FROM_ALL)
add_subdirectory(../../third_party/omr  omr/build EXCLUDE_FROM_ALL)

get_property(JITBUILDER_INCLUDE TARGET jitbuilder PROPERTY INTERFACE_INCLUDE_DIRECTORIES)

get_property(JITBUILDER_DEFINITIONS TARGET jitbuilder PROPERTY INTERFACE_COMPILE_DEFINITIONS)

set(WABTJIT_FILES  environment.cc
type-dictionary.cc
function-builder.cc
wabtjit.cc
stack.cc
vms_hack.cc
thunk.cc)

create_omr_compiler_library(
	NAME wabtjit
	OBJECTS ${WABTJIT_FILES}
	DEFINES ${JITBUILDER_DEFINITIONS}
	INCLUDES ${JITBUILDER_INCLUDE}
)
make_compiler_target(wabtjit PUBLIC COMPILER jitbuilder)
add_dependencies(wabtjit jitbuilder)
target_link_libraries(wabtjit PUBLIC jitbuilder)
