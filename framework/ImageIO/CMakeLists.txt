file(COPY "resource/icns" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
file(COPY "resource/iconset" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
add_executable(test_ImageIO_icns "test/test_ImageIO_icns.m")
target_link_libraries(test_ImageIO_icns "-framework Foundation" "-framework ImageIO" "-framework CoreGraphics" darling-testsuite-lib)
add_test(NAME test_ImageIO_icns COMMAND test_ImageIO_icns)

add_executable(test_ImageIO_variable "test/test_ImageIO_variable.m")
target_link_libraries(test_ImageIO_variable "-framework Foundation" "-framework ImageIO" darling-testsuite-lib)
add_test(NAME test_ImageIO_variable COMMAND test_ImageIO_variable)
