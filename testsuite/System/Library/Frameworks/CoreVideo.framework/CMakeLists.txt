set(DARLING_PATH "${DARLING_PATH}/CoreVideo.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_CoreVideo_framework")

add_executable("${DARLING_IDENTIFIER}.test_CoreVideo_variable" "test/test_CoreVideo_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreVideo_variable" "-framework Foundation" "-framework CoreVideo" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreVideo_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreVideo_variable")
