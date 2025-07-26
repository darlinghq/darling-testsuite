include_directories(include)

add_library(libxpc_helper_tools 
    src/helper/xpc_error.c
)

# Automated Testing
add_executable(test_basic_connection_client test/automated/basic_connection/client.m)
target_link_libraries(test_basic_connection_client libxpc_helper_tools)

add_test(NAME test_libxpc_basic_connection_client COMMAND test_basic_connection_client)

# Manual Setup

configure_file(test/manual/resources/install_launchd_services.sh ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

add_executable(test_basic_connection_server test/manual/basic_connection/server.m)
target_link_libraries(test_basic_connection_server libxpc_helper_tools)

set(PROGRAM ${CMAKE_CURRENT_BINARY_DIR}/test_basic_connection_server)
set(STANDARDOUTPATH ${CMAKE_CURRENT_BINARY_DIR}/test_basic_connection_server_stdout_log.txt)
set(STANDARDERRORPATH ${CMAKE_CURRENT_BINARY_DIR}/test_basic_connection_server_stderr_log.txt)
set(SERVICE_NAME "org.darlinghq.test_basic_connection_server")

configure_file(
    test/manual/resources/org.darlinghq.test_basic_connection_server.plist.in
    org.darlinghq.test_basic_connection_server.plist
)
