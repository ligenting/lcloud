#include"public/gtest/gtest.h"
int add(int a,int b){
    return a+b;
}
TEST(testCase,test0){
    EXPECT_EQ(5,5);
}
TEST(testCase1,test0){
    EXPECT_EQ(5,5);
}
TEST(testCase1,test1){
    EXPECT_EQ(5,5);
}
TEST(testCase1,test2){
    EXPECT_EQ(5,5);
}

