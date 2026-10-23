# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

###
### Automated
###

add_executable("${DARLING_IDENTIFIER}__test_ImageIO_icns" "automated/test_ImageIO_icns.m")
target_link_libraries("${DARLING_IDENTIFIER}__test_ImageIO_icns" "-framework Foundation" "-framework ImageIO" "-framework CoreGraphics" darling-testsuite-lib)
add_test(NAME "${DARLING_IDENTIFIER}__test_ImageIO_icns" COMMAND "${DARLING_IDENTIFIER}__test_ImageIO_icns")

### Variables/Enums/Etc.

add_executable("${DARLING_IDENTIFIER}__test_ImageIO_variable" "automated/test_ImageIO_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}__test_ImageIO_variable" "-framework Foundation" "-framework ImageIO" darling-testsuite-lib)
add_test(NAME "${DARLING_IDENTIFIER}__test_ImageIO_variable" COMMAND "${DARLING_IDENTIFIER}__test_ImageIO_variable")

###
### Manual
###

###
### Semi-Automated
###
