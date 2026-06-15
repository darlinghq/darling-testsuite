# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/posix_spawn")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_posix_spawn")

add_compile_definitions(DARLING_IDENTIFIER=\"${DARLING_IDENTIFIER}\")

add_executable("${DARLING_IDENTIFIER}.test_posix_spawn_parent_set_arg0" "test/test_posix_spawn_parent_set_arg0.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_posix_spawn_parent_set_arg0" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_posix_spawn_parent_set_arg0" COMMAND "${DARLING_IDENTIFIER}.test_posix_spawn_parent_set_arg0")

add_executable("${DARLING_IDENTIFIER}.test_posix_spawn_child_verify_argv0" "test/test_posix_spawn_child_verify_argv0.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_posix_spawn_child_verify_argv0" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_posix_spawn_child_verify_argv0" COMMAND "${DARLING_IDENTIFIER}.test_posix_spawn_child_verify_argv0")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_posix_spawn_parent_set_arg0"
        "${DARLING_IDENTIFIER}.test_posix_spawn_child_verify_argv0"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
