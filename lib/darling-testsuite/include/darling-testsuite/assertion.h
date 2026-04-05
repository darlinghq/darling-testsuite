// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_ASSERTION_H
#define DARLING_TESTSUITE_LIB_ASSERTION_H

#include <darling-testsuite/backtrace.h>
#include <darling-testsuite/print.h>
#include <darling-testsuite/testcase.h>

#include <CoreFoundation/CoreFoundation.h>

#include <stdbool.h>

// General
void internal__assert_is_true(testcase_mgr_t context, const char* expression_str, bool is_true);

#define assert_is_true(context,expression) \
    BACKTRACE_MACRO(internal__assert_is_true(context,#expression,expression))

// Integer Comparison (standard)
void assert_equals_uint8_t(char* variable_name, uint8_t expected, uint8_t actual);
void assert_equals_uint16_t(char* variable_name, uint16_t expected, uint16_t actual);
void assert_equals_uint32_t(char* variable_name, uint32_t expected, uint32_t actual);
void assert_equals_uint64_t(char* variable_name, uint64_t expected, uint64_t actual);

void assert_equals_int8_t(char* variable_name, int8_t expected, int8_t actual);
void assert_equals_int16_t(char* variable_name, int16_t expected, int16_t actual);
void assert_equals_int32_t(char* variable_name, int32_t expected, int32_t actual);
void assert_equals_int64_t(char* variable_name, int64_t expected, int64_t actual);

void internal__assert_equals_uint8_t(testcase_mgr_t context, char* variable_name, uint8_t expected, uint8_t actual);
void internal__assert_equals_uint16_t(testcase_mgr_t context, char* variable_name, uint16_t expected, uint16_t actual);
void internal__assert_equals_uint32_t(testcase_mgr_t context, char* variable_name, uint32_t expected, uint32_t actual);
void internal__assert_equals_uint64_t(testcase_mgr_t context, char* variable_name, uint64_t expected, uint64_t actual);

void internal__assert_equals_int8_t(testcase_mgr_t context, char* variable_name, int8_t expected, int8_t actual);
void internal__assert_equals_int16_t(testcase_mgr_t context, char* variable_name, int16_t expected, int16_t actual);
void internal__assert_equals_int32_t(testcase_mgr_t context, char* variable_name, int32_t expected, int32_t actual);
void internal__assert_equals_int64_t(testcase_mgr_t context, char* variable_name, int64_t expected, int64_t actual);

#define assert_equals_uint8_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_uint8_t(context, variable_name, expected, actual))
#define assert_equals_uint16_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_uint16_t(context, variable_name, expected, actual))
#define assert_equals_uint32_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_uint32_t(context, variable_name, expected, actual))
#define assert_equals_uint64_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_uint64_t(context, variable_name, expected, actual))

#define assert_equals_int8_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_int8_t(context, variable_name, expected, actual))
#define assert_equals_int16_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_int16_t(context, variable_name, expected, actual))
#define assert_equals_int32_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_int32_t(context, variable_name, expected, actual))
#define assert_equals_int64_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_int64_t(context, variable_name, expected, actual))

// Integer Comparsion (special)
void assert_equals_size_t(char *variable_name, size_t expected, size_t actual);

void internal__assert_equals_size_t(testcase_mgr_t context, char *variable_name, size_t expected, size_t actual);

#define assert_equals_size_t2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_size_t(context, variable_name, expected, actual))

// Floating Point Comparsion
void assert_equals_float(char *variable_name, float expected, float actual);
void assert_equals_double(char *variable_name, double expected, double actual);

void internal__assert_equals_float(testcase_mgr_t context, char *variable_name, float expected, float actual);
void internal__assert_equals_double(testcase_mgr_t context, char *variable_name, double expected, double actual);

#define assert_equals_float2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_float(context, variable_name, expected, actual))
#define assert_equals_double2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_double(context, variable_name, expected, actual))

// Errno Comparsion
void assert_no_errno(const char* function_name, bool is_failure_case);
void assert_expected_errno(const char* function_name, bool is_failure_case, int expected_errcode);

// CoreFoundation
void assert_equals_CFStringRef(CFStringRef expected, CFStringRef actual);

#if __OBJC__
#include <Foundation/Foundation.h>

// Objective-C Comparsion
void assert_equals_NSString(const NSString* expected, const NSString* actual);
void assert_equals_NSArray(NSArray* expected, NSArray* actual, print_basicobj_func_t print_item);

void internal__assert_equals_NSString(testcase_mgr_t context, const NSString* expected, const NSString* actual);
void internal__assert_equals_NSArray(testcase_mgr_t context, NSArray* expected, NSArray* actual, print_basicobj_func_t print_item);

#define assert_equals_NSString2(context, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_NSString(context, expected, actual))
#define assert_equals_NSArray2(context, expected, actual, print_item) \
    BACKTRACE_MACRO(internal__assert_equals_NSArray(context, expected, actual, print_item))

void assert_equals_NSUInteger(char* variable_name, NSUInteger expected, NSUInteger actual);
void assert_equals_BOOL(char *variable_name, BOOL expected, BOOL actual);

void internal__assert_equals_NSInteger(testcase_mgr_t context, char *variable_name, NSInteger expected, NSInteger actual);
void internal__assert_equals_NSUInteger(testcase_mgr_t context, char *variable_name, NSUInteger expected, NSUInteger actual);
void internal__assert_equals_BOOL(testcase_mgr_t context, char *variable_name, BOOL expected, BOOL actual);

#define assert_equals_NSInteger2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_NSInteger(context, variable_name, expected, actual))
#define assert_equals_NSUInteger2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_NSInteger(context, variable_name, expected, actual))
#define assert_equals_BOOL2(context, variable_name, expected, actual) \
    BACKTRACE_MACRO(internal__assert_equals_BOOL(context, variable_name, expected, actual))

// Objective-C Exception/Error
void assert_NSError_not_set(NSError *error, bool is_failure_case);
NSException *assert_NSException_is_thrown(void (^function_to_execute)(void));

void internal__assert_NSException_is_thrown(testcase_mgr_t context, NSException **result, void (^function_to_execute)(void));

#define assert_NSException_is_thrown2(context, result, function_to_execute) \
    BACKTRACE_MACRO(internal__assert_NSException_is_thrown(context, result, function_to_execute))

#endif // __OBJC__

#endif // DARLING_TESTSUITE_LIB_ASSERTION_H
