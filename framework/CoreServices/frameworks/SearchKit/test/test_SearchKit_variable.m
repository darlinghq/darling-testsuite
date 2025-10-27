#include <CoreServices/CoreServices.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <SearchKit/SKAnalysis.h>
    assert_equals_cfstringref(CFSTR("kSKMinTermLength"), kSKMinTermLength);
    assert_equals_cfstringref(CFSTR("kSKMaximumTerms"), kSKMaximumTerms);
    assert_equals_cfstringref(CFSTR("kSKProximityIndexing"), kSKProximityIndexing);
}
