#!/bin/bash
#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Wraps the lineage extract-utils helper. Run with the path to a stock
# TB375FC dump as the argument:
#
#   ./extract-files.sh /path/to/stock-dump
#
# The dump can be either a folder containing /vendor /product /system_ext
# trees, or a single super.img file (in which case we lpunpack/erofs-extract
# it on the fly).

set -e

DEVICE=tb375fc
VENDOR=lenovo

LINEAGE_ROOT="$(realpath "$(dirname "$(readlink -f "$0")")"/../../..)"

HELPER="${LINEAGE_ROOT}/tools/extract-utils/extract_utils.sh"
[ -f "$HELPER" ] || HELPER="${LINEAGE_ROOT}/vendor/lineage/tools/extract-utils/extract_utils.sh"
. "$HELPER"

SRC="${1:-adb}"
KANG="${KANG:-}"
SECTION="${SECTION:-}"

setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" false "$KANG"
extract "$MY_DIR/proprietary-files.txt" "$SRC" "$KANG" --section "$SECTION"

"$MY_DIR/setup-makefiles.sh"
