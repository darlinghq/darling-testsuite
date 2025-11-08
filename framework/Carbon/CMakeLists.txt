add_executable(test_Carbon_variable "test/test_Carbon_variable.m")
target_link_libraries(test_Carbon_variable "-framework Foundation" "-framework Carbon" darling-testsuite-lib)
add_test(NAME test_Carbon_variable COMMAND test_Carbon_variable)
