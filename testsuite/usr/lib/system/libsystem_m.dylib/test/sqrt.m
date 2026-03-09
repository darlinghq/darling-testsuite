// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <math.h>

#include <darling-testsuite/assertion.h>

int main() {
    assert_equals_double(NULL, 2.5, sqrt(6.25));
    assert_equals_float(NULL, 2.5, sqrtf(6.25));
}
