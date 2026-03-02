# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/WebKit.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_WebKit_framework")

add_executable("${DARLING_IDENTIFIER}.test_WebKit_variable" "test/test_WebKit_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_WebKit_variable" "-framework Foundation" "-framework WebKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_WebKit_variable" COMMAND "${DARLING_IDENTIFIER}.test_WebKit_variable")
