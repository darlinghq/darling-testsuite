add_executable(test_QuartzCore_variable "test/test_QuartzCore_variable.m")
target_link_libraries(test_QuartzCore_variable "-framework Foundation" "-framework QuartzCore" darling-testsuite-lib)
add_test(NAME test_QuartzCore_variable COMMAND test_QuartzCore_variable)
