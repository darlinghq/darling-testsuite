#include <CoreMedia/CoreMedia.h>

#include <darling-testsuite/assertion.h>

void test_CoreMedia_CMTime_h(void);

int main() {
    // #include <CoreMedia/CMSampleBuffer.h>
    assert_equals_cfstringref(CFSTR("DisplayImmediately"), kCMSampleAttachmentKey_DisplayImmediately);

    // #include <CoreMedia/CMTime.h>
    test_CoreMedia_CMTime_h();
}

void test_CoreMedia_CMTime_h(void) {
    // kCMTimeInvalid
    assert_equals_int64("kCMTimeInvalid.value", 0, kCMTimeInvalid.value);
    assert_equals_int32("kCMTimeInvalid.timescale", 0, kCMTimeInvalid.timescale);
    assert_equals_uint32("kCMTimeInvalid.flags", 0, kCMTimeInvalid.flags);
    assert_equals_int64("kCMTimeInvalid.epoch", 0, kCMTimeInvalid.epoch);

    // kCMTimeIndefinite
    assert_equals_int64("kCMTimeIndefinite.value", 0, kCMTimeIndefinite.value);
    assert_equals_int32("kCMTimeIndefinite.timescale", 0, kCMTimeIndefinite.timescale);
    assert_equals_uint32("kCMTimeIndefinite.flags", 17 /* kCMTimeFlags_Valid | kCMTimeFlags_Indefinite */, kCMTimeIndefinite.flags);
    assert_equals_int64("kCMTimeIndefinite.epoch", 0, kCMTimeIndefinite.epoch);

    // kCMTimePositiveInfinity
    assert_equals_int64("kCMTimePositiveInfinity.value", 0, kCMTimePositiveInfinity.value);
    assert_equals_int32("kCMTimePositiveInfinity.timescale", 0, kCMTimePositiveInfinity.timescale);
    assert_equals_uint32("kCMTimePositiveInfinity.flags", 5 /* kCMTimeFlags_Valid | kCMTimeFlags_PositiveInfinity */, kCMTimePositiveInfinity.flags);
    assert_equals_int64("kCMTimePositiveInfinity.epoch", 0, kCMTimePositiveInfinity.epoch);

    // kCMTimeNegativeInfinity
    assert_equals_int64("kCMTimeNegativeInfinity.value", 0, kCMTimeNegativeInfinity.value);
    assert_equals_int32("kCMTimeNegativeInfinity.timescale", 0, kCMTimeNegativeInfinity.timescale);
    assert_equals_uint32("kCMTimeNegativeInfinity.flags", 9 /* kCMTimeFlags_Valid | kCMTimeFlags_NegativeInfinity */, kCMTimeNegativeInfinity.flags);
    assert_equals_int64("kCMTimeNegativeInfinity.epoch", 0, kCMTimeNegativeInfinity.epoch);

    // kCMTimeZero
    assert_equals_int64("kCMTimeZero.value", 0, kCMTimeZero.value);
    assert_equals_int32("kCMTimeZero.timescale", 1, kCMTimeZero.timescale);
    assert_equals_uint32("kCMTimeZero.flags", 1 /* kCMTimeFlags_Valid */, kCMTimeZero.flags);
    assert_equals_int64("kCMTimeZero.epoch", 0, kCMTimeZero.epoch);
}
