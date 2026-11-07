// SPDX-FileCopyrightText: 2026 Lubos Dolezel
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    @autoreleasepool {
        NSTextField *label = [NSTextField labelWithString:@"Hello"];

        assert_equals_BOOL("[label isKindOfClass:[NSTextField class]]", YES, [label isKindOfClass:[NSTextField class]]);
        assert_equals_NSString(@"Hello", [label stringValue]);

        // Static label: not editable, not selectable, no bezel, border or background.
        assert_equals_BOOL("isEditable", NO, [label isEditable]);
        assert_equals_BOOL("isSelectable", NO, [label isSelectable]);
        assert_equals_BOOL("isBezeled", NO, [label isBezeled]);
        assert_equals_BOOL("isBordered", NO, [label isBordered]);
        assert_equals_BOOL("drawsBackground", NO, [label drawsBackground]);

        // Doesn't wrap: the text is clipped instead.
        assert_equals_BOOL("cell.wraps", NO, [[label cell] wraps]);
        assert_equals_NSUInteger("lineBreakMode", NSLineBreakByClipping, [label lineBreakMode]);

        // Uses the system font at the default size.
        NSFont *systemFont = [NSFont systemFontOfSize:[NSFont systemFontSize]];
        assert_equals_NSString([systemFont fontName], [[label font] fontName]);
        assert_equals_CGFloat("font.pointSize", [NSFont systemFontSize], [[label font] pointSize]);

        // Sized to fit its text.
        assert_equals_BOOL("[label frame].size.width > 0", YES, [label frame].size.width > 0);
        assert_equals_BOOL("[label frame].size.height > 0", YES, [label frame].size.height > 0);
    }
}
