#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

void verify_variables_in_NSApplication_h(void);
void verify_variables_in_NSKeyValueBinding_h(void);

int main() {
    // #include <AppKit/NSAccessibilityConstants.h>
    assert_equals_nsstring(@"AXShowAlternateUI", NSAccessibilityShowAlternateUIAction);
    assert_equals_nsstring(@"AXShowDefaultUI", NSAccessibilityShowDefaultUIAction);

    // #include <AppKit/NSApplication.h>
    verify_variables_in_NSApplication_h();

    // #include <AppKit/NSColor.h>
    assert_equals_nsstring(@"NSSystemColorsDidChangeNotification" , NSSystemColorsDidChangeNotification);

    // #include <AppKit/NSDraggingItem.h>
    assert_equals_nsstring(@"icon", NSDraggingImageComponentIconKey);
    assert_equals_nsstring(@"label", NSDraggingImageComponentLabelKey);

    // #include <AppKit/NSGraphics.h>
    assert_equals_nsstring(@"NSCustomColorSpace", NSCustomColorSpace);

    // #include <AppKit/NSKeyValueBinding.h>
    verify_variables_in_NSKeyValueBinding_h();

    // #include <AppKit/NSMenu.h>
    assert_equals_nsstring(@"NSMenuDidSendActionNotification", NSMenuDidSendActionNotification);
    assert_equals_nsstring(@"NSMenuWillSendActionNotification", NSMenuWillSendActionNotification);

    // #include <AppKit/NSPasteboard.h>
    assert_equals_nsstring(@"Apple InkText pasteboard type", NSInkTextPboardType);
    assert_equals_nsstring(@"NSMenuWillSendActionNotification", NSMenuWillSendActionNotification);
    assert_equals_nsstring(@"Apple multiple text selection pasteboard type", NSMultipleTextSelectionPboardType);
    assert_equals_nsstring(@"com.apple.cocoa.pasteboard.multiple-text-selection", NSPasteboardTypeMultipleTextSelection);
    assert_equals_nsstring(@"public.url", NSPasteboardTypeURL);

    // #include <AppKit/NSPrintInfo.h>
    assert_equals_nsstring(@"NSScalingFactor", NSPrintScalingFactor);
    assert_equals_nsstring(@"selectedValue", NSSelectedValueBinding);

    // #include <AppKit/NSWorkspace.h>
    assert_equals_nsstring(@"NSWorkspaceDidDeactivateApplicationNotification", NSWorkspaceDidDeactivateApplicationNotification);
    assert_equals_nsstring(@"NSWorkspaceSessionDidBecomeActiveNotification", NSWorkspaceSessionDidBecomeActiveNotification);
    assert_equals_nsstring(@"NSWorkspaceDidActivateApplicationNotification", NSWorkspaceDidActivateApplicationNotification);
}


void verify_variables_in_NSApplication_h(void) {
    // NSApplicationPresentationOptions
    assert_equals_nsuinteger("NSApplicationPresentationDefault",                         0,       NSApplicationPresentationDefault);
    assert_equals_nsuinteger("NSApplicationPresentationAutoHideDock",                    1 << 0,  NSApplicationPresentationAutoHideDock);
    assert_equals_nsuinteger("NSApplicationPresentationHideDock",                        1 << 1,  NSApplicationPresentationHideDock);
    assert_equals_nsuinteger("NSApplicationPresentationAutoHideMenuBar",                 1 << 2,  NSApplicationPresentationAutoHideMenuBar);
    assert_equals_nsuinteger("NSApplicationPresentationHideMenuBar",                     1 << 3,  NSApplicationPresentationHideMenuBar);
    assert_equals_nsuinteger("NSApplicationPresentationDisableAppleMenu",                1 << 4,  NSApplicationPresentationDisableAppleMenu);
    assert_equals_nsuinteger("NSApplicationPresentationDisableProcessSwitching",         1 << 5,  NSApplicationPresentationDisableProcessSwitching);
    assert_equals_nsuinteger("NSApplicationPresentationDisableForceQuit",                1 << 6,  NSApplicationPresentationDisableForceQuit);
    assert_equals_nsuinteger("NSApplicationPresentationDisableSessionTermination",       1 << 7,  NSApplicationPresentationDisableSessionTermination);
    assert_equals_nsuinteger("NSApplicationPresentationDisableHideApplication",          1 << 8,  NSApplicationPresentationDisableHideApplication);
    assert_equals_nsuinteger("NSApplicationPresentationDisableMenuBarTransparency",      1 << 9,  NSApplicationPresentationDisableMenuBarTransparency);
    assert_equals_nsuinteger("NSApplicationPresentationFullScreen",                      1 << 10, NSApplicationPresentationFullScreen);
    assert_equals_nsuinteger("NSApplicationPresentationAutoHideToolbar",                 1 << 11, NSApplicationPresentationAutoHideToolbar);
    assert_equals_nsuinteger("NSApplicationPresentationDisableCursorLocationAssistance", 1 << 12, NSApplicationPresentationDisableCursorLocationAssistance);
}


void verify_variables_in_NSKeyValueBinding_h(void) {
    // NSBindingInfoKey
    assert_equals_nsstring(@"NSObservedKeyPath", NSObservedKeyPathKey);
    assert_equals_nsstring(@"NSObservedObject", NSObservedObjectKey);
    assert_equals_nsstring(@"NSOptions", NSOptionsKey);
    
    // NSBindingName
    assert_equals_nsstring(@"animate", NSAnimateBinding);
    assert_equals_nsstring(@"contentArray", NSContentArrayBinding);
    assert_equals_nsstring(@"content", NSContentBinding);
    assert_equals_nsstring(@"contentObject", NSContentObjectBinding);
    assert_equals_nsstring(@"contentObjects", NSContentObjectsBinding);
    assert_equals_nsstring(@"contentSet", NSContentSetBinding);
    assert_equals_nsstring(@"contentValues", NSContentValuesBinding);
    assert_equals_nsstring(@"doubleClickTarget", NSDoubleClickTargetBinding);
    assert_equals_nsstring(@"enabled", NSEnabledBinding);
    assert_equals_nsstring(@"fontBold", NSFontBoldBinding);
    assert_equals_nsstring(@"fontItalic", NSFontItalicBinding);
    assert_equals_nsstring(@"hidden", NSHiddenBinding);
    assert_equals_nsstring(@"image", NSImageBinding);
    assert_equals_nsstring(@"selectedIndex", NSSelectedIndexBinding);
    assert_equals_nsstring(@"selectedObject", NSSelectedObjectBinding);
    assert_equals_nsstring(@"selectedObjects", NSSelectedObjectsBinding);
    assert_equals_nsstring(@"selectedTag", NSSelectedTagBinding);
    assert_equals_nsstring(@"selectedValue", NSSelectedValueBinding);
    assert_equals_nsstring(@"selectionIndexes", NSSelectionIndexesBinding);
    assert_equals_nsstring(@"title", NSTitleBinding);
    assert_equals_nsstring(@"value", NSValueBinding);
    assert_equals_nsstring(@"visible", NSVisibleBinding);
    assert_equals_nsstring(@"toolTip", NSToolTipBinding);
    assert_equals_nsstring(@"editable", NSEditableBinding);

    // NSBindingOption
    assert_equals_nsstring(@"NSInsertsNullPlaceholder", NSInsertsNullPlaceholderBindingOption);
    assert_equals_nsstring(@"NSValidatesImmediately", NSValidatesImmediatelyBindingOption);
    assert_equals_nsstring(@"NSNotApplicablePlaceholder", NSNotApplicablePlaceholderBindingOption);
    assert_equals_nsstring(@"NSNullPlaceholder", NSNullPlaceholderBindingOption);
    assert_equals_nsstring(@"NSNoSelectionPlaceholder", NSNoSelectionPlaceholderBindingOption);
    assert_equals_nsstring(@"NSPredicateFormat", NSPredicateFormatBindingOption);
    assert_equals_nsstring(@"NSCreatesSortDescriptor", NSCreatesSortDescriptorBindingOption);
    assert_equals_nsstring(@"NSRaisesForNotApplicableKeys", NSRaisesForNotApplicableKeysBindingOption);
    assert_equals_nsstring(@"NSAllowsEditingMultipleValuesSelection", NSAllowsEditingMultipleValuesSelectionBindingOption);
    assert_equals_nsstring(@"NSValueTransformerName", NSValueTransformerNameBindingOption);
    assert_equals_nsstring(@"NSValueTransformer", NSValueTransformerBindingOption);
    assert_equals_nsstring(@"NSConditionallySetsEnabled", NSConditionallySetsEnabledBindingOption);
    assert_equals_nsstring(@"NSConditionallySetsEditable", NSConditionallySetsEditableBindingOption);
    assert_equals_nsstring(@"NSContinuouslyUpdatesValue", NSContinuouslyUpdatesValueBindingOption);
    assert_equals_nsstring(@"NSDisplayPattern", NSDisplayPatternBindingOption);
}
