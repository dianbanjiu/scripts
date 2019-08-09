# termux.sh
可以在安装完 termux 之后进行一些自动化的简单配置，主要包括
- 开启双层特殊键
- 关闭震动反馈
- 更改镜像源为中科大
- 安装 oh my zsh 与其插件 zsh-syntax-highlighting
- 启用内部存储（需手动确认）
- 使用 vim-plug 安装以下几个 vim 插件（插件的具体内容以及一些 vim 的简单配置位于我的另一个库 dianbanjiu/.vimrc 中，[点击此处到达](https://github.com/dianbanjiu/.vimrc)）
    - vim-airline

## docker.sh  
建议在执行该脚本时使用普通用户，而非超级用户。  
- 根据 docker 官方文档的安装步骤总结的安装脚本。  
- Docker CE 及 Docker Registry 更改为中科大的镜像源（前者是用来下载 docker，后者用来获取镜像的），加速国内下载的速度。  
- 将 docker 添加至当前用户组，之后以该用户身份使用 docker 时，可以不用加 sudo  
