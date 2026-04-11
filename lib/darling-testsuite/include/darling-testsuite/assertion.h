// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_ASSERTION_H
#define DARLING_TESTSUITE_LIB_ASSERTION_H

#include <darling-testsuite/print.h>

#include <CoreFoundation/CoreFoundation.h>

// Integer Comparison (standard)
void assert_equals_uint8_t(char* variable_name, uint8_t expected, uint8_t actual);
void assert_equals_uint16_t(char* variable_name, uint16_t expected, uint16_t actual);
void assert_equals_uint32_t(char* variable_name, uint32_t expected, uint32_t actual);
void assert_equals_uint64_t(char* variable_name, uint64_t expected, uint64_t actual);

void assert_equals_int8_t(char* variable_name, int8_t expected, int8_t actual);
void assert_equals_int16_t(char* variable_name, int16_t expected, int16_t actual);
void assert_equals_int32_t(char* variable_name, int32_t expected, int32_t actual);
void assert_equals_int64_t(char* variable_name, int64_t expected, int64_t actual);

// Integer Comparsion (special)
void assert_equals_size_t(char *variable_name, size_t expected, size_t actual);

// Floating Point Comparsion
void assert_equals_float(char *variable_name, float expected, float actual);
void assert_equals_double(char *variable_name, double expected, double actual);

// C string comparison
void assert_equals_cstring(char* variable_name, const char* expected, const char* actual);

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

void assert_equals_NSUInteger(char* variable_name, NSUInteger expected, NSUInteger actual);
void assert_equals_BOOL(char *variable_name, BOOL expected, BOOL actual);

// Objective-C Exception/Error
void assert_NSError_not_set(NSError *error, bool is_failure_case);
NSException *assert_NSException_is_thrown(void (^function_to_execute)(void));
#endif // __OBJC__

#endif // DARLING_TESTSUITE_LIB_ASSERTION_H
