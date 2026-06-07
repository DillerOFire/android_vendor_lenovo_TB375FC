#!/bin/bash
#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Generates the Android.mk / Android.bp / *-vendor.mk shells from the
# proprietary-files.txt list.

set -e

DEVICE=tb375fc
VENDOR=lenovo

LINEAGE_ROOT="$(realpath "$(dirname "$(readlink -f "$0")")"/../../..)"
HELPER="${LINEAGE_ROOT}/tools/extract-utils/extract_utils.sh"
[ -f "$HELPER" ] || HELPER="${LINEAGE_ROOT}/vendor/lineage/tools/extract-utils/extract_utils.sh"
. "$HELPER"

setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" true

write_headers
write_makefiles "$MY_DIR/proprietary-files.txt" true
write_footers
