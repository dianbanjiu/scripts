# 实用脚本合辑

**在执行脚本之前，请确保已经赋予脚本可执行权限**  

## blog.py
使用方式：在 hugo 站点的根目录下执行下面的命令  
```shell
$ ./blog.py create "blogTitle" # 创建新的博客文章  
$ ./blog.py push "commits" # 推送文章及渲染结果到远程仓库 
```

## termux.sh
可以在安装完 termux 之后进行一些自动化的简单配置，主要包括
- 开启双层特殊键
- 关闭震动反馈
- 安装 oh my zsh 与其插件 zsh-syntax-highlighting
- 启用内部存储（需手动确认）

## docker.sh  
建议在执行该脚本时使用普通用户，而非超级用户。  
- 根据 docker 官方文档的安装步骤总结的安装脚本。  
- Docker CE 及 Docker Registry 更改为中科大的镜像源（前者是用来下载 docker，后者用来获取镜像的），加速国内下载的速度。  
- 将 docker 添加至当前用户组，之后以该用户身份使用 docker 时，可以不用加 sudo  

## keybord
将其添加到开机自启动脚本当中，可以在系统开机的时候关掉笔记本的自带键盘

## zsh-installation
下载 oh-my-zsh 及 zsh-syntax 和 zsh-autosuggestions 两个插件。  

## gtd.sh
一个非常简单的倒计时程序，使用方法：  
```shell
$ ./gtd.sh 30s  
$ ./gtd.sh 2h
```

在未指定单位时，默认是秒。  


## rm.sh
其中包含一个简单的函数，当使用 rm 命令的时候，将需要删除的文件移动至主目录下的 .trash 目录。  
