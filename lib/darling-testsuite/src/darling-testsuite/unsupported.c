#include <darling-testsuite/unsupported.h>

#include <stdio.h>
#include <stdlib.h>

const char* get_os_type() {
#if defined(TARGET_OS_OSX)
    return "macOS";
#else
    return "OS";
#endif
}

void darling_testcase_os_doesnt_support_newer_api() {
    printf("This testcase requires an API that is not supported in the current %s version.\n", get_os_type());
    abort();
}
