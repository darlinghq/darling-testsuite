add_executable(test_AddressBook_variable "test/test_AddressBook_variable.m")
target_link_libraries(test_AddressBook_variable "-framework Foundation" "-framework AddressBook" darling-testsuite-lib)
add_test(NAME test_AddressBook_variable COMMAND test_AddressBook_variable)
