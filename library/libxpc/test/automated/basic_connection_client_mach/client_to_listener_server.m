#include <test_shared_data.h>

extern int basic_xpc_connection_client_mach_main(const char* service_name);

int main() {
    return basic_xpc_connection_client_mach_main(SERVICE_NAME_XPC_LISTENER_MACH);
}
