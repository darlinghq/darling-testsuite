# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/bsd")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_bsd")

add_subdirectory("sys_close")
add_subdirectory("sys_exit")
add_subdirectory("sys_link")
add_subdirectory("sys_open")
add_subdirectory("sys_read")
add_subdirectory("sys_unlink")
add_subdirectory("sys_wait4")
add_subdirectory("sys_write")
