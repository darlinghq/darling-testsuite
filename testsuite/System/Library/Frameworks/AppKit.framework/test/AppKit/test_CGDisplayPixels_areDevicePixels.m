// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>
#include <CoreGraphics/CoreGraphics.h>

#include <math.h>

#include <darling-testsuite/assertion.h>

// CGDisplayPixelsWide and CGDisplayPixelsHigh are documented as returning device
// pixels, while NSScreen.frame is in points. The two are related only by the backing
// scale, so an implementation that reports the frame size straight from
// CGDisplayPixelsWide is self-consistent at 1x and wrong by exactly the scale factor
// above it: at 2x a caller sizing a bitmap from it gets half the pixels it asked for.
//
// Unlike the other AppKit cases here this needs no environment variable, because the
// expected value is derived rather than configured, so it checks the same thing on a
// native macOS run.
//
// Only the declared CoreGraphics entry points are used. CGDisplayBounds is not declared
// by CGDirectDisplay.h, so the expected values come from NSScreen instead.
static void check_display(CGDirectDisplayID display, NSScreen* screen) {
    CGFloat scale = [screen backingScaleFactor];

    assert_equals_size_t("CGDisplayPixelsWide reports device pixels",
                         (size_t) lround(NSWidth([screen frame]) * scale),
                         CGDisplayPixelsWide(display));
    assert_equals_size_t("CGDisplayPixelsHigh reports device pixels",
                         (size_t) lround(NSHeight([screen frame]) * scale),
                         CGDisplayPixelsHigh(display));
}

int main() {
    NSScreen* screen = [NSScreen mainScreen];
    assert_is_true(screen != nil);

    // A backing scale below 1.0 is not a thing; the default display is 1.0.
    assert_is_true([screen backingScaleFactor] >= 1.0);

    check_display(CGMainDisplayID(), screen);

    // A pixel count is never smaller than the point count it came from, and above 1x
    // it must be strictly larger. Stated separately so a failure names which half of
    // the conversion broke.
    NSRect frame = [screen frame];
    size_t wide = CGDisplayPixelsWide(CGMainDisplayID());
    size_t high = CGDisplayPixelsHigh(CGMainDisplayID());

    assert_is_true(wide >= (size_t) lround(NSWidth(frame)));
    assert_is_true(high >= (size_t) lround(NSHeight(frame)));
    if ([screen backingScaleFactor] > 1.0) {
        assert_is_true(wide > (size_t) lround(NSWidth(frame)));
        assert_is_true(high > (size_t) lround(NSHeight(frame)));
    }

    // Every screen has to match the display it names in its device description,
    // scaled by that screen's own scale. This catches a scale borrowed from the
    // wrong screen. (Display IDs are opaque numbers, so they are taken from the
    // documented NSScreenNumber key rather than guessed from the screen's position.)
    NSArray<NSScreen*>* screens = [NSScreen screens];
    for (NSUInteger index = 0; index < [screens count]; index++) {
        NSScreen* each = [screens objectAtIndex: index];
        NSNumber* number = [[each deviceDescription] objectForKey: @"NSScreenNumber"];
        assert_is_true(number != nil);
        check_display((CGDirectDisplayID) [number unsignedIntValue], each);
    }

    return 0;
}
