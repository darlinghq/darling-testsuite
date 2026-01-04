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
