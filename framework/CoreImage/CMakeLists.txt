add_executable(test_CoreImage_variable "test/test_CoreImage_variable.m")
target_link_libraries(test_CoreImage_variable "-framework Foundation" "-framework CoreImage" darling-testsuite-lib)
add_test(NAME test_CoreImage_variable COMMAND test_CoreImage_variable)
