// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <xpc/xpc.h>

#include <darling-testsuite/availability.h>

void log_unexpected_xpc_type(xpc_type_t type) {
#if MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(MACOS_10_15,MACOS_MAX_VERSION) || MIN_VERSION_IOS_ABI_TARGET_SUPPORTED(IOS_13_0,IOS_MAX_VERSION)
    printf("Unexpected XPC type: %s\n", xpc_type_get_name(type));
#else
    printf("Unexpected XPC type\n");
#endif
}
