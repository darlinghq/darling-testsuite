add_executable(test_VideoToolbox_variable "test/test_VideoToolbox_variable.m")
target_link_libraries(test_VideoToolbox_variable "-framework Foundation" "-framework VideoToolbox" darling-testsuite-lib)
add_test(NAME test_VideoToolbox_variable COMMAND test_VideoToolbox_variable)
