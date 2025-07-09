# sys_close
add_executable(test_sys_close_success "bsd/sys_close/test_close_success.c")
target_link_libraries(test_sys_close_success xnu_syscall)

add_executable(test_sys_close_invalid_fd "bsd/sys_close/test_close_invalid_fd.c")
target_link_libraries(test_sys_close_invalid_fd xnu_syscall)

add_test(NAME test_sys_close_success COMMAND test_sys_close_success)
add_test(NAME test_sys_close_invalid_fd COMMAND test_sys_close_invalid_fd)

# sys_exit
add_executable(test_sys_exit_returns_0 "bsd/sys_exit/test_return_0.c")
target_link_libraries(test_sys_exit_returns_0 xnu_syscall)

add_executable(test_sys_exit_returns_1 "bsd/sys_exit/test_return_1.c")
target_link_libraries(test_sys_exit_returns_1 xnu_syscall)

add_test(NAME test_sys_exit_returns_0 COMMAND test_sys_exit_returns_0)
add_test(NAME test_sys_exit_returns_1 COMMAND test_sys_exit_returns_1)
set_property(TEST test_sys_exit_returns_1 PROPERTY WILL_FAIL true)

# sys_link
add_executable(test_sys_link_success "bsd/sys_link/test_link_success.c")
target_link_libraries(test_sys_link_success xnu_syscall)

add_test(NAME test_sys_link_success COMMAND test_sys_link_success)

# sys_read
configure_file(bsd/sys_read/resources/read_hello_world.txt ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

add_executable(test_sys_read_file "bsd/sys_read/test_read_file.c")
target_link_libraries(test_sys_read_file xnu_syscall)

add_test(NAME test_sys_read_file COMMAND test_sys_read_file)

# sys_unlink
add_executable(test_sys_unlink_delete_newly_created_file "bsd/sys_unlink/test_unlink_delete_newly_created_file.c")
target_link_libraries(test_sys_unlink_delete_newly_created_file xnu_syscall)

add_executable(test_sys_unlink_file_does_not_exist "bsd/sys_unlink/test_unlink_file_does_not_exist.c")
target_link_libraries(test_sys_unlink_file_does_not_exist xnu_syscall)

add_test(NAME test_sys_unlink_delete_newly_created_file COMMAND test_sys_unlink_delete_newly_created_file)
add_test(NAME test_sys_unlink_file_does_not_exist COMMAND test_sys_unlink_file_does_not_exist)

# sys_wait4
add_executable(test_sys_wait4 "bsd/sys_wait4/test_wait4.c")
add_executable(test_sys_wait4_child "bsd/sys_wait4/test_wait4_child.c")
target_link_libraries(test_sys_wait4 xnu_syscall)
target_link_libraries(test_sys_wait4_child xnu_syscall)

add_test(NAME test_sys_wait4 COMMAND test_sys_wait4)

# sys_write
add_executable(test_sys_write_file "bsd/sys_write/test_write_file.c")
target_link_libraries(test_sys_write_file xnu_syscall)

add_test(NAME test_sys_write_file COMMAND test_sys_write_file)
