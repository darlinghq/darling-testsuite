add_executable("${DARLING_IDENTIFIER}.test_close_success" "test/test_close_success.c")
add_test(NAME "${DARLING_PATH}/test_close_success" COMMAND "${DARLING_IDENTIFIER}.test_close_success")

add_executable("${DARLING_IDENTIFIER}.test_close_invalid_fd" "test/test_close_invalid_fd.c")
add_test(NAME "${DARLING_PATH}/test_close_invalid_fd" COMMAND "${DARLING_IDENTIFIER}.test_close_invalid_fd")
