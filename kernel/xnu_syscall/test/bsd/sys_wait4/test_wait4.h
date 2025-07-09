#ifndef XNU_SYSCALL_BSD_TEST_WAIT4_SHARED_DATA
#define XNU_SYSCALL_BSD_TEST_WAIT4_SHARED_DATA

#include <stddef.h>

const char* FILE_PATH = "write_test_wait4_child_messsage_1.txt";
const char* FILE_CONTENT = "The child process wants to say hello!";
const size_t FILE_SIZE = 38;

#endif // XNU_SYSCALL_BSD_TEST_WAIT4_SHARED_DATA