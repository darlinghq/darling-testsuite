# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/libsystem_kernel.dylib")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_libsystem_kernel_dylib")

add_subdirectory("clonefile")
add_subdirectory("close")
add_subdirectory("link")
add_subdirectory("open")
add_subdirectory("posix_spawn")
add_subdirectory("read")
add_subdirectory("unlink")
add_subdirectory("wait4")
add_subdirectory("write")
