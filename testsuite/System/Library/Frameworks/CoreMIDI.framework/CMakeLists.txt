# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/CoreMIDI.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_CoreMIDI_framework")

add_executable("${DARLING_IDENTIFIER}.test_CoreMIDI_variable" "test/test_CoreMIDI_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreMIDI_variable" "-framework Foundation" "-framework CoreMIDI" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreMIDI_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreMIDI_variable")
