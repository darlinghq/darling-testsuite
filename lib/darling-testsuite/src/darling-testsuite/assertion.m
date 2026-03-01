// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/assertion.h>

#include <assert.h>
#include <stdio.h>

#include <sys/errno.h>


#define CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(primitive_type, printf_primitive_type) \
void assert_equals_ ## primitive_type(char* variable_name, primitive_type expected, primitive_type actual) { \
    if (expected != actual) { \
        printf("Expected does not equal actual (%s)\n", variable_name == NULL ? "" : variable_name); \
        printf("Expected: " printf_primitive_type "\n", expected); \
        printf("Actual: " printf_primitive_type "\n", actual); \
        assert(expected == actual); \
    } \
}

//
// Integer Comparison (Standard)
//

CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(uint8_t, "%hhu")
CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(uint16_t, "%hu")
CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(uint32_t, "%u")
CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(uint64_t, "%llu")

CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(int8_t, "%hhd")
CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(int16_t, "%hd")
CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(int32_t, "%d")
CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(int64_t, "%lld")

//
// Integer Comparsion (Special)
//

CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(size_t, "%zu")

//
// Floating Point Comparsion
//

CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(float, "%f")
CREATE_BASIC_PRIMITIVE_COMPARISON_FUNCTION(double, "%f")

//
// Errno Comparsion
//

const char* get_errno_varname(int error_code) {
    switch (error_code) {
        case EPERM: return "EPERM";
        case ENOENT: return "ENOENT";
        case ESRCH: return "ESRCH";
        case EINTR: return "EINTR";
        case EIO: return "EIO";
        case ENXIO: return "ENXIO";
        case E2BIG: return "E2BIG";
        case ENOEXEC: return "ENOEXEC";
        case EBADF: return "EBADF";
        case ECHILD: return "ECHILD";
        case EDEADLK: return "EDEADLK";
        case ENOMEM: return "ENOMEM";
        case EACCES: return "EACCES";
        case EFAULT: return "EFAULT";
        case ENOTBLK: return "ENOTBLK";
        case EBUSY: return "EBUSY";
        case EEXIST: return "EEXIST";
        case EXDEV: return "EXDEV";
        case ENODEV: return "ENODEV";
        case ENOTDIR: return "ENOTDIR";
        case EISDIR: return "EISDIR";
        case EINVAL: return "EINVAL";
        case ENFILE: return "ENFILE";
        case EMFILE: return "EMFILE";
        case ENOTTY: return "ENOTTY";
        case ETXTBSY: return "ETXTBSY";
        case EFBIG: return "EFBIG";
        case ENOSPC: return "ENOSPC";
        case ESPIPE: return "ESPIPE";
        case EROFS: return "EROFS";
        case EMLINK: return "EMLINK";
        case EPIPE: return "EPIPE";
        case EDOM: return "EDOM";
        case ERANGE: return "ERANGE";
        case EAGAIN: return "EAGAIN";
        case EINPROGRESS: return "EINPROGRESS";
        case EALREADY: return "EALREADY";
        case ENOTSOCK: return "ENOTSOCK";
        case EDESTADDRREQ: return "EDESTADDRREQ";
        case EMSGSIZE: return "EMSGSIZE";
        case EPROTOTYPE: return "EPROTOTYPE";
        case ENOPROTOOPT: return "ENOPROTOOPT";
        case EPROTONOSUPPORT: return "EPROTONOSUPPORT";
        case ESOCKTNOSUPPORT: return "ESOCKTNOSUPPORT";
        case ENOTSUP: return "ENOTSUP";
        case EPFNOSUPPORT: return "EPFNOSUPPORT";
        case EAFNOSUPPORT: return "EAFNOSUPPORT";
        case EADDRINUSE: return "EADDRINUSE";
        case EADDRNOTAVAIL: return "EADDRNOTAVAIL";
        case ENETDOWN: return "ENETDOWN";
        case ENETUNREACH: return "ENETUNREACH";
        case ENETRESET: return "ENETRESET";
        case ECONNABORTED: return "ECONNABORTED";
        case ECONNRESET: return "ECONNRESET";
        case ENOBUFS: return "ENOBUFS";
        case EISCONN: return "EISCONN";
        case ENOTCONN: return "ENOTCONN";
        case ESHUTDOWN: return "ESHUTDOWN";
        case ETIMEDOUT: return "ETIMEDOUT";
        case ECONNREFUSED: return "ECONNREFUSED";
        case ELOOP: return "ELOOP";
        case ENAMETOOLONG: return "ENAMETOOLONG";
        case EHOSTDOWN: return "EHOSTDOWN";
        case EHOSTUNREACH: return "EHOSTUNREACH";
        case ENOTEMPTY: return "ENOTEMPTY";
        case EPROCLIM: return "EPROCLIM";
        case EUSERS: return "EUSERS";
        case EDQUOT: return "EDQUOT";
        case ESTALE: return "ESTALE";
        case EBADRPC: return "EBADRPC";
        case ERPCMISMATCH: return "ERPCMISMATCH";
        case EPROGUNAVAIL: return "EPROGUNAVAIL";
        case EPROGMISMATCH: return "EPROGMISMATCH";
        case EPROCUNAVAIL: return "EPROCUNAVAIL";
        case ENOLCK: return "ENOLCK";
        case ENOSYS: return "ENOSYS";
        case EFTYPE: return "EFTYPE";
        case EAUTH: return "EAUTH";
        case ENEEDAUTH: return "ENEEDAUTH";
        case EPWROFF: return "EPWROFF";
        case EDEVERR: return "EDEVERR";
        case EOVERFLOW: return "EOVERFLOW";
        case EBADEXEC: return "EBADEXEC";
        case EBADARCH: return "EBADARCH";
        case ESHLIBVERS: return "ESHLIBVERS";
        case EBADMACHO: return "EBADMACHO";
        case ECANCELED: return "ECANCELED";
        case EIDRM: return "EIDRM";
        case ENOMSG: return "ENOMSG";
        case EILSEQ: return "EILSEQ";
        case ENOATTR: return "ENOATTR";
        case EBADMSG: return "EBADMSG";
        case EMULTIHOP: return "EMULTIHOP";
        case ENODATA: return "ENODATA";
        case ENOLINK: return "ENOLINK";
        case ENOSR: return "ENOSR";
        case ENOSTR: return "ENOSTR";
        case EPROTO: return "EPROTO";
        case ETIME: return "ETIME";
        case EOPNOTSUPP: return "EOPNOTSUPP";
        default: return "Unknown value";
    }
}

void assert_no_errno(const char* function_name, bool is_failure_case) {
    if (is_failure_case) {
        int error_num = errno;
        const char* error_varname = get_errno_varname(error_num);
        const char* error_msg = strerror(error_num);

        if (function_name != NULL) {
            printf("%s has failed (%s %d: %s)\n", 
                function_name, error_varname, error_num, error_msg);
        } else {
            printf("Errno failure has occured (%s %d: %s)\n", 
                error_varname, error_num, error_msg);
        }

        assert(!is_failure_case);
    }
}

void assert_expected_errno(const char* function_name, bool is_failure_case, int expected_errcode) {
    int error_num = errno;
    if (is_failure_case && error_num == expected_errcode) {
        return;
    }

    assert_no_errno(function_name, is_failure_case);
    
    if (!is_failure_case) {
        if (function_name != NULL) {
            printf("%s should have failed, but it succeeded.\n", function_name);
        } else {
            printf("Should have failed, but succeeded.\n");
        }

        assert(is_failure_case);
    }
}

//
// Core Foundation Comparsion
//

void assert_equals_CFStringRef(CFStringRef expected, CFStringRef actual) {
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

void assert_equals_NSString(const NSString* expected, const NSString* actual) {
    assert_equals_basicobj((NSObject*)expected, (NSObject*)actual, pretty_print_NSString);
}

void assert_equals_NSArray(NSArray* expected, NSArray* actual, print_basicobj_func_t print_item) {
    if (![expected isEqualTo:actual]) {
        printf("Expected does not equal actual\n");
        printf("Expected: %s\n", [pretty_print_NSArray(expected, print_item) UTF8String]);
        printf("Actual: %s\n", [pretty_print_NSArray(actual, print_item) UTF8String]);
        assert([expected isEqualTo:actual]);
    }
}

void assert_equals_NSUInteger(char* variable_name, NSUInteger expected, NSUInteger actual) {
#if __LP64__
    assert_equals_uint64_t(variable_name, expected, actual);
#else
    assert_equals_uint32_t(variable_name, expected, actual);
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
// Objective-C Exception/Error
//

void assert_NSError_not_set(NSError *error, bool is_failure_case) {
    if (is_failure_case && error != NULL) {
        printf("An NSError has occured (code=%ld, domain=%s)\n",
            error.code,
            [error.domain UTF8String]
        );

        assert(!is_failure_case && error == NULL);
    }
}

NSException* assert_NSException_is_thrown(void (^function_to_execute)(void)) {
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
