cmake_minimum_required(VERSION 2.8.8)
project(__PROJECT_NAME__)

find_package(Threads REQUIRED)

#-------------------
# set common include folder for module
#-------------------
set(COMMON_INCLUDES ${PROJECT_SOURCE_DIR}/src)
set(EXT_PROJECTS_DIR ${PROJECT_SOURCE_DIR}/ext)

set(CMAKE_CXX_FLAGS "-std=c++11")

# add_subdirectory(${EXT_PROJECTS_DIR}/easyloggingcpp)
add_subdirectory(${EXT_PROJECTS_DIR}/gtest)

add_subdirectory(src)

enable_testing()
add_subdirectory(test)
