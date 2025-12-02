add_executable(test_CoreMedia_variable "test/test_CoreMedia_variable.m")
target_link_libraries(test_CoreMedia_variable "-framework Foundation" "-framework CoreMedia" darling-testsuite-lib)
add_test(NAME test_CoreMedia_variable COMMAND test_CoreMedia_variable)
