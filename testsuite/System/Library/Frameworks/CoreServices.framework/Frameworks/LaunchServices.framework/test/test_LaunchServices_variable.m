#include <CoreServices/CoreServices.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <LaunchServices/LSInfoDeprecated.h>
    assert_equals_cfstringref(CFSTR("LSItemContentType"), kLSItemContentType);

    // #include <LaunchServices/LSQuarantine.h>
    assert_equals_cfstringref(CFSTR("LSQuarantineAgentBundleIdentifier"), kLSQuarantineAgentBundleIdentifierKey);
    assert_equals_cfstringref(CFSTR("LSQuarantineAgentName"), kLSQuarantineAgentNameKey);
    assert_equals_cfstringref(CFSTR("LSQuarantineDataURL"), kLSQuarantineDataURLKey);
    assert_equals_cfstringref(CFSTR("LSQuarantineOriginURL"), kLSQuarantineOriginURLKey);
    assert_equals_cfstringref(CFSTR("LSQuarantineTimeStamp"), kLSQuarantineTimeStampKey);
    assert_equals_cfstringref(CFSTR("LSQuarantineType"), kLSQuarantineTypeKey);
    assert_equals_cfstringref(CFSTR("LSQuarantineTypeOtherDownload"), kLSQuarantineTypeOtherDownload);
    assert_equals_cfstringref(CFSTR("LSQuarantineTypeWebDownload"), kLSQuarantineTypeWebDownload);
}
