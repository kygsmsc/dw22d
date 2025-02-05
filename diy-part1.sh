#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
#rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #新的argon主题
#git clone https://github.com/jerrykuku/luci-app-argon-config package/lean/luci-app-argon-config  #argon主题设置（编译时候选上,在固件的‘系统’里面）
#git clone https://github.com/tty228/luci-app-serverchan.git package/lean/luci-app-serverchan  #微信推送
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/lean/luci-app-smartdns  #smartdns DNS加速
#git clone https://github.com/garypang13/luci-app-eqos.git package/lean/luci-app-eqos  #内网IP限速工具
#git clone https://github.com/jerrykuku/node-request.git package/lean/node-request  #京东签到依赖
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/lean/luci-app-jd-dailybonus  #京东签到
#git clone https://github.com/small-5/luci-app-adblock-plus package/lean/luci-app-adblock-plus  #adblock plus+ 去广告

# Add a feed source
rm -rf tmp
# sed -i '$a src-git MrH723 https://github.com/MrH723/openwrt-packages' feeds.conf.default
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
sed -i '$a src-git printing https://github.com/jastheace/openwrt-printing-packages.git' feeds.conf.default # 添加CUPS打印项
# sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
# echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# echo 'src-git fichenx https://github.com/fichenx/openwrt-package' >>feeds.conf.default

#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
#./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
#rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
#rm -rf feeds/packages/utils/v2dat
#rm -rf feeds/packages/lang/golang
#rm -rf {*passwall*,*bypass*,*homeproxy*,*mihomo*}
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

# sed -i "/helloworld/d" "feeds.conf.default"
# echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"

# ./scripts/feeds clean

# 使用方式：
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

# 对于强迫症的同学（有报错信息、或Lean源码编译出错的情况），请尝试删除冲突的插件
# rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

# git tag
# git branch
# git checkout v23.05.4 #在tag里有版本号，填入你要的版本号，我选我现在最新的v23.05.4

