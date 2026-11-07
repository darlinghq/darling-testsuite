// SPDX-FileCopyrightText: 2026 Lubos Dolezel
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

@interface TestViewController : NSViewController
@property (nonatomic) int loadViewCount;
@end

@implementation TestViewController
- (void)loadView {
    self.loadViewCount++;
    [self setView:[[[NSView alloc] initWithFrame:NSZeroRect] autorelease]];
}
@end

int main() {
    @autoreleasepool {
        // Asking doesn't load the view.
        TestViewController *controller = [[[TestViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        assert_equals_BOOL("isViewLoaded (new)", NO, [controller isViewLoaded]);
        assert_equals_BOOL("isViewLoaded (asked again)", NO, [controller isViewLoaded]);
        assert_equals_int32_t("loadViewCount", 0, controller.loadViewCount);

        // Accessing the view loads it.
        [controller view];
        assert_equals_int32_t("loadViewCount", 1, controller.loadViewCount);
        assert_equals_BOOL("isViewLoaded (after view)", YES, [controller isViewLoaded]);

        // Setting a view counts as loaded.
        NSViewController *plain = [[[NSViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        assert_equals_BOOL("isViewLoaded (plain)", NO, [plain isViewLoaded]);
        [plain setView:[[[NSView alloc] initWithFrame:NSZeroRect] autorelease]];
        assert_equals_BOOL("isViewLoaded (after setView:)", YES, [plain isViewLoaded]);
    }
}
