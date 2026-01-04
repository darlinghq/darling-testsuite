#include <Carbon/Carbon.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <HIToolbox/TextInputSources.h>
    assert_equals_CFStringRef(CFSTR("com.apple.Carbon.TISNotifySelectedKeyboardInputSourceChanged"), kTISNotifySelectedKeyboardInputSourceChanged);
}
