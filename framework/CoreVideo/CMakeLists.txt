add_executable(test_CoreVideo_variable "test/test_CoreVideo_variable.m")
target_link_libraries(test_CoreVideo_variable "-framework Foundation" "-framework CoreVideo" darling-testsuite-lib)
add_test(NAME test_CoreVideo_variable COMMAND test_CoreVideo_variable)
