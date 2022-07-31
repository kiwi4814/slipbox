---
Date: 2021-12-26 13:38:01
---
- MetaData
	- Date : 2021-12-26 13:38:01
	- DailyNotes : [[2021-12-26_周日]]
	- Link : 
	- Tag : #ZK卡片 #Linux 

### 一、安装Node
- 查看当前yum中最新的node版本
	```bash
	# 升级yum版本
	yum update
	```
	
- 安装

  ```shell
  # 安装目录
  cd /usr/local/bin
  # 创建文件夹
  mkdir nodejs
  # 下载
  wget https://npm.taobao.org/mirrors/node/v14.16.0/node-v14.16.0-linux-x64.tar.xz
  # 解压
  xz -d node-v16.13.1-linux-x64.tar.xz
  tar -xvf node-v16.13.1-linux-x64.tar
  ```

  

- 配置环境变量

  ```shell
  vim /etc/profile
  source /etc/profile
  ```

  

  ```shell
  export NODE_HOME=/usr/local/bin/nodejs/node-v16.13.1-linux-x64
  export PATH=$NODE_HOME/bin:$PATH
  ```

- 查看版本

  ```shell
  [root@hecs-x-medium-2-linux-20200630164425 ~]# node -v
  v16.13.1
  [root@hecs-x-medium-2-linux-20200630164425 ~]# npm -v
  8.1.2
  ```

### 二、安装git

- centos默认带有git 1.8.3，需要先移除

  ```
  yum remove git
  ```

- 安装依赖

  ```
  yum install zlib-devel
  yum install autoconf
  yum install automake
  sudo yum install perl-ExtUtils-MakeMaker
  yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
  ```

- 进入解压后的目录，执行安装前检查：

  ```bash
  make configure
  ```

  声明安装目录：

  ```bash
  ./configure --prefix=/usr/local/git
  ```

  `/usr/local` 是 Linux 平台默认程序目录。

  执行最后安装：

  ```bash
  sudo make install
  ```

- 验证

  ```
  [root@hecs-x-medium-2-linux-20200630164425 git-2.9.5]# git --version
  -bash: /usr/bin/git: No such file or directory
  [root@hecs-x-medium-2-linux-20200630164425 git-2.9.5]# ln -s /usr/local/git /usr/bin/git
  [root@hecs-x-medium-2-linux-20200630164425 git-2.9.5]# git --version
  -bash: /usr/bin/git: Is a directory
  [root@hecs-x-medium-2-linux-20200630164425 git-2.9.5]# vim /etc/profile
  [root@hecs-x-medium-2-linux-20200630164425 git-2.9.5]# source /etc/profile
  [root@hecs-x-medium-2-linux-20200630164425 git-2.9.5]# git --version
  git version 2.9.5
  ```

  分析：

  git安装到/usr/local/git/目录内了，而centos默认该目录没有在搜索目录内。

  解决办法是建立一个软链接。

  然后配置环境变量。

  ```
  export GIT_HOME=/usr/local/git
  export PATH=$GIT_HOME/bin:$PATH
  ```

### 三、安装python和pip3

- 安装环境依赖

  ```
  yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
  ```

- 下载安装包

  ```
  cd /usr/local
  wget https://www.python.org/ftp/python/3.9.9/Python-3.9.9.tgz
  ```

- 安装

  ```
  # 创建安装文件夹
  mkdir /usr/local/python3
  # 解压安装包
  tar -xvf Python-3.9.9.tgz
  # 进入解压之后的文件夹
  cd Python-3.9.9
  # 配置安装目录
  ./configure --prefix=/usr/local/python3
  # 编译源码
  make
  # 执行源码安装
  make install
  ```

- 软链接&&测试

  ```
  ln -s /usr/local/python3/bin/python3  /usr/bin/python3
  [root@hecs-x-medium-2-linux-20200630164425 bin]# pip3 -V
  pip 9.0.3 from /usr/lib/python3.6/site-packages (python 3.6)
  [root@hecs-x-medium-2-linux-20200630164425 bin]# python3
  Python 3.6.8 (default, Nov 16 2020, 16:55:22) 
  [GCC 4.8.5 20150623 (Red Hat 4.8.5-44)] on linux
  
  ```

  然后发现centos自带了python 3.6.8和，囧，不折腾了先。[参考链接。](https://cloud.tencent.com/developer/article/1693084)

### 四、安装go

- 直接使用yum安装了

  ```
  yum -y install golang
  go version
  go version go1.15.14 linux/amd64
  ```

  

### 五、安装hugo

参考链接：[centos 7.x-64x 安装 hugo【附源码】_无锋剑客_51CTO博客](https://blog.51cto.com/michaelkang/2364007)

（1）增加配置文件

```
vim /etc/yum.repos.d/hugo.repo 

[daftaupe-hugo]
name=Copr repo for hugo owned by daftaupe
baseurl=https://copr-be.cloud.fedoraproject.org/results/daftaupe/hugo/epel-7-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/daftaupe/hugo/pubkey.gpg
repo_gpgcheck=0
enabled=1
```

（2）执行安装

```
yum -y install hugo
```

（3）检查版本

```
hugo version
hugo v0.91.1 linux/amd64 BuildDate=2021-12-22T16:48:53Z
```

### 六、使用Caddy

未完待续，先试试[[使用Hugo+Github Pages搭建个人博客]]



