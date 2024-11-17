#OPENWRT:
#remotes/origin/HEAD -> origin/main
#remotes/origin/lede-17.01
#remotes/origin/main
#remotes/origin/master
#remotes/origin/openwrt-18.06
#remotes/origin/openwrt-19.07
#remotes/origin/openwrt-21.02
#remotes/origin/openwrt-22.03
#remotes/origin/openwrt-23.05
#remotes/origin/openwrt-24.10

#v17.01.0   v17.01.0-rc1   v17.01.0-rc2   v17.01.1       v17.01.2       v17.01.3   v17.01.4       v17.01.5       v17.01.6   v17.01.7
#v18.06.0   v18.06.0-rc1   v18.06.0-rc2   v18.06.1       v18.06.2       v18.06.3   v18.06.4       v18.06.5       v18.06.6   v18.06.7
#v18.06.8   v18.06.9       v19.07.0       v19.07.0-rc1   v19.07.0-rc2   v19.07.1   v19.07.10      v19.07.2       v19.07.3   v19.07.4
#v19.07.5   v19.07.6       v19.07.7       v19.07.8       v19.07.9       v21.02.0   v21.02.0-rc1   v21.02.0-rc2   v21.02.0-rc3
#v21.02.0-rc4   v21.02.1   v21.02.2       v21.02.3       v21.02.4       v21.02.5   v21.02.6       v21.02.7       v22.03.0
#v22.03.0-rc1   v22.03.0-rc2   v22.03.0-rc3   v22.03.0-rc4   v22.03.0-rc5   v22.03.0-rc6   v22.03.1   v22.03.2   v22.03.3   v22.03.4
#v22.03.5       v22.03.6       v22.03.7       v23.05.0       v23.05.0-rc1   v23.05.0-rc2   v23.05.0-rc3          v23.05.0-rc4
#v23.05.1       v23.05.2       v23.05.3       v23.05.4       v23.05.5

#LEDE:
#remotes/origin/HEAD -> origin/master
#remotes/origin/master

#20200408   20200416   20200915   20211107   20220401   20220505   20220716   20221001   20230609

#IMMORTALWRT:
#remotes/origin/HEAD -> origin/master
#remotes/origin/master
#remotes/origin/openwrt-18.06
#remotes/origin/openwrt-18.06-k5.4
#remotes/origin/openwrt-21.02
#remotes/origin/openwrt-23.05
#remotes/origin/openwrt-24.10

#v21.02.0       v21.02.1       v21.02.2       v21.02.3   v21.02.4   v21.02.5   v21.02.6   v21.02.7   v23.05.0   v23.05.0-rc1
#v23.05.0-rc2   v23.05.0-rc3   v23.05.0-rc4   v23.05.1   v23.05.2   v23.05.3   v23.05.45

#LIENOL:
#remotes/origin/19.07
#remotes/origin/21.02
#remotes/origin/22.03
#remotes/origin/23.05
#remotes/origin/24.10
#remotes/origin/HEAD -> origin/24.10
#remotes/origin/main
#-------------------------------------------------------------------------------------------------------------      
      #git fetch --tags --all  # 拉取所有标签和远程分支
      git tag    # 你可以查看所有可用的版本
      git branch -a  # 查看当前使用的版本
      git checkout 21.02.7   # 切换到指定的版本
