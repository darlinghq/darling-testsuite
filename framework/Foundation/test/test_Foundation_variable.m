#include <Foundation/Foundation.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <Foundation/NSConnection.h>
    assert_equals_nsstring(@"NSFailedAuthenticationException", NSFailedAuthenticationException);

    // #include <Foundation/NSURL.h>
    assert_equals_nsstring(@"NSURLUbiquitousItemDownloadingStatusNotDownloaded", NSURLUbiquitousItemDownloadingStatusNotDownloaded);
}
