# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/PDFKit.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_PDFKit_framework")

add_executable("${DARLING_IDENTIFIER}.test_PDFKit_variable" "test/test_PDFKit_variable.m")
# Older versions of macOS had PDFKit live inside the Quartz framework
target_link_libraries("${DARLING_IDENTIFIER}.test_PDFKit_variable" "-framework Foundation" "-framework Quartz" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_PDFKit_variable" COMMAND "${DARLING_IDENTIFIER}.test_PDFKit_variable")
