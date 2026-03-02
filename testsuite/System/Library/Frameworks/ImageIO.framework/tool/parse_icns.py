#!/usr/bin/env python3

# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MIT-0

# Credit to https://en.wikipedia.org/wiki/Apple_Icon_Image_format
# for details on the icns format.

import os
import struct
import sys

def parse_icns_header(icns_file) -> bool:
    buffer = icns_file.read(8)
    magic, file_length = struct.unpack('>4si',buffer)

    if magic != b'icns':
        print("File magic '{}' is not an 'icns' type".format(magic))
        return False
    else:
        print("Header {")
        print("  char[4] magic = {}".format(magic))
        print("  int file_length = {}".format(file_length))
        print("}")
    
    return True

def parse_icns_icon_data(icns_file):
    while (buffer := icns_file.read(8)):
        icon_type, data_length = struct.unpack('>4si',buffer)

        print("Icon data {")
        print("  char[4] icon_type = {}".format(icon_type))
        print("  int data_length = {}".format(data_length))
        print("}")

        icns_file.seek(data_length-8, os.SEEK_CUR)


def parse_icns_format(path: str):
    with open(path, 'rb') as icns_file:
        if not parse_icns_header(icns_file):
            return

        parse_icns_icon_data(icns_file)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("parse_icns [path]")
        sys.exit()

    path = sys.argv[1]
    parse_icns_format(path)