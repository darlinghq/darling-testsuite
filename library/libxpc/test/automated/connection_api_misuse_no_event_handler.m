#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <xpc/xpc.h>

void verify_signal(int signum);

int main() {
    const char* service_name = "org.darlinghq.this_server_should_not_exist";
    dispatch_queue_t targetq = NULL;
    uint64_t flags = 0;

    // Create (suspended) connection
    xpc_connection_t connection = xpc_connection_create_mach_service(service_name, targetq, flags);
    assert(connection != NULL);

    signal(SIGTRAP, verify_signal);

    // We will not set a event handler, this should cause a SIGTRAP to occur
    xpc_connection_activate(connection);

    // Something went wrong if no signal is sent...
    fprintf(stderr, "xpc_connection_activate didn't throw SIGTRAP...\n");
    abort();
}

void verify_signal(int signum) {
    assert(signum == SIGTRAP);
    exit(0);
}
