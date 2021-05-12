#!/bin/bash

cd third_party/omr
echo "OMR commit is:"
git log -1 --oneline
cd ../..

mkdir build
cd build
cmake -DBUILD_TOOLS=ON -DCMAKE_BUILD_TYPE=Debug .. 
make -j8
BUILD_RESULT=$?
if test $BUILD_RESULT -eq 0
then
	echo "Build succeded"
else
	echo "Host '$hostname' not found in $FILE file."
    exit $BUILD_RESULT
fi
