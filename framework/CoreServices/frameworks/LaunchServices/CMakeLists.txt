add_executable(test_LaunchServices_variable "test/test_LaunchServices_variable.m")
target_link_libraries(test_LaunchServices_variable "-framework Foundation" "-framework CoreServices" darling-testsuite-lib)
add_test(NAME test_LaunchServices_variable COMMAND test_LaunchServices_variable)
