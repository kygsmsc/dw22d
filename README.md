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

- 创建 .config 文件并构建 OpenWrt 固件。因此，在创建仓库以构建自己的固件之前，您可以通过简单的搜索来查看其他人是否已经构建了满足您需求的固件 [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- 在你的仓库介绍中添加一些你构建的固件的元信息（比如固件架构和已安装的软件包），这样可以节省其他人的时间。

## 学分

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
