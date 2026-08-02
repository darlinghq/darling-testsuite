# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

# NSApplication

add_executable("${DARLING_IDENTIFIER}.test_NSApplication_helpMenu_setterDoesntAffectMainMenuStructure" "NSApplication/test_NSApplication_helpMenu_setterDoesntAffectMainMenuStructure.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSApplication_helpMenu_setterDoesntAffectMainMenuStructure" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSApplication_helpMenu_setterDoesntAffectMainMenuStructure" COMMAND "${DARLING_IDENTIFIER}.test_NSApplication_helpMenu_setterDoesntAffectMainMenuStructure")

add_executable("${DARLING_IDENTIFIER}.test_NSApplication_setPresentationOptions_verifyException" "NSApplication/test_NSApplication_setPresentationOptions_verifyException.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSApplication_setPresentationOptions_verifyException" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSApplication_setPresentationOptions_verifyException" COMMAND "${DARLING_IDENTIFIER}.test_NSApplication_setPresentationOptions_verifyException")

# NSColor

add_executable("${DARLING_IDENTIFIER}.test_NSColor_class_variable" "NSColor/test_NSColor_class_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSColor_class_variable" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSColor_class_variable" COMMAND "${DARLING_IDENTIFIER}.test_NSColor_class_variable")

add_executable("${DARLING_IDENTIFIER}.test_NSColor_colorUsingColorSpaceNamedevice" "NSColor/test_NSColor_colorUsingColorSpaceNamedevice.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSColor_colorUsingColorSpaceNamedevice" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSColor_colorUsingColorSpaceNamedevice" COMMAND "${DARLING_IDENTIFIER}.test_NSColor_colorUsingColorSpaceNamedevice")

add_executable("${DARLING_IDENTIFIER}.test_NSColor_colorWithCatalogNamecolorName" "NSColor/test_NSColor_colorWithCatalogNamecolorName.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSColor_colorWithCatalogNamecolorName" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSColor_colorWithCatalogNamecolorName" COMMAND "${DARLING_IDENTIFIER}.test_NSColor_colorWithCatalogNamecolorName")

# NSColorList

add_executable("${DARLING_IDENTIFIER}.test_NSColorList_availableColorLists_checkDefaultColorList" "NSColorList/test_NSColorList_availableColorLists_checkDefaultColorList.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSColorList_availableColorLists_checkDefaultColorList" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSColorList_availableColorLists_checkDefaultColorList" COMMAND "${DARLING_IDENTIFIER}.test_NSColorList_availableColorLists_checkDefaultColorList")

add_executable("${DARLING_IDENTIFIER}.test_NSColorList_colorListNamed_verifySystemColorList" "NSColorList/test_NSColorList_colorListNamed_verifySystemColorList.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSColorList_colorListNamed_verifySystemColorList" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSColorList_colorListNamed_verifySystemColorList" COMMAND "${DARLING_IDENTIFIER}.test_NSColorList_colorListNamed_verifySystemColorList")

add_executable("${DARLING_IDENTIFIER}.test_NSColorList_editable_isDefaultColorListEditable" "NSColorList/test_NSColorList_editable_isDefaultColorListEditable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSColorList_editable_isDefaultColorListEditable" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSColorList_editable_isDefaultColorListEditable" COMMAND "${DARLING_IDENTIFIER}.test_NSColorList_editable_isDefaultColorListEditable")

add_executable("${DARLING_IDENTIFIER}.test_NSColorList_insertColorkeyatIndex_defaultColorListNotEditable" "NSColorList/test_NSColorList_insertColorkeyatIndex_defaultColorListNotEditable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSColorList_insertColorkeyatIndex_defaultColorListNotEditable" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSColorList_insertColorkeyatIndex_defaultColorListNotEditable" COMMAND "${DARLING_IDENTIFIER}.test_NSColorList_insertColorkeyatIndex_defaultColorListNotEditable")

# NSCursor

add_executable("${DARLING_IDENTIFIER}.test_NSCursor_encodeWithCoder" "NSCursor/test_NSCursor_encodeWithCoder.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSCursor_encodeWithCoder" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSCursor_encodeWithCoder" COMMAND "${DARLING_IDENTIFIER}.test_NSCursor_encodeWithCoder")

add_executable("${DARLING_IDENTIFIER}.test_NSCursor_initWithCoder" "NSCursor/test_NSCursor_initWithCoder.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSCursor_initWithCoder" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSCursor_initWithCoder" COMMAND "${DARLING_IDENTIFIER}.test_NSCursor_initWithCoder")

# NSWorkspace

add_executable("${DARLING_IDENTIFIER}.test_NSWorkspace_openFile_withApplication_andDeactivate" "NSWorkspace/test_NSWorkspace_openFile_withApplication_andDeactivate.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSWorkspace_openFile_withApplication_andDeactivate" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSWorkspace_openFile_withApplication_andDeactivate" COMMAND "${DARLING_IDENTIFIER}.test_NSWorkspace_openFile_withApplication_andDeactivate")

add_executable("${DARLING_IDENTIFIER}.manual_NSWorkspace_openURL" "NSWorkspace/manual/test_NSWorkspace_openURL.m")
target_link_libraries("${DARLING_IDENTIFIER}.manual_NSWorkspace_openURL" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)

# Misc

add_executable("${DARLING_IDENTIFIER}.test_AppKit_variable" "test_AppKit_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_AppKit_variable" "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_AppKit_variable" COMMAND "${DARLING_IDENTIFIER}.test_AppKit_variable")

install(
    TARGETS
        # NSApplication
        "${DARLING_IDENTIFIER}.test_NSApplication_helpMenu_setterDoesntAffectMainMenuStructure"
        "${DARLING_IDENTIFIER}.test_NSApplication_setPresentationOptions_verifyException"
        
        # NSColor
        "${DARLING_IDENTIFIER}.test_NSColor_class_variable"
        "${DARLING_IDENTIFIER}.test_NSColor_colorUsingColorSpaceNamedevice"
        "${DARLING_IDENTIFIER}.test_NSColor_colorWithCatalogNamecolorName"

        # NSColorList
        "${DARLING_IDENTIFIER}.test_NSColorList_availableColorLists_checkDefaultColorList"
        "${DARLING_IDENTIFIER}.test_NSColorList_colorListNamed_verifySystemColorList"
        "${DARLING_IDENTIFIER}.test_NSColorList_editable_isDefaultColorListEditable"
        "${DARLING_IDENTIFIER}.test_NSColorList_insertColorkeyatIndex_defaultColorListNotEditable"

        # NSCursor
        "${DARLING_IDENTIFIER}.test_NSCursor_encodeWithCoder"
        "${DARLING_IDENTIFIER}.test_NSCursor_initWithCoder"

        # NSWorkspace
        "${DARLING_IDENTIFIER}.test_NSWorkspace_openFile_withApplication_andDeactivate"

        # Misc
        "${DARLING_IDENTIFIER}.test_AppKit_variable"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)

install(
    TARGETS
        # NSWorkspace
        "${DARLING_IDENTIFIER}.manual_NSWorkspace_openURL"

    DESTINATION
        "${INSTALL_DIR_MANUAL}"
)
