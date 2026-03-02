# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

# sys_close
add_executable("${DARLING_IDENTIFIER}.test_sys_close_success" "sys_close/test_sys_close_success.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_close_success" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_close_success" COMMAND "${DARLING_IDENTIFIER}.test_sys_close_success")

add_executable("${DARLING_IDENTIFIER}.test_sys_close_invalid_fd" "sys_close/test_sys_close_invalid_fd.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_close_invalid_fd" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_close_invalid_fd" COMMAND "${DARLING_IDENTIFIER}.test_sys_close_invalid_fd")

# sys_exit
add_executable("${DARLING_IDENTIFIER}.test_sys_exit_returns_0" "sys_exit/test_sys_exit_returns_0.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_exit_returns_0" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_exit_returns_0" COMMAND "${DARLING_IDENTIFIER}.test_sys_exit_returns_0")

add_executable("${DARLING_IDENTIFIER}.test_sys_exit_returns_1" "sys_exit/test_sys_exit_returns_1.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_exit_returns_1" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_exit_returns_1" COMMAND "${DARLING_IDENTIFIER}.test_sys_exit_returns_1")
set_property(TEST "${DARLING_PATH}/test_sys_exit_returns_1" PROPERTY WILL_FAIL true)

# sys_link
add_executable("${DARLING_IDENTIFIER}.test_sys_link_success" "sys_link/test_sys_link_success.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_link_success" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_link_success" COMMAND "${DARLING_IDENTIFIER}.test_sys_link_success")

# sys_open
add_executable("${DARLING_IDENTIFIER}.test_sys_open_doesnt_exist" "sys_open/test_sys_open_doesnt_exist.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_open_doesnt_exist" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_open_doesnt_exist" COMMAND "${DARLING_IDENTIFIER}.test_sys_open_doesnt_exist")

add_executable("${DARLING_IDENTIFIER}.test_sys_open_exist" "sys_open/test_sys_open_exist.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_open_exist" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_open_exist" COMMAND "${DARLING_IDENTIFIER}.test_sys_open_exist")

# sys_read
configure_file(sys_read/resources/read_hello_world.txt ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

add_executable("${DARLING_IDENTIFIER}.test_sys_read_file" "sys_read/test_sys_read_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_read_file" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_read_file" COMMAND "${DARLING_IDENTIFIER}.test_sys_read_file")

# sys_unlink
add_executable("${DARLING_IDENTIFIER}.test_sys_unlink_delete_newly_created_file" "sys_unlink/test_sys_unlink_delete_newly_created_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_unlink_delete_newly_created_file" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_unlink_delete_newly_created_file" COMMAND "${DARLING_IDENTIFIER}.test_sys_unlink_delete_newly_created_file")

add_executable("${DARLING_IDENTIFIER}.test_sys_unlink_file_does_not_exist" "sys_unlink/test_sys_unlink_file_does_not_exist.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_unlink_file_does_not_exist" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_unlink_file_does_not_exist" COMMAND "${DARLING_IDENTIFIER}.test_sys_unlink_file_does_not_exist")

# sys_wait4
add_executable("${DARLING_IDENTIFIER}.test_sys_wait4" "sys_wait4/test_sys_wait4.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_wait4" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_wait4" COMMAND "${DARLING_IDENTIFIER}.test_sys_wait4")

add_executable("test_sys_wait4_child" "sys_wait4/test_sys_wait4_child.c")
target_link_libraries(test_sys_wait4_child darling-directsyscall darling-nostdlib)

# sys_write
add_executable("${DARLING_IDENTIFIER}.test_sys_write_file" "sys_write/test_sys_write_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_write_file" darling-directsyscall darling-nostdlib)
add_test(NAME "${DARLING_PATH}/test_sys_write_file" COMMAND "${DARLING_IDENTIFIER}.test_sys_write_file")
