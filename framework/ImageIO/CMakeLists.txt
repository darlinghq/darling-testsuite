add_executable(test_ImageIO_variable "test/test_ImageIO_variable.m")
target_link_libraries(test_ImageIO_variable "-framework Foundation" "-framework ImageIO" darling-testsuite-lib)
add_test(NAME test_ImageIO_variable COMMAND test_ImageIO_variable)
