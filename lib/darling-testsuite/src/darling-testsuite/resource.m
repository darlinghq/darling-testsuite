// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/resource.h>

#include <darling-testsuite/algorithm.h>

#include <sys/syslimits.h>

#include <dirent.h>
#include <stdlib.h>
#include <string.h>

struct opaque_resource_container {
    const char* base_path;
    linked_list_t *allocated_resource_paths;
};

const char *grab_base_resource_path();
resource_container_pt alloc_resource_container();
void free_allocated_resource_path(void* ptr);

resource_container_pt resource_container_alloc() {
    return malloc(sizeof(struct opaque_resource_container));
}

resource_container_pt resource_container_init() {
    const char *base_path = grab_base_resource_path();

    if (base_path == NULL) {
        return NULL;
    }
    
    resource_container_pt container = resource_container_alloc();
    container->base_path = base_path;
    container->allocated_resource_paths = NULL;
    return container;
}

void resource_container_free(resource_container_pt* container) {
    linked_list_freeall(&(*container)->allocated_resource_paths, free_allocated_resource_path);
    free(*container);
    *container = NULL;
}

void free_allocated_resource_path(void* ptr) {
    free(ptr);
}

const char *grab_full_resource_path(resource_container_pt container, const char *resource_path) {
    if (resource_path == NULL) {
        return NULL;
    }

    const char *base_path = container->base_path;
    size_t base_length = strlen(base_path);

    size_t divider_length = base_path[base_length-1] == '/' ? 0 : 1;

    size_t relative_path_length = strlen(resource_path);
    
    size_t new_str_length = base_length + divider_length + relative_path_length + sizeof('\0');
    char *full_path = malloc(new_str_length);

    memcpy(full_path, base_path, base_length);
    if (divider_length > 0) {
        full_path[base_length] = '/';
        full_path[base_length+1] = '\0';
    } else {
        full_path[base_length] = '\0';
    }

    linked_list_append_next(&container->allocated_resource_paths, full_path);
    return strncat(full_path, resource_path, new_str_length);
}

NSString *grab_full_resource_path_nsstring(resource_container_pt container, NSString* resource_path) {
    if (resource_path == nil) {
        return nil;
    }

    const char *cstring_result = grab_full_resource_path(container, [resource_path UTF8String]);
    if (cstring_result == NULL) {
        return nil;
    }

    NSString* result = [[NSString alloc] initWithBytesNoCopy:(void *)cstring_result 
                                                      length:strlen(cstring_result)
                                                    encoding:NSUTF8StringEncoding
                                                freeWhenDone:NO];
    return [result autorelease];
}

const char *grab_base_resource_path() {
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
            return path;
        }
    }

    return NULL;
}