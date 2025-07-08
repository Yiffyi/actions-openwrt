#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

cp $GITHUB_WORKSPACE/600-custom-change-txpower-and-dfs.patch package/firmware/wireless-regdb/patches/

cat <<EOF > package/base-files/files/etc/board.d/99-yiffyi
. /lib/functions/uci-defaults.sh

board_config_update

#ucidef_set_timezone 'CST-8'
ucidef_set_ntpserver 'ntp1.aliyun.com' 'time.windows.com' 'time.apple.com'
ucidef_set_ssh_authorized_key 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTLjpK+Muyugr2FJgl8GfXfbKBSKWSY1WLozAcJFYIG eddsa-key-20240129'

board_config_flush

exit 0
EOF
