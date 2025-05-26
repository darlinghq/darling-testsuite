add_executable(test_exit_return_0 "exit/test_exit_return_0.c")
add_executable(test_exit_return_1 "exit/test_exit_return_1.c")

add_test(NAME test_exit_return_0 COMMAND test_exit_return_0)
add_test(NAME test_exit_return_1 COMMAND test_exit_return_1)
set_property(TEST test_exit_return_1 PROPERTY WILL_FAIL true)
