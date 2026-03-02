# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/system")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_system")

add_subdirectory("libsystem_c.dylib")
add_subdirectory("libsystem_kernel.dylib")
add_subdirectory("libsystem_m.dylib")
add_subdirectory("libxpc.dylib")
