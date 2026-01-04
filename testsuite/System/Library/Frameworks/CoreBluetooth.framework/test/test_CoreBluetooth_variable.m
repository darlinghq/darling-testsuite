#include <CoreBluetooth/CoreBluetooth.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <CoreBluetooth/CBAdvertisementData.h>
    assert_equals_nsstring(@"kCBAdvDataLocalName", CBAdvertisementDataLocalNameKey);
    assert_equals_nsstring(@"kCBAdvDataManufacturerData", CBAdvertisementDataManufacturerDataKey);
    assert_equals_nsstring(@"kCBAdvDataServiceData", CBAdvertisementDataServiceDataKey);
    assert_equals_nsstring(@"kCBAdvDataServiceUUIDs", CBAdvertisementDataServiceUUIDsKey);
    assert_equals_nsstring(@"kCBAdvDataHashedServiceUUIDs", CBAdvertisementDataOverflowServiceUUIDsKey);
    assert_equals_nsstring(@"kCBAdvDataTxPowerLevel", CBAdvertisementDataTxPowerLevelKey);

    // #include <CoreBluetooth/CBCentralManagerConstants.h>
    assert_equals_nsstring(@"kCBScanOptionAllowDuplicates", CBCentralManagerScanOptionAllowDuplicatesKey);

    // #include <CoreBluetooth/CBError.h>
    assert_equals_nsstring(@"CBATTErrorDomain", CBATTErrorDomain);
    assert_equals_nsstring(@"CBErrorDomain", CBErrorDomain);    
}
