// SPDX-FileCopyrightText: 2026 Lubos Dolezel
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

static BOOL isBold(NSFont *font) {
    return ([[NSFontManager sharedFontManager] traitsOfFont:font] & NSBoldFontMask) != 0;
}

int main() {
    @autoreleasepool {
        // A version of the system font: same family, only the digits differ.
        NSString *systemFamily = [[NSFont systemFontOfSize:13] familyName];

        NSFont *regular = [NSFont monospacedDigitSystemFontOfSize:13 weight:NSFontWeightRegular];
        assert_equals_BOOL("regular != nil", YES, regular != nil);
        assert_equals_NSString(systemFamily, [regular familyName]);
        assert_equals_CGFloat("regular pointSize", 13, [regular pointSize]);
        assert_equals_BOOL("regular is bold", NO, isBold(regular));

        NSFont *bold = [NSFont monospacedDigitSystemFontOfSize:13 weight:NSFontWeightBold];
        assert_equals_BOOL("bold != nil", YES, bold != nil);
        assert_equals_NSString(systemFamily, [bold familyName]);
        assert_equals_CGFloat("bold pointSize", 13, [bold pointSize]);
        assert_equals_BOOL("bold is bold", YES, isBold(bold));

        // A size of 0 gives the default system font size.
        NSFont *defaultSize = [NSFont monospacedDigitSystemFontOfSize:0 weight:NSFontWeightRegular];
        assert_equals_CGFloat("default pointSize", [NSFont systemFontSize], [defaultSize pointSize]);
    }
}
