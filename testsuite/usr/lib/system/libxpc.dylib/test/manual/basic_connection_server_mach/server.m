// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <xpc/xpc.h>

#include <test_shared_data.h>
#include <helper/xpc_type.h>

void log_error_or_unexpected_xpc_type(xpc_object_t xpc_obj, xpc_type_t xpc_obj_type);
void read_response_and_create_reply(xpc_object_t connection, xpc_object_t message);

int main() {
    // Create (inactive) connection listener
    dispatch_queue_t targetq = NULL;
    uint64_t flags = XPC_CONNECTION_MACH_SERVICE_LISTENER;
    
    xpc_connection_t listener = xpc_connection_create_mach_service(SERVICE_NAME_XPC_CONNECTION_MACH, targetq, flags);
    if (listener == NULL) {
        printf("Failed to create (inactive) connection listener\n");
        return 1;
    }

    // Setup listener handler
    xpc_handler_t listener_handler = ^(xpc_object_t connection) {
        xpc_type_t type = xpc_get_type(connection);

        if (type == XPC_TYPE_CONNECTION) {
            // If the xpc object is a connection, setup the connection handler
            xpc_handler_t connection_event_handler = ^(xpc_object_t message) {
                xpc_type_t type = xpc_get_type(message);

                if (type == XPC_TYPE_DICTIONARY) {
                    read_response_and_create_reply(connection, message);

                } else {
                    log_error_or_unexpected_xpc_type(message, type);
                }
            };

            xpc_connection_set_event_handler(connection, connection_event_handler);

            // Activate connection
            xpc_connection_activate(connection);

        } else {
            log_error_or_unexpected_xpc_type(connection, type);
        }
    };

    xpc_connection_set_event_handler(listener, listener_handler);

    // Activate listener
    xpc_connection_activate(listener);

    // Prevent the program from terminating
    dispatch_main();
}

void log_error_or_unexpected_xpc_type(xpc_object_t xpc_obj, xpc_type_t xpc_obj_type) {
    if (xpc_obj_type == XPC_TYPE_ERROR) {
        const char* error_reason = xpc_dictionary_get_string(xpc_obj, XPC_ERROR_KEY_DESCRIPTION);
        printf("XPC error has occured: \"%s\"\n", error_reason);

    } else {
        log_unexpected_xpc_type(xpc_obj_type);
    }
}

void read_response_and_create_reply(xpc_object_t connection, xpc_object_t message) {
    const char* actual_client_msg = xpc_dictionary_get_string(message, CLIENT_MSG_KEY);
    printf("Recieved message from client: \"%s\"\n", actual_client_msg);

    printf("Does client message match '%s' message: %s\n", 
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
    xpc_connection_send_message(connection, reply);
}
