// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_FILE_H
#define DARLING_TESTSUITE_LIB_FILE_H

#include <stdbool.h>

bool create_file_with_content(const char *path, const char *format, ...);
void delete_directory_with_files(const char *path);

#endif