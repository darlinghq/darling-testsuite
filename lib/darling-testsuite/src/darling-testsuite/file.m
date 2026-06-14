// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/file.h>

#include <ftw.h>
#include <stdarg.h>
#include <stdio.h>
#include <unistd.h>

int delete_file_or_dir(const char *pathname, const struct stat *file_stat, int file_info, struct FTW * file_ftw);

bool create_file_with_content(const char *path, const char *format, ...) {
    FILE* input_file = fopen(path, "w");
    if (input_file == NULL) {
        perror("Failed to create file");
        return false;
    }

    va_list args;
    va_start(args, format);
    vfprintf(input_file, format, args);

    fclose(input_file);
    return true;
}

void delete_directory_with_files(const char *path) {
    // walk a file tree
    nftw(path, delete_file_or_dir, 64, FTW_DEPTH | FTW_PHYS);
}

int delete_file_or_dir(const char *pathname, const struct stat *file_stat, int file_info, struct FTW * file_ftw) {
    return remove(pathname);
}
