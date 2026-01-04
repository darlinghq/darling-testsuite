#include <CoreMedia/CoreMedia.h>

#include <darling-testsuite/assertion.h>

void test_CoreMedia_CMTime_h(void);

int main() {
    // #include <CoreMedia/CMSampleBuffer.h>
    assert_equals_CFStringRef(CFSTR("DisplayImmediately"), kCMSampleAttachmentKey_DisplayImmediately);

    // #include <CoreMedia/CMTime.h>
    test_CoreMedia_CMTime_h();
}

void test_CoreMedia_CMTime_h(void) {
    // kCMTimeInvalid
    assert_equals_int64_t("kCMTimeInvalid.value", 0, kCMTimeInvalid.value);
    assert_equals_int32_t("kCMTimeInvalid.timescale", 0, kCMTimeInvalid.timescale);
    assert_equals_uint32_t("kCMTimeInvalid.flags", 0, kCMTimeInvalid.flags);
    assert_equals_int64_t("kCMTimeInvalid.epoch", 0, kCMTimeInvalid.epoch);

    // kCMTimeIndefinite
    assert_equals_int64_t("kCMTimeIndefinite.value", 0, kCMTimeIndefinite.value);
    assert_equals_int32_t("kCMTimeIndefinite.timescale", 0, kCMTimeIndefinite.timescale);
    assert_equals_uint32_t("kCMTimeIndefinite.flags", 17 /* kCMTimeFlags_Valid | kCMTimeFlags_Indefinite */, kCMTimeIndefinite.flags);
    assert_equals_int64_t("kCMTimeIndefinite.epoch", 0, kCMTimeIndefinite.epoch);

    // kCMTimePositiveInfinity
    assert_equals_int64_t("kCMTimePositiveInfinity.value", 0, kCMTimePositiveInfinity.value);
    assert_equals_int32_t("kCMTimePositiveInfinity.timescale", 0, kCMTimePositiveInfinity.timescale);
    assert_equals_uint32_t("kCMTimePositiveInfinity.flags", 5 /* kCMTimeFlags_Valid | kCMTimeFlags_PositiveInfinity */, kCMTimePositiveInfinity.flags);
    assert_equals_int64_t("kCMTimePositiveInfinity.epoch", 0, kCMTimePositiveInfinity.epoch);

    // kCMTimeNegativeInfinity
    assert_equals_int64_t("kCMTimeNegativeInfinity.value", 0, kCMTimeNegativeInfinity.value);
    assert_equals_int32_t("kCMTimeNegativeInfinity.timescale", 0, kCMTimeNegativeInfinity.timescale);
    assert_equals_uint32_t("kCMTimeNegativeInfinity.flags", 9 /* kCMTimeFlags_Valid | kCMTimeFlags_NegativeInfinity */, kCMTimeNegativeInfinity.flags);
    assert_equals_int64_t("kCMTimeNegativeInfinity.epoch", 0, kCMTimeNegativeInfinity.epoch);

    // kCMTimeZero
    assert_equals_int64_t("kCMTimeZero.value", 0, kCMTimeZero.value);
    assert_equals_int32_t("kCMTimeZero.timescale", 1, kCMTimeZero.timescale);
    assert_equals_uint32_t("kCMTimeZero.flags", 1 /* kCMTimeFlags_Valid */, kCMTimeZero.flags);
    assert_equals_int64_t("kCMTimeZero.epoch", 0, kCMTimeZero.epoch);
}
