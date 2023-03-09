## 准备工作

查看当前shell：`echo $SHELL`

安装git：yum install -y git

安装zsh：yum install -y zsh

切换为zsh：chsh -s /bin/zsh



## 配置oh-my-zsh

下面来逐步安装和配置oh-my-zsh。



使用curl或者wget的方式进行安装：

```bash
# curl 安装方式
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# wget 安装方式
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

由于网络问题，可能会出现如下报错：

安装oh-my-zsh

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230309132920921.webp" alt="image-20230309132920921" style="zoom:25%;" />



## 安装powerline

pip3 install powerline-status --user

![image-20230309133852565](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230309133852565.webp)



## 配置主题

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

提示：You are using ZSH version 5.0.2. The minimum required version for Powerlevel10k is 5.1.



[解决方案](https://github.com/Powerlevel9k/powerlevel9k/issues/1355)

```
sudo yum update -y
sudo yum install -y git make ncurses-devel gcc autoconf man
git clone -b zsh-5.8.1 https://github.com/zsh-users/zsh.git /tmp/zsh
cd /tmp/zsh
./Util/preconfig
./configure
sudo make -j 20 install.bin install.modules install.fns
```

在执行完上面的过程，查看版本仍然是5.0.2.

```
zsh --version
```



重新登录后，出现以下提示，按照提示操作切换为最新版本。

```
You are using ZSH version 5.0.2. The minimum required version for Powerlevel10k is 5.1.
Type 'echo $ZSH_VERSION' to see your current zsh version.
You have /usr/local/bin/zsh with version 5.8.1 but this is not what you are using.
To change your user shell, type the following command:

  echo /usr/local/bin/zsh | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
[root@kiwi4814]~# echo /usr/local/bin/zsh | sudo tee -a /etc/shells
/usr/local/bin/zsh
[root@kiwi4814]~# chsh -s /usr/local/bin/zsh
Changing shell for root.
Shell changed.
[root@kiwi4814]~#
```

## 安装主题





