#include <WebKit/WebKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <WebKit/WebKitErrors.h>
    assert_equals_NSString(@"WebKitErrorDomain", WebKitErrorDomain);

    // #include <WebKit/WebView.h>
    assert_equals_NSString(@"WebElementLinkLabel", WebElementLinkLabelKey);
    assert_equals_NSString(@"WebElementLinkURL", WebElementLinkURLKey);
    assert_equals_NSString(@"WebViewDidChangeSelectionNotification", WebViewDidChangeSelectionNotification);
}
