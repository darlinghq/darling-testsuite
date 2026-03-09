// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    assert_equals_BOOL("NSColorList (Apple)",            NO, [[NSColorList colorListNamed:@"Apple"] isEditable]);
    assert_equals_BOOL("NSColorList (Crayons)",          NO, [[NSColorList colorListNamed:@"Crayons"] isEditable]);
    assert_equals_BOOL("NSColorList (System)",           NO, [[NSColorList colorListNamed:@"System"] isEditable]);
    assert_equals_BOOL("NSColorList (Web Safe Colors)",  NO, [[NSColorList colorListNamed:@"Web Safe Colors"] isEditable]);
}
