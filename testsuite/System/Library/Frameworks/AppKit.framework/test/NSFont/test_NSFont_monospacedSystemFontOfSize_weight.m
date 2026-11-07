// SPDX-FileCopyrightText: 2026 Lubos Dolezel
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

static BOOL isBold(NSFont *font) {
    return ([[NSFontManager sharedFontManager] traitsOfFont:font] & NSBoldFontMask) != 0;
}

int main() {
    @autoreleasepool {
        NSFont *regular = [NSFont monospacedSystemFontOfSize:13 weight:NSFontWeightRegular];
        assert_equals_BOOL("regular != nil", YES, regular != nil);
        assert_equals_BOOL("regular isFixedPitch", YES, [regular isFixedPitch]);
        assert_equals_CGFloat("regular pointSize", 13, [regular pointSize]);
        assert_equals_BOOL("regular is bold", NO, isBold(regular));

        NSFont *bold = [NSFont monospacedSystemFontOfSize:13 weight:NSFontWeightBold];
        assert_equals_BOOL("bold != nil", YES, bold != nil);
        assert_equals_BOOL("bold isFixedPitch", YES, [bold isFixedPitch]);
        assert_equals_CGFloat("bold pointSize", 13, [bold pointSize]);
        assert_equals_BOOL("bold is bold", YES, isBold(bold));

        // A size of 0 gives the default system font size.
        NSFont *defaultSize = [NSFont monospacedSystemFontOfSize:0 weight:NSFontWeightRegular];
        assert_equals_CGFloat("default pointSize", [NSFont systemFontSize], [defaultSize pointSize]);
    }
}
