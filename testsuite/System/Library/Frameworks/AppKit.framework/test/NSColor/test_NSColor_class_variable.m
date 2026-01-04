#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

void verify_catalog_color_name(NSColor* label, NSString* expectedCatalogName, NSString* expectedColorName);

int main() {
    verify_catalog_color_name([NSColor labelColor], @"System", @"labelColor");

    verify_catalog_color_name([NSColor unemphasizedSelectedTextColor], @"System", @"unemphasizedSelectedTextColor");

    verify_catalog_color_name([NSColor unemphasizedSelectedTextBackgroundColor], @"System", @"unemphasizedSelectedTextBackgroundColor");

    verify_catalog_color_name([NSColor linkColor], @"System", @"linkColor");
}

void verify_catalog_color_name(NSColor* color, NSString* expectedCatalogName, NSString* expectedColorName) {
    assert_equals_NSString(expectedCatalogName, color.catalogNameComponent);
    assert_equals_NSString(expectedColorName, color.colorNameComponent);
}
