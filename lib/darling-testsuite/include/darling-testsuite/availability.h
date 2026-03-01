// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_AVAILABILITY_H
#define DARLING_TESTSUITE_LIB_AVAILABILITY_H

#include <Availability.h>

// TODO: Change macro name
#define VERSION_10_8    1080
#define VERSION_10_15   101500
#define VERSION_13_0    130000
#define VERSION_14_0    140000
#define VERSION_15_0    150000

#define MIN_MACOS(version) (__MAC_OS_X_VERSION_MIN_REQUIRED >= version)
#define MIN_IOS(version) (__IPHONE_OS_VERSION_MIN_REQUIRED >= version)
#define MIN_TVOS(version) (__TV_OS_VERSION_MIN_REQUIRED >= version)
#define MIN_WATCHOS(version) (__WATCH_OS_VERSION_MIN_REQUIRED >= version)
#define MIN_VISIONOS(version) (__VISION_OS_VERSION_MIN_REQUIRED >= version)

#define MACOS_SUPPORTED_ABI(min,max) (min <= __MAC_OS_X_VERSION_MIN_REQUIRED && __MAC_OS_X_VERSION_MIN_REQUIRED <= max)

#endif // DARLING_TESTSUITE_LIB_AVAILABILITY_H
