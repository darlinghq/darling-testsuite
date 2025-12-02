add_executable(test_CoreText_variable "test/test_CoreText_variable.m")
target_link_libraries(test_CoreText_variable "-framework Foundation" "-framework CoreText" darling-testsuite-lib)
add_test(NAME test_CoreText_variable COMMAND test_CoreText_variable)
