#include <nostdlib/io.h>

#include <nostdlib/math.h>
#include <nostdlib/string.h>
#include <syscall/cbridge_syscall.h>

#include <stdarg.h>
#include <unistd.h>

int nostdlib_printf(const char* format, ...) {
    va_list format_args;
    va_start(format_args, format);

    const size_t format_size = nostdlib_strlen(format);
    size_t format_index = 0;
    while (format_index < format_size) {
        if (format[format_index] == '%') {
            format_index++;

            if (format[format_index] == 's')
            {
                const char* string = va_arg(format_args, const char*);
                size_t string_size = nostdlib_strlen(string);
                nostdlib_write(STDOUT_FILENO, string, string_size, NULL);

                format_index += 1;
            
            } else if (format[format_index] == 'd') {
                const int number = va_arg(format_args, int);

                int abs_number = nostdlib_abs(number);
                char num_string_buffer[21];
                
                int index = 20;
                if (abs_number == 0) {
                    num_string_buffer[index] = '0';

                } else {
                    while (abs_number > 0)
                    {
                        num_string_buffer[index--] = (number % 10) + '0';
                        abs_number = abs_number / 10;
                    }

                    if (number < 0) {
                        num_string_buffer[index] = '-';
                    } else {
                        index++;
                    }
                }



                char* num_string = num_string_buffer + index;
                size_t num_string_size = 21 - index;
                nostdlib_write(STDOUT_FILENO, num_string, num_string_size, NULL);
                
                format_index += 1;
            }

        } else {
            size_t ordinary_chars_start_index = format_index;
            size_t ordinary_chars_end_index = format_index;

            char check_char = format[ordinary_chars_end_index];
            while (check_char != '%' && check_char != '\0') {
                ordinary_chars_end_index++;
                check_char = format[ordinary_chars_end_index];
            }

            char buffer[512];
            size_t size = ordinary_chars_end_index - ordinary_chars_start_index;
            nostdlib_strncpy(buffer, format+ordinary_chars_start_index, size);
            buffer[ordinary_chars_end_index] = '\0';

            nostdlib_write(STDOUT_FILENO, buffer, size, NULL);

            format_index = ordinary_chars_end_index;
        }
    }

    va_end(format_args);
    return 0;
}

ssize_t nostdlib_write(int fildes, const void *buf, size_t nbyte, int* error_code) {
    return sys_write(fildes, (darling_user_addr_t)buf, (darling_user_size_t)nbyte, NULL);
}