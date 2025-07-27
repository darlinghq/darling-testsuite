#include <assert.h>
#include <stdio.h>
#include <xpc/xpc.h>

#include <test_shared_data.h>
#include <helper/xpc_error.h>

int main() {
    // Connect to the XPC service
    dispatch_queue_t target_queue = NULL;
    xpc_session_create_flags_t flags = 0;
    xpc_rich_error_t session_error;

    xpc_session_t session = xpc_session_create_mach_service(SERVICE_NAME_XPC_LISTENER_MACH, target_queue, flags, &session_error);
    if (session == NULL) {
        log_xpc_error(session_error, "Failed to create session");

        // For this test case, session should not be null!
        assert(session != NULL);
    }

    // Create a request
    const char* const* keys = NULL;
    xpc_object_t* values = NULL;
    size_t count = 0;
    
    xpc_object_t message = xpc_dictionary_create(keys, values, count);
    assert(message != NULL);

    xpc_dictionary_set_string(message, CLIENT_MSG_KEY, EXPECTED_CLIENT_MSG);

    // Send a request to XPC service
    xpc_rich_error_t reply_error;
    xpc_object_t reply = xpc_session_send_message_with_reply_sync(session, message, &reply_error);
    if (reply == NULL) {
        log_xpc_error(reply_error, "Failed to obtain reply from server");

        // For this test case, reply should not be null!
        assert(reply != NULL);
    }

    const char* actual_server_msg = xpc_dictionary_get_string(reply, SERVER_MSG_KEY);
    assert(strcmp(EXPECTED_SERVER_MSG, actual_server_msg) == 0);

    // Close session
    xpc_session_cancel(session);
}
