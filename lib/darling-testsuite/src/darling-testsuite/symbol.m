// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/symbol.h>

#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

void *load_library(const char* path) {
    void* handle = dlopen(path, RTLD_NOW | RTLD_GLOBAL);
    if (handle == NULL) {
        printf("Unable to get handle: %s", dlerror());
        exit(1);
    }

    return handle;
}

void* init_symbol(void* handle, const char* symbol_name) {
    void* result = dlsym(handle, symbol_name);
    if (result == NULL) {
        printf("Unable to get function pointer: %s", dlerror());
        exit(1);
    }

    return result;
}
