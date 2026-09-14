// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-testsuite/assertion.h>

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
        assert_is_true(workspace != nil);

        // With no URL to open, the call is expected to fail. This case does
        // not launch anything, so it can run unattended.
        BOOL nilURLResult = [workspace openURL:NULL];
        assert_is_false(nilURLResult);
    }
    return 0;
}
