// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <stdio.h>

#include <helper/xpc_error.h>

#if MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(MACOS_10_15,MACOS_MAX_VERSION)
void log_xpc_error(xpc_rich_error_t xpc_error, const char* error_msg) {
    char* xpc_error_description = xpc_rich_error_copy_description(xpc_error);
    fprintf(stderr, "%s (%s)\n", error_msg, xpc_error_description);
    free(xpc_error_description);
}
#endif
