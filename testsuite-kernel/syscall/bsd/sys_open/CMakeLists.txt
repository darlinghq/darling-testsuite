# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/sys_open")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_sys_open")

add_executable("${DARLING_IDENTIFIER}.test_sys_open_doesnt_exist" "test/test_sys_open_doesnt_exist.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_open_doesnt_exist" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_open_doesnt_exist" COMMAND "${DARLING_IDENTIFIER}.test_sys_open_doesnt_exist")

add_executable("${DARLING_IDENTIFIER}.test_sys_open_exist" "test/test_sys_open_exist.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_open_exist" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_open_exist" COMMAND "${DARLING_IDENTIFIER}.test_sys_open_exist")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_sys_open_doesnt_exist"
        "${DARLING_IDENTIFIER}.test_sys_open_exist"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
