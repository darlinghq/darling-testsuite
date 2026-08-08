// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-testsuite/assertion.h>

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

// Builds a minimal, launchable .app bundle wrapping a no-op command line
// executable and returns its path (or nil on failure). LaunchServices needs a
// real application bundle to launch, so this is what lets openFile:... succeed.
static NSString *createTestAppBundle(void) {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *appPath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"NSWorkspaceOpenFileTest.app"];

    // Start from a clean slate in case a previous run left a bundle behind.
    [fm removeItemAtPath:appPath error:NULL];

    NSString *macOSDir = [appPath stringByAppendingPathComponent:@"Contents/MacOS"];
    if (![fm createDirectoryAtPath:macOSDir withIntermediateDirectories:YES attributes:nil error:NULL]) {
        return nil;
    }

    // A tiny executable that exits immediately is enough for the launch to be
    // considered successful.
    NSString *executablePath = [macOSDir stringByAppendingPathComponent:@"NSWorkspaceOpenFileTest"];
    NSString *script = @"#!/bin/sh\nexit 0\n";
    if (![script writeToFile:executablePath atomically:YES encoding:NSUTF8StringEncoding error:NULL]) {
        return nil;
    }
    if (![fm setAttributes:@{ NSFilePosixPermissions: @(0755) } ofItemAtPath:executablePath error:NULL]) {
        return nil;
    }

    NSDictionary *infoPlist = @{
        @"CFBundleExecutable": @"NSWorkspaceOpenFileTest",
        @"CFBundleIdentifier": @"org.darlinghq.testsuite.NSWorkspaceOpenFileTest",
        @"CFBundleName": @"NSWorkspaceOpenFileTest",
        @"CFBundlePackageType": @"APPL",
        @"CFBundleInfoDictionaryVersion": @"6.0",
        @"CFBundleVersion": @"1",
    };
    NSString *infoPath = [appPath stringByAppendingPathComponent:@"Contents/Info.plist"];
    if (![infoPlist writeToFile:infoPath atomically:YES]) {
        return nil;
    }

    return appPath;
}

int main(void) {
    NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
    assert_is_true(workspace != nil);

    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *dummyFile = [NSTemporaryDirectory() stringByAppendingPathComponent:@"nsworkspace_openfile_test.txt"];
    [fm createFileAtPath:dummyFile contents:[NSData data] attributes:nil];

    // A plain command line tool is not an application, so opening a file with it
    // is expected to fail.
    BOOL cliResult = [workspace openFile:dummyFile withApplication:@"/bin/echo" andDeactivate:NO];
    assert_is_false(cliResult);

    // Wrapping an executable in a .app bundle gives LaunchServices something it
    // can launch, so the same call is expected to succeed.
    NSString *appPath = createTestAppBundle();
    assert_is_true(appPath != nil);

    BOOL appResult = [workspace openFile:dummyFile withApplication:appPath andDeactivate:NO];
    assert_is_true(appResult);

    // Clean up
    [fm removeItemAtPath:dummyFile error:NULL];
    [fm removeItemAtPath:appPath error:NULL];

    return 0;
}
