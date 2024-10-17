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
# cd $WORK_PATH 目录下,先运行的 public.h -> 设备.h -> scripts/feeds install -a
# 必须的文件

USER_NAME='admin'        # 用户名 admin
device_name='G-DOCK'      # 设备名
wifi_name="OpenWrt"       # Wifi 名字 
WIFI_PASSWORD="1234567890"              # wifi密码，切记密码最少8位 admin
VERSION_name='KYGS'                     # 系统版本名称 KYGS
VERSION_TIME=$(date "+%Y%m%d")          # 自动时间更新时版本号: 20200320
lan_ip='192.168.2.1'                                                        # Lan Ip地址
utc_name='Asia\/Shanghai'                                                   # 时区
delete_bootstrap=true                                                       # 是否删除默认主题 true 、false
default_theme='argon'                                                       # 默认主题 结合主题文件夹名字
theme_argon='https://github.com/sypopo/luci-theme-argon-mc.git'             # 主题地址
openClash_url='https://github.com/vernesong/OpenClash.git'                  # OpenClash包地址
adguardhome_url='https://github.com/rufengsuixing/luci-app-adguardhome.git' # adguardhome 包地址
lienol_url='https://github.com/Lienol/openwrt-package.git'                  # Lienol 包地址
vssr_url_rely='https://github.com/jerrykuku/lua-maxminddb.git'              # vssr lua-maxminddb依赖
vssr_url='https://github.com/jerrykuku/luci-app-vssr.git'                   # vssr地址
vssr_plus_rely='https://github.com/Leo-Jo-My/my.git'                        # vssr_plus 依赖
vssr_plus='https://github.com/Leo-Jo-My/luci-app-vssr-plus.git'             # vssr_plus 地址
filter_url='https://github.com/destan19/OpenAppFilter.git'                  # AppFilter 地址
DEFAULT_PATH="./user/shared/defaults.h" # 默认文件配置目录
# 命令


# echo '修改用户名'
# sed -i 's/#define\s*SYS_USER_ROOT\s*"admin"/#define  SYS_USER_ROOT     "'$USER_NAME'"/g' $DEFAULT_PATH

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改想要的root密码
#sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:你的密码/g' package/lean/default-settings/files/zzz-default-settings

# echo "修改机器名称"
# sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate

# echo "修改wifi名称"
# sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# echo "修改Wif密码"
# sed -i "s/1234567890/$WIFI_PASSWORD/g" $DEFAULT_PATH

echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=[0-9]*/FIRMWARE_BUILDS_REV="$VERSION_namez$VERSION_TIME"/g" ./versions.inc

echo "设置lan ip"
sed -i "s/192.168.1.1/$lan_ip/g" package/base-files/files/bin/config_generate

echo "修改时区"
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate

echo "修改默认主题"
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci

if [ $delete_bootstrap ]; then
  echo "去除默认bootstrap主题"
  sed -i '/\+luci-theme-bootstrap/d' feeds/luci/collections/luci/Makefile
  sed -i '/\+luci-theme-bootstrap/d' package/feeds/luci/luci/Makefile
  sed -i '/CONFIG_PACKAGE_luci-theme-bootstrap=y/d' .config
  sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
fi

echo '添加主题argon'
(git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon && {
    [ -d package/luci-theme-argon ] && echo "CONFIG_PACKAGE_luci-theme-argon=y" >> .config 
}) 
# 添加主题argon-设置
(git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config && {
    [ -d package/luci-app-argon-config ] && echo "CONFIG_PACKAGE_luci-app-argon-config=y" >> .config 
})

# echo '添加OpenClash'
# git clone $openClash_url package/lean/luci-app-openclash

#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=n' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=n' >>.config

echo '添加Lienol包'
git clone $lienol_url package/Lienol

echo '添加Passwall'
echo 'CONFIG_PACKAGE_luci-app-passwall=n' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=n' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=n' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=n' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=n' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=n' >>.config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=n' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=n' >>.config

echo '添加文件浏览器'
echo 'CONFIG_PACKAGE_luci-app-filebrowser=y' >>.config
echo 'CONFIG_PACKAGE_luci-i18n-filebrowser-zh-cn=y' >>.config

# echo '添加adguardhome'
# git clone $adguardhome_url package/lean/luci-app-adguardhome
# echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
# echo 'CONFIG_PACKAGE_luci-i18n-adguardhome-zh-cn=y'  >> .config

# echo '添加HelloWord,并使用包默认的配置'  # TODO 这个的配置文件和SSP 冲突
# git clone $vssr_url_rely package/lean/lua-maxminddb
# git clone $vssr_url package/lean/luci-app-vssr
# echo 'CONFIG_PACKAGE_luci-app-vssr=y' >> .config
# echo 'CONFIG_PACKAGE_luci-i18n-vssr-zh-cn=y'  >> .config

# echo '添加OpenAppFilter过滤器'
# git clone $filter_url package/OpenAppFilter
# echo 'CONFIG_PACKAGE_luci-app-oaf=y' >>.config
# echo 'CONFIG_PACKAGE_kmod-oaf=y' >>.config
# echo 'CONFIG_PACKAGE_appfilter=y' >>.config
# echo 'CONFIG_PACKAGE_luci-i18n-oaf-zh-cn=y' >>.config

# echo '添加Leo-Jo-My的Hello World,并且使用默认包配置'
# git clone $vssr_plus_rely package/lean/luci-vssr-plus-rely
# git clone $vssr_plus_rely package/lean/luci-app-vssr-plus
# echo 'CONFIG_PACKAGE_luci-app-vssr-plus=y' >> .config
# echo 'CONFIG_PACKAGE_luci-i18n-vssr-plus-zh-cn=y'  >> .config




# 修改插件名字（修改名字后不知道会不会对插件功能有影响，自己多测试）
# sed -i 's/"BaiduPCS Web"/"百度网盘"/g' package/lean/luci-app-baidupcs-web/luasrc/controller/baidupcs-web.lua
# sed -i 's/cbi("qbittorrent"),_("qBittorrent")/cbi("qbittorrent"),_("BT下载")/g' package/lean/luci-app-qbittorrent/luasrc/controller/qbittorrent.lua
# sed -i 's/"aMule设置"/"电驴下载"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
# sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
# sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
# sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
# sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
# sed -i 's/"实时流量监测"/"流量"/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
# sed -i 's/"KMS 服务器"/"KMS激活"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.zh-cn.po
# sed -i 's/"TTYD 终端"/"命令窗"/g' package/lean/luci-app-ttyd/po/zh-cn/terminal.po
# sed -i 's/"USB 打印服务器"/"打印服务"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
# sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
# sed -i 's/"Web 管理"/"Web管理"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po
# sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
# sed -i 's/"带宽监控"/"监视"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po

sed -i 's/"aMule设置"/"电驴下载"/g' `grep "aMule设置" -rl ./`
sed -i 's/"网络存储"/"NAS"/g' `grep "网络存储" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"实时流量监测"/"流量"/g' `grep "实时流量监测" -rl ./`
# sed -i 's/"KMS 服务器"/"KMS激活"/g' `grep "KMS 服务器" -rl ./`
# sed -i 's/"TTYD 终端"/"命令窗"/g' `grep "TTYD 终端" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
# sed -i 's/"Web 管理"/"Web"/g' `grep "Web 管理" -rl ./`
sed -i 's/"管理权"/"密码设置"/g' `grep "管理权" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
# sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`

# 2. 添加公共自定义功能，设备单个的到设备 sh文件中添加
######################################################################
#以下选项是定义你需要的功能（y=集成,n=忽略），重新写入到 .config 文件
######################################################################
# $WORK_DIR/trunk 执行在这个目录下
set -u

# 是否超频(多选一）
# echo "CONFIG_FIRMWARE_CPU_900MHZ=n" >>.config
# echo "CONFIG_FIRMWARE_CPU_600MHZ=n" >>.config

# 科学
echo "CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y" >>.config # SS plus+
echo "CONFIG_FIRMWARE_INCLUDE_SSSERVER=n" >>.config    # SS server
echo "CONFIG_FIRMWARE_INCLUDE_SSOBFS=y" >>.config      # simple-obfs混淆插件,SS 开了才可以打开
echo "CONFIG_FIRMWARE_INCLUDE_V2RAY=n" >>.config  # 集成v2ray执行文件（3.8M左右)，如果不集成，会从网上下载下来执行，不影响正常使用
echo "CONFIG_FIRMWARE_INCLUDE_TROJAN=n" >>.config # 集成trojan执行文件(1.1M左右)，如果不集成，会从网上下载下来执行，不影响正常使用

# 文件
echo "CONFIG_FIRMWARE_INCLUDE_CADDY=y" >>.config    # 在线文件管理服务
echo "CONFIG_FIRMWARE_INCLUDE_CADDYBIN=n" >>.config # 集成 caddu执行文件，此文件有13M,请注意固件大小。如果不集成，会从网上下载下来执行，不影响正常使用

# 广告
echo "CONFIG_FIRMWARE_INCLUDE_KOOLPROXY=n" >>.config   # KP 广告过滤
echo "CONFIG_FIRMWARE_INCLUDE_ADGUARDHOME=n" >>.config # ADGUARD 广告拦截
echo "CONFIG_FIRMWARE_INCLUDE_ADBYBY=n" >>.config      # adbyby plus+

# 代理
echo "CONFIG_FIRMWARE_INCLUDE_KUMASOCKS=y" >>.config # KUMA
echo "CONFIG_FIRMWARE_INCLUDE_SRELAY=n" >>.config    # SOCKS proxy
echo "CONFIG_FIRMWARE_INCLUDE_TUNSAFE=n" >>.config   # TUNSAFE
echo "CONFIG_FIRMWARE_INCLUDE_SRELAY=n" >>.config    # srelay
echo "CONFIG_FIRMWARE_INCLUDE_IPT2SOCKS=n" >>.config # IPT2

# 穿透
echo "CONFIG_FIRMWARE_INCLUDE_FRPC=n" >>.config    # 内网穿透FRPC
echo "CONFIG_FIRMWARE_INCLUDE_FRPS=n" >>.config    # 内网穿透FRPS
echo "CONFIG_FIRMWARE_INCLUDE_ALIDDNS=n" >>.config # 阿里DDNS

#网易云解锁
echo "CONFIG_FIRMWARE_INCLUDE_WYY=n" >>.config
#网易云解锁GO版本执行文件（4M多）注意固件超大小
echo "CONFIG_FIRMWARE_INCLUDE_WYYBIN=n" >>.config

# DNS 有关
echo "CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER=n" >>.config # DNS-FORWARDER
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y" >>.config     # smartdns
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNSBIN=y" >>.config  # smartdns二进制文件

# 其他
echo "CONFIG_FIRMWARE_INCLUDE_MENTOHUST=n" >>.config  # MENTOHUST
echo "CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT=n" >>.config # SCUTCLIENT
echo "CONFIG_FIRMWARE_INCLUDE_CADDY=n" >>.config      # 在线文件管理服务
echo "CONFIG_FIRMWARE_INCLUDE_MENTOHUST=n" >>.config  # MENTOHUST 锐捷认证
echo "CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT=n" >>.config # SCUT校园网客户端
echo "CONFIG_FIRMWARE_INCLUDE_CADDYBIN=n" >>.config   # 集成caddu执行文件，此文件有13M,请注意固件大小。如果不集成，会从网上下载下来执行，不影响正常使用
echo "CONFIG_FIRMWARE_INCLUDE_ZEROTIER=n" >>.config   # zerotier ~1.3M

# 3. 删除预设项
################################################################################################
# 因不同型号配置功能不一样，所以先把配置项删除，如果你自己要添加其他的，也要写上删除这一条，切记！！！
################################################################################################
# Default
# sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR/d" .config           # 删除配置项 dropbear SSH
# sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR_FAST_CODE/d" .config # 删除配置项 dropbear symmetrica
# sed -i "/CONFIG_FIRMWARE_INCLUDE_OPENSSH/d" .config            # 删除配置项 OpenSSH
# sed -i "/CONFIG_FIRMWARE_INCLUDE_DDNS_SSL/d" .config           # HTTPS support for DDNS client
# sed -i "/CONFIG_FIRMWARE_INCLUDE_HTTPS/d" .config              # HTTPS support

# C大
# sed -i "/CONFIG_FIRMWARE_INCLUDE_MENTOHUST/d" .config    # 删除配置项 MENTOHUST
# sed -i "/CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT/d" .config   # 删除配置项 SCUTCLIENT
# sed -i "/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS/d" .config  # 删除配置项 SS plus+
# sed -i "/CONFIG_FIRMWARE_INCLUDE_SSSERVER/d" .config     # 删除配置项 SS server
# sed -i "/CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER/d" .config # 删除配置项 DNS-FORWARDER
# sed -i "/CONFIG_FIRMWARE_INCLUDE_ADBYBY/d" .config       # 删除配置项 adbyby plus+
# sed -i "/CONFIG_FIRMWARE_INCLUDE_TUNSAFE/d" .config      # 删除配置项 TUNSAFE
# sed -i "/CONFIG_FIRMWARE_INCLUDE_ALIDDNS/d" .config      # 删除配置项 阿里 DDNS
# sed -i "/CONFIG_FIRMWARE_INCLUDE_SMARTDNS/d" .config     # 删除配置项 smartDns
# sed -i "/CONFIG_FIRMWARE_INCLUDE_SRELAY/d" .config       # 删除配置项 srelay 代理
# sed -i "/CONFIG_FIRMWARE_INCLUDE_WYY/d" .config          # 删除配置项 网易云解锁
# sed -i "/CONFIG_FIRMWARE_INCLUDE_WYYBIN/d" .config       # 删除配置项 网易云解锁GO版本执行文件（4M多）注意固件超大小


#--------------------------------------------------------------------------------------------------------------


