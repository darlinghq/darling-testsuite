configure_file(test/resources/pypi_org.der ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)
configure_file(test/resources/globalsign_atlas_r3_dv_tls_ca_2025_q1.der ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

add_executable(test_SecTrustEvaluateWithError "test/SecTrustEvaluateWithError/test_SecTrustEvaluateWithError.c")
target_link_libraries(test_SecTrustEvaluateWithError "-framework CoreFoundation" "-framework Security")

add_test(NAME test_SecTrustEvaluateWithError COMMAND test_SecTrustEvaluateWithError)
