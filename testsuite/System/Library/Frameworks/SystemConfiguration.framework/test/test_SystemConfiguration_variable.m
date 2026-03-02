// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <SystemConfiguration/SystemConfiguration.h>

#include <darling-testsuite/assertion.h>

int main() {
    // include <SystemConfiguration/SCSchemaDefinitions.h>
    assert_equals_CFStringRef(CFSTR("Interface"), kSCEntNetInterface);
}
