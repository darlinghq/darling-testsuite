add_executable(test_CoreGraphics_variable "test/test_CoreGraphics_variable.m")
target_link_libraries(test_CoreGraphics_variable "-framework Foundation" "-framework CoreGraphics" darling-testsuite-lib)
add_test(NAME test_CoreGraphics_variable COMMAND test_CoreGraphics_variable)
