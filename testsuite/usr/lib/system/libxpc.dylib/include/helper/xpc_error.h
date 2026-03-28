// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#ifndef DARLING_LIBXPC_HELPER_TOOLS_XPC_ERROR
#define DARLING_LIBXPC_HELPER_TOOLS_XPC_ERROR

#include <xpc/xpc.h>

#include <darling-testsuite/availability.h>

#if MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(MACOS_10_15,MACOS_MAX_VERSION)
void log_xpc_error(xpc_rich_error_t xpc_error, const char *error_msg);
#endif

#endif // DARLING_LIBXPC_HELPER_TOOLS_XPC_ERROR
