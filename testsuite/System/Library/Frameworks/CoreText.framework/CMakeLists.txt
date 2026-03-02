# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/CoreText.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_CoreText_framework")

add_executable("${DARLING_IDENTIFIER}.test_CoreText_variable" "test/test_CoreText_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreText_variable" "-framework Foundation" "-framework CoreText" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreText_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreText_variable")
