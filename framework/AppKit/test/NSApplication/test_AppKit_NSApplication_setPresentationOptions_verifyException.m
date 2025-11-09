#include <AppKit/AppKit.h>

#include <stdio.h>

#include <darling-testsuite/assertion.h>

NSException* assert_exception_is_thrown(NSApplication* obj, NSApplicationPresentationOptions options);

int main() {
    NSApplication* app = NSApplication.sharedApplication;
    NSException* exception;

    // NSApplicationPresentationAutoHideDock and NSApplicationPresentationHideDock
    // are mutually exclusive: You may specify one or the other, but not both.

    exception = assert_exception_is_thrown(app, NSApplicationPresentationAutoHideDock | NSApplicationPresentationHideDock);
    printf("NSApplicationPresentationAutoHideDock | NSApplicationPresentationHideDock: %s\n", [exception.reason UTF8String]);
    assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    //
    // NSApplicationPresentationAutoHideMenuBar and NSApplicationPresentationHideMenuBar
    // are mutually exclusive: You may specify one or the other, but not both.
    //

    exception = assert_exception_is_thrown(app, NSApplicationPresentationAutoHideMenuBar | NSApplicationPresentationHideMenuBar | (NSApplicationPresentationHideDock));
    printf("NSApplicationPresentationAutoHideMenuBar | NSApplicationPresentationHideMenuBar: %s\n", [exception.reason UTF8String]);
    assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    //
    // If you specify NSApplicationPresentationHideMenuBar, it must be accompanied by 
    // NSApplicationPresentationHideDock.
    //

    exception = assert_exception_is_thrown(app, NSApplicationPresentationHideMenuBar /* & ~NSApplicationPresentationHideDock */);
    printf("NSApplicationPresentationHideMenuBar & ~NSApplicationPresentationHideDock: %s\n", [exception.reason UTF8String]);
    assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    // //
    // // If you specify NSApplicationPresentationAutoHideMenuBar, it must be accompanied
    // // by either NSApplicationPresentationHideDock or NSApplicationPresentationAutoHideDock.
    // //

    // exception = assert_exception_is_thrown(app, NSApplicationPresentationAutoHideMenuBar /* & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock) */);
    // printf("NSApplicationPresentationAutoHideMenuBar & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock): %s\n", [exception.reason UTF8String]);
    // assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    //
    // If you specify any of NSApplicationPresentationDisableProcessSwitching, NSApplicationPresentationDisableForceQuit,
    // NSApplicationPresentationDisableSessionTermination, or NSApplicationPresentationDisableMenuBarTransparency, it must
    // be accompanied by either NSApplicationPresentationHideDock or NSApplicationPresentationAutoHideDock.
    //

    exception = assert_exception_is_thrown(app, NSApplicationPresentationDisableProcessSwitching /* & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock) */);
    printf("NSApplicationPresentationDisableProcessSwitching & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock): %s\n", [exception.reason UTF8String]);
    assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    exception = assert_exception_is_thrown(app, NSApplicationPresentationDisableForceQuit /* & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock) */);
    printf("NSApplicationPresentationDisableForceQuit & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock): %s\n", [exception.reason UTF8String]);
    assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    exception = assert_exception_is_thrown(app, NSApplicationPresentationDisableSessionTermination /* ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock) */);
    printf("NSApplicationPresentationDisableSessionTermination & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock): %s\n", [exception.reason UTF8String]);
    assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    exception = assert_exception_is_thrown(app, NSApplicationPresentationDisableMenuBarTransparency /* & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock) */);
    printf("NSApplicationPresentationDisableMenuBarTransparency & ~(NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideDock): %s\n", [exception.reason UTF8String]);
    assert_equals_nsstring(NSInvalidArgumentException, exception.name);

    // //
    // // NSApplicationPresentationAutoHideToolbar may be used only when both NSApplicationPresentationFullScreen
    // // and NSApplicationPresentationAutoHideMenuBar are also set.
    // //

    // exception = assert_exception_is_thrown(app, NSApplicationPresentationAutoHideToolbar /* & ~(NSApplicationPresentationFullScreen | NSApplicationPresentationAutoHideMenuBar) */);
    // printf("NSApplicationPresentationAutoHideToolbar & ~(NSApplicationPresentationFullScreen | NSApplicationPresentationAutoHideMenuBar): %s\n", [exception.reason UTF8String]);
    // assert_equals_nsstring(NSInvalidArgumentException, exception.name);
}

NSException* assert_exception_is_thrown(NSApplication* obj, NSApplicationPresentationOptions options) {
    NSException* result = nil;
    @try {
        [obj setPresentationOptions:options];
    }

    @catch (NSException* exception) {
        result = exception;
    }

    assert(result != nil);
    return result;
}
