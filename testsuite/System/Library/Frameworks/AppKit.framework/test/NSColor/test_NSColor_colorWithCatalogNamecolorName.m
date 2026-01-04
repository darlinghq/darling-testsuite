#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>


int main() {
    NSColor* actualCatalog = [NSColor colorWithCatalogName:@"System"
                                                 colorName:@"textBackgroundColor"];
    NSColor* expectedCatalog = [NSColor textBackgroundColor];

    assert_equals_NSString(expectedCatalog.catalogNameComponent, actualCatalog.catalogNameComponent);                        
    assert_equals_NSString(expectedCatalog.colorNameComponent, actualCatalog.colorNameComponent);
}
