// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <test_shared_data.h>

extern int basic_xpc_session_client_mach_main(const char* service_name);

int main() {
    return basic_xpc_session_client_mach_main(SERVICE_NAME_XPC_LISTENER_MACH);
}
