// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreServices/CoreServices.h>

#include <darling-testsuite/assertion.h>

void test_SearchKit_SKSearch_h();

int main() {
    // #include <SearchKit/SKAnalysis.h>
    assert_equals_CFStringRef(CFSTR("kSKMinTermLength"), kSKMinTermLength);
    assert_equals_CFStringRef(CFSTR("kSKMaximumTerms"), kSKMaximumTerms);
    assert_equals_CFStringRef(CFSTR("kSKProximityIndexing"), kSKProximityIndexing);
    assert_equals_CFStringRef(CFSTR("kSKStopWords"), kSKStopWords);
    assert_equals_CFStringRef(CFSTR("kSKTermChars"), kSKTermChars);
    assert_equals_CFStringRef(CFSTR("kSKStartTermChars"), kSKStartTermChars);
    assert_equals_CFStringRef(CFSTR("kSKEndTermChars"), kSKEndTermChars);

    // #include <SearchKit/SKIndex.h>
    assert_equals_uint32_t("kSKIndexUnknown", 0, kSKIndexUnknown);
    assert_equals_uint32_t("kSKIndexInverted", 1, kSKIndexInverted);
    assert_equals_uint32_t("kSKIndexVector", 2, kSKIndexVector);
    assert_equals_uint32_t("kSKIndexInvertedVector", 3, kSKIndexInvertedVector);

    // #include <SearchKit/SKSearch.h>
    test_SearchKit_SKSearch_h();
}

void test_SearchKit_SKSearch_h() {
    /* SKSearchType */
    assert_equals_uint32_t("kSKSearchRanked", 0, kSKSearchRanked);
    assert_equals_uint32_t("kSKSearchBooleanRanked", 1, kSKSearchBooleanRanked);
    assert_equals_uint32_t("kSKSearchRequiredRanked", 2, kSKSearchRequiredRanked);
    assert_equals_uint32_t("kSKSearchPrefixRanked", 3, kSKSearchPrefixRanked);

    /* SKSearchOptions */
    assert_equals_uint32_t("kSKSearchOptionDefault", 0, kSKSearchOptionDefault);
    assert_equals_uint32_t("kSKSearchOptionNoRelevanceScores", 1L << 0, kSKSearchOptionNoRelevanceScores);
    assert_equals_uint32_t("kSKSearchOptionSpaceMeansOR", 1L << 1, kSKSearchOptionSpaceMeansOR);
    assert_equals_uint32_t("kSKSearchOptionFindSimilar", 1L << 2, kSKSearchOptionFindSimilar);
}
