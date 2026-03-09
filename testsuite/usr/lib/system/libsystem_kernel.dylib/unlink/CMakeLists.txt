# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

# unlink
add_executable("${DARLING_IDENTIFIER}.test_unlink_file_does_not_exist" "test/test_unlink_file_does_not_exist.c")
add_test(NAME "${DARLING_PATH}/test_unlink_file_does_not_exist" COMMAND "${DARLING_IDENTIFIER}.test_unlink_file_does_not_exist")

add_executable("${DARLING_IDENTIFIER}.test_unlink_delete_newly_created_file" "test/test_unlink_delete_newly_created_file.c")
add_test(NAME "${DARLING_PATH}/test_unlink_delete_newly_created_file" COMMAND "${DARLING_IDENTIFIER}.test_unlink_delete_newly_created_file")
