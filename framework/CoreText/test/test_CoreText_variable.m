#include <CoreText/CoreText.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <CoreText/CTFontManager.h>
    assert_equals_cfstringref(CFSTR("CTFontManagerFontChangedNotification"), kCTFontManagerRegisteredFontsChangedNotification);
}
