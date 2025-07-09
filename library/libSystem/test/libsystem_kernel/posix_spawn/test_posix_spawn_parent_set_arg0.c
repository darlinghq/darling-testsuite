#include <assert.h>
#include <errno.h>
#include <spawn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/syslimits.h>

const char* CHILD_PROGRAM_NAME = "test_posix_spawn_child_verify_argv0";

int main() {
    // Create the argv[0] value that will be passed into the child process
    char child_path[PATH_MAX];
    getcwd(child_path, PATH_MAX);
    strlcat(child_path, "/", PATH_MAX);
    strlcat(child_path, CHILD_PROGRAM_NAME, PATH_MAX);

    // Create the child process
    pid_t child_pid = -1;
    char* const argv[] = { child_path, NULL };
    char* const envp[] = { NULL };
    int posix_spawn_result = posix_spawn(&child_pid, CHILD_PROGRAM_NAME, NULL, NULL, argv, envp);
    assert(posix_spawn_result == 0);

    // Verify that nothing went wrong in the child process
    int child_status;
    pid_t wait4_result = wait4(child_pid, &child_status, 0, NULL);
    assert(child_pid == wait4_result);
    assert(WIFEXITED(child_status));
}
