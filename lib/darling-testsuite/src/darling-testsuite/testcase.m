// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/backtrace.h>
#include <darling-testsuite/log.h>

#include <private/darling-testsuite/testcase_private.h>

#include <stdlib.h>

//
// Memory & Init Functions
//

void alloc_testcase_mgr(testcase_mgr_t *context) {
    *context = malloc(sizeof(struct opaque_testcase_mgr));
}

void init_testcase_mgr(testcase_mgr_t context) {
    internal__set_testcase_state(context, TCSTATE_PASSED);
    context->backtrace = [[NSMutableArray alloc] init];
}

void free_testcase_mgr(testcase_mgr_t *context) {
    [(*context)->backtrace release];
    
    switch (get_testcase_state((*context))) {
        case TCSTATE_FAILURE_NOTEQUAL:
        case TCSTATE_FAILURE_NOTTRUE:
        case TCSTATE_FAILURE_NOTFALSE:
            [(*context)->result.notes.comparion.expression release];
            [(*context)->result.notes.comparion.expected release];
            [(*context)->result.notes.comparion.actual release];
            break;

        // default:
        case TCSTATE_PASSED:
        case TCSTATE_SKIPPED_INCOMPLETE:
        case TCSTATE_FAILURE_EXPLICTCALL:
        case TCSTATE_FAILURE_EXCEPTION:
            break;
    }

    free(*context);
    *context = NULL;
}

//
// Testcase Controller
//

bool is_testcase_in_initial_state(testcase_mgr_t context) {
    if (setjmp(context->testcase_jmp_buf) == 0) {
        return true;
    } else {
        return false;
    }
}

void single_testcase_controller(void (*single_testcase)(TESTCASE_ARGDEFS), int argc, char **argv) {
    testcase_mgr_t context;
    alloc_testcase_mgr(&context);
    init_testcase_mgr(context);

    if (is_testcase_in_initial_state(context)) {
        single_testcase(TESTCASE_ARGS);
    }

    testcase_result_state_t tcstate = get_testcase_state(context);
    switch (GRAB_COMMON_REASON(tcstate)) {
        case COMMON_REASON_PASSED:
            dlts_log(context, LOG_INFO, "Test case passed");
            break;
        case COMMON_REASON_SKIPPED:
            dlts_log(context, LOG_INFO, "Test case skipped");
            print_reason(context);
            break;
        case COMMON_REASON_FAILURE:
            dlts_log(context, LOG_INFO, "Test case failed");
            print_reason(context);
            print_backtrace(context);
            exit(1);
    }
    
    free_testcase_mgr(&context);
}

//
// Testcase State 
//

void internal__set_testcase_state(testcase_mgr_t context, testcase_result_state_t result_state) {
    context->result.state = result_state;
}

testcase_result_state_t get_testcase_state(testcase_mgr_t context) {
    return context->result.state;
}

void internal__jmp_to_bypass_testcase_execution(testcase_mgr_t context) {
    longjmp(context->testcase_jmp_buf, -1);
}

void skip_testcase_incomplete(testcase_mgr_t context) {
    internal__set_testcase_state(context, TCSTATE_SKIPPED_INCOMPLETE);
    internal__jmp_to_bypass_testcase_execution(context);
}

void fail_testcase(testcase_mgr_t context) {
    internal__set_testcase_state(context, TCSTATE_FAILURE_EXPLICTCALL);
    internal__jmp_to_bypass_testcase_execution(context);
}

void internal__fail_testcase_notequals(testcase_mgr_t context, NSString* expected, NSString* actual) {
    context->result.notes.comparion.expression = nil;
    context->result.notes.comparion.expected = [expected retain];
    context->result.notes.comparion.actual = [actual retain];
    internal__set_testcase_state(context, TCSTATE_FAILURE_NOTEQUAL);
    internal__jmp_to_bypass_testcase_execution(context);
}

void internal__fail_testcase_notfalse(testcase_mgr_t context, NSString* expression) {
    context->result.notes.comparion.expression = expression;
    context->result.notes.comparion.expected = @"false";
    context->result.notes.comparion.actual = @"true";
    internal__set_testcase_state(context, TCSTATE_FAILURE_NOTFALSE);
    internal__jmp_to_bypass_testcase_execution(context);
}

void internal__fail_testcase_nottrue(testcase_mgr_t context, NSString* expression) {
    context->result.notes.comparion.expression = expression;
    context->result.notes.comparion.expected = @"true";
    context->result.notes.comparion.actual = @"false";
    internal__set_testcase_state(context, TCSTATE_FAILURE_NOTTRUE);
    internal__jmp_to_bypass_testcase_execution(context);
}

//
// Testcase Result Notes
//

void print_reason(testcase_mgr_t context) {
    NSString* expression;
    NSString* expected;
    NSString* actual;
    switch (get_testcase_state(context)) {
        case TCSTATE_FAILURE_EXPLICTCALL:
            dlts_log(context, LOG_ERROR, "TODO TCSTATE_FAILURE_EXPLICTCALL");
            break;
        case TCSTATE_FAILURE_EXCEPTION:
            dlts_log(context, LOG_ERROR, "TODO TCSTATE_FAILURE_EXCEPTION");
            break;
        case TCSTATE_FAILURE_NOTTRUE:
        case TCSTATE_FAILURE_NOTFALSE:
            expression = context->result.notes.comparion.expression;
            expected = context->result.notes.comparion.expected;
            actual = context->result.notes.comparion.actual;
            dlts_log(context, LOG_ERROR, "`%s` is %s when should be %s",
                [expression UTF8String], [actual UTF8String], [expected UTF8String]);
            break;
        case TCSTATE_FAILURE_NOTEQUAL:
            expected = context->result.notes.comparion.expected;
            actual = context->result.notes.comparion.actual;
            dlts_log(context, LOG_ERROR, "Expected does not equal actual");
            dlts_log(context, LOG_ERROR, "Expected: %s", [expected UTF8String]);
            dlts_log(context, LOG_ERROR, "Actual: %s", [actual UTF8String]);
            break;
        
        case TCSTATE_SKIPPED_INCOMPLETE:
            dlts_log(context, LOG_WARN, "This test case is incomplete");
            break;

        // default: (ignore)
        case TCSTATE_PASSED:
            break;
    }
}
