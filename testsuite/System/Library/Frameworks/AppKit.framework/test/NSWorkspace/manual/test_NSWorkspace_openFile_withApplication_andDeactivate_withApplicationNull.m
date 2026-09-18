// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-testsuite/assertion.h>

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
        assert_is_true(workspace != nil);

        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *dummyFile = [NSTemporaryDirectory() stringByAppendingPathComponent:@"nsworkspace_openfile_test.txt"];
        [fm createFileAtPath:dummyFile contents:[NSData data] attributes:nil];

        // With no application given, the file is opened with the default
        // application for its type, so the call is expected to succeed.
        NSLog(@"Testing NSWorkspace openFile:withApplication:andDeactivate: manually...");
        NSLog(@"The default application for a .txt file should open %@.", dummyFile);

        BOOL noAppArgumentTest = [workspace openFile:dummyFile withApplication:NULL andDeactivate:NO];
        assert_is_true(noAppArgumentTest);

        // Clean up
        [fm removeItemAtPath:dummyFile error:NULL];
    }
    return 0;
}
