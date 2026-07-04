// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/algorithm.h>

#include <stdlib.h>

linked_list_t *linked_list_alloc();

linked_list_t *linked_list_alloc() {
    return malloc(sizeof(linked_list_t));
}

linked_list_t* linked_list_create(void *value) {
    linked_list_t* item = linked_list_alloc();
    item->value = value;
    item->prev = NULL;
    item->next = NULL;
    return item;
}

void linked_list_append_next(linked_list_t **base, void *value) {
    linked_list_t *item_to_insert = linked_list_create(value);

    if (*base != NULL) {
        item_to_insert->next = (*base)->next;
        item_to_insert->prev = (*base);

        linked_list_t *item_after_base = item_to_insert->next;
        (*base)->next = item_to_insert;
        if (item_after_base != NULL) {
            item_after_base->prev = item_to_insert;
        }
    } else {
        *base = item_to_insert;
    }
}

void linked_list_free(linked_list_t **base, value_free_handler_f free_value_func) {
    linked_list_t *item_before_base = (*base)->prev;
    linked_list_t *item_after_base = (*base)->next;

    if (item_before_base != NULL) {
        item_before_base->next = item_after_base;
    }
    if (item_after_base != NULL) {
        item_after_base->prev = item_before_base;
    }

    free_value_func((*base)->value);
    free(*base);
    base = NULL;
}

void linked_list_freeall(linked_list_t **base, value_free_handler_f free_value_func) {
    linked_list_freeall_after(*base, free_value_func);
    linked_list_freeall_before(*base, free_value_func);
    linked_list_free(base, free_value_func);
}

void linked_list_freeall_before(linked_list_t *base, value_free_handler_f free_value_func) {
    linked_list_t *prev_item = base->prev;
    while (prev_item != NULL) {
        linked_list_t *item_to_delete = prev_item;
        prev_item = prev_item->prev;
        linked_list_free(&item_to_delete, free_value_func);
    }

    base->prev = NULL;
}

void linked_list_freeall_after(linked_list_t *base, value_free_handler_f free_value_func) {
    linked_list_t *next_item = base->next;
    while (next_item != NULL) {
        linked_list_t *item_to_delete = next_item;
        next_item = next_item->next;
        linked_list_free(&item_to_delete, free_value_func);
    }

    base->next = NULL;
}
