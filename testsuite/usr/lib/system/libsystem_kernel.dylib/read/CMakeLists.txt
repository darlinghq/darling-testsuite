# read
configure_file(resources/read_hello_world.txt ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

add_executable("${DARLING_IDENTIFIER}.test_read_file" "test/test_read_file.c")
add_test(NAME "${DARLING_PATH}/test_read_file" COMMAND "${DARLING_IDENTIFIER}.test_read_file")
