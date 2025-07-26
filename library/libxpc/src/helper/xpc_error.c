#include <stdio.h>

#include <helper/xpc_error.h>

void log_xpc_error(xpc_rich_error_t xpc_error, const char* error_msg) {
    char* xpc_error_description = xpc_rich_error_copy_description(xpc_error);
    fprintf(stderr, "%s (%s)\n", error_msg, xpc_error_description);
    free(xpc_error_description);
}
