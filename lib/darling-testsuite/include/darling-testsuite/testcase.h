// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_TESTCASE_H
#define DARLING_TESTSUITE_LIB_TESTCASE_H

#include <stdbool.h>
#include <setjmp.h>

typedef struct opaque_testcase_mgr *testcase_mgr_t;

#define TESTCASE_ARGDEFS testcase_mgr_t context, int argc, char **argv
#define TESTCASE_ARGS context, argc, argv
typedef void (*test_case_template_f)(TESTCASE_ARGDEFS);

#define GRAB_COMMON_REASON(x)      (0xFF00 & x)
#define COMMON_REASON_PASSED        0x0000
#define COMMON_REASON_SKIPPED       0x0100
#define COMMON_REASON_FAILURE       0x0200

#define GRAB_UNIQUE_REASON(x)                   (0xFF & x)

#define SKIPPED_REASON_INCOMPLETE                0x01

#define FAILURE_REASON_EXPLICTCALL               0x01
#define FAILURE_REASON_EXCEPTION                 0x02
#define FAILURE_REASON_NOTEQUAL                  0x03
#define FAILURE_REASON_NOTTRUE                   0x04
#define FAILURE_REASON_NOTFALSE                  0x05

typedef enum testcase_result_state {
    // Success
    TCSTATE_PASSED                      = COMMON_REASON_PASSED | 0,

    // Skipped
    TCSTATE_SKIPPED_INCOMPLETE          = COMMON_REASON_SKIPPED | SKIPPED_REASON_INCOMPLETE,

    // Failure
    TCSTATE_FAILURE_EXPLICTCALL         = COMMON_REASON_FAILURE | FAILURE_REASON_EXPLICTCALL,
    TCSTATE_FAILURE_EXCEPTION           = COMMON_REASON_FAILURE | FAILURE_REASON_EXCEPTION,
    TCSTATE_FAILURE_NOTEQUAL            = COMMON_REASON_FAILURE | FAILURE_REASON_NOTEQUAL,
    TCSTATE_FAILURE_NOTTRUE             = COMMON_REASON_FAILURE | FAILURE_REASON_NOTTRUE,
    TCSTATE_FAILURE_NOTFALSE            = COMMON_REASON_FAILURE | FAILURE_REASON_NOTFALSE
} testcase_result_state_t;

// Memory & Init Functions
void alloc_testcase_mgr(testcase_mgr_t *context);
void init_testcase_mgr(testcase_mgr_t context);
void free_testcase_mgr(testcase_mgr_t *context);

// Testcase Controller
bool is_testcase_in_initial_state(testcase_mgr_t context);
void single_testcase_controller(void (*single_testcase)(TESTCASE_ARGDEFS), int argc, char **argv);

// Testcase State
testcase_result_state_t get_testcase_state(testcase_mgr_t context);
void skip_testcase_incomplete(testcase_mgr_t context);
void fail_testcase(testcase_mgr_t context);

void print_reason(testcase_mgr_t context);

#endif // DARLING_TESTSUITE_LIB_TESTCASE_H
