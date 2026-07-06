// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>
#include <ImageIO/ImageIO.h>

#include <assert.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/resource.h>

void test_icontype_ic04(resource_container_pt resource_container);
void test_icontype_ic05(resource_container_pt resource_container);
void test_icontype_ic07(resource_container_pt resource_container);
void test_icontype_ic08(resource_container_pt resource_container);
void test_icontype_ic09(resource_container_pt resource_container);
void test_icontype_ic10(resource_container_pt resource_container);
void test_icontype_ic11(resource_container_pt resource_container);
void test_icontype_ic12(resource_container_pt resource_container);
void test_icontype_ic13(resource_container_pt resource_container);
void test_icontype_ic14(resource_container_pt resource_container);


// -> count]
// -> createImageAtIndex:options:]
// --> parseIfNeeded]
// ---> parseImages]
// ----> parseIcon]
int main() {
    resource_container_pt resource_container = resource_container_init();

    test_icontype_ic04(resource_container);
    test_icontype_ic05(resource_container);
    test_icontype_ic07(resource_container);
    test_icontype_ic08(resource_container);
    test_icontype_ic09(resource_container);
    test_icontype_ic10(resource_container);
    test_icontype_ic11(resource_container);
    test_icontype_ic12(resource_container);
    test_icontype_ic13(resource_container);
    test_icontype_ic14(resource_container);

    resource_container_free(&resource_container);
}

void template_test_icns_single_type(NSURL* icns_url, size_t expected_width, size_t expected_height) {
    CGImageSourceRef icns_image_source_ref = CGImageSourceCreateWithURL((CFURLRef)icns_url, nil);
    assert(icns_image_source_ref != nil);
    
    assert(CGImageSourceGetCount(icns_image_source_ref) == 1);
    CGImageRef icns_image_ref = CGImageSourceCreateImageAtIndex(icns_image_source_ref, 0, nil);
    assert_equals_CFStringRef(CFSTR("com.apple.icns"), CGImageGetUTType(icns_image_ref));
    assert_equals_size_t(NULL, expected_width, CGImageGetWidth(icns_image_ref));
    assert_equals_size_t(NULL, expected_height, CGImageGetHeight(icns_image_ref));
    assert_equals_size_t(NULL, 32, CGImageGetBitsPerPixel(icns_image_ref));
    assert_equals_int64_t(NULL, kCGImageAlphaLast, CGImageGetAlphaInfo(icns_image_ref));
    CGColorSpaceRef icns_color_space_ref = CGImageGetColorSpace(icns_image_ref);
    assert_equals_int64_t(NULL, kCGColorSpaceModelRGB, CGColorSpaceGetModel(icns_color_space_ref));

    CFRelease(icns_image_source_ref);
    CGImageRelease(icns_image_ref);
}

void test_icontype_ic04(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic04.icns")];
    size_t expected_width = 16;
    size_t expected_height = 16;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}   

void test_icontype_ic05(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic05.icns")];
    size_t expected_width = 32;
    size_t expected_height = 32;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic07(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic07.icns")];
    size_t expected_width = 128;
    size_t expected_height = 128;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic08(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic08.icns")];
    size_t expected_width = 256;
    size_t expected_height = 256;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic09(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic09.icns")];
    size_t expected_width = 512;
    size_t expected_height = 512;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic10(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic10.icns")];
    size_t expected_width = 1024;
    size_t expected_height = 1024;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic11(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic11.icns")];
    size_t expected_width = 32;
    size_t expected_height = 32;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic12(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic12.icns")];
    size_t expected_width = 64;
    size_t expected_height = 64;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic13(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic13.icns")];
    size_t expected_width = 256;
    size_t expected_height = 256;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic14(resource_container_pt resource_container) {
    NSURL* icns_url = [NSURL fileURLWithPath:grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/ImageIO.framework/resource/icns/Type_ic14.icns")];
    size_t expected_width = 512;
    size_t expected_height = 512;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}
