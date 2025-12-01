#include <darling-testsuite/assertion.h>

#include <assert.h>
#include <stdio.h>

//
// Integer Comparsion
//

void assert_equals_uint8(char* variable_name, uint8_t expected, uint8_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %hhu\n", expected);
        printf("Actual: %hhu\n", actual);
        assert(expected == actual);
    }
}

void assert_equals_uint16(char* variable_name, uint16_t expected, uint16_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %hu\n", expected);
        printf("Actual: %hu\n", actual);
        assert(expected == actual);
    }
}

void assert_equals_uint32(char* variable_name, uint32_t expected, uint32_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %u\n", expected);
        printf("Actual: %u\n", actual);
        assert(expected == actual);
    }
}

void assert_equals_uint64(char* variable_name, uint64_t expected, uint64_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %llu\n", expected);
        printf("Actual: %llu\n", actual);
        assert(expected == actual);
    }
}

void assert_equals_int8(char* variable_name, int8_t expected, int8_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %hhd\n", expected);
        printf("Actual: %hhd\n", actual);
        assert(expected == actual);
    }
}

void assert_equals_int16(char* variable_name, int16_t expected, int16_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %hd\n", expected);
        printf("Actual: %hd\n", actual);
        assert(expected == actual);
    }
}

void assert_equals_int32(char* variable_name, int32_t expected, int32_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %d\n", expected);
        printf("Actual: %d\n", actual);
        assert(expected == actual);
    }
}

void assert_equals_int64(char* variable_name, int64_t expected, int64_t actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %lld\n", expected);
        printf("Actual: %lld\n", actual);
        assert(expected == actual);
    }
}

//
// Core Foundation Comparsion
//

void assert_equals_cfstringref(CFStringRef expected, CFStringRef actual) {
    if (expected == nil && actual == nil) {
        // Are equal
        return;

    } else if (expected == nil || actual == nil) {
        const char* expectedCStr = expected == nil ? nil : CFStringGetCStringPtr(expected, kCFStringEncodingUTF8);
        const char* actualCStr = actual == nil ? nil : CFStringGetCStringPtr(actual, kCFStringEncodingUTF8);

        printf("Expected does not equal actual\n");
        if (expected != nil) {
            const char* expectedCStr = CFStringGetCStringPtr(expected, kCFStringEncodingUTF8);
            if (expectedCStr != NULL) {
                printf("Expected: %s\n", expectedCStr);
            } else {
                printf("Unable to grab expected result\n");
            }
        } else {
            printf("Expected result is nil\n");
        }

        if (actual != nil) {
            const char* actualCStr = CFStringGetCStringPtr(actual, kCFStringEncodingUTF8);
            if (actualCStr != NULL) {
                printf("Actual: %s\n", actualCStr);
            } else {
                printf("Unable to grab actual result\n");
            }
        } else {
            printf("Actual result is nil\n");
        }

        assert(expected != nil);
        assert(actual != nil);

    } else if (kCFCompareEqualTo != CFStringCompare(expected,actual,0)) {
        const char* expectedCStr = CFStringGetCStringPtr(expected, kCFStringEncodingUTF8);
        const char* actualCStr = CFStringGetCStringPtr(actual, kCFStringEncodingUTF8);
        
        if (expectedCStr != NULL && actualCStr != NULL) {
            printf("Expected does not equal actual\n");
            printf("Expected: %s\n", expectedCStr);
            printf("Actual: %s\n", actualCStr);
            assert(kCFCompareEqualTo == CFStringCompare(expected,actual,0));

        } else if (expectedCStr == NULL) {
            printf("Unable to grab expected result\n");
            assert(expectedCStr != NULL);

        } else if (actualCStr == NULL) {
            printf("Unable to grab actual result\n");
            assert(actualCStr != NULL);
        }
    }
}

//
// Objective-C Comparsion
//

void assert_equals_basicobj(NSObject* expected, NSObject* actual, print_basicobj_func_t print_item) {
    if (![expected isEqualTo:actual]) {
        printf("Expected does not equal actual\n");
        printf("Expected: %s\n", [print_item(expected) UTF8String]);
        printf("Actual: %s\n", [print_item(actual) UTF8String]);
        assert([expected isEqualTo:actual]);
    }
}

void assert_equals_nsstring(const NSString* expected, const NSString* actual) {
    assert_equals_basicobj((NSObject*)expected, (NSObject*)actual, pretty_print_nsstring);
}

void assert_equals_nsarray(NSArray* expected, NSArray* actual, print_basicobj_func_t print_item) {
    if (![expected isEqualTo:actual]) {
        printf("Expected does not equal actual\n");
        printf("Expected: %s\n", [pretty_print_nsarray(expected, print_item) UTF8String]);
        printf("Actual: %s\n", [pretty_print_nsarray(actual, print_item) UTF8String]);
        assert([expected isEqualTo:actual]);
    }
}

void assert_equals_nsuinteger(char* variable_name, NSUInteger expected, NSUInteger actual) {
#if __LP64__
    assert_equals_uint64(variable_name, expected, actual);
#else
    assert_equals_uint32(variable_name, expected, actual);
#endif
}

void assert_equals_BOOL(char *variable_name, BOOL expected, BOOL actual) {
    if (expected != actual) {
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name);
        printf("Expected: %hhu (%s)\n", expected, expected == NO ? "NO" : "YES");
        printf("Actual: %hhu (%s)\n", actual, actual == NO ? "NO" : "YES");
        assert(expected == actual);
    }
}

//
// Objective-C Exception
//

NSException* assert_exception_is_thrown(void (^function_to_execute)(void)) {
    NSException* result = nil;
    @try {
        function_to_execute();
    }

    @catch (NSException* exception) {
        result = exception;
    }

    assert(result != nil);
    return result;
}
