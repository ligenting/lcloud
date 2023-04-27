#include"../public/gtest/gtest.h"
#include <iostream>

int add(int a,int b){
    return a+b;
}
TEST(testCase,test0){
    EXPECT_EQ(5,5);
}

TEST(testCase,test1){
    EXPECT_EQ(2,5);

}

