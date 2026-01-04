add_executable("${DARLING_IDENTIFIER}.test_basic_connection_client_to_connection_server_mach"
    basic_connection_client_mach/client_to_connection_server.m
    basic_connection_client_mach/shared_logic.m
)
target_link_libraries("${DARLING_IDENTIFIER}.test_basic_connection_client_to_connection_server_mach" darling-testsuite-lib libxpc_helper_tools)
add_test(NAME "${DARLING_PATH}/test_basic_connection_client_to_connection_server_mach" COMMAND "${DARLING_IDENTIFIER}.test_basic_connection_client_to_connection_server_mach")


add_executable("${DARLING_IDENTIFIER}.test_basic_connection_client_to_listener_server_mach"
    basic_connection_client_mach/client_to_listener_server.m
    basic_connection_client_mach/shared_logic.m
)
target_link_libraries("${DARLING_IDENTIFIER}.test_basic_connection_client_to_listener_server_mach" darling-testsuite-lib libxpc_helper_tools)
add_test(NAME "${DARLING_PATH}/test_basic_connection_client_to_listener_server_mach" COMMAND "${DARLING_IDENTIFIER}.test_basic_connection_client_to_listener_server_mach")


add_executable("${DARLING_IDENTIFIER}.test_basic_session_client_to_connection_server_mach"
    basic_session_client_mach/client_to_connection_server.m
    basic_session_client_mach/shared_logic.m
)
target_link_libraries("${DARLING_IDENTIFIER}.test_basic_session_client_to_connection_server_mach" darling-testsuite-lib libxpc_helper_tools)
add_test(NAME "${DARLING_PATH}/test_basic_session_client_to_connection_server_mach" COMMAND "${DARLING_IDENTIFIER}.test_basic_session_client_to_connection_server_mach")


add_executable("${DARLING_IDENTIFIER}.test_basic_session_client_to_listener_server_mach"
    basic_session_client_mach/client_to_listener_server.m
    basic_session_client_mach/shared_logic.m
)
target_link_libraries("${DARLING_IDENTIFIER}.test_basic_session_client_to_listener_server_mach" darling-testsuite-lib libxpc_helper_tools)
add_test(NAME "${DARLING_PATH}/test_basic_session_client_to_listener_server_mach" COMMAND "${DARLING_IDENTIFIER}.test_basic_session_client_to_listener_server_mach")


add_executable("${DARLING_IDENTIFIER}.test_connection_api_misuse_no_event_handler" connection_api_misuse_no_event_handler.m)
target_link_libraries("${DARLING_IDENTIFIER}.test_connection_api_misuse_no_event_handler" darling-testsuite-lib libxpc_helper_tools)
add_test(NAME "${DARLING_PATH}/test_connection_api_misuse_no_event_handler" COMMAND "${DARLING_IDENTIFIER}.test_connection_api_misuse_no_event_handler")


add_executable("${DARLING_IDENTIFIER}.test_connection_client_error_no_server" connection_client_error_no_server.m)
target_link_libraries("${DARLING_IDENTIFIER}.test_connection_client_error_no_server" darling-testsuite-lib libxpc_helper_tools)
add_test(NAME "${DARLING_PATH}/test_connection_client_error_no_server" COMMAND "${DARLING_IDENTIFIER}.test_connection_client_error_no_server")


add_executable("${DARLING_IDENTIFIER}.test_connection_server_error_invalid_connection" connection_server_error_invalid_connection.m)
target_link_libraries("${DARLING_IDENTIFIER}.test_connection_server_error_invalid_connection" darling-testsuite-lib libxpc_helper_tools)
add_test(NAME "${DARLING_PATH}/test_connection_server_error_invalid_connection" COMMAND "${DARLING_IDENTIFIER}.test_connection_server_error_invalid_connection")
