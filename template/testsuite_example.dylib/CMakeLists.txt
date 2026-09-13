# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/testsuite_example.dylib")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_testsuite_example_dylib")

include_directories("include")

add_subdirectory("src")

###
### Install 
###

install(
    TARGETS
        # "${DARLING_IDENTIFIER}__test_functionA_scenarioA"
        "${DARLING_IDENTIFIER}__test_testsuite_example_variable"

    DESTINATION
        "${INSTALL_DIR_TESTCASE_AUTOMATED}"
)

install(
    TARGETS
        # "${DARLING_IDENTIFIER}__test_functionA_scenarioB"

    DESTINATION
        "${INSTALL_DIR_TESTCASE_MANUAL}"
)

install(
    TARGETS
        # "${DARLING_IDENTIFIER}__test_functionA_scenarioC"

    DESTINATION
        "${INSTALL_DIR_TESTCASE_SEMIAUTOMATED}"
)

install(
    DIRECTORY "resources/testdata"
    DESTINATION "${INSTALL_DIR_RESOURCE}/${DARLING_PATH}/resources"
)
