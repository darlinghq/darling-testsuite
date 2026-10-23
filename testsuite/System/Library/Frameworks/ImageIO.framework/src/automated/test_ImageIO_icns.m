// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>
#include <ImageIO/ImageIO.h>

#include <assert.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/resource.h>

void test_icontype_ic04(testsuite_container_pt context);
void test_icontype_ic05(testsuite_container_pt context);
void test_icontype_ic07(testsuite_container_pt context);
void test_icontype_ic08(testsuite_container_pt context);
void test_icontype_ic09(testsuite_container_pt context);
void test_icontype_ic10(testsuite_container_pt context);
void test_icontype_ic11(testsuite_container_pt context);
void test_icontype_ic12(testsuite_container_pt context);
void test_icontype_ic13(testsuite_container_pt context);
void test_icontype_ic14(testsuite_container_pt context);

#define TESTCASE_TYPE TESTCASE_TYPE_AUTOMATED

// Testcase Logic
#include <darling-testsuite/testcase/setup.h>

void setup_testcase(testsuite_container_pt context) {}
void cleanup_testcase(testsuite_container_pt context) {}

int execute_testcase(testsuite_container_pt context, int argc, char **argv) {
    test_icontype_ic04(context);
    test_icontype_ic05(context);
    test_icontype_ic07(context);
    test_icontype_ic08(context);
    test_icontype_ic09(context);
    test_icontype_ic10(context);
    test_icontype_ic11(context);
    test_icontype_ic12(context);
    test_icontype_ic13(context);
    test_icontype_ic14(context);

    return 0;
}

void template_test_icns_single_type(
        NSURL* icns_url,
        size_t expected_width,
        size_t expected_height,
        CFStringRef expected_uttype
        ) {
    CGImageSourceRef icns_image_source_ref = CGImageSourceCreateWithURL((CFURLRef)icns_url, nil);
    assert(icns_image_source_ref != nil);
    
    assert(CGImageSourceGetCount(icns_image_source_ref) == 1);
    CGImageRef icns_image_ref = CGImageSourceCreateImageAtIndex(icns_image_source_ref, 0, nil);
    assert_equals_CFStringRef(expected_uttype, CGImageGetUTType(icns_image_ref));
    assert_equals_size_t(NULL, expected_width, CGImageGetWidth(icns_image_ref));
    assert_equals_size_t(NULL, expected_height, CGImageGetHeight(icns_image_ref));
    assert_equals_size_t(NULL, 32, CGImageGetBitsPerPixel(icns_image_ref));
    assert_equals_int64_t(NULL, kCGImageAlphaLast, CGImageGetAlphaInfo(icns_image_ref));
    CGColorSpaceRef icns_color_space_ref = CGImageGetColorSpace(icns_image_ref);
    assert_equals_int64_t(NULL, kCGColorSpaceModelRGB, CGColorSpaceGetModel(icns_color_space_ref));

    CFRelease(icns_image_source_ref);
    CGImageRelease(icns_image_ref);
}

void test_icontype_ic04(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic04.icns")];
    size_t expected_width = 16;
    size_t expected_height = 16;
    CFStringRef expected_uttype = CFSTR("com.apple.icns");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}   

void test_icontype_ic05(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic05.icns")];
    size_t expected_width = 32;
    size_t expected_height = 32;
    CFStringRef expected_uttype = CFSTR("com.apple.icns");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic07(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic07.icns")];
    size_t expected_width = 128;
    size_t expected_height = 128;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic08(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic08.icns")];
    size_t expected_width = 256;
    size_t expected_height = 256;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic09(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic09.icns")];
    size_t expected_width = 512;
    size_t expected_height = 512;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic10(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic10.icns")];
    size_t expected_width = 1024;
    size_t expected_height = 1024;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic11(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic11.icns")];
    size_t expected_width = 32;
    size_t expected_height = 32;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic12(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic12.icns")];
    size_t expected_width = 64;
    size_t expected_height = 64;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic13(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic13.icns")];
    size_t expected_width = 256;
    size_t expected_height = 256;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}

void test_icontype_ic14(testsuite_container_pt context) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(context, @"testsuite/System/Library/Frameworks/ImageIO.framework/resources/testdata/icns/Type_ic14.icns")];
    size_t expected_width = 512;
    size_t expected_height = 512;
    // TODO: Older versions of macOS used a different uttype
    // CFStringRef expected_uttype = CFSTR("com.apple.icns");
    CFStringRef expected_uttype = CFSTR("public.png");
    template_test_icns_single_type(icns_url, expected_width, expected_height, expected_uttype);
}
