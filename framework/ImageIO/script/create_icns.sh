# iconutil --convert iconset -o ../resource/iconset/Type.iconset ../resource/icns/Type.icns
# iconutil --convert icns -o ../resource/icns/Type.icns ../resource/iconset/Type.iconset

createIcns() {
    local name="$1"

    local icns_path="../resource/icns/$name.icns"
    local iconset_path="../resource/iconset/$name.iconset"

    echo "Creating $icns_path"
    iconutil --convert icns -o $icns_path $iconset_path
}

# Modern version of macOS will create an icNN icon type.
createIcns "Type_ic04"
createIcns "Type_ic05"
createIcns "Type_ic07"
createIcns "Type_ic08"
createIcns "Type_ic09"
createIcns "Type_ic10"
createIcns "Type_ic11"
createIcns "Type_ic12"
createIcns "Type_ic13"
createIcns "Type_ic14"

# TODO: Figure out how to generate these icon types
# createIcns "Type_icp4"
# createIcns "Type_icp5"
# createIcns "Type_icp6"
