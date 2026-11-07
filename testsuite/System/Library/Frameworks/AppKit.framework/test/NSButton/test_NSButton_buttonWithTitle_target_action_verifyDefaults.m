// SPDX-FileCopyrightText: 2026 Lubos Dolezel
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

// NSBezelStyleAutomatic (macOS 14 and later); a push button created by the
// factory method reports it on newer systems, NSBezelStyleRounded on older ones.
#define BEZEL_STYLE_AUTOMATIC 0

int main() {
    @autoreleasepool {
        NSObject *target = [[[NSObject alloc] init] autorelease];
        NSButton *button = [NSButton buttonWithTitle:@"Click" target:target action:@selector(description)];

        assert_equals_BOOL("[button isKindOfClass:[NSButton class]]", YES, [button isKindOfClass:[NSButton class]]);
        assert_equals_NSString(@"Click", [button title]);
        assert_equals_BOOL("[button target] == target", YES, [button target] == target);
        assert_equals_BOOL("[button action] == @selector(description)", YES, [button action] == @selector(description));

        // Standard push button: rounded bezel, momentary push-in behaviour.
        assert_equals_BOOL("[button bezelStyle] == NSRoundedBezelStyle || [button bezelStyle] == BEZEL_STYLE_AUTOMATIC", YES, [button bezelStyle] == NSRoundedBezelStyle || [button bezelStyle] == BEZEL_STYLE_AUTOMATIC);
        assert_equals_BOOL("isBordered", YES, [button isBordered]);
        assert_equals_BOOL("([[button cell] highlightsBy] & NSPushInCellMask) != 0", YES, ([[button cell] highlightsBy] & NSPushInCellMask) != 0);
        assert_equals_NSUInteger("showsStateBy", NSNoCellMask, [[button cell] showsStateBy]);
        assert_equals_NSUInteger("state", NSOffState, [button state]);

        // A title-only button.
        assert_equals_BOOL("[button image] == nil", YES, [button image] == nil);
        assert_equals_NSUInteger("imagePosition", NSNoImage, [button imagePosition]);

        // Sized to fit its title.
        assert_equals_BOOL("[button frame].size.width > 0", YES, [button frame].size.width > 0);
        assert_equals_BOOL("[button frame].size.height > 0", YES, [button frame].size.height > 0);
    }
}
