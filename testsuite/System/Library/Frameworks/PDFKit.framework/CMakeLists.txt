set(DARLING_PATH "${DARLING_PATH}/PDFKit.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_PDFKit_framework")

add_executable("${DARLING_IDENTIFIER}.test_PDFKit_variable" "test/test_PDFKit_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_PDFKit_variable" "-framework Foundation" "-framework PDFKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_PDFKit_variable" COMMAND "${DARLING_IDENTIFIER}.test_PDFKit_variable")
