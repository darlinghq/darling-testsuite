add_executable("${DARLING_IDENTIFIER}.test_open_doesnt_exist" "test/test_open_doesnt_exist.c")
add_test(NAME "${DARLING_PATH}/test_open_doesnt_exist" COMMAND "${DARLING_IDENTIFIER}.test_open_doesnt_exist")

add_executable("${DARLING_IDENTIFIER}.test_open_exist" "test/test_open_exist.c")
add_test(NAME "${DARLING_PATH}/test_open_exist" COMMAND "${DARLING_IDENTIFIER}.test_open_exist")
