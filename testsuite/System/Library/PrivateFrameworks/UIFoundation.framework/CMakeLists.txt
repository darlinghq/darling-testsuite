# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/UIFoundation.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_UIFoundation_framework")

add_executable("${DARLING_IDENTIFIER}.test_UIFoundation_UIDataLooksLikeNibArchive"
    "test/test_UIFoundation_UIDataLooksLikeNibArchive.m"
)
target_link_libraries("${DARLING_IDENTIFIER}.test_UIFoundation_UIDataLooksLikeNibArchive"
    "-framework Foundation"
    darling-testsuite-lib
)
add_test(
    NAME "${DARLING_PATH}/test_UIFoundation_UIDataLooksLikeNibArchive"
    COMMAND "${DARLING_IDENTIFIER}.test_UIFoundation_UIDataLooksLikeNibArchive"
)

add_executable("${DARLING_IDENTIFIER}.test_UIFoundation_variable"
    "test/test_UIFoundation_variable.m"
)
target_link_libraries("${DARLING_IDENTIFIER}.test_UIFoundation_variable"
    "-framework Foundation"
    darling-testsuite-lib
)
add_test(
    NAME "${DARLING_PATH}/test_UIFoundation_variable"
    COMMAND "${DARLING_IDENTIFIER}.test_UIFoundation_variable"
)
