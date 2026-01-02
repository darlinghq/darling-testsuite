#include <Foundation/Foundation.h>
#include <ImageIO/ImageIO.h>

#include <assert.h>

#include <darling-testsuite/assertion.h>

void test_icontype_ic04(void);
void test_icontype_ic05(void);
void test_icontype_ic07(void);
void test_icontype_ic08(void);
void test_icontype_ic09(void);
void test_icontype_ic10(void);
void test_icontype_ic11(void);
void test_icontype_ic12(void);
void test_icontype_ic13(void);
void test_icontype_ic14(void);


// -> count]
// -> createImageAtIndex:options:]
// --> parseIfNeeded]
// ---> parseImages]
// ----> parseIcon]
int main() {
    test_icontype_ic04();
    test_icontype_ic05();
    test_icontype_ic07();
    test_icontype_ic08();
    test_icontype_ic09();
    test_icontype_ic10();
    test_icontype_ic11();
    test_icontype_ic12();
    test_icontype_ic13();
    test_icontype_ic14();
}

void template_test_icns_single_type(NSURL* icns_url, size_t expected_width, size_t expected_height) {
    CGImageSourceRef icns_image_source_ref = CGImageSourceCreateWithURL((CFURLRef)icns_url, nil);
    assert(icns_image_source_ref != nil);
    
    assert(CGImageSourceGetCount(icns_image_source_ref) == 1);
    CGImageRef icns_image_ref = CGImageSourceCreateImageAtIndex(icns_image_source_ref, 0, nil);
    assert_equals_cfstringref(CFSTR("com.apple.icns"), CGImageGetUTType(icns_image_ref));
    assert_equals_size_t(NULL, expected_width, CGImageGetWidth(icns_image_ref));
    assert_equals_size_t(NULL, expected_height, CGImageGetHeight(icns_image_ref));
    assert_equals_size_t(NULL, 32, CGImageGetBitsPerPixel(icns_image_ref));
    assert_equals_int64(NULL, kCGImageAlphaLast, CGImageGetAlphaInfo(icns_image_ref));
    CGColorSpaceRef icns_color_space_ref = CGImageGetColorSpace(icns_image_ref);
    assert_equals_int64(NULL, kCGColorSpaceModelRGB, CGColorSpaceGetModel(icns_color_space_ref));

    CFRelease(icns_image_source_ref);
    CGImageRelease(icns_image_ref);
}

void test_icontype_ic04(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic04.icns"];
    size_t expected_width = 16;
    size_t expected_height = 16;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}   

void test_icontype_ic05(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic05.icns"];
    size_t expected_width = 32;
    size_t expected_height = 32;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic07(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic07.icns"];
    size_t expected_width = 128;
    size_t expected_height = 128;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic08(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic08.icns"];
    size_t expected_width = 256;
    size_t expected_height = 256;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic09(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic09.icns"];
    size_t expected_width = 512;
    size_t expected_height = 512;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic10(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic10.icns"];
    size_t expected_width = 1024;
    size_t expected_height = 1024;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic11(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic11.icns"];
    size_t expected_width = 32;
    size_t expected_height = 32;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic12(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic12.icns"];
    size_t expected_width = 64;
    size_t expected_height = 64;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic13(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic13.icns"];
    size_t expected_width = 256;
    size_t expected_height = 256;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}

void test_icontype_ic14(void) {
    NSURL* icns_url = [NSURL fileURLWithPath:@"icns/Type_ic14.icns"];
    size_t expected_width = 512;
    size_t expected_height = 512;
    template_test_icns_single_type(icns_url, expected_width, expected_height);
}
