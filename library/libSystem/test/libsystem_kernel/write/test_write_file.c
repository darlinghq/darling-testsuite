#include <assert.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

int main() {
    // Setup
    const char* NEW_FILENAME = "write_to_new_file_1.txt";
    char buffer[] = "New file!";
    size_t size = 10;

    int fd = open(NEW_FILENAME, O_CREAT | O_EXCL | O_RDWR, 0666);
    assert(fd >= 0);

    // Test
    size_t bytes_written = write(fd, buffer, size);

    // Verify
    assert(bytes_written == 10);

    char buffer2[10] = {0};
    lseek(fd, 0, SEEK_SET);
    size_t bytes_read = read(fd, buffer2, size);
    assert(bytes_read == 10);
    assert(strncmp(buffer2, "New file!", bytes_read) == 0);

    // Teardown
    close(fd);
    unlink(NEW_FILENAME);
    return 0;
}
