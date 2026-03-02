# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/CoreImage.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_CoreImage_framework")

add_executable("${DARLING_IDENTIFIER}.test_CoreImage_variable" "test/test_CoreImage_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreImage_variable" "-framework Foundation" "-framework CoreImage" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreImage_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreImage_variable")
