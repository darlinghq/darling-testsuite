# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/sys_exit")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_sys_exit")

add_executable("${DARLING_IDENTIFIER}.test_sys_exit_returns_0" "test/test_sys_exit_returns_0.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_exit_returns_0" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_exit_returns_0" COMMAND "${DARLING_IDENTIFIER}.test_sys_exit_returns_0")

add_executable("${DARLING_IDENTIFIER}.test_sys_exit_returns_1" "test/test_sys_exit_returns_1.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_exit_returns_1" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_exit_returns_1" COMMAND "${DARLING_IDENTIFIER}.test_sys_exit_returns_1")
set_property(TEST "${DARLING_PATH}/test_sys_exit_returns_1" PROPERTY WILL_FAIL true)

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_sys_exit_returns_0"
        "${DARLING_IDENTIFIER}.test_sys_exit_returns_1"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
