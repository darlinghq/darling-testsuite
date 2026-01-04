#include <assert.h>
#include <errno.h>
#include <unistd.h>

int main() {
    int unlink_result = unlink("unlink_this_file_should_not_exist.txt");
    assert(unlink_result == -1);
    assert(errno == ENOENT);
}
