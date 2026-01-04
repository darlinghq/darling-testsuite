# wait4
add_executable("${DARLING_IDENTIFIER}.test_wait4" "test/test_wait4.c")
add_test(NAME "${DARLING_PATH}/test_wait4" COMMAND "${DARLING_IDENTIFIER}.test_wait4")
