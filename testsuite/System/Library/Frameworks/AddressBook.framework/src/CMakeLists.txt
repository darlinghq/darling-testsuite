# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

###
### Automated
###

### Variables/Enums/Etc.

add_executable("${DARLING_IDENTIFIER}__test_AddressBook_variable" "automated/test_AddressBook_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}__test_AddressBook_variable" "-framework Foundation" "-framework AddressBook" darling-testsuite-lib)
add_test(NAME "${DARLING_IDENTIFIER}__test_AddressBook_variable" COMMAND "${DARLING_IDENTIFIER}__test_AddressBook_variable")

###
### Manual
###

###
### Semi-Automated
###
