#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/syslimits.h>

const char* CHILD_PROGRAM_NAME = DARLING_IDENTIFIER ".test_posix_spawn_child_verify_argv0";

int main(int argc, char* argv[]) {
    // Create a path that matches argv[0]
    char child_path[PATH_MAX];
    getcwd(child_path, PATH_MAX);
    strlcat(child_path, "/", PATH_MAX);
    strlcat(child_path, CHILD_PROGRAM_NAME, PATH_MAX);

    assert(strncmp(argv[0], child_path, PATH_MAX) == 0);
}
