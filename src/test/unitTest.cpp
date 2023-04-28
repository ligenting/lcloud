#include"gtest/gtest.h"
#include <iostream>
#include <cassert>
#include "leveldb/db.h"
#include "gflags/gflags.h"
#include <gflags/gflags.h>
#include "google/protobuf/any.h"

int add(int a,int b){
    return a+b;
}
TEST(testCase,test0){
    int a =0;
    int b = 1;
    int c = b/a;
    EXPECT_EQ(5,5);
}

TEST(leveldbTest,test1){
    leveldb::DB* db;
    leveldb::Options options;
    options.create_if_missing = true;
    leveldb::Status status = leveldb::DB::Open(options, "/tmp/testdb", &db);
    assert(status.ok());
}
DEFINE_bool(big_menu, true, "Include 'advanced' options in the menu listing");
DEFINE_string(languages, "english,french,german",
            "comma-separated list of languages to offer in the 'lang' menu");
TEST(gflagsTest,test1){


}

