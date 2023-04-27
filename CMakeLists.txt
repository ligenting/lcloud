
cmake_minimum_required(VERSION 3.5)
project(TestProject)

set(CMAKE_BUILD_TYPE "Release")

if( CMAKE_BUILD_TYPE STREQUAL "Debug" )
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -g -Wall -Wno-unused-variable -pthread")
else( CMAKE_BUILD_TYPE STREQUAL "Release" )
        set(CMAKE_BUILD_TYPE "Release")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -O2 -pthread -fopenmp")
endif( CMAKE_BUILD_TYPE STREQUAL "Debug" )

message("Build Type:"${CMAKE_BUILD_TYPE} ${CMAKE_CXX_FLAGS})


# 设置变量
set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
# 头文件查找目录
include_directories(
    ${ROOT_DIR}/include
)
# 库文件查找目录
link_directories(${ROOT_DIR}/lib)
add_subdirectory(src bin)
