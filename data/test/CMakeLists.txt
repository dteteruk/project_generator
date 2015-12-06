set(PROJECT_TEST_NAME ${PROJECT_NAME}_test)

file(GLOB TEST_SRC_FILES ${PROJECT_SOURCE_DIR}/test/*.cpp )

include_directories(${GTEST_INCLUDE_DIRS} ${COMMON_INCLUDES} ${EASYLOGGING_INCLUDES})

add_executable(${PROJECT_TEST_NAME} ${TEST_SRC_FILES})
add_dependencies(${PROJECT_TEST_NAME} googletest ${ACCAUNT_LIB})

target_link_libraries(${PROJECT_TEST_NAME}
        ${GTEST_LIBS_DIR}/libgtest.a
        ${GTEST_LIBS_DIR}/libgtest_main.a 
        pthread)

add_test(test1 ${PROJECT_TEST_NAME})