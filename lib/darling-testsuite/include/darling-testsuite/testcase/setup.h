// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifdef DARLING_TESTSUITE_LIB_TESTCASE_SETUP_H
#error "This header file should not be imported more then once"
#endif

#include <darling-testsuite/testcase.h>

#include <stdio.h>

//
// Macro Arguments
//

/* # TESTCASE_TYPE
 * 
 * Tells the testsuite what type of test case is being executed.
 * 
 * Options:
 *   * TESTCASE_TYPE_AUTOMATED
 *   * TESTCASE_TYPE_MANUAL
 *   * TESTCASE_TYPE_SEMIAUTOMATED
 */

#ifndef TESTCASE_TYPE
#error "TESTCASE_TYPE must be set"
#elif TESTCASE_TYPE != TESTCASE_TYPE_AUTOMATED \
    && TESTCASE_TYPE != TESTCASE_TYPE_MANUAL \
    && TESTCASE_TYPE != TESTCASE_TYPE_SEMIAUTOMATED
#error "TESTCASE_TYPE must be set to either TESTCASE_TYPE_AUTOMATED, TESTCASE_TYPE_MANUAL and TESTCASE_TYPE_SEMIAUTOMATED"
#endif
 
/* 
 * Methods the test case must implement
 */

void setup_testcase(testsuite_container_pt context);
int execute_testcase(testsuite_container_pt context, int argc, char **argv);
void cleanup_testcase(testsuite_container_pt context);

int main(int argc, char **argv) {
    testsuite_container_pt context = create_testsuite_container();
    int result;

    printf("Starting execution of testcase: %s\n", argv[0]);

    setup_testcase(context);
    result = execute_testcase(context, argc, argv);
    cleanup_testcase(context);

    printf("Finished execution of testcase: %s\n", argv[0]);

    free_testsuite_container(&context);
    return result;
}

// After we have setup the test environment
#define DARLING_TESTSUITE_LIB_TESTCASE_SETUP_H
