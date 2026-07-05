# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/sys_wait4")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_sys_wait4")

add_executable("${DARLING_IDENTIFIER}.test_sys_wait4" "test/test_sys_wait4.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_wait4" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_wait4" COMMAND "${DARLING_IDENTIFIER}.test_sys_wait4")

add_executable("test_sys_wait4_child" "test/test_sys_wait4_child.c")
target_link_libraries(test_sys_wait4_child darling-directsyscall darling-testsuite-lib)

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_sys_wait4"
        "test_sys_wait4_child"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
