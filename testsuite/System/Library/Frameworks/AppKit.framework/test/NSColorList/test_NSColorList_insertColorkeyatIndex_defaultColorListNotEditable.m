#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    NSException* exception = nil;
    NSColor* testsuiteColor = [NSColor colorWithDeviceRed:121.0/255.0
                                                green: 46.0/255.0
                                                    blue:251.0/255.0
                                                alpha:1.0];

    // Test replacing existing key 
    exception = assert_NSException_is_thrown(^{
        [[NSColorList colorListNamed:@"System"] insertColor:testsuiteColor
                                                       key:@"textBackgroundColor"
                                                   atIndex:0];
    });
    printf("[NSColorList colorListNamed:@\"System\"] - Exception reason when replacing @\"textBackgroundColor\": %s\n", [exception.reason UTF8String]);
    assert_equals_NSString(NSColorListNotEditableException, exception.name);

    // Test inserting new key 
    exception = assert_NSException_is_thrown(^{
        [[NSColorList colorListNamed:@"System"] insertColor:testsuiteColor
                                                       key:@"unlikelyDarlingTestsuiteNewColorKey"
                                                   atIndex:0];
    });
    printf("[NSColorList colorListNamed:@\"System\"] - Exception reason inserting new key @\"unlikelyDarlingTestsuiteNewColorKey\": %s\n", [exception.reason UTF8String]);
    assert_equals_NSString(NSColorListNotEditableException, exception.name);

    //
    // Test other noneditable color list
    //

    exception = assert_NSException_is_thrown(^{
        [[NSColorList colorListNamed:@"Apple"] insertColor:testsuiteColor
                                                       key:@"unlikelyDarlingTestsuiteNewColorKey"
                                                   atIndex:0];
    });
    printf("[NSColorList colorListNamed:@\"Apple\"] - Exception reason inserting new key @\"unlikelyDarlingTestsuiteNewColorKey\": %s\n", [exception.reason UTF8String]);
    assert_equals_NSString(NSColorListNotEditableException, exception.name);


    exception = assert_NSException_is_thrown(^{
        [[NSColorList colorListNamed:@"Crayons"] insertColor:testsuiteColor
                                                       key:@"unlikelyDarlingTestsuiteNewColorKey"
                                                   atIndex:0];
    });
    printf("[NSColorList colorListNamed:@\"Crayons\"] - Exception reason inserting new key @\"unlikelyDarlingTestsuiteNewColorKey\": %s\n", [exception.reason UTF8String]);
    assert_equals_NSString(NSColorListNotEditableException, exception.name);


    exception = assert_NSException_is_thrown(^{
        [[NSColorList colorListNamed:@"Web Safe Colors"] insertColor:testsuiteColor
                                                       key:@"unlikelyDarlingTestsuiteNewColorKey"
                                                   atIndex:0];
    });
    printf("[NSColorList colorListNamed:@\"Web Safe Colors\"] - Exception reason inserting new key @\"unlikelyDarlingTestsuiteNewColorKey\": %s\n", [exception.reason UTF8String]);
    assert_equals_NSString(NSColorListNotEditableException, exception.name);
}
