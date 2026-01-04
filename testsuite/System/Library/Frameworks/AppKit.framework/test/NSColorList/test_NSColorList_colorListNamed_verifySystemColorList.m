#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    NSColorList* actualColorList =  [NSColorList colorListNamed:@"System"];

    NSArray<NSString*> *actualKeyList = [actualColorList allKeys];
    NSArray<NSString*> *expectedKeyList = @[
        @"alternateSelectedControlTextColor",
        @"alternatingContentBackgroundColor",
        @"controlAccentColor",
        @"controlBackgroundColor",
        @"controlColor",
        @"controlTextColor",
        @"disabledControlTextColor",
        @"findHighlightColor",
        @"gridColor",
        @"headerTextColor",
        @"keyboardFocusIndicatorColor",
        @"labelColor",
        @"linkColor",
        @"placeholderTextColor",
        @"quaternaryLabelColor",
        @"quaternarySystemFillColor",
        @"quinaryLabelColor",
        @"quinarySystemFillColor",
        @"secondaryLabelColor",
        @"secondarySystemFillColor",
        @"selectedContentBackgroundColor",
        @"selectedControlColor",
        @"selectedControlTextColor",
        @"selectedMenuItemTextColor",
        @"selectedTextBackgroundColor",
        @"selectedTextColor",
        @"separatorColor",
        @"systemBlueColor",
        @"systemBrownColor",
        @"systemCyanColor",
        @"systemFillColor",
        @"systemGrayColor",
        @"systemGreenColor",
        @"systemIndigoColor",
        @"systemMintColor",
        @"systemOrangeColor",
        @"systemPinkColor",
        @"systemPurpleColor",
        @"systemRedColor",
        @"systemTealColor",
        @"systemYellowColor",
        @"tertiaryLabelColor",
        @"tertiarySystemFillColor",
        @"textBackgroundColor",
        @"textColor",
        @"underPageBackgroundColor",
        @"unemphasizedSelectedContentBackgroundColor",
        @"unemphasizedSelectedTextBackgroundColor",
        @"unemphasizedSelectedTextColor",
        @"windowBackgroundColor",
        @"windowFrameTextColor"
    ];
    
    // Sorting
    actualKeyList = [actualKeyList sortedArrayUsingSelector:@selector(compare:)];

    // Verifying
    assert_equals_NSString(@"System", actualColorList.name);
    assert_equals_NSArray(expectedKeyList, actualKeyList, pretty_print_NSString);

    // Note to self:
    // Should we verify the NSColor values as well?
}
