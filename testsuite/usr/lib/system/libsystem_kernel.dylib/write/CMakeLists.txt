# write
add_executable("${DARLING_IDENTIFIER}.test_write_file" "test/test_write_file.c")
add_test(NAME "${DARLING_PATH}/test_write_file" COMMAND "${DARLING_IDENTIFIER}.test_write_file")
