# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/VideoToolbox.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_VideoToolbox_framework")

add_executable("${DARLING_IDENTIFIER}.test_VideoToolbox_variable" "test/test_VideoToolbox_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_VideoToolbox_variable" "-framework Foundation" "-framework VideoToolbox" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_VideoToolbox_variable" COMMAND "${DARLING_IDENTIFIER}.test_VideoToolbox_variable")
