// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_AVAILABILITY_H
#define DARLING_TESTSUITE_LIB_AVAILABILITY_H

#include <Availability.h>
#include <TargetConditionals.h>

//
// macOS Version Number
//

#define MACOS_10_0          1000
#define MACOS_10_8          1080
#define MACOS_10_15         101500
#define MACOS_13_0          130000
#define MACOS_14_0          140000
#define MACOS_14_7          140700
#define MACOS_15_0          150000
#define MACOS_26_0          260000

#define MACOS_MIN_VERSION   MACOS_10_0
#define MACOS_MAX_VERSION   9999999

//
// iOS Version Number
//

#define IOS_2_0         20000
#define IOS_13_0        130000

#define IOS_MIN_VERSION   IOS_2_0
#define IOS_MAX_VERSION   9999999

//
// Minimum Version Range Checker
//

#define MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(min,max) (TARGET_OS_OSX && min <= __MAC_OS_X_VERSION_MIN_REQUIRED && __MAC_OS_X_VERSION_MIN_REQUIRED <= max)
#define MIN_VERSION_IOS_ABI_TARGET_SUPPORTED(min,max) (TARGET_OS_IOS && min <= __IPHONE_OS_VERSION_MIN_REQUIRED && __IPHONE_OS_VERSION_MIN_REQUIRED <= max)

#endif // DARLING_TESTSUITE_LIB_AVAILABILITY_H
