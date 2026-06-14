# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

# link
add_executable("${DARLING_IDENTIFIER}.test_link_success" "test/test_link_success.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_link_success" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_link_success" COMMAND "${DARLING_IDENTIFIER}.test_link_success")
