// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-nostdlib/math.h>

int nostdlib_abs(int i) {
    return i < 0 ? -i : i;
}