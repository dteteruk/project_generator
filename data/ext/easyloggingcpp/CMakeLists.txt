#Taken fromhttps://github.com/snikulov/google-test-examples
cmake_minimum_required(VERSION 2.8.8)
project(easyloggingpp_builder C CXX)
include(ExternalProject)

ExternalProject_Add(easyloggingpp
    GIT_REPOSITORY https://github.com/easylogging/easyloggingpp.git
        GIT_TAG "v9.80"
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
        UPDATE_COMMAND  ""

)

# Specify include dir
ExternalProject_Get_Property(easyloggingpp source_dir)
set(EASYLOGGING_INCLUDE_DIRS ${source_dir} PARENT_SCOPE)