// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <Foundation/NSConnection.h>
    assert_equals_NSString(@"NSFailedAuthenticationException", NSFailedAuthenticationException);

    // #include <Foundation/NSTimeZone.h>
    assert_equals_NSString(@"kCFTimeZoneSystemTimeZoneDidChangeNotification", NSSystemTimeZoneDidChangeNotification);

    // #include <Foundation/NSURL.h>
    assert_equals_NSString(@"NSURLUbiquitousItemDownloadingStatusNotDownloaded", NSURLUbiquitousItemDownloadingStatusNotDownloaded);
}
