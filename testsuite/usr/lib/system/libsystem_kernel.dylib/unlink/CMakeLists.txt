# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/unlink")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_unlink")

# unlink
add_executable("${DARLING_IDENTIFIER}.test_unlink_file_does_not_exist" "test/test_unlink_file_does_not_exist.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_unlink_file_does_not_exist" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_unlink_file_does_not_exist" COMMAND "${DARLING_IDENTIFIER}.test_unlink_file_does_not_exist")

add_executable("${DARLING_IDENTIFIER}.test_unlink_delete_newly_created_file" "test/test_unlink_delete_newly_created_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_unlink_delete_newly_created_file" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_unlink_delete_newly_created_file" COMMAND "${DARLING_IDENTIFIER}.test_unlink_delete_newly_created_file")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_unlink_file_does_not_exist"
        "${DARLING_IDENTIFIER}.test_unlink_delete_newly_created_file"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
