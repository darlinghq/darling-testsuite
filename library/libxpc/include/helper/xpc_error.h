#ifndef DARLING_LIBXPC_HELPER_TOOLS_XPC_ERROR
#define DARLING_LIBXPC_HELPER_TOOLS_XPC_ERROR

#include <xpc/xpc.h>

void log_xpc_error(xpc_rich_error_t xpc_error, const char *error_msg);

#endif // DARLING_LIBXPC_HELPER_TOOLS_XPC_ERROR
