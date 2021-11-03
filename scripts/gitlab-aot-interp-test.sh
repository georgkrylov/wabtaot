#!/bin/bash

TESTS_DIR="./test/jit"
GOLDEN_DIR="$TESTS_DIR/golden_results"

#This could be extracted from artifact name???
EXEC="./leo-bin/wasm-interp"
WAT2WASM="wat2wasm"

RESULTS_FOLDER="test_results"
SUMMARY_FOLDER=$RESULTS_FOLDER"/summary"
rm -rf $RESULTS_FOLDER || true
rm -rf $SUMMARY_FOLDER || true
mkdir -p $RESULTS_FOLDER
mkdir -p $SUMMARY_FOLDER

FILES_LIST=`find  $TESTS_DIR  -maxdepth 1 -type f -iname "*.txt" `
GLOBAL_RESULT=0
INTERPRETER_FAILURES=$SUMMARY_FOLDER"/interpreter_failures.txt"
COMPILE_FAILURES=$SUMMARY_FOLDER"/compile_failures.txt"
LOAD_FAILURES=$SUMMARY_FOLDER"/load_failures.txt"
COMPILE_LOAD_MISMATCH=$SUMMARY_FOLDER"/compiled_loaded_mismatch.txt"
GOLDEN_FAILURES=$SUMMARY_FOLDER"/loaded_golden_mismatch.txt"
INTERPRETER_SKIP_LIST=$GOLDEN_DIR"/skip/interpreter_skip_list.txt"
COMPILE_SKIP_LIST=$GOLDEN_DIR"/skip/compile_skip_list.txt"
LOAD_SKIP_LIST=$GOLDEN_DIR"/skip/load_skip_list.txt"
LOADED_GOLDEN_SKIP_LIST=$GOLDEN_DIR"/skip/loaded_golden_skip_list.txt"


# a custom function to find if the filename is in a certain skip list
# Should have probably been just grep
function find_item()
{
	for i in `cat $2`
	do
	if [[ $i == $1 ]];
	then
		echo "0"
		return
	fi
	done
	echo "1"
}

for TEST_NAME in $FILES_LIST
do

## SUPER IMPORTANT DUE TO PROBLEMS WITH DEBUG NAME
rm -rf /tmp/omrsharedresources

FILE_NAME=`echo $TEST_NAME | awk -F"/" '{print $4}' |  awk -F"." '{print $1}' `
echo $TEST_NAME

SEARCH=$(find_item $TEST_NAME $INTERPRETER_SKIP_LIST)
if  test $SEARCH -eq 0 
then
echo $FILE_NAME "is in interpreter skip list, not doing any tests further"
continue
fi
## Generate a WASM file
WASM=$RESULTS_FOLDER"/"$FILE_NAME".wasm"

TEST_RESULT=0
$WAT2WASM $TEST_NAME -o $WASM || TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME generated wasm
else
	echo $TEST_NAME  >> $INTERPRETER_FAILURES
	GLOBAL_RESULT=$((GLOBAL_RESULT || 1))
	continue
fi


COMPILED=$RESULTS_FOLDER/$FILE_NAME"_compile.out"
LOADED=$RESULTS_FOLDER/$FILE_NAME"_load.out"
GOLDEN=$GOLDEN_DIR/$FILE_NAME"_interp_golden.out"
cat $GOLDEN > $RESULTS_FOLDER"/"$FILE_NAME"_interp_golden.out"

SEARCH=$(find_item $TEST_NAME $COMPILE_SKIP_LIST)
if  test $SEARCH -eq 0 
then
echo $FILE_NAME "is in compile skip list, not doing any tests further"
continue
fi

TEST_RESULT=0

$EXEC $WASM --run-all-exports  --jit-threshold=1000 &> $COMPILED || TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME compiled
else
	echo $TEST_NAME  >> $COMPILE_FAILURES
	GLOBAL_RESULT=$((GLOBAL_RESULT || 1))
	continue
fi

SEARCH=$(find_item $TEST_NAME $LOAD_SKIP_LIST)
if  test $SEARCH -eq 0 
then
echo $FILE_NAME "is in load skip list, not doing any tests further"
continue
fi

$EXEC $WASM --run-all-exports  --jit-threshold=1000 &> $LOADED || TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME loaded
else
	echo $TEST_NAME  >> $LOAD_FAILURES
	GLOBAL_RESULT=$((GLOBAL_RESULT || 1))
	continue
fi

diff $COMPILED $LOADED &> /dev/null || TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME compile run matches load run
else
	echo $TEST_NAME  >> $COMPILE_LOAD_MISMATCH
	GLOBAL_RESULT=$((GLOBAL_RESULT || 1))
	continue
fi

SEARCH=$(find_item $TEST_NAME $LOADED_GOLDEN_SKIP_LIST)
if  test $SEARCH -eq 0 
then
echo $FILE_NAME "is in loaded golden skip list, not doing any tests further"
continue
fi

diff $LOADED $GOLDEN  &> /dev/null || TEST_RESULT=$?
if test $TEST_RESULT -eq 0
then
	echo $TEST_NAME load run matches wasmjit-omr
else
	echo $TEST_NAME  >> $GOLDEN_FAILURES
	GLOBAL_RESULT=$((GLOBAL_RESULT || 1))
	continue
fi

done
echo "Testing finished to completion"

if test $GLOBAL_RESULT -eq 0 ; 
then
	echo "None of the tests that are not in the skip lists have failed"
else
	echo "Some of the tests not in the skip lists have failed, see test_results/summary for details"
fi

exit $GLOBAL_RESULT