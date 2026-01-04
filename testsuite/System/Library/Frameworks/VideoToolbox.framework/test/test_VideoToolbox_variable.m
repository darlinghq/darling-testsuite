#include <VideoToolbox/VideoToolbox.h>

#include <darling-testsuite/assertion.h>

int main() {
    assert_equals_cfstringref(CFSTR("MaxKeyFrameIntervalDuration"), kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration);
    assert_equals_cfstringref(CFSTR("DataRateLimits"), kVTCompressionPropertyKey_DataRateLimits);
    assert_equals_cfstringref(CFSTR("H264_High_AutoLevel"), kVTProfileLevel_H264_High_AutoLevel);
    assert_equals_cfstringref(CFSTR("MaxFrameDelayCount"), kVTCompressionPropertyKey_MaxFrameDelayCount);
    assert_equals_cfstringref(CFSTR("ExpectedFrameRate"), kVTCompressionPropertyKey_ExpectedFrameRate);
    assert_equals_cfstringref(CFSTR("RequireHardwareAcceleratedVideoEncoder"), kVTVideoEncoderSpecification_RequireHardwareAcceleratedVideoEncoder);
}
