// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreGraphics/CoreGraphics.h>
// #include <Foundation/Foundation.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/availability.h>

// extern const CFStringRef kCGDisplayStreamShowCursor;

int main() {
#if MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(MACOS_10_8,MACOS_14_0)
    // #include <CoreGraphics/CGDisplayStream.h>
    assert_equals_CFStringRef(CFSTR("kCGDisplayStreamShowCursor"), kCGDisplayStreamShowCursor);
#endif

    // #include <CoreGraphics/CGFont.h>
    assert_equals_CFStringRef(CFSTR("kCGFontVariationAxisName"), kCGFontVariationAxisName);
    assert_equals_CFStringRef(CFSTR("kCGFontVariationAxisMinValue"), kCGFontVariationAxisMinValue);
    assert_equals_CFStringRef(CFSTR("kCGFontVariationAxisDefaultValue"), kCGFontVariationAxisDefaultValue);
    assert_equals_CFStringRef(CFSTR("kCGFontVariationAxisMaxValue"), kCGFontVariationAxisMaxValue);

    // #include <CoreGraphics/CGWindow.h>
    assert_equals_CFStringRef(CFSTR("kCGWindowIsOnscreen"), kCGWindowIsOnscreen);
}
