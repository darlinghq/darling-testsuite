// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <test_shared_data.h>
#include <darling-testsuite/availability.h>
#include <darling-testsuite/unsupported.h>

extern int basic_xpc_connection_client_mach_main(const char* service_name);

int main() {
#if MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(MACOS_13_0,MACOS_MAX_VERSION)
    return basic_xpc_connection_client_mach_main(SERVICE_NAME_XPC_LISTENER_MACH);
#else
    darling_testcase_os_doesnt_support_newer_api();
#endif
}
