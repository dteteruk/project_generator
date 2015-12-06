cmake_minimum_required(VERSION 2.8.8)
set(BIN_NAME ${PROJECT_NAME})

set(CMAKE_CXX_FLAGS "-std=c++11")

add_executable(${BIN_NAME} main.cpp)
target_link_libraries(${BIN_NAME} pthread)
