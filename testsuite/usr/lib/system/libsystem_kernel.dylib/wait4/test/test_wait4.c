// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/errno.h>
#include <sys/wait.h>

#define FILE_SIZE 38

const char* FILE_PATH = "write_test_wait4_child_messsage_1.txt";
const char* FILE_CONTENT = "The child process wants to say hello!";

int main() {
    pid_t pid = fork();
    assert(pid >= 0);

    unlink(FILE_PATH);

    if (pid == 0) {
        // Child process
        // Create and write file
        int fd = open(FILE_PATH, O_CREAT | O_TRUNC | O_RDWR, 0666);
        assert(fd >= 0);

        size_t write_bytes = write(fd, FILE_CONTENT, FILE_SIZE);
        assert(write_bytes == FILE_SIZE);

        // Clean up
        close(fd);

    } else if (pid > 0) {
        // Parent process
        int* stat_loc = NULL;
        int options = 0;
        struct rusage* rusage = NULL;

        pid_t pid_wait4 = wait4(pid, stat_loc, options, rusage);
        assert(pid == pid_wait4);
        
        // Verify file created by child
        int fd = open(FILE_PATH, O_RDWR);
        assert(fd >= 0);

        char child_msg[FILE_SIZE];
        size_t read_bytes = read(fd, child_msg, FILE_SIZE);
        assert(read_bytes == FILE_SIZE);

        int cmp_result = strncmp(FILE_CONTENT, child_msg, FILE_SIZE);
        assert(cmp_result == 0);

        // Cleanup
        close(fd);
    }
}