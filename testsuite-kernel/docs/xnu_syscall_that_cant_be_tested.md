<!--
SPDX-FileCopyrightText: 2026 Darling Team
SPDX-License-Identifier: MPL-2.0      
-->

# XNU Syscalls That Can't Be Tested Directly

## sys_fork

Relies on user space to properly set up the fork.

https://github.com/apple-oss-distributions/Libc/blob/Libc-1439.141.1/sys/fork.c#L47-L73
