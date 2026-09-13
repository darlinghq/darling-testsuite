# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

###
### Automated
###

# ### functionA
#
# add_executable("${DARLING_IDENTIFIER}__test_functionA_scenarioA" "automated/functionA/test_functionA_scenarioA.c")
# target_link_libraries("${DARLING_IDENTIFIER}__test_functionA_scenarioA" "-framework Foundation" darling-testsuite-lib)
# add_test(NAME "${DARLING_IDENTIFIER}__test_functionA_scenarioA" COMMAND "${DARLING_IDENTIFIER}__test_functionA_scenarioA")

### Variables/Enums/Etc.

add_executable("${DARLING_IDENTIFIER}__test_testsuite_example_variable" "automated/test_testsuite_example_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}__test_testsuite_example_variable" "-framework Foundation" darling-testsuite-lib)
add_test(NAME "${DARLING_IDENTIFIER}__test_testsuite_example_variable" COMMAND "${DARLING_IDENTIFIER}__test_testsuite_example_variable")

###
### Manual
###

# ### functionA
# 
# add_executable("${DARLING_IDENTIFIER}__test_functionA_scenarioB" "manual/functionA/test_functionA_scenarioB.c")
# target_link_libraries("${DARLING_IDENTIFIER}__test_functionA_scenarioB" "-framework Foundation" darling-testsuite-lib)

###
### Semi-Automated
###

# ### functionA
#
# add_executable("${DARLING_IDENTIFIER}__test_functionA_scenarioC" "automated/functionA/test_functionA_scenarioC.c")
# target_link_libraries("${DARLING_IDENTIFIER}__test_functionA_scenarioC" "-framework Foundation" darling-testsuite-lib)
# add_test(NAME "${DARLING_IDENTIFIER}__test_functionA_scenarioC" COMMAND "${DARLING_IDENTIFIER}__test_functionA_scenarioC")
