#include <test_shared_data.h>
#include <darling-testsuite/availability.h>
#include <darling-testsuite/unsupported.h>

extern int basic_xpc_connection_client_mach_main(const char* service_name);

int main() {
#if MIN_MACOS(VERSION_13_0)
    return basic_xpc_connection_client_mach_main(SERVICE_NAME_XPC_LISTENER_MACH);
#else
    darling_testcase_os_doesnt_support_newer_api();
#endif
}
