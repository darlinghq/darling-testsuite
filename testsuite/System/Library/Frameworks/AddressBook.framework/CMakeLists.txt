set(DARLING_PATH "${DARLING_PATH}/AddressBook.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}.AddressBook_framework")

add_executable("${DARLING_IDENTIFIER}.test_AddressBook_variable" "test/test_AddressBook_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_AddressBook_variable" "-framework Foundation" "-framework AddressBook" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_AddressBook_variable" COMMAND "${DARLING_IDENTIFIER}.test_AddressBook_variable")
