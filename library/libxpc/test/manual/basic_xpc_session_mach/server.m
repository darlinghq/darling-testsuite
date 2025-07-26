#include <stdio.h>
#include <xpc/xpc.h>

#include <test_shared_data.h>
#include <helper/xpc_error.h>

int main() {
    xpc_listener_incoming_session_handler_t session_handler = ^(xpc_session_t peer) {
        xpc_session_incoming_message_handler_t message_handler = ^(xpc_object_t message) {
            // Grab the values that were sent from the client
            const char* actual_client_msg = xpc_dictionary_get_string(message, CLIENT_MSG_KEY);
            printf("Recieved message from client: \"%s\"", actual_client_msg);

            printf("Does client message match '%s' message: %s", 
                EXPECTED_CLIENT_MSG, 
                strcmp(EXPECTED_CLIENT_MSG, actual_client_msg) == 0 ? "yes" : "no"
            );

            // Setup reply message
            xpc_object_t reply = xpc_dictionary_create_reply(message);
            if (reply == NULL) {
                printf("WARNING: reply object is NULL\n");
            }

            xpc_dictionary_set_string(reply, SERVER_MSG_KEY, EXPECTED_SERVER_MSG);
            
            // Send a response to the client
            xpc_rich_error_t reply_error = xpc_session_send_message(peer, reply);
            if (reply_error != NULL) {
                log_xpc_error(reply_error, "Failed to send reply");
            }
        };

        // Sets up a handler that processes an incoming connection
        xpc_session_set_incoming_message_handler(peer, message_handler);
    };

    // Create a listener that will handle all incoming connections
    dispatch_queue_t target_queue = NULL;
    xpc_listener_create_flags_t flags = XPC_LISTENER_CREATE_FORCE_MACH;
    xpc_rich_error_t listener_error;
    
    xpc_listener_t listener = xpc_listener_create(SERVICE_NAME_XPC_SESSION_MACH, target_queue, flags, session_handler, &listener_error);
    if (listener == NULL) {
        log_xpc_error(listener_error, "Failed to create listener");

        // We can't do much without a listener
        return 1;
    }

    // Executes the xpc session handler block and prevents the program from terminating
    dispatch_main();

    return 0;
}
