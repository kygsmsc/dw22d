- name: 加载自定义提要
      run: |
        chmod +x $DIY_P3_SH
        cd openwrt
        $GITHUB_WORKSPACE/$DIY_P3_SH
