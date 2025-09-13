#
# Automated Testing
#

add_executable(test_basic_verify_return_values test/basic_verify_return_values.m)
target_link_libraries(test_basic_verify_return_values "-framework Foundation")
add_test(NAME test_basic_verify_return_values COMMAND test_basic_verify_return_values)
