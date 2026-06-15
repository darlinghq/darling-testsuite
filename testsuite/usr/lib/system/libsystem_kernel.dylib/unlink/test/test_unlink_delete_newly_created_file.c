// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

#include <darling-testsuite/assertion.h>

int main() {
    int fd;
    const char *NEW_FILENAME = "/tmp/please_delete_me_unlink.txt";

    // Create new file
    fd = open(NEW_FILENAME, O_CREAT | O_EXCL | O_RDWR, 0666);
    assert_no_errno("open(...)", fd == -1);
    assert_no_errno("close(...)", close(fd) == -1);

    // Delete file
    assert_no_errno("unlink(...)", unlink(NEW_FILENAME) == -1);

    // Verify the file does not exist anymore
    fd = open(NEW_FILENAME, O_RDWR);
    assert(fd == -1);
    assert(errno == ENOENT);
}
