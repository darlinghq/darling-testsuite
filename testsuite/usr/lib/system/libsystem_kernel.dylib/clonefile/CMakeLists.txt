# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

configure_file("resources/clone_resolve_beneath/input.txt" ${CMAKE_CURRENT_BINARY_DIR}/clone_resolve_beneath/input.txt COPYONLY)
configure_file("resources/multifiles/inner_folder/E.txt" ${CMAKE_CURRENT_BINARY_DIR}/multifiles/inner_folder/E.txt COPYONLY)
configure_file("resources/multifiles/A.txt" ${CMAKE_CURRENT_BINARY_DIR}/multifiles/A.txt COPYONLY)
configure_file("resources/multifiles/B.txt" ${CMAKE_CURRENT_BINARY_DIR}/multifiles/B.txt COPYONLY)
configure_file("resources/multifiles/C.txt" ${CMAKE_CURRENT_BINARY_DIR}/multifiles/C.txt COPYONLY)
configure_file("resources/multifiles/D.txt" ${CMAKE_CURRENT_BINARY_DIR}/multifiles/D.txt COPYONLY)
configure_file("resources/symlink_folder/fclonefileat_reference.txt" ${CMAKE_CURRENT_BINARY_DIR}/symlink_folder/fclonefileat_reference.txt COPYONLY)
configure_file("resources/fclonefileat_hello_world.txt" ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)
configure_file("resources/fclonefileat_reference.txt" ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

# clonefile
add_executable("${DARLING_IDENTIFIER}.test_clonefile_soft_symlink" "test/test_clonefile_soft_symlink.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_clonefile_soft_symlink" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_clonefile_soft_symlink" COMMAND "${DARLING_IDENTIFIER}.test_clonefile_soft_symlink")

add_executable("${DARLING_IDENTIFIER}.test_clonefile_soft_symlink_nofollow" "test/test_clonefile_soft_symlink_nofollow.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_clonefile_soft_symlink_nofollow" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_clonefile_soft_symlink_nofollow" COMMAND "${DARLING_IDENTIFIER}.test_clonefile_soft_symlink_nofollow")

# fclonefileat
add_executable("${DARLING_IDENTIFIER}.test_fclonefileat_clone_nofollow_any" "test/test_fclonefileat_clone_nofollow_any.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_fclonefileat_clone_nofollow_any" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_fclonefileat_clone_nofollow_any" COMMAND "${DARLING_IDENTIFIER}.test_fclonefileat_clone_nofollow_any")

add_executable("${DARLING_IDENTIFIER}.test_fclonefileat_clone_resolve_beneath_invalid_flag" "test/test_fclonefileat_clone_resolve_beneath_invalid_flag.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_fclonefileat_clone_resolve_beneath_invalid_flag" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_fclonefileat_clone_resolve_beneath_invalid_flag" COMMAND "${DARLING_IDENTIFIER}.test_fclonefileat_clone_resolve_beneath_invalid_flag")

add_executable("${DARLING_IDENTIFIER}.test_fclonefileat_folder_api_abuse" "test/test_fclonefileat_folder_api_abuse.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_fclonefileat_folder_api_abuse" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_fclonefileat_folder_api_abuse" COMMAND "${DARLING_IDENTIFIER}.test_fclonefileat_folder_api_abuse")

add_executable("${DARLING_IDENTIFIER}.test_fclonefileat_nonacl" "test/test_fclonefileat_nonacl.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_fclonefileat_nonacl" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_fclonefileat_nonacl" COMMAND "${DARLING_IDENTIFIER}.test_fclonefileat_nonacl")

add_executable("${DARLING_IDENTIFIER}.test_fclonefileat_simple_file" "test/test_fclonefileat_simple_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_fclonefileat_simple_file" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_fclonefileat_simple_file" COMMAND "${DARLING_IDENTIFIER}.test_fclonefileat_simple_file")
