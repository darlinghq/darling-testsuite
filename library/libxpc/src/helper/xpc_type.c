#include <xpc/xpc.h>

#include <darling-testsuite/availability.h>

void log_unexpected_xpc_type(xpc_type_t type) {
#if MIN_MACOS(VERSION_10_15) || MIN_IOS(VERSION_13_0)
    printf("Unexpected XPC type: %s\n", xpc_type_get_name(type));
#else
    printf("Unexpected XPC type\n");
#endif
}
