# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

# ./parse_icns.py ../testdata/icns/Type.icns

parseIcns() {
    local name="$1"

    local icns_path="../testdata/icns/$name.icns"

    echo "Inspecting $icns_path"
    ./parse_icns.py $icns_path
    echo "" # To add a space
}

parseIcns "Type_ic04"
parseIcns "Type_ic05"
parseIcns "Type_ic07"
parseIcns "Type_ic08"
parseIcns "Type_ic09"
parseIcns "Type_ic10"
parseIcns "Type_ic11"
parseIcns "Type_ic12"
parseIcns "Type_ic13"
parseIcns "Type_ic14"

# parseIcns "Type_icp4"
# parseIcns "Type_icp5"
# parseIcns "Type_icp6"
