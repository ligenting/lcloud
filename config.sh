#!/bin/bash开头（指定解析器）
LIB_HOME=$PWD/lib
ROOT_DIR=$PWD
main(){
    #clean
    #install_googletest
    install_benchmark
}
clean(){
    if test -e $LIB_HOME
    then 
        rm $LIB_HOME/*
    else
        mkdir $PWD/lib
    fi
}
install_googletest() {
    cd $ROOT_DIR/modules/googletest/
    if test -e build
    then 
        rm -rf build
    fi
   
    #make build dir to build project
    mkdir build
    cd build
    cmake ..&&make
    cp ./lib/* $LIB_HOME
}
install_benchmark() {
    cd $ROOT_DIR/modules/benchmark
   
    # Make a build directory to place the build output.
    cmake -E make_directory "build"
    # Generate build system files with cmake, and download any dependencies.
    cmake -E chdir "build" cmake -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on -DCMAKE_BUILD_TYPE=Release ../
    # or, starting with CMake 3.13, use a simpler form:
    # cmake -DCMAKE_BUILD_TYPE=Release -S . -B "build"
    # Build the library.
    cmake --build "build" --config Release
    echo hh
    cp build/src/*.a $LIB_HOME

}

main "$@"