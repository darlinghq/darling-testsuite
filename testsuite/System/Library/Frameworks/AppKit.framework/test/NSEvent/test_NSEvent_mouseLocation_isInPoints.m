// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>
#include <CoreGraphics/CoreGraphics.h>

#include <math.h>

#include <darling-testsuite/assertion.h>

// +[NSEvent mouseLocation] and CGWarpMouseCursorPosition both work in points, but
// in different spaces: Quartz global display coordinates have their origin at the
// top left of the main display, while the Cocoa screen space that mouseLocation and
// NSScreen.frame use has it at the bottom left (the main screen's frame starts at
// (0,0)). The X11 backend used to feed XQueryPointer's device pixels straight back
// out, so at 2x the reported location was twice as far from the origin as the
// pointer actually was, and warping to a point moved the pointer to twice that
// distance.
//
// Driving the pointer with CGWarpMouseCursorPosition and reading it back is what
// makes this deterministic: a test that only sampled wherever the pointer happened
// to be would pass on broken code half the time.

static const CGFloat tolerance = 1.0;

static BOOL locations_match(NSPoint a, NSPoint b) {
    return fabs(a.x - b.x) <= tolerance && fabs(a.y - b.y) <= tolerance;
}

int main() {
    NSScreen* screen = [NSScreen mainScreen];
    assert_is_true(screen != nil);

    NSRect frame = [screen frame];
    CGFloat scale = [screen backingScaleFactor];

    // Deliberately off-centre and asymmetric: a centre-only sample would still
    // agree between the two coordinate spaces at 1x, and an off-centre point is
    // what separates "points" from "device pixels" at 2x.
    CGPoint warpTarget = CGPointMake(NSWidth(frame) / 4.0, NSHeight(frame) / 8.0);
    // The same place in Cocoa screen coordinates: y counts up from the bottom edge.
    NSPoint target = NSMakePoint(NSMinX(frame) + warpTarget.x,
                                 NSMaxY(frame) - warpTarget.y);

    CGError error = CGWarpMouseCursorPosition(warpTarget);
    assert_is_true(error == kCGErrorSuccess);

    // The X11 backend reads the pointer back with a synchronous XQueryPointer, but
    // allow a few frames for a compositor to catch up before giving up, so this does
    // not turn into a timing-dependent test.
    NSPoint reported = CGPointZero;
    for (int attempt = 0; attempt < 20; attempt++) {
        reported = [NSEvent mouseLocation];
        if (locations_match(reported, target))
            break;
    }

    assert_equals_CGFloat("mouseLocation.x is in points", target.x, reported.x);
    assert_equals_CGFloat("mouseLocation.y is in points", target.y, reported.y);

    // A device-pixel reading at 2x can be pushed past the point-space bounds of the
    // screen, so containment is a cheap second opinion on the same claim.
    assert_is_true(reported.x >= NSMinX(frame) - tolerance);
    assert_is_true(reported.y >= NSMinY(frame) - tolerance);
    assert_is_true(reported.x <= NSMaxX(frame) + tolerance);
    assert_is_true(reported.y <= NSMaxY(frame) + tolerance);

    // Put the pointer back roughly centred so the test does not leave it in a corner.
    CGWarpMouseCursorPosition(CGPointMake(NSWidth(frame) / 2.0, NSHeight(frame) / 2.0));

    // Sanity: the two spaces only coincide at 1x, which is why this test has to
    // exercise a non-central point to mean anything above 1x.
    if (scale > 1.0) {
        assert_is_true(!locations_match(target, NSMakePoint(target.x * scale,
                                                             target.y * scale)));
    }

    return 0;
}
