// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_RESOURCE_H
#define DARLING_TESTSUITE_LIB_RESOURCE_H

typedef struct opaque_resource_container *resource_container_pt;

resource_container_pt resource_container_init();
void resource_container_free(resource_container_pt *container);

const char *grab_full_resource_path(resource_container_pt container, const char *resource_path);

#ifdef __OBJC__

#include <Foundation/Foundation.h>

NSString *grab_full_resource_path_nsstring(resource_container_pt container, NSString *resource_path);

#endif // __OBJC__

#endif //DARLING_TESTSUITE_LIB_RESOURCE_H
