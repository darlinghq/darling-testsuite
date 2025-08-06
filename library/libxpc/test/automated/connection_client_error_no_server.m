#include <assert.h>
#include <stdlib.h>
#include <unistd.h>
#include <xpc/xpc.h>

int main() {
    const char* service_name = "org.darlinghq.libxpc_this_server_doesnt_exist";
    dispatch_queue_t targetq = NULL;
    uint64_t flags = 0;

    // Create (suspended) connection
    xpc_connection_t connection = xpc_connection_create_mach_service(service_name, targetq, flags);
    assert(connection != NULL);

    // Set up event handler
    xpc_handler_t event_handler = ^(xpc_object_t xpc_obj) {
        xpc_type_t obj_type = xpc_get_type(xpc_obj);
        if (obj_type == XPC_TYPE_ERROR) {
            const char* xpc_error_string = xpc_dictionary_get_string(xpc_obj, XPC_ERROR_KEY_DESCRIPTION);
            printf("XPC error has occured: %s\n", xpc_error_string);
            exit(0);
        }

        printf("Unexpected XPC type: %s\n", xpc_type_get_name(obj_type));
        exit(1);
    };

    xpc_connection_set_event_handler(connection, event_handler);
    
    // Attempt to connect to server that doesn't exist
    xpc_connection_activate(connection);

    sleep(5);
    abort();
}
