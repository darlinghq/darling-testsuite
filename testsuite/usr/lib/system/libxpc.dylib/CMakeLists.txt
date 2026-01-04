set(DARLING_PATH "${DARLING_PATH}/libxpc.dylib")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}.libxpc_dylib")

set(SERVICE_NAME_XPC_CONNECTION_MACH "org.darlinghq.libxpc_basic_connection_server_mach")
set(SERVICE_NAME_XPC_LISTENER_MACH "org.darlinghq.libxpc_basic_listener_server_mach")

configure_file(include/test_shared_data.h.in include/test_shared_data.h)

include_directories(include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)


add_library(libxpc_helper_tools 
    src/helper/xpc_error.c
    src/helper/xpc_type.c
)

add_subdirectory(test)

#
# Manual Setup
#

add_executable(libxpc_basic_listener_server_mach test/manual/basic_listener_server_mach/server.m)
target_link_libraries(libxpc_basic_listener_server_mach darling-testsuite-lib libxpc_helper_tools)

set(PROGRAM_NAME libxpc_basic_listener_server_mach)
set(PROGRAM ${CMAKE_INSTALL_PREFIX}/bin/${PROGRAM_NAME})
set(STANDARDOUTPATH /tmp/darling-testsuite/${PROGRAM_NAME}_stdout_log.txt)
set(STANDARDERRORPATH /tmp/darling-testsuite/${PROGRAM_NAME}_stderr_log.txt)
set(SERVICE_NAME ${SERVICE_NAME_XPC_LISTENER_MACH})
configure_file(
    resources/launchd_basic_mach_service_template.plist.in
    ${SERVICE_NAME}.plist
)

add_executable(libxpc_basic_connection_server_mach test/manual/basic_connection_server_mach/server.m)
target_link_libraries(libxpc_basic_connection_server_mach darling-testsuite-lib libxpc_helper_tools)

set(PROGRAM_NAME libxpc_basic_connection_server_mach)
set(PROGRAM ${CMAKE_INSTALL_PREFIX}/bin/${PROGRAM_NAME})
set(STANDARDOUTPATH /tmp/darling-testsuite/${PROGRAM_NAME}_stdout_log.txt)
set(STANDARDERRORPATH /tmp/darling-testsuite/${PROGRAM_NAME}_stderr_log.txt)
set(SERVICE_NAME ${SERVICE_NAME_XPC_CONNECTION_MACH})
configure_file(
    resources/launchd_basic_mach_service_template.plist.in
    ${SERVICE_NAME}.plist
)



# 
# For componenets that need to be manually setup
# 

configure_file(resources/launchd_services_install.sh.in launchd_services_install.sh)
configure_file(resources/launchd_services_uninstall.sh.in launchd_services_uninstall.sh)

# Programs
install(
    TARGETS
        libxpc_basic_listener_server_mach
        libxpc_basic_connection_server_mach
)

# Launchd Scripts
install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/${SERVICE_NAME_XPC_LISTENER_MACH}.plist
        ${CMAKE_CURRENT_BINARY_DIR}/${SERVICE_NAME_XPC_CONNECTION_MACH}.plist
    
    DESTINATION
        "launchd"
)

# Shell Scripts
install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/launchd_services_install.sh
        ${CMAKE_CURRENT_BINARY_DIR}/launchd_services_uninstall.sh
    
    PERMISSIONS
        OWNER_READ
        OWNER_WRITE
        OWNER_EXECUTE
        GROUP_READ
        GROUP_EXECUTE
        WORLD_READ
        WORLD_EXECUTE

    DESTINATION
        "scripts"
)
