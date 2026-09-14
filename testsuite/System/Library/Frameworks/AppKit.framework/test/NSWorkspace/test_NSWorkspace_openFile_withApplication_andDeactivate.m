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

        // With no file and no application there is nothing to open or launch,
        // so the call is expected to fail.
        BOOL noFileAndNoAppResult = [workspace openFile:NULL withApplication:NULL andDeactivate:NO];
        assert_is_false(noFileAndNoAppResult);

        // A plain command line tool is not an application, so opening a file
        // with it is expected to fail.
        BOOL cliResult = [workspace openFile:dummyFile withApplication:@"/bin/echo" andDeactivate:NO];
        assert_is_false(cliResult);

        // Clean up
        [fm removeItemAtPath:dummyFile error:NULL];
    }
    return 0;
}
