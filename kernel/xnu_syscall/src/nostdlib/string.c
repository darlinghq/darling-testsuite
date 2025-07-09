#include <nostdlib/string.h>

const char NULL_TERMINATOR = '\0';

size_t nostdlib_strlen(const char* str) {
    size_t index = 0;
    while (str[index] != '\0')
    {
        index++;
    }

    return index;
}

char* nostdlib_strncat(char* base_str, const char* append_str, size_t append_str_length) {
    size_t base_str_length = nostdlib_strlen(base_str);

    char* end_of_base_str = base_str + base_str_length;
    nostdlib_strncpy(end_of_base_str, append_str, append_str_length);

    int new_null_term_pos = base_str_length + append_str_length + 1;
    base_str[new_null_term_pos] = '\0';

    return base_str;
}

int nostdlib_strncmp(const char* str1, const char* str2, size_t limit) {
    size_t index = 0;
    while (index < limit) {
        char c1 = str1[index];
        char c2 = str2[index];

        int difference = c1 - c2;
        if (difference == 0 && c1 != NULL_TERMINATOR) {
            index++;
            continue;
        }

        return difference;
    }

    return 0;
}

char* nostdlib_strncpy(char* dst, const char* src, size_t dstsize) {
    size_t dstindex = 0;
    
    while (dstindex < dstsize && src[dstindex] != '\0') {
        dst[dstindex] = src[dstindex];
        dstindex++;
    }

    while (dstindex < dstsize) {
        dst[dstindex] = '\0';
        dstindex++;
    }

    return dst;
}
