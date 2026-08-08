// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Carbon/Carbon.h>

#include <darling-testsuite/assertion.h>

void test_HIToolbox_Appearance_h();
void test_HIToolbox_HITheme_h();

int main() {
    // #include <HIToolbox/Appearance.h>
    test_HIToolbox_Appearance_h();

    // #include <HIToolbox/HITheme.h>
    test_HIToolbox_HITheme_h();
}

void test_HIToolbox_Appearance_h() {
    /* ThemeBrush */
    assert_equals_int16_t("kThemeBrushDialogBackgroundActive", 1, kThemeBrushDialogBackgroundActive);
    assert_equals_int16_t("kThemeBrushDialogBackgroundInactive", 2, kThemeBrushDialogBackgroundInactive);
    assert_equals_int16_t("kThemeBrushAlertBackgroundActive", 3, kThemeBrushAlertBackgroundActive);
    assert_equals_int16_t("kThemeBrushAlertBackgroundInactive", 4, kThemeBrushAlertBackgroundInactive);
    assert_equals_int16_t("kThemeBrushModelessDialogBackgroundActive", 5, kThemeBrushModelessDialogBackgroundActive);
    assert_equals_int16_t("kThemeBrushModelessDialogBackgroundInactive", 6, kThemeBrushModelessDialogBackgroundInactive);
    assert_equals_int16_t("kThemeBrushUtilityWindowBackgroundActive", 7, kThemeBrushUtilityWindowBackgroundActive);
    assert_equals_int16_t("kThemeBrushUtilityWindowBackgroundInactive", 8, kThemeBrushUtilityWindowBackgroundInactive);
    assert_equals_int16_t("kThemeBrushListViewSortColumnBackground", 9, kThemeBrushListViewSortColumnBackground);
    assert_equals_int16_t("kThemeBrushListViewBackground", 10, kThemeBrushListViewBackground);
    assert_equals_int16_t("kThemeBrushIconLabelBackground", 11, kThemeBrushIconLabelBackground);
    assert_equals_int16_t("kThemeBrushListViewSeparator", 12, kThemeBrushListViewSeparator);
    assert_equals_int16_t("kThemeBrushChasingArrows", 13, kThemeBrushChasingArrows);
    assert_equals_int16_t("kThemeBrushDragHilite", 14, kThemeBrushDragHilite);
    assert_equals_int16_t("kThemeBrushDocumentWindowBackground", 15, kThemeBrushDocumentWindowBackground);
    assert_equals_int16_t("kThemeBrushFinderWindowBackground", 16, kThemeBrushFinderWindowBackground);
    assert_equals_int16_t("kThemeBrushScrollBarDelimiterActive", 17, kThemeBrushScrollBarDelimiterActive);
    assert_equals_int16_t("kThemeBrushScrollBarDelimiterInactive", 18, kThemeBrushScrollBarDelimiterInactive);
    assert_equals_int16_t("kThemeBrushFocusHighlight", 19, kThemeBrushFocusHighlight);
    assert_equals_int16_t("kThemeBrushPopupArrowActive", 20, kThemeBrushPopupArrowActive);
    assert_equals_int16_t("kThemeBrushPopupArrowPressed", 21, kThemeBrushPopupArrowPressed);
    assert_equals_int16_t("kThemeBrushPopupArrowInactive", 22, kThemeBrushPopupArrowInactive);
    assert_equals_int16_t("kThemeBrushAppleGuideCoachmark", 23, kThemeBrushAppleGuideCoachmark);
    assert_equals_int16_t("kThemeBrushIconLabelBackgroundSelected", 24, kThemeBrushIconLabelBackgroundSelected);
    assert_equals_int16_t("kThemeBrushStaticAreaFill", 25, kThemeBrushStaticAreaFill);
    assert_equals_int16_t("kThemeBrushActiveAreaFill", 26, kThemeBrushActiveAreaFill);
    assert_equals_int16_t("kThemeBrushButtonFrameActive", 27, kThemeBrushButtonFrameActive);
    assert_equals_int16_t("kThemeBrushButtonFrameInactive", 28, kThemeBrushButtonFrameInactive);
    assert_equals_int16_t("kThemeBrushButtonFaceActive", 29, kThemeBrushButtonFaceActive);
    assert_equals_int16_t("kThemeBrushButtonFaceInactive", 30, kThemeBrushButtonFaceInactive);
    assert_equals_int16_t("kThemeBrushButtonFacePressed", 31, kThemeBrushButtonFacePressed);
    assert_equals_int16_t("kThemeBrushButtonActiveDarkShadow", 32, kThemeBrushButtonActiveDarkShadow);
    assert_equals_int16_t("kThemeBrushButtonActiveDarkHighlight", 33, kThemeBrushButtonActiveDarkHighlight);
    assert_equals_int16_t("kThemeBrushButtonActiveLightShadow", 34, kThemeBrushButtonActiveLightShadow);
    assert_equals_int16_t("kThemeBrushButtonActiveLightHighlight", 35, kThemeBrushButtonActiveLightHighlight);
    assert_equals_int16_t("kThemeBrushButtonInactiveDarkShadow", 36, kThemeBrushButtonInactiveDarkShadow);
    assert_equals_int16_t("kThemeBrushButtonInactiveDarkHighlight", 37, kThemeBrushButtonInactiveDarkHighlight);
    assert_equals_int16_t("kThemeBrushButtonInactiveLightShadow", 38, kThemeBrushButtonInactiveLightShadow);
    assert_equals_int16_t("kThemeBrushButtonInactiveLightHighlight", 39, kThemeBrushButtonInactiveLightHighlight);
    assert_equals_int16_t("kThemeBrushButtonPressedDarkShadow", 40, kThemeBrushButtonPressedDarkShadow);
    assert_equals_int16_t("kThemeBrushButtonPressedDarkHighlight", 41, kThemeBrushButtonPressedDarkHighlight);
    assert_equals_int16_t("kThemeBrushButtonPressedLightShadow", 42, kThemeBrushButtonPressedLightShadow);
    assert_equals_int16_t("kThemeBrushButtonPressedLightHighlight", 43, kThemeBrushButtonPressedLightHighlight);
    assert_equals_int16_t("kThemeBrushBevelActiveLight", 44, kThemeBrushBevelActiveLight);
    assert_equals_int16_t("kThemeBrushBevelActiveDark", 45, kThemeBrushBevelActiveDark);
    assert_equals_int16_t("kThemeBrushBevelInactiveLight", 46, kThemeBrushBevelInactiveLight);
    assert_equals_int16_t("kThemeBrushBevelInactiveDark", 47, kThemeBrushBevelInactiveDark);
    assert_equals_int16_t("kThemeBrushNotificationWindowBackground", 48, kThemeBrushNotificationWindowBackground);
    assert_equals_int16_t("kThemeBrushMovableModalBackground", 49, kThemeBrushMovableModalBackground);
    assert_equals_int16_t("kThemeBrushSheetBackgroundOpaque", 50, kThemeBrushSheetBackgroundOpaque);
    assert_equals_int16_t("kThemeBrushDrawerBackground", 51, kThemeBrushDrawerBackground);
    assert_equals_int16_t("kThemeBrushToolbarBackground", 52, kThemeBrushToolbarBackground);
    assert_equals_int16_t("kThemeBrushSheetBackgroundTransparent", 53, kThemeBrushSheetBackgroundTransparent);
    assert_equals_int16_t("kThemeBrushMenuBackground", 54, kThemeBrushMenuBackground);
    assert_equals_int16_t("kThemeBrushMenuBackgroundSelected", 55, kThemeBrushMenuBackgroundSelected);
    assert_equals_int16_t("kThemeBrushListViewOddRowBackground", 56, kThemeBrushListViewOddRowBackground);
    assert_equals_int16_t("kThemeBrushListViewEvenRowBackground", 57, kThemeBrushListViewEvenRowBackground);
    assert_equals_int16_t("kThemeBrushListViewColumnDivider", 58, kThemeBrushListViewColumnDivider);
    assert_equals_int16_t("kThemeBrushSheetBackground", 50, kThemeBrushSheetBackground);
    assert_equals_int16_t("kThemeBrushBlack", -1, kThemeBrushBlack);
    assert_equals_int16_t("kThemeBrushWhite", -2, kThemeBrushWhite);
    assert_equals_int16_t("kThemeBrushPrimaryHighlightColor", -3, kThemeBrushPrimaryHighlightColor);
    assert_equals_int16_t("kThemeBrushSecondaryHighlightColor", -4, kThemeBrushSecondaryHighlightColor);
    assert_equals_int16_t("kThemeBrushAlternatePrimaryHighlightColor", -5, kThemeBrushAlternatePrimaryHighlightColor);

    /* ThemeButtonKind */
    assert_equals_uint16_t("kThemePushButton", 0, kThemePushButton);
    assert_equals_uint16_t("kThemeCheckBox", 1, kThemeCheckBox);
    assert_equals_uint16_t("kThemeRadioButton", 2, kThemeRadioButton);
    assert_equals_uint16_t("kThemeBevelButton", 3, kThemeBevelButton);
    assert_equals_uint16_t("kThemeArrowButton", 4, kThemeArrowButton);
    assert_equals_uint16_t("kThemePopupButton", 5, kThemePopupButton);
    assert_equals_uint16_t("kThemeDisclosureButton", 6, kThemeDisclosureButton);
    assert_equals_uint16_t("kThemeIncDecButton", 7, kThemeIncDecButton);
    assert_equals_uint16_t("kThemeSmallBevelButton", 8, kThemeSmallBevelButton);
    assert_equals_uint16_t("kThemeMediumBevelButton", 3, kThemeMediumBevelButton);
    assert_equals_uint16_t("kThemeLargeBevelButton", 9, kThemeLargeBevelButton);
    assert_equals_uint16_t("kThemeListHeaderButton", 10, kThemeListHeaderButton);
    assert_equals_uint16_t("kThemeRoundButton", 11, kThemeRoundButton);
    assert_equals_uint16_t("kThemeLargeRoundButton", 12, kThemeLargeRoundButton);
    assert_equals_uint16_t("kThemeSmallCheckBox", 13, kThemeSmallCheckBox);
    assert_equals_uint16_t("kThemeSmallRadioButton", 14, kThemeSmallRadioButton);
    assert_equals_uint16_t("kThemeRoundedBevelButton", 15, kThemeRoundedBevelButton);
    assert_equals_uint16_t("kThemeNormalCheckBox", 1, kThemeNormalCheckBox);
    assert_equals_uint16_t("kThemeNormalRadioButton", 2, kThemeNormalRadioButton);

    /* ThemeButtonValue */
    assert_equals_uint16_t("kThemeButtonOff", 0, kThemeButtonOff);
    assert_equals_uint16_t("kThemeButtonOn", 1, kThemeButtonOn);
    assert_equals_uint16_t("kThemeButtonMixed", 2, kThemeButtonMixed);
    assert_equals_uint16_t("kThemeDisclosureRight", 0, kThemeDisclosureRight);
    assert_equals_uint16_t("kThemeDisclosureDown", 1, kThemeDisclosureDown);
    assert_equals_uint16_t("kThemeDisclosureLeft", 2, kThemeDisclosureLeft);

    /* ThemeButtonAdornment */
    assert_equals_uint16_t("kThemeAdornmentNone", 0, kThemeAdornmentNone);
    assert_equals_uint16_t("kThemeAdornmentDefault", (1 << 0), kThemeAdornmentDefault);
    assert_equals_uint16_t("kThemeAdornmentFocus", (1 << 2), kThemeAdornmentFocus);
    assert_equals_uint16_t("kThemeAdornmentRightToLeft", (1 << 4), kThemeAdornmentRightToLeft);
    assert_equals_uint16_t("kThemeAdornmentDrawIndicatorOnly", (1 << 5), kThemeAdornmentDrawIndicatorOnly);
    assert_equals_uint16_t("kThemeAdornmentHeaderButtonLeftNeighborSelected", (1 << 6), kThemeAdornmentHeaderButtonLeftNeighborSelected);
    assert_equals_uint16_t("kThemeAdornmentHeaderButtonRightNeighborSelected", (1 << 7), kThemeAdornmentHeaderButtonRightNeighborSelected);
    assert_equals_uint16_t("kThemeAdornmentHeaderButtonSortUp", (1 << 8), kThemeAdornmentHeaderButtonSortUp);
    assert_equals_uint16_t("kThemeAdornmentHeaderMenuButton", (1 << 9), kThemeAdornmentHeaderMenuButton);
    assert_equals_uint16_t("kThemeAdornmentHeaderButtonNoShadow", (1 << 10), kThemeAdornmentHeaderButtonNoShadow);
    assert_equals_uint16_t("kThemeAdornmentHeaderButtonShadowOnly", (1 << 11), kThemeAdornmentHeaderButtonShadowOnly);
    assert_equals_uint16_t("kThemeAdornmentNoShadow", (1 << 10), kThemeAdornmentNoShadow);
    assert_equals_uint16_t("kThemeAdornmentShadowOnly", (1 << 11), kThemeAdornmentShadowOnly);
    assert_equals_uint16_t("kThemeAdornmentArrowLeftArrow", (1 << 6), kThemeAdornmentArrowLeftArrow);
    assert_equals_uint16_t("kThemeAdornmentArrowDownArrow", (1 << 7), kThemeAdornmentArrowDownArrow);
    assert_equals_uint16_t("kThemeAdornmentArrowDoubleArrow", (1 << 8), kThemeAdornmentArrowDoubleArrow);
    assert_equals_uint16_t("kThemeAdornmentArrowUpArrow", (1 << 9), kThemeAdornmentArrowUpArrow);
}

void test_HIToolbox_HITheme_h() {
    /* HIThemeOrientation */
    assert_equals_uint32_t("kHIThemeOrientationNormal", 0, kHIThemeOrientationNormal);
    assert_equals_uint32_t("kHIThemeOrientationInverted", 1, kHIThemeOrientationInverted);

    /* HIThemeSplitterAdornment */
    assert_equals_uint32_t("kHIThemeSplitterAdornmentNone", 0, kHIThemeSplitterAdornmentNone);
    assert_equals_uint32_t("kHIThemeSplitterAdornmentMetal", 1, kHIThemeSplitterAdornmentMetal);
}
