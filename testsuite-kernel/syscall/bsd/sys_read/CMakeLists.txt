# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/sys_read")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_sys_read")

add_executable("${DARLING_IDENTIFIER}.test_sys_read_file" "test/test_sys_read_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_read_file" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_read_file" COMMAND "${DARLING_IDENTIFIER}.test_sys_read_file")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_sys_read_file"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)

install(
    DIRECTORY "resources"
    DESTINATION "${INSTALL_DIR_RESOURCE}/${DARLING_PATH}"
)
