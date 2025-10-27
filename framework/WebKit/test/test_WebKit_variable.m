#include <WebKit/WebKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <WebKit/WebKitErrors.h>
    assert_equals_nsstring(@"WebKitErrorDomain", WebKitErrorDomain);

    // #include <WebKit/WebView.h>
    assert_equals_nsstring(@"WebElementLinkLabel", WebElementLinkLabelKey);
    assert_equals_nsstring(@"WebElementLinkURL", WebElementLinkURLKey);
    assert_equals_nsstring(@"WebViewDidChangeSelectionNotification", WebViewDidChangeSelectionNotification);
}
