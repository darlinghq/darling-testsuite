// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <stdlib.h>

#include <darling-testsuite/assertion.h>

int main() {
    // TODO: We'll need to figure out how to test the following.

    // * NSDeviceWhiteColorSpace
    //     *  NSDeviceWhiteColorSpace -> NSDeviceWhiteColorSpace
    //     *  NSDeviceWhiteColorSpace -> NSCalibratedRGBColorSpace
    //     *  NSDeviceWhiteColorSpace -> NSDeviceRGBColorSpace
    //     *  NSDeviceWhiteColorSpace -> NSDeviceCMYKColorSpace

    // * NSDeviceRGBColorSpace
    //     *  NSDeviceRGBColorSpace -> NSDeviceRGBColorSpace
    //     *  NSDeviceRGBColorSpace -> NSDeviceWhiteColorSpace
    //     *  NSDeviceRGBColorSpace -> NSDeviceCMYKColorSpace
    //     *  NSDeviceRGBColorSpace -> NSCalibratedRGBColorSpace
    //     *  NSDeviceRGBColorSpace -> NSCalibratedWhiteColorSpace

    // * NSDeviceCMYKColorSpace
    //     *  NSDeviceCMYKColorSpace -> NSDeviceCMYKColorSpace
    //     *  NSDeviceCMYKColorSpace -> NSCalibratedRGBColorSpace
    //     *  NSDeviceCMYKColorSpace -> NSCalibratedWhiteColorSpace

    // * NSCalibratedWhiteColorSpace
    //     *  NSCalibratedWhiteColorSpace -> NSCalibratedWhiteColorSpace
    //     *  NSCalibratedWhiteColorSpace -> NSCalibratedRGBColorSpace
    //     *  NSCalibratedWhiteColorSpace -> NSDeviceRGBColorSpace
    //     *  NSCalibratedWhiteColorSpace -> NSDeviceCMYKColorSpace
    //     *  NSCalibratedWhiteColorSpace -> NSPatternColorSpace

    // * NSCalibratedRGBColorSpace
    //     *  NSCalibratedRGBColorSpace -> NSCalibratedRGBColorSpace
    //     *  NSCalibratedRGBColorSpace -> NSDeviceWhiteColorSpace
    //     *  NSCalibratedRGBColorSpace -> NSDeviceCMYKColorSpace
    //     *  NSCalibratedRGBColorSpace -> NSCalibratedWhiteColorSpace
    //     *  NSCalibratedRGBColorSpace -> NSDeviceRGBColorSpace
    //     *  NSCalibratedRGBColorSpace -> NSPatternColorSpace

    // * NSNamedColorSpace
    //     *  NSNamedColorSpace -> NSNamedColorSpace
    //     *  NSNamedColorSpace -> NSPatternColorSpace
    //     *  NSNamedColorSpace -> NSDeviceRGBColorSpace

    // * NSCustomColorSpace
    //     *  NSCustomColorSpace -> NSCustomColorSpace
    //     *  NSCustomColorSpace -> NSDeviceRGBColorSpace
    //     *  NSCustomColorSpace -> NSPatternColorSpace

    exit(1);
}
