// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-testsuite/assertion.h>

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
        assert_is_true(workspace != nil);

        // With a nil path but a valid application, the application is simply
        // launched without a file, so the call is expected to succeed. Run
        // this test from the directory that contains
        // NSApplicationDelegate_application_openFile.app.
        NSLog(@"Testing NSWorkspace openFile:withApplication:andDeactivate: manually...");
        NSLog(@"The launched app should start without a file.");

        BOOL noFileArgumentTest = [workspace openFile:NULL withApplication:@"NSApplicationDelegate_application_openFile.app" andDeactivate:NO];
        assert_is_true(noFileArgumentTest);
    }
    return 0;
}
