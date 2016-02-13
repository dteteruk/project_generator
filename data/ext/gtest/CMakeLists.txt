#Taken fromhttps://github.com/snikulov/google-test-examples
cmake_minimum_required(VERSION 2.8.8)
project(gtest_builder C CXX)
include(ExternalProject)

##### GTest ############
ExternalProject_Add(gtest
    URL https://github.com/google/googletest/archive/release-1.7.0.zip
    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/gtest
    # Disable install step
    INSTALL_COMMAND ""
)

# Specify include dir
ExternalProject_Get_Property(gtest source_dir)
set(GTEST_INCLUDE_DIRS ${source_dir}/include PARENT_SCOPE)

# Specify MainTest's link libraries
ExternalProject_Get_Property(gtest binary_dir)
set(GTEST_LIBS_DIR ${binary_dir} PARENT_SCOPE)

##### GMock ############
set(ENV{GTEST_DIR} ${source_dir}) 

ExternalProject_Add(gmock
    URL https://github.com/google/googlemock/archive/release-1.7.0.zip
    DEPENDS gtest
    SOURCE_DIR ${source_dir}/../gmock
    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/gmock
    # Disable install step
    INSTALL_COMMAND ""
)

# Specify include dir
ExternalProject_Get_Property(gmock source_dir)
set(GMOCK_INCLUDE_DIRS ${source_dir}/include PARENT_SCOPE)

# Specify MainTest's link libraries
ExternalProject_Get_Property(gmock binary_dir)
set(GMOCK_LIBS_DIR ${binary_dir} PARENT_SCOPE)