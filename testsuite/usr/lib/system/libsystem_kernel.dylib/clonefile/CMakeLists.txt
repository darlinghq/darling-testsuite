# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

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

add_executable("${DARLING_IDENTIFIER}.test_fclonefileat_folder_api_abuse" "test/test_fclonefileat_folder_api_abuse.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_fclonefileat_folder_api_abuse" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_fclonefileat_folder_api_abuse" COMMAND "${DARLING_IDENTIFIER}.test_fclonefileat_folder_api_abuse")

add_executable("${DARLING_IDENTIFIER}.test_fclonefileat_simple_file" "test/test_fclonefileat_simple_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_fclonefileat_simple_file" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_fclonefileat_simple_file" COMMAND "${DARLING_IDENTIFIER}.test_fclonefileat_simple_file")
