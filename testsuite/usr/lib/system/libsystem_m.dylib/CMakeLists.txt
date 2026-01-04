set(DARLING_PATH "${DARLING_PATH}/libsystem_m.dylib")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}.libsystem_m_dylib")

add_executable("${DARLING_IDENTIFIER}.test_libSystem_libsystem_m_sqrt" "test/sqrt.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_libSystem_libsystem_m_sqrt" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_libSystem_libsystem_m_sqrt" COMMAND "${DARLING_IDENTIFIER}.test_libSystem_libsystem_m_sqrt")
