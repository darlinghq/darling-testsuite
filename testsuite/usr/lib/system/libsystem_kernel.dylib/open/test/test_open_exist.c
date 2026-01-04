#include <fcntl.h>
#include <assert.h>
#include <unistd.h>

int main() {
    // Test
    int fd = open("/System", O_RDONLY);

    // Verify
    assert(fd >= 0);

    // Teardown
    close(fd);
}
