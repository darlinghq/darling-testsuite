// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    NSMutableArray<NSString*> *actualKeys = [[NSMutableArray alloc] init];
    for (NSColorList* colorList in [NSColorList availableColorLists]) {
        [actualKeys addObject:[colorList name]];
    }

    NSArray<NSString*> *expectedKeys = @[
        @"Apple",
        @"Crayons",
        @"System",
        @"Web Safe Colors"
    ];

    // Sort List
    [actualKeys sortUsingSelector: @selector(compare:)];

    // Verify List
    assert_equals_NSArray(expectedKeys, actualKeys, pretty_print_NSString);
}
