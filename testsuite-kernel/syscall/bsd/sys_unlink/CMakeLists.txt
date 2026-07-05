# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/sys_unlink")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_sys_unlink")

add_executable("${DARLING_IDENTIFIER}.test_sys_unlink_delete_newly_created_file" "test/test_sys_unlink_delete_newly_created_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_unlink_delete_newly_created_file" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_unlink_delete_newly_created_file" COMMAND "${DARLING_IDENTIFIER}.test_sys_unlink_delete_newly_created_file")

add_executable("${DARLING_IDENTIFIER}.test_sys_unlink_file_does_not_exist" "test/test_sys_unlink_file_does_not_exist.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_unlink_file_does_not_exist" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_unlink_file_does_not_exist" COMMAND "${DARLING_IDENTIFIER}.test_sys_unlink_file_does_not_exist")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_sys_unlink_delete_newly_created_file"
        "${DARLING_IDENTIFIER}.test_sys_unlink_file_does_not_exist"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
