add_compile_definitions(DARLING_IDENTIFIER=\"${DARLING_IDENTIFIER}\")

add_executable("${DARLING_IDENTIFIER}.test_posix_spawn_parent_set_arg0" "test/test_posix_spawn_parent_set_arg0.c")
add_test(NAME "${DARLING_PATH}/test_posix_spawn_parent_set_arg0" COMMAND "${DARLING_IDENTIFIER}.test_posix_spawn_parent_set_arg0")

add_executable("${DARLING_IDENTIFIER}.test_posix_spawn_child_verify_argv0" "test/test_posix_spawn_child_verify_argv0.c")
add_test(NAME "${DARLING_PATH}/test_posix_spawn_child_verify_argv0" COMMAND "${DARLING_IDENTIFIER}.test_posix_spawn_child_verify_argv0")
