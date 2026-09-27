// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <math.h>
#include <stdlib.h>

#include <darling-testsuite/assertion.h>

// NSScreen.frame is documented in points and -backingScaleFactor reports how many
// device pixels a point covers. The X11 backend used to hardcode the scale to 1.0
// and report the raw CRTC size, which is self-consistent and therefore invisible at
// 1x: a 1:1 screen satisfies "frame == device pixels" while being wrong at 2x.
//
// There is no portable way to ask the system what the scale ought to be, so the
// scale-specific check is driven by GDK_SCALE, which is how the Darling X11 backend
// is told to scale in the first place. On a native macOS run GDK_SCALE is absent and
// only the scale-independent invariants are checked.
static CGFloat configured_scale(void) {
    const char* value = getenv("GDK_SCALE");
    if (value == NULL || *value == '\0')
        return -1.0;

    return (CGFloat) atof(value);
}

int main() {
    NSScreen* screen = [NSScreen mainScreen];
    assert_is_true(screen != nil);

    CGFloat scale = [screen backingScaleFactor];
    CGFloat expected = configured_scale();

    // A backing scale below 1.0 is not a thing; the default display is 1.0 and
    // anything denser is above it.
    assert_is_true(scale >= 1.0);
    assert_is_true(isfinite(scale));

    if (expected >= 1.0) {
        assert_equals_CGFloat("backingScaleFactor", expected, scale);
    }

    NSRect frame = [screen frame];
    assert_is_true(NSWidth(frame) > 0.0);
    assert_is_true(NSHeight(frame) > 0.0);
    assert_is_true(isfinite(NSWidth(frame)));
    assert_is_true(isfinite(NSHeight(frame)));

    // The frame is in points, so multiplying by the scale has to land on whole
    // device pixels. A frame still expressed in device pixels fails this at 2x.
    CGFloat deviceWidth = NSWidth(frame) * scale;
    CGFloat deviceHeight = NSHeight(frame) * scale;
    assert_equals_CGFloat("frame.width * scale is a whole pixel count",
                          round(deviceWidth), deviceWidth);
    assert_equals_CGFloat("frame.height * scale is a whole pixel count",
                          round(deviceHeight), deviceHeight);

    // Every screen has to agree, otherwise a window can end up placed against one
    // screen's idea of the scale and drawn against another's.
    for (NSScreen* other in [NSScreen screens]) {
        assert_equals_CGFloat("backingScaleFactor agrees across screens",
                              scale, [other backingScaleFactor]);
    }

    return 0;
}
