// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <InstantMessage/IMService.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <InstantMessage/IMService.h>
    assert_equals_NSString(@"__kIMPersonStatusChangedNotification", IMPersonStatusChangedNotification);
    assert_equals_NSString(@"__kIMPersonScreenNameKey", IMPersonScreenNameKey);
}
