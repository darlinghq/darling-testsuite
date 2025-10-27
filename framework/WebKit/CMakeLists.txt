add_executable(test_WebKit_variable "test/test_WebKit_variable.m")
target_link_libraries(test_WebKit_variable "-framework Foundation" "-framework WebKit" darling-testsuite-lib)
add_test(NAME test_WebKit_variable COMMAND test_WebKit_variable)
