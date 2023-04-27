#!/bin/bash开头（指定解析器）
LIB_HOME=$PWD/lib

main(){
    clean
    install_googletest
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
    cd modules/googletest/
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

main "$@"