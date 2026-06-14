# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/close")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_close")

add_executable("${DARLING_IDENTIFIER}.test_close_success" "test/test_close_success.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_close_success" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_close_success" COMMAND "${DARLING_IDENTIFIER}.test_close_success")

add_executable("${DARLING_IDENTIFIER}.test_close_invalid_fd" "test/test_close_invalid_fd.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_close_invalid_fd" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_close_invalid_fd" COMMAND "${DARLING_IDENTIFIER}.test_close_invalid_fd")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_close_success"
        "${DARLING_IDENTIFIER}.test_close_invalid_fd"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
