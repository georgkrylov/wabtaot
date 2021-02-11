#!/bin/bash

mkdir build
cd build
cmake -DBUILD_TOOLS=ON .. 
make -j6
BUILD_RESULT=$?
if test $BUILD_RESULT -eq 0
then
	echo "Build succeded"
else
	echo "Host '$hostname' not found in $FILE file."
    exit $BUILD_RESULT
fi
