+++
title = "centos 安装及配置 oh-my-zsh"
date = 2023-02-03 15:42:09
slug = "/linux-zsh"
draft = false
tags = ["Linux","oh-my-zsh"]
toc = false

+++



上篇文章主要演示了如何在Mac电脑的iTerm2软件上安装和配置 `oh-my-zsh` , 本文将演示如何在云服务器上安装 `oh-my-zsh` , 由于整体过程大同小异，所以只记录安装命令以及执行结果，然后重点记录与上篇文章中不太一样的地方。



系统版本：CentOS Linux release 7.9.2009

## 准备工作

查看当前shell：`echo $SHELL`

安装git：`yum install -y git`

安装zsh：`yum install -y zsh`

切换为zsh：`chsh -s /bin/zsh`



**✨✨✨✨说明：**

**在安装过程中可能需要克隆很多github项目，如果你使用的是国内服务器，可能会卡在这一步，这时候可以采用另一种思路，使用[gitee](https://gitee.com/)的镜像项目替换，本文中所有安装以github项目为例，无特殊情况外不再说明，相信在阅读本文的你肯定能找到合适的办法。**

## 安装oh-my-zsh

使用curl或者wget的方式进行安装：

```bash
# curl 安装方式
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# wget 安装方式
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230309132920921.webp" alt="image-20230309132920921" style="zoom: 50%;" />

由于网络问题，国内的服务器（如阿里云、腾讯云等）可能无法访问github，可以克隆[gitee的镜像](https://gitee.com/mirrors/oh-my-zsh)，然后在tools中找到`install.sh`脚本，并在脚本目录下执行安装命令：

```bash
sudo sh ./install.sh
```

## 安装powerline

执行命令（python3）：

```bash
pip3 install powerline-status --user
```

结果：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230309133852565.webp" alt="image-20230309133852565" style="zoom:50%;" />



## 安装主题Powerlevel10k

克隆项目

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

然后编辑配置文件

```bash
# 1. 编辑配置文件
vi ~/.zshrc
# 2. 按照下图的方式修改为：ZSH_THEME="powerlevel10k/powerlevel10k"
# 3. 使配置文件生效
source ~/.zshrc
```

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317142345658.webp" alt="image-20230317142345658" style="zoom:50%;" />

这时候可能会提示：`You are using ZSH version 5.0.2. The minimum required version for Powerlevel10k is 5.1.`

这是因为 yum 中 zsh 的最新版本5.0.2，而我们要安装的 Powerlevel10k 主题对版本的最低要求是 5.1 ，然后在github的issues中找到了[解决方案](https://github.com/Powerlevel9k/powerlevel9k/issues/1355)：

```bash
sudo yum update -y
sudo yum install -y git make ncurses-devel gcc autoconf man
git clone -b zsh-5.8.1 https://github.com/zsh-users/zsh.git /tmp/zsh
cd /tmp/zsh
./Util/preconfig
./configure
sudo make -j 20 install.bin install.modules install.fns
```

在执行完上面的过程，可以通过命令 `zsh --version` 查看版本，这时候大概率仍然是 5.0.2 ，需要我们重新登录下系统。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317141927648.webp" alt="image-20230317141927648" style="zoom:50%;" />

重新登录后，出现以下提示，按照提示操作切换为最新版本即可。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317145430715.webp" alt="image-20230317145430715" style="zoom:50%;" />

```bash
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
```

执行完成后发现版本已经切换到最新版本 5.8.1 了，这时候再次登录系统，发现会自动进入主题Powerlevel10k的配置界面，按照提示选择自己想要的样式即可。

![image-20230317145809815](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317145809815.webp)

## 安装插件

插件的安装方式几乎都一样，同上篇文章，命令如下：

```bash
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
```

安装完成后仍然像修改主题那样修改配置文件：

```bash
# 1. 编辑配置文件
vi ~/.zshrc
# 2. 按照下图的方式修改为:
plugins=(
     git
     zsh-autosuggestions
     zsh-syntax-highlighting 
)
# 3. 使配置文件生效
source ~/.zshrc
```

![image-20230317150822467](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317150822467.webp)



至此，安装完成。
