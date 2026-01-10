set(DARLING_PATH "${DARLING_PATH}/AVFoundation.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_AVFoundation_framework")

add_executable("${DARLING_IDENTIFIER}.test_AVFoundation_variable" "test/test_AVFoundation_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_AVFoundation_variable" "-framework Foundation" "-framework AVFoundation" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_AVFoundation_variable" COMMAND "${DARLING_IDENTIFIER}.test_AVFoundation_variable")
