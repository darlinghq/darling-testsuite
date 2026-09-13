# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/AddressBook.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_AddressBook_framework")

add_subdirectory("src")

###
### Install 
###

install(
    TARGETS
        "${DARLING_IDENTIFIER}__test_AddressBook_variable"

    DESTINATION
        "${INSTALL_DIR_TESTCASE_AUTOMATED}"
)
