#include <CoreImage/CoreImage.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <CoreImage/CIFilter.h>
    assert_equals_nsstring(@"inputRadius", kCIInputRadiusKey);
}
