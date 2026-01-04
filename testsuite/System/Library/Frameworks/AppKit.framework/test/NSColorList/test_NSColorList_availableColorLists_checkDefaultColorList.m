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
    assert_equals_nsarray(expectedKeys, actualKeys, pretty_print_nsstring);
}
