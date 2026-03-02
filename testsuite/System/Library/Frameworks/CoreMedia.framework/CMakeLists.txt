# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/CoreMedia.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_CoreMedia_framework")

add_executable("${DARLING_IDENTIFIER}.test_CoreMedia_variable" "test/test_CoreMedia_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreMedia_variable" "-framework Foundation" "-framework CoreMedia" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreMedia_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreMedia_variable")
