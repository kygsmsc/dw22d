**English** | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

# 在线编译——Openwrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

使用 GitHub Actions 在线云构建 OpenWrt 的固件 

## 使用方法

- 单击 Actions 按钮进入在线运行界面。
- 因 GitHub Actions 某未知原因，无法在编云编译固件时利用 SSH 定制编译配置（编译固件时会出错自动停止），特改成了“配置文件生成”和“固件编译”两部分。
- 第一步在线生成对应openwrt及分支的.config 文件。
- 将生成的.config文件中的内容拷贝到config目录下对应openwrt分支的.config文件中。
- 再 Actions （操作） 页面上选择“固件自动编译”，并设置对应参数，要和“配置文件生成”时同样的参数。
- 单击 Run workflow 按钮。
- 构建完成后，会在 Actions （操作） 页面对应执行完成的编译项目下生成ZIP的下载文件，或直接在“发布”区找到最新固件下载。

## 技巧 
### OPENWRT:
remotes/origin/HEAD -> origin/main
remotes/origin/lede-17.01
remotes/origin/main
remotes/origin/master
remotes/origin/openwrt-18.06
remotes/origin/openwrt-19.07
remotes/origin/openwrt-21.02
remotes/origin/openwrt-22.03
remotes/origin/openwrt-23.05
remotes/origin/openwrt-24.10

v17.01.0   v17.01.0-rc1   v17.01.0-rc2   v17.01.1       v17.01.2       v17.01.3   v17.01.4       v17.01.5       v17.01.6   v17.01.7
v18.06.0   v18.06.0-rc1   v18.06.0-rc2   v18.06.1       v18.06.2       v18.06.3   v18.06.4       v18.06.5       v18.06.6   v18.06.7
v18.06.8   v18.06.9       v19.07.0       v19.07.0-rc1   v19.07.0-rc2   v19.07.1   v19.07.10      v19.07.2       v19.07.3   v19.07.4
v19.07.5   v19.07.6       v19.07.7       v19.07.8       v19.07.9       v21.02.0   v21.02.0-rc1   v21.02.0-rc2   v21.02.0-rc3
v21.02.0-rc4   v21.02.1   v21.02.2       v21.02.3       v21.02.4       v21.02.5   v21.02.6       v21.02.7       v22.03.0
v22.03.0-rc1   v22.03.0-rc2   v22.03.0-rc3   v22.03.0-rc4   v22.03.0-rc5   v22.03.0-rc6   v22.03.1   v22.03.2   v22.03.3   v22.03.4
v22.03.5       v22.03.6       v22.03.7       v23.05.0       v23.05.0-rc1   v23.05.0-rc2   v23.05.0-rc3          v23.05.0-rc4
v23.05.1       v23.05.2       v23.05.3       v23.05.4       v23.05.5

###LEDE:
remotes/origin/HEAD -> origin/master
remotes/origin/master

20200408     20200416     20200915     20211107     20220401     20220505     20220716     20221001     20230609

###IMMORTALWRT:
remotes/origin/HEAD -> origin/master
remotes/origin/master
remotes/origin/openwrt-18.06
remotes/origin/openwrt-18.06-k5.4
remotes/origin/openwrt-21.02
remotes/origin/openwrt-23.05
remotes/origin/openwrt-24.10

v21.02.0       v21.02.1       v21.02.2       v21.02.3   v21.02.4   v21.02.5   v21.02.6   v21.02.7   v23.05.0   v23.05.0-rc1
v23.05.0-rc2   v23.05.0-rc3   v23.05.0-rc4   v23.05.1   v23.05.2   v23.05.3   v23.05.45

###LIENOL:
remotes/origin/19.07
remotes/origin/21.02
remotes/origin/22.03
remotes/origin/23.05
remotes/origin/24.10
remotes/origin/HEAD -> origin/24.10
remotes/origin/main

## 感谢

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## 许可证 

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
