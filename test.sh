#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
TEST_ROOT=$CURRENT_DIR/build/bin/test
PROJECT_ROOT=$CURRENT_DIR
mkdir $PROJECT_ROOT/build
cmake -S ./ -B ./build
cd $PROJECT_ROOT/build&&make&& cd $CURRENT_DIR
echo -------------googletestDependTest----------------
$TEST_ROOT/Test2
#echo -------------benchTest----------------
#$TEST_ROOT/benchTest