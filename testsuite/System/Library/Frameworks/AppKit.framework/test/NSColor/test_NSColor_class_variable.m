// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

void verify_catalog_color_name(NSColor* label, NSString* expectedCatalogName, NSString* expectedColorName);

int main() {
    verify_catalog_color_name([NSColor labelColor], @"System", @"labelColor");

    // IDK why Apple didn't include these methods in their 10.14 SDK header...
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"
    verify_catalog_color_name([NSColor unemphasizedSelectedTextColor], @"System", @"unemphasizedSelectedTextColor");

    verify_catalog_color_name([NSColor unemphasizedSelectedTextBackgroundColor], @"System", @"unemphasizedSelectedTextBackgroundColor");

    verify_catalog_color_name([NSColor linkColor], @"System", @"linkColor");
#pragma clang diagnostic pop
}

void verify_catalog_color_name(NSColor* color, NSString* expectedCatalogName, NSString* expectedColorName) {
    assert_equals_NSString(expectedCatalogName, color.catalogNameComponent);
    assert_equals_NSString(expectedColorName, color.colorNameComponent);
}
