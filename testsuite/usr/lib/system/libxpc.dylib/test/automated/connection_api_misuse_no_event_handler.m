// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

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

#if defined(__arm64__)
    signal(SIGTRAP, verify_signal);
#elif defined(__i386__) || defined(__x86_64__)
    signal(SIGILL, verify_signal);
#endif

    // We will not set a event handler, this should cause a SIGTRAP to occur
    xpc_connection_activate(connection);

    // Something went wrong if no signal is sent...
    fprintf(stderr, "xpc_connection_activate didn't throw SIGTRAP...\n");
    abort();
}

void verify_signal(int signum) {
#if defined(__arm64__)
    assert(signum == SIGTRAP);
#elif defined(__i386__) || defined(__x86_64__)
    assert(signum == SIGILL);
#endif

    exit(0);
}
