// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreText/CoreText.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <CoreText/CTFontManager.h>
    assert_equals_CFStringRef(CFSTR("CTFontManagerFontChangedNotification"), kCTFontManagerRegisteredFontsChangedNotification);
}
