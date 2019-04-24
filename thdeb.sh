DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
first='$DIR/out/gcc/Debug/src/aot/wabtaot $1.wasm'
second='g++ -g $DIR/tempmod.o $DIR/trap-with.o -o $1.so -shared'
eval $first
eval $second
#g++ -g /homes/pjelenko/wasmjit-omr/tempmod.o /homes/pjelenko/wasmjit-omr/trap-with.o -o $1.so -shared
