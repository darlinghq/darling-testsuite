# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/ImageIO.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_ImageIO_framework")

add_subdirectory("src")

install(
    TARGETS
        "${DARLING_IDENTIFIER}__test_ImageIO_icns"
        "${DARLING_IDENTIFIER}__test_ImageIO_variable"

    DESTINATION
        "${INSTALL_DIR_TESTCASE_AUTOMATED}"
)

install(
    DIRECTORY "resources/testdata"
    DESTINATION "${INSTALL_DIR_RESOURCE}/${DARLING_PATH}/resources"
)
