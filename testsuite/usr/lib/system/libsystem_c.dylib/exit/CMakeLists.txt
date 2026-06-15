# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/exit")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_exit")

add_executable("${DARLING_IDENTIFIER}.test_exit_return_0" "test/test_exit_return_0.c")
add_test(NAME "${DARLING_PATH}/test_exit_return_0" COMMAND "${DARLING_IDENTIFIER}.test_exit_return_0")

add_executable("${DARLING_IDENTIFIER}.test_exit_return_1" "test/test_exit_return_1.c")
add_test(NAME "${DARLING_PATH}/test_exit_return_1" COMMAND "${DARLING_IDENTIFIER}.test_exit_return_1")
set_property(TEST "${DARLING_PATH}/test_exit_return_1" PROPERTY WILL_FAIL true)

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_exit_return_0"
        "${DARLING_IDENTIFIER}.test_exit_return_1"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
