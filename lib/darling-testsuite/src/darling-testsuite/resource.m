// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/resource.h>

#include <sys/syslimits.h>

#include <dirent.h>
#include <stdlib.h>
#include <string.h>

char *grab_base_resource_path();

const char *grab_full_resource_path(const char *resource_path) {
    char *base_path = grab_base_resource_path();
    if (base_path == NULL || resource_path == NULL) {
        return NULL;
    }

    size_t base_length = strlen(base_path);
    size_t divider_length = base_path[base_length-1] == '/' ? 0 : 1;
    size_t relative_path_length = strlen(resource_path);
    size_t new_str_length = base_length + divider_length + relative_path_length + sizeof('\0');
    
    char *full_path = reallocf(base_path, new_str_length);
    if (divider_length > 0) {
        full_path[base_length] = '/';
        full_path[base_length+1] = '\0';
    } else {
        full_path[base_length] = '\0';
    }

    return strncat(full_path, resource_path, new_str_length);
}

NSString *grab_full_resource_path_nsstring(NSString* resource_path) {
    if (resource_path == nil) {
        return nil;
    }

    const char *cstring_result = grab_full_resource_path([resource_path UTF8String]);
    if (cstring_result == NULL) {
        return nil;
    }

    NSString* result = [[NSString alloc] initWithBytesNoCopy:(void *)cstring_result 
                                                      length:strlen(cstring_result)
                                                    encoding:NSUTF8StringEncoding
                                                freeWhenDone:YES];
    return [result autorelease];
}

char *grab_base_resource_path() {
    const char *paths_to_check[] = {
        getenv("DARLING_TESTSUITE_RESOURCE_PATH"),
        "resource",
        "../resource"
    };

    const int MAX_PATH_TO_CHECK_SIZE = sizeof(paths_to_check)/sizeof(const char*);
    for (int i=0; i<MAX_PATH_TO_CHECK_SIZE; i++) {
        const char *path = paths_to_check[i];
        DIR *dir = opendir(path);
        if (dir != NULL) {
            closedir(dir);
            return strdup(path);
        }
    }

    return NULL;
}