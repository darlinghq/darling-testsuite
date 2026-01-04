#include <AppKit/AppKit.h>

#include <assert.h>
#include <stdio.h>

#include <darling-testsuite/assertion.h>

int main() {
    NSApplication* app = NSApplication.sharedApplication;

    // Setup
    // We are creating a basic setup that is similar to how Storyboard/XIB sets up their "Help" menu
    app.mainMenu = [[NSMenu alloc] init];

    NSMenuItem* origHelpMenuItem = [[NSMenuItem alloc] initWithTitle:@"Orig Help Menu Item" action:NULL keyEquivalent:@""];
    NSMenu* origHelpMenu = [[NSMenu alloc] initWithTitle:@"Orig Help Menu"];
    app.helpMenu = origHelpMenu;
    origHelpMenuItem.submenu = origHelpMenu;
    [app.mainMenu addItem:origHelpMenuItem];

    // Test
    NSMenu* newHelpMenu = [[NSMenu alloc] initWithTitle:@"New Help Menu"];
    app.helpMenu = newHelpMenu;

    // Verify
    // Updating the help menu should have no affect on the structure of the main menu
    assert(app.mainMenu.numberOfItems == 1);
    assert([app.mainMenu itemWithTitle:@"Orig Help Menu Item"] != nil);
    assert([app.mainMenu itemWithTitle:@"Orig Help Menu Item"].submenu != nil);
    assert([[app.mainMenu itemWithTitle:@"Orig Help Menu Item"].submenu.title isEqual:@"Orig Help Menu"]);
}
