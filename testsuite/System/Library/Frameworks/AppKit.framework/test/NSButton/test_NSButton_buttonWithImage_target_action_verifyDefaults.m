// SPDX-FileCopyrightText: 2026 Lubos Dolezel
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

// NSBezelStyleAutomatic (macOS 14 and later); a push button created by the
// factory method reports it on newer systems, NSBezelStyleRounded on older ones.
#define BEZEL_STYLE_AUTOMATIC 0

int main() {
    @autoreleasepool {
        NSImage *image = [[[NSImage alloc] initWithSize:NSMakeSize(16, 16)] autorelease];
        NSButton *button = [NSButton buttonWithImage:image target:nil action:NULL];

        assert_equals_BOOL("[button isKindOfClass:[NSButton class]]", YES, [button isKindOfClass:[NSButton class]]);
        assert_equals_BOOL("[button image] == image", YES, [button image] == image);
        assert_equals_BOOL("[button target] == nil", YES, [button target] == nil);
        assert_equals_BOOL("[button action] == NULL", YES, [button action] == NULL);

        // Standard push button: rounded bezel, momentary push-in behaviour.
        assert_equals_BOOL("[button bezelStyle] == NSRoundedBezelStyle || [button bezelStyle] == BEZEL_STYLE_AUTOMATIC", YES, [button bezelStyle] == NSRoundedBezelStyle || [button bezelStyle] == BEZEL_STYLE_AUTOMATIC);
        assert_equals_BOOL("isBordered", YES, [button isBordered]);
        assert_equals_BOOL("([[button cell] highlightsBy] & NSPushInCellMask) != 0", YES, ([[button cell] highlightsBy] & NSPushInCellMask) != 0);
        assert_equals_NSUInteger("showsStateBy", NSNoCellMask, [[button cell] showsStateBy]);
        assert_equals_NSUInteger("state", NSOffState, [button state]);

        // Only the image is shown.
        assert_equals_NSUInteger("imagePosition", NSImageOnly, [button imagePosition]);

        // Sized to fit its image.
        assert_equals_BOOL("[button frame].size.width > 0", YES, [button frame].size.width > 0);
        assert_equals_BOOL("[button frame].size.height > 0", YES, [button frame].size.height > 0);
    }
}
