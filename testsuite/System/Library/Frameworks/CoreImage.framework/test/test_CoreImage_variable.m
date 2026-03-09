// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreImage/CoreImage.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <CoreImage/CIFilter.h>
    assert_equals_NSString(@"inputRadius", kCIInputRadiusKey);
}
