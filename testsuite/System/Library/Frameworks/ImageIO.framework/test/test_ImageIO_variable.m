#include <ImageIO/ImageIO.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <ImageIO/CGImageSource.h>
    assert_equals_CFStringRef(CFSTR("kCGImageSourceShouldAllowFloat"), kCGImageSourceShouldAllowFloat);

    // #include <ImageIO/CGImageProperties.h>
    assert_equals_CFStringRef(CFSTR("HasAlpha"), kCGImagePropertyHasAlpha);

}
