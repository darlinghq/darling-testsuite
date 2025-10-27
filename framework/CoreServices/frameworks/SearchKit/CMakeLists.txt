add_executable(test_SearchKit_variable "test/test_SearchKit_variable.m")
target_link_libraries(test_SearchKit_variable "-framework Foundation" "-framework CoreServices" darling-testsuite-lib)
add_test(NAME test_SearchKit_variable COMMAND test_SearchKit_variable)
