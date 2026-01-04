set(DARLING_PATH "${DARLING_PATH}/CoreGraphics.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}.CoreGraphics_framework")

add_executable("${DARLING_IDENTIFIER}.test_CoreGraphics_variable" "test/test_CoreGraphics_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreGraphics_variable" "-framework Foundation" "-framework CoreGraphics" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreGraphics_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreGraphics_variable")
