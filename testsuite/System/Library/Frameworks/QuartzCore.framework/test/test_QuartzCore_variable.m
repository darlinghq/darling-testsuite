// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <QuartzCore/QuartzCore.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <QuartzCore/CAEmitterLayer.h>
    assert_equals_NSString(@"point", kCAEmitterLayerPoint);
    assert_equals_NSString(@"additive", kCAEmitterLayerAdditive);
}
