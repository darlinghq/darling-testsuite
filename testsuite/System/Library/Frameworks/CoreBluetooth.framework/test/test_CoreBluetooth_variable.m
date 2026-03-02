// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreBluetooth/CoreBluetooth.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <CoreBluetooth/CBAdvertisementData.h>
    assert_equals_NSString(@"kCBAdvDataLocalName", CBAdvertisementDataLocalNameKey);
    assert_equals_NSString(@"kCBAdvDataManufacturerData", CBAdvertisementDataManufacturerDataKey);
    assert_equals_NSString(@"kCBAdvDataServiceData", CBAdvertisementDataServiceDataKey);
    assert_equals_NSString(@"kCBAdvDataServiceUUIDs", CBAdvertisementDataServiceUUIDsKey);
    assert_equals_NSString(@"kCBAdvDataHashedServiceUUIDs", CBAdvertisementDataOverflowServiceUUIDsKey);
    assert_equals_NSString(@"kCBAdvDataTxPowerLevel", CBAdvertisementDataTxPowerLevelKey);

    // #include <CoreBluetooth/CBCentralManagerConstants.h>
    assert_equals_NSString(@"kCBScanOptionAllowDuplicates", CBCentralManagerScanOptionAllowDuplicatesKey);

    // #include <CoreBluetooth/CBError.h>
    assert_equals_NSString(@"CBATTErrorDomain", CBATTErrorDomain);
    assert_equals_NSString(@"CBErrorDomain", CBErrorDomain);    
}
