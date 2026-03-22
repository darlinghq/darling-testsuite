// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_TESTCASE_PRIVATE_H
#define DARLING_TESTSUITE_LIB_TESTCASE_PRIVATE_H

#include <darling-testsuite/testcase.h>

#include <Foundation/Foundation.h>

#include <setjmp.h>

struct opaque_testcase_mgr {
    jmp_buf testcase_jmp_buf;
    struct {
        testcase_result_state_t state;
        union {
            // TCSTATE_FAILURE_NOTEQUAL
            struct {
                NSString* expected;
                NSString* actual;
            } comparion;
        } notes;
    } result;

    NSMutableArray<NSString *> *backtrace;
};

// End/Set Testcase State
void internal__set_testcase_state(testcase_mgr_t context, testcase_result_state_t result_state);
void internal__jmp_to_bypass_testcase_execution(testcase_mgr_t context);

// Internal Fail Testcase
void internal__fail_testcase_notequals(testcase_mgr_t context, NSString *expected, NSString *actual);

#endif // DARLING_TESTSUITE_LIB_TESTCASE_PRIVATE_H
