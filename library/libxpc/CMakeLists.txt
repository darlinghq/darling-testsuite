set(SERVICE_NAME_XPC_SESSION_MACH "org.darlinghq.test_basic_xpc_session_mach_server")

configure_file(test/manual/resources/install_launchd_services.sh.in install_launchd_services.sh)
configure_file(include/test_shared_data.h.in include/test_shared_data.h)

include_directories(include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)


add_library(libxpc_helper_tools 
    src/helper/xpc_error.c
)

#
# Automated Testing
#

add_executable(test_basic_xpc_session_mach_client test/automated/basic_xpc_session_mach/client.m)
target_link_libraries(test_basic_xpc_session_mach_client libxpc_helper_tools)

add_test(NAME test_libxpc_basic_xpc_session_mach_client COMMAND test_basic_xpc_session_mach_client)


add_executable(test_basic_xpc_connection_mach_client test/automated/basic_xpc_connection_mach/client.m)
target_link_libraries(test_basic_xpc_connection_mach_client libxpc_helper_tools)

add_test(NAME test_libxpc_basic_xpc_connection_mach_client COMMAND test_basic_xpc_connection_mach_client)

#
# Manual Setup
#

add_executable(test_basic_xpc_session_mach_server test/manual/basic_xpc_session_mach/server.m)
target_link_libraries(test_basic_xpc_session_mach_server libxpc_helper_tools)

set(PROGRAM ${CMAKE_CURRENT_BINARY_DIR}/test_basic_xpc_session_mach_server)
set(STANDARDOUTPATH ${CMAKE_CURRENT_BINARY_DIR}/test_basic_xpc_session_mach_server_stdout_log.txt)
set(STANDARDERRORPATH ${CMAKE_CURRENT_BINARY_DIR}/test_basic_xpc_session_mach_server_stderr_log.txt)
set(SERVICE_NAME ${SERVICE_NAME_XPC_SESSION_MACH})
configure_file(
    test/manual/resources/${SERVICE_NAME_XPC_SESSION_MACH}.plist.in
    ${SERVICE_NAME_XPC_SESSION_MACH}.plist
)
