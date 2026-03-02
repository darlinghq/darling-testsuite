# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/Carbon.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_Carbon_framework")

add_executable("${DARLING_IDENTIFIER}.test_Carbon_variable" "test/test_Carbon_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_Carbon_variable" "-framework Foundation" "-framework Carbon" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_Carbon_variable" COMMAND "${DARLING_IDENTIFIER}.test_Carbon_variable")
