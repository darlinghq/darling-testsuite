add_executable(test_PDFKit_variable "test/test_PDFKit_variable.m")
target_link_libraries(test_PDFKit_variable "-framework Foundation" "-framework PDFKit" darling-testsuite-lib)
add_test(NAME test_PDFKit_variable COMMAND test_PDFKit_variable)
