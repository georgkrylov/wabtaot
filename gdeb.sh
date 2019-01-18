#/hdd/wasmjit-omr/out/gcc/Debug/src/mix-aot/mixwabtaot $1.wasm
#g++ -g tempmod.o /hdd/wasmjit-omr/trap-with.o -o $1.so -shared
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
first='$DIR/out/gcc/Debug/src/mix-aot/mixwabtaot $1.wasm'
second='g++ -g $DIR/tempmod.o $DIR/trap-with.o -o $1.so -shared'
eval $first
eval $second
