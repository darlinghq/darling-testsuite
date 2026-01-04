#include <CoreServices/CoreServices.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <LaunchServices/LSInfoDeprecated.h>
    assert_equals_CFStringRef(CFSTR("LSItemContentType"), kLSItemContentType);

    // #include <LaunchServices/LSQuarantine.h>
    assert_equals_CFStringRef(CFSTR("LSQuarantineAgentBundleIdentifier"), kLSQuarantineAgentBundleIdentifierKey);
    assert_equals_CFStringRef(CFSTR("LSQuarantineAgentName"), kLSQuarantineAgentNameKey);
    assert_equals_CFStringRef(CFSTR("LSQuarantineDataURL"), kLSQuarantineDataURLKey);
    assert_equals_CFStringRef(CFSTR("LSQuarantineOriginURL"), kLSQuarantineOriginURLKey);
    assert_equals_CFStringRef(CFSTR("LSQuarantineTimeStamp"), kLSQuarantineTimeStampKey);
    assert_equals_CFStringRef(CFSTR("LSQuarantineType"), kLSQuarantineTypeKey);
    assert_equals_CFStringRef(CFSTR("LSQuarantineTypeOtherDownload"), kLSQuarantineTypeOtherDownload);
    assert_equals_CFStringRef(CFSTR("LSQuarantineTypeWebDownload"), kLSQuarantineTypeWebDownload);
}
