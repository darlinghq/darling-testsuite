#include <assert.h>
#include <xpc/xpc.h>

#include <test_shared_data.h>

int main() {
    const char* service_name = NULL;
    dispatch_queue_t targetq = NULL;
    uint64_t flags = 0;

    // Create (suspended) connection
    xpc_connection_t connection = xpc_connection_create_mach_service(SERVICE_NAME_XPC_SESSION_MACH, targetq, flags);
    assert(connection != NULL);

    // Set up event handler (required)
    xpc_handler_t event_handler = ^(xpc_object_t xpc_obj) {
        xpc_type_t obj_type = xpc_get_type(xpc_obj);
        if (obj_type == XPC_TYPE_ERROR) {
            const char* xpc_error_string = xpc_dictionary_get_string(xpc_obj, XPC_ERROR_KEY_DESCRIPTION);
            printf("XPC error has occured: %s\n", xpc_error_string);
            assert(xpc_get_type(xpc_obj) == XPC_TYPE_ERROR);
        } else {
            printf("Unexpected XPC type: %s\n", xpc_type_get_name(obj_type));
            assert(false && "Unknown XPC type");
        }
    };

    xpc_connection_set_event_handler(connection, event_handler);

    // Create message to send to server
    xpc_object_t message = xpc_dictionary_create(NULL, NULL, 0);
    assert(message != NULL);

    xpc_dictionary_set_string(message, CLIENT_MSG_KEY, EXPECTED_CLIENT_MSG);
    
    // Send message to server
    xpc_connection_resume(connection);

    xpc_object_t reply = xpc_connection_send_message_with_reply_sync(connection, message);
    assert(reply != NULL);

    // Verify reply from server
    const char* actual_server_msg = xpc_dictionary_get_string(reply, SERVER_MSG_KEY);
    assert(strcmp(EXPECTED_SERVER_MSG, actual_server_msg) == 0);
}
