#ifndef DARLING_TESTSUITE_LIB_ASSERTION_H
#define DARLING_TESTSUITE_LIB_ASSERTION_H

#include <darling-testsuite/print.h>

#include <CoreFoundation/CoreFoundation.h>
#include <Foundation/Foundation.h>

// Integer Comparsion
void assert_equals_uint8(char* variable_name, uint8_t expected, uint8_t actual);
void assert_equals_uint16(char* variable_name, uint16_t expected, uint16_t actual);
void assert_equals_uint32(char* variable_name, uint32_t expected, uint32_t actual);
void assert_equals_uint64(char* variable_name, uint64_t expected, uint64_t actual);

void assert_equals_int8(char* variable_name, int8_t expected, int8_t actual);
void assert_equals_int16(char* variable_name, int16_t expected, int16_t actual);
void assert_equals_int32(char* variable_name, int32_t expected, int32_t actual);
void assert_equals_int64(char* variable_name, int64_t expected, int64_t actual);

// CoreFoundation
void assert_equals_cfstringref(CFStringRef expected, CFStringRef actual);

// Objective-C Comparsion
void assert_equals_nsstring(NSString* expected, NSString* actual);
void assert_equals_nsarray(NSArray* expected, NSArray* actual, print_basicobj_func_t print_item);

void assert_equals_nsuinteger(char* variable_name, NSUInteger expected, NSUInteger actual);
void assert_equals_BOOL(char *variable_name, BOOL expected, BOOL actual);

// Objective-C Exception
NSException* assert_exception_is_thrown(void (^function_to_execute)(void));

#endif // DARLING_TESTSUITE_LIB_ASSERTION_H
