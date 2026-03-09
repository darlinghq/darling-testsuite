# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

# link
add_executable("${DARLING_IDENTIFIER}.test_link_success" "test/test_link_success.c")
add_test(NAME "${DARLING_PATH}/test_link_success" COMMAND "${DARLING_IDENTIFIER}.test_link_success")
