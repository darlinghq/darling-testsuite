#ifndef DARLING_TESTSUITE_NOSTDLIB_STRING_H
#define DARLING_TESTSUITE_NOSTDLIB_STRING_H

#include <stddef.h>

size_t nostdlib_strlen(const char* str);
char *nostdlib_strncat(char *base_str, const char *append_str, size_t append_str_length);
int nostdlib_strncmp(const char *str1, const char *str2, size_t limit);
char* nostdlib_strncpy(char *dst, const char *src, size_t dstsize);

#endif // DARLING_TESTSUITE_NOSTDLIB_STRING_H
