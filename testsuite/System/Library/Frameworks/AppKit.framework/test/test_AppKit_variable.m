#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

void test_AppKit_NSApplication_h(void);
void test_AppKit_NSKeyValueBinding_h(void);
void test_AppKit_NSSpeechSynthesizer_h(void);

extern const NSString* NSTextInputReplacementRangeAttributeName;

int main() {
    // #include <AppKit/???>
    assert_equals_NSString(@"NSTextInputReplacementRangeAttributeName", NSTextInputReplacementRangeAttributeName);

    // #include <AppKit/NSAccessibilityConstants.h>
    assert_equals_NSString(@"AXShowAlternateUI", NSAccessibilityShowAlternateUIAction);
    assert_equals_NSString(@"AXShowDefaultUI", NSAccessibilityShowDefaultUIAction);
    assert_equals_NSString(@"AXMarkedMisspelled", NSAccessibilityMarkedMisspelledTextAttribute);
    assert_equals_NSString(@"AXLevelIndicator", NSAccessibilityLevelIndicatorRole);

    // #include <AppKit/NSApplication.h>
    test_AppKit_NSApplication_h();

    // #include <AppKit/NSAttributedString.h>
    assert_equals_NSString(@"NSMarkedClauseSegment", NSMarkedClauseSegmentAttributeName);

    // #include <AppKit/NSCell.h>
    assert_equals_NSString(@"NSControlTintDidChangeNotification", NSControlTintDidChangeNotification);

    // #include <AppKit/NSColor.h>
    assert_equals_NSString(@"NSSystemColorsDidChangeNotification" , NSSystemColorsDidChangeNotification);

    // #include <AppKit/NSDraggingItem.h>
    assert_equals_NSString(@"icon", NSDraggingImageComponentIconKey);
    assert_equals_NSString(@"label", NSDraggingImageComponentLabelKey);

    // #include <AppKit/NSGraphics.h>
    assert_equals_NSString(@"NSCustomColorSpace", NSCustomColorSpace);

    // #include <AppKit/NSKeyValueBinding.h>
    test_AppKit_NSKeyValueBinding_h();

    // #include <AppKit/NSMenu.h>
    assert_equals_NSString(@"NSMenuDidSendActionNotification", NSMenuDidSendActionNotification);
    assert_equals_NSString(@"NSMenuWillSendActionNotification", NSMenuWillSendActionNotification);

    // #include <AppKit/NSPasteboard.h>
    assert_equals_NSString(@"Apple InkText pasteboard type", NSInkTextPboardType);
    assert_equals_NSString(@"NSMenuWillSendActionNotification", NSMenuWillSendActionNotification);
    assert_equals_NSString(@"Apple multiple text selection pasteboard type", NSMultipleTextSelectionPboardType);
    assert_equals_NSString(@"com.apple.cocoa.pasteboard.multiple-text-selection", NSPasteboardTypeMultipleTextSelection);
    assert_equals_NSString(@"public.url", NSPasteboardTypeURL);

    // #include <AppKit/NSPrintInfo.h>
    assert_equals_NSString(@"NSScalingFactor", NSPrintScalingFactor);
    assert_equals_NSString(@"selectedValue", NSSelectedValueBinding);

    // #include <AppKit/NSScreen.h>
    assert_equals_NSString(@"NSScreenColorSpaceDidChangeNotification", NSScreenColorSpaceDidChangeNotification);

    // #include <AppKit/NSSharingService.h>
    assert_equals_NSString(@"com.apple.share.System.add-to-safari-reading-list", NSSharingServiceNameAddToSafariReadingList);

    // #include <AppKit/NSSpeechSynthesizer.h>
    test_AppKit_NSSpeechSynthesizer_h();

    // #include <AppKit/NSWorkspace.h>
    assert_equals_NSString(@"NSWorkspaceDidDeactivateApplicationNotification", NSWorkspaceDidDeactivateApplicationNotification);
    assert_equals_NSString(@"NSWorkspaceSessionDidBecomeActiveNotification", NSWorkspaceSessionDidBecomeActiveNotification);
    assert_equals_NSString(@"NSWorkspaceDidActivateApplicationNotification", NSWorkspaceDidActivateApplicationNotification);
}


void test_AppKit_NSApplication_h(void) {
    // NSApplicationPresentationOptions
    assert_equals_NSUInteger("NSApplicationPresentationDefault",                         0,       NSApplicationPresentationDefault);
    assert_equals_NSUInteger("NSApplicationPresentationAutoHideDock",                    1 << 0,  NSApplicationPresentationAutoHideDock);
    assert_equals_NSUInteger("NSApplicationPresentationHideDock",                        1 << 1,  NSApplicationPresentationHideDock);
    assert_equals_NSUInteger("NSApplicationPresentationAutoHideMenuBar",                 1 << 2,  NSApplicationPresentationAutoHideMenuBar);
    assert_equals_NSUInteger("NSApplicationPresentationHideMenuBar",                     1 << 3,  NSApplicationPresentationHideMenuBar);
    assert_equals_NSUInteger("NSApplicationPresentationDisableAppleMenu",                1 << 4,  NSApplicationPresentationDisableAppleMenu);
    assert_equals_NSUInteger("NSApplicationPresentationDisableProcessSwitching",         1 << 5,  NSApplicationPresentationDisableProcessSwitching);
    assert_equals_NSUInteger("NSApplicationPresentationDisableForceQuit",                1 << 6,  NSApplicationPresentationDisableForceQuit);
    assert_equals_NSUInteger("NSApplicationPresentationDisableSessionTermination",       1 << 7,  NSApplicationPresentationDisableSessionTermination);
    assert_equals_NSUInteger("NSApplicationPresentationDisableHideApplication",          1 << 8,  NSApplicationPresentationDisableHideApplication);
    assert_equals_NSUInteger("NSApplicationPresentationDisableMenuBarTransparency",      1 << 9,  NSApplicationPresentationDisableMenuBarTransparency);
    assert_equals_NSUInteger("NSApplicationPresentationFullScreen",                      1 << 10, NSApplicationPresentationFullScreen);
    assert_equals_NSUInteger("NSApplicationPresentationAutoHideToolbar",                 1 << 11, NSApplicationPresentationAutoHideToolbar);
    assert_equals_NSUInteger("NSApplicationPresentationDisableCursorLocationAssistance", 1 << 12, NSApplicationPresentationDisableCursorLocationAssistance);
}


void test_AppKit_NSKeyValueBinding_h(void) {
    // NSBindingInfoKey
    assert_equals_NSString(@"NSObservedKeyPath", NSObservedKeyPathKey);
    assert_equals_NSString(@"NSObservedObject", NSObservedObjectKey);
    assert_equals_NSString(@"NSOptions", NSOptionsKey);
    
    // NSBindingName
    assert_equals_NSString(@"animate", NSAnimateBinding);
    assert_equals_NSString(@"contentArray", NSContentArrayBinding);
    assert_equals_NSString(@"content", NSContentBinding);
    assert_equals_NSString(@"contentObject", NSContentObjectBinding);
    assert_equals_NSString(@"contentObjects", NSContentObjectsBinding);
    assert_equals_NSString(@"contentSet", NSContentSetBinding);
    assert_equals_NSString(@"contentValues", NSContentValuesBinding);
    assert_equals_NSString(@"doubleClickTarget", NSDoubleClickTargetBinding);
    assert_equals_NSString(@"enabled", NSEnabledBinding);
    assert_equals_NSString(@"fontBold", NSFontBoldBinding);
    assert_equals_NSString(@"fontItalic", NSFontItalicBinding);
    assert_equals_NSString(@"hidden", NSHiddenBinding);
    assert_equals_NSString(@"image", NSImageBinding);
    assert_equals_NSString(@"selectedIndex", NSSelectedIndexBinding);
    assert_equals_NSString(@"selectedObject", NSSelectedObjectBinding);
    assert_equals_NSString(@"selectedObjects", NSSelectedObjectsBinding);
    assert_equals_NSString(@"selectedTag", NSSelectedTagBinding);
    assert_equals_NSString(@"selectedValue", NSSelectedValueBinding);
    assert_equals_NSString(@"selectionIndexes", NSSelectionIndexesBinding);
    assert_equals_NSString(@"title", NSTitleBinding);
    assert_equals_NSString(@"value", NSValueBinding);
    assert_equals_NSString(@"visible", NSVisibleBinding);
    assert_equals_NSString(@"toolTip", NSToolTipBinding);
    assert_equals_NSString(@"editable", NSEditableBinding);

    // NSBindingOption
    assert_equals_NSString(@"NSInsertsNullPlaceholder", NSInsertsNullPlaceholderBindingOption);
    assert_equals_NSString(@"NSValidatesImmediately", NSValidatesImmediatelyBindingOption);
    assert_equals_NSString(@"NSNotApplicablePlaceholder", NSNotApplicablePlaceholderBindingOption);
    assert_equals_NSString(@"NSNullPlaceholder", NSNullPlaceholderBindingOption);
    assert_equals_NSString(@"NSNoSelectionPlaceholder", NSNoSelectionPlaceholderBindingOption);
    assert_equals_NSString(@"NSPredicateFormat", NSPredicateFormatBindingOption);
    assert_equals_NSString(@"NSCreatesSortDescriptor", NSCreatesSortDescriptorBindingOption);
    assert_equals_NSString(@"NSRaisesForNotApplicableKeys", NSRaisesForNotApplicableKeysBindingOption);
    assert_equals_NSString(@"NSAllowsEditingMultipleValuesSelection", NSAllowsEditingMultipleValuesSelectionBindingOption);
    assert_equals_NSString(@"NSValueTransformerName", NSValueTransformerNameBindingOption);
    assert_equals_NSString(@"NSValueTransformer", NSValueTransformerBindingOption);
    assert_equals_NSString(@"NSConditionallySetsEnabled", NSConditionallySetsEnabledBindingOption);
    assert_equals_NSString(@"NSConditionallySetsEditable", NSConditionallySetsEditableBindingOption);
    assert_equals_NSString(@"NSContinuouslyUpdatesValue", NSContinuouslyUpdatesValueBindingOption);
    assert_equals_NSString(@"NSDisplayPattern", NSDisplayPatternBindingOption);
}

void test_AppKit_NSSpeechSynthesizer_h(void) {
    // NSVoiceGenderName
    assert_equals_NSString(@"VoiceGenderFemale", NSVoiceGenderFemale);
    assert_equals_NSString(@"VoiceGenderMale", NSVoiceGenderMale);

    // NSVoiceAttributeKey
    assert_equals_NSString(@"VoiceName", NSVoiceName);
    assert_equals_NSString(@"VoiceGender", NSVoiceGender);
    assert_equals_NSString(@"VoiceLocaleIdentifier",NSVoiceLocaleIdentifier);

    // NSSpeechPropertyKey
    assert_equals_NSString(@"rate", NSSpeechRateProperty);
    assert_equals_NSString(@"pbas", NSSpeechPitchBaseProperty);
    assert_equals_NSString(@"volm", NSSpeechVolumeProperty);
}
