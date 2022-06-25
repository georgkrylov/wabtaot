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

# As create_omr_compiler_library by default includes "compiler folder root"
# i.e. ".", we can set WABTJIT_INCLUDES to empty

add_library(wabtjit
	environment.cc
	type-dictionary.cc
	function-builder.cc
	wabtjit.cc
	stack.cc
	vms_hack.cc
	thunk.cc)

# To properly configure defines etc, as this is crucial
# for x86 to use proper vector sizes, as well as to
# properly be able to use TR_ASSERT()
make_compiler_target(wabtjit PUBLIC COMPILER jitbuilder)

# To make sure the JITbuilder APIgen was executed before
# wabtjit is built
add_dependencies(wabtjit jitbuilder)
target_link_libraries(wabtjit PUBLIC jitbuilder)
