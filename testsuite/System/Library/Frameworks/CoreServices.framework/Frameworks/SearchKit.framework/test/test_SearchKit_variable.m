// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreServices/CoreServices.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <SearchKit/SKAnalysis.h>
    assert_equals_CFStringRef(CFSTR("kSKMinTermLength"), kSKMinTermLength);
    assert_equals_CFStringRef(CFSTR("kSKMaximumTerms"), kSKMaximumTerms);
    assert_equals_CFStringRef(CFSTR("kSKProximityIndexing"), kSKProximityIndexing);
}
