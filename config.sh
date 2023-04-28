#!/bin/bash开头（指定解析器）

CURRENT_DIR=$(cd $(dirname $0); pwd)
LIB_HOME=$CURRENT_DIR/lib
INCLUDE_PATH=$CURRENT_DIR/src/public
ROOT_DIR=$CURRENT_DIR
main(){
    apt-get install -y git g++ make 
    clean
    install_googletest
    install_benchmark
    install_leveldb
    install_gflag
    install_protobuf
    install_brpc
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
    echo ------installing googletest------
    cd $ROOT_DIR/modules/googletest/
    cmake -E make_directory "build"
    #make build dir to build project
    
    cd build
    cmake ..&&make
    cp ./lib/* $LIB_HOME
}
install_benchmark() {
    echo ------installing benchmark------
    cd $ROOT_DIR/modules/benchmark
   
    # Make a build directory to place the build output.
    cmake -E make_directory "build"
    # Generate build system files with cmake, and download any dependencies.
    cmake -E chdir "build" cmake  -DCMAKE_BUILD_TYPE=Release ../
    # or, starting with CMake 3.13, use a simpler form:
    # cmake -DCMAKE_BUILD_TYPE=Release -S . -B "build"
    # Build the library.
    cmake --build "build" --config Release
    cp build/src/libbenchmark.a build/src/libbenchmark_main.a $LIB_HOME

}
install_leveldb() {
    echo ------installing leveldb------
    cd $ROOT_DIR/modules/leveldb
   
    mkdir -p build && cd build

    cmake -DCMAKE_BUILD_TYPE=Release \
            -DLEVELDB_BUILD_TESTS=OFF \
            -DLEVELDB_BUILD_BENCHMARKS=OFF \
             .. && cmake --build .

    cp libleveldb.a  $LIB_HOME

}
install_gflag() {
     echo ------installing gflag------
    cd $ROOT_DIR/modules/gflags
   
    mkdir -p build && cd build

    cmake -DCMAKE_BUILD_TYPE=Release \
             .. && cmake --build .

    cp lib/libgflags.a lib/libgflags_nothreads.a $LIB_HOME
    cd include
    cp * $INCLUDE_PATH -r

}
install_protobuf() {
    echo ------installing protobuf------
    cd $ROOT_DIR/modules/protobuf
   
    mkdir -p build && cd build

    cmake -DCMAKE_BUILD_TYPE=Release \
            -Dprotobuf_BUILD_TESTS=OFF \
            -DCMAKE_INSTALL_PREFIX=$ROOT_DIR/modules/protobuf/builds
             .. && cmake --build .
    # i dont know how to install it
    make install

}
install_brpc(){
    echo ------installing protobuf------
    apt-get install -y libssl-dev libgflags-dev libprotobuf-dev libprotoc-dev protobuf-compiler libleveldb-dev
    cd $ROOT_DIR/modules/brpc
    cmake -B build -Dprotobuf_BUILD_TESTS=OFF  && cmake --build build -j6
    cd build 
    make install
}   
main "$@"