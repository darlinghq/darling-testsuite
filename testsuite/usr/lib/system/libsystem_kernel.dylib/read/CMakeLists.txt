# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

# read
add_executable("${DARLING_IDENTIFIER}.test_read_file" "test/test_read_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_read_file" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_read_file" COMMAND "${DARLING_IDENTIFIER}.test_read_file")
