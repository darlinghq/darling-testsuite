// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_ALGORITHM_H
#define DARLING_TESTSUITE_LIB_ALGORITHM_H

#include <stdlib.h>

typedef void (*value_free_handler_f)(void *);

typedef struct linked_list {
    void *value;
    struct linked_list *prev;
    struct linked_list *next;
} linked_list_t;

linked_list_t *linked_list_create(void *value);
void linked_list_append_next(linked_list_t **base, void *value);
void linked_list_free(linked_list_t **base, value_free_handler_f free_value_func);
void linked_list_freeall(linked_list_t **base, value_free_handler_f free_value_func);
void linked_list_freeall_before(linked_list_t *base, value_free_handler_f free_value_func);
void linked_list_freeall_after(linked_list_t *base, value_free_handler_f free_value_func);

#endif // DARLING_TESTSUITE_LIB_ALGORITHM_H
