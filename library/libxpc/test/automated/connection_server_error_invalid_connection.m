#include <xpc/xpc.h>

#include <test_shared_data.h>

int main() {
    // Create (inactive) connection listener
    const char* service_name = "org.darlinghq.libxpc_server_not_setup_properly";
    dispatch_queue_t targetq = NULL;
    uint64_t flags = XPC_CONNECTION_MACH_SERVICE_LISTENER;
    
    xpc_connection_t listener = xpc_connection_create_mach_service(service_name, targetq, flags);
    if (listener == NULL) {
        printf("Failed to create (inactive) connection listener\n");
        return 1;
    }

    // Setup listener handler
    xpc_handler_t listener_handler = ^(xpc_object_t xpc_obj) {
        xpc_type_t type = xpc_get_type(xpc_obj);
        if (type == XPC_TYPE_ERROR) {
            const char* error_reason = xpc_dictionary_get_string(xpc_obj, XPC_ERROR_KEY_DESCRIPTION);
            printf("XPC error has occured: \"%s\"\n", error_reason);
            exit(0);

        } else {
            fprintf(stderr, "Unexpected XPC type: %s\n", xpc_type_get_name(type));
            abort();
        }
    };

    xpc_connection_set_event_handler(listener, listener_handler);

    // Activate listener
    xpc_connection_activate(listener);

    sleep(5);
    return 1;
}
