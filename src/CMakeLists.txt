
set(TargetName Test2)
set(srclist unitTest.cpp)

# sub_dir指定包含CMakeLists.txt和源码文件的子目录位置
# binary_dir是输出路径， 一般可以不指定

add_executable(${TargetName} ${srclist} )
add_executable(SaySomething ExecuteFile.cpp)
message(${ROOT_DIR}" current ")
target_link_libraries(${TargetName} ${ROOT_DIR}/lib/libgtest_main.a 
                             ${ROOT_DIR}/lib/libgtest.a 
                             ${ROOT_DIR}/lib/libgmock.a 
                             ${ROOT_DIR}/lib/libgmock_main.a)