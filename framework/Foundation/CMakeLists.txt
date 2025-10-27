add_subdirectory("test/NSDictionary(NSDictionary)")

add_executable(test_Foundation_variable "test/test_Foundation_variable.m")
target_link_libraries(test_Foundation_variable "-framework Foundation" darling-testsuite-lib)
add_test(NAME test_Foundation_variable COMMAND test_Foundation_variable)
