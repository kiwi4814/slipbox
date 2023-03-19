---
Date: 2022-03-27 18:24:39
---
- MetaData
	- Date : 2022-03-27 18:24:39
	- DailyNotes : [[2022-03-27_周日]]
	- Link : [群晖 | 6.2最新获取root权限设置root密码方法 – Vedio Talk - VLOG、科技、生活、乐分享](https://www.vediotalk.com/archives/2211)
	- Tag : #ZK卡片 

##### 1、控制面板—-终端机和SNMP里，开启SSH功能

##### 2、登陆群晖的SSH，用系统默认用户登陆

```bash
ssh admin@192.168.50.100
```

##### 3、登陆后输入以下命令切换至root账号，这时还需在输入一次你的群晖登陆密码

```bash
sudo -i
```

##### 4、输入以下命令进入到ssh的目录

```bash
cd /etc/ssh
```

##### 5、给sshd_config赋予755的权限

```bash
chmod 755 sshd_config
```

##### 6、修改config配置文件内容

```bash
vi /etc/ssh/sshd_config
```

参考下面的修改，将`#PermitRootLogin prohibit-password`那一行的注释取消，然后后面的值改为yes

```ini
"/etc/ssh/sshd_config" 127L, 3398C
#   $OpenBSD: sshd_config,v 1.100 2016/08/15 12:32:04 naddy Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_dsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
PermitRootLogin yes
#StrictModes yes
#MaxAuthTries 6
#MaxSessions 10

#PubkeyAuthentication yes

# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
# but this is overridden so installations will only check .ssh/authorized_keys
#AuthorizedKeysFile .ssh/authorized_keys
```

##### 7、重启群晖

```bash
reboot
```

##### 8、重启完成再次以系统默认账户登录群晖SSH

```bash
ssh admin@192.168.50.100
```

##### 9、再次输入以下命令切换至root账号，这时还需在输入一次你的群晖登陆密码

```bash
sudo -i
```

##### 10、输入下面命令修改root默认密码，xxx改为你要设置的密码，回车没有任何提示即可

```bash
synouser --setpw root xxx
```

##### 11、这时再从新以root权限就可以登陆到ssh了，ip记得改为你群晖的ip哦。

```bash
ssh root@192.168.50.100
```



### 附录（群晖的内核版本）

查看命令：

-   `cat /etc/issue`：这个命令会输出当前系统的版本信息，包括发行版名称和版本号。
    
-   `uname -a`：这个命令会输出当前系统的内核版本信息。
    
-   `cat /proc/version`：这个命令会输出当前系统的版本信息，包括内核版本、gcc版本和发行版信息等。



uname -a 的执行结果是 `Linux kiwinas 4.4.59+ #23739 SMP PREEMPT Tue Jul 3 19:51:03 CST 2018 x86_64 GNU/Linux synology_apollolake_918+`，具体含义为：

-   `Linux`：操作系统的内核类型，这里表示当前系统使用的是 Linux 内核。
    
-   `kiwinas`：系统的主机名，也就是机器的名称。
    
-   `4.4.59+`：当前系统使用的 Linux 内核版本号。
    
-   `#23739 SMP PREEMPT Tue Jul 3 19:51:03 CST 2018`：内核编译的时间和日期，以及所使用的编译选项。
    
-   `x86_64`：系统的处理器架构类型，这里表示当前系统使用的是 64 位处理器架构。
    
-   `GNU/Linux`：系统的操作系统名称，这里表示当前系统是一个基于 GNU 工具集的 Linux 操作系统。
    
-   `synology_apollolake_918+`：这是群晖 NAS 所使用的芯片型号，Apollolake 代表芯片架构，918 + 代表机型号。



在群晖系统的命令中，需要使用 `synopkg` 命令来管理软件包。`synopkg` 命令是群晖自带的软件包管理工具，它可以用来安装、升级和删除软件包。以下是一些常用的 `synopkg` 命令：

-   `synopkg list`：列出所有已安装的软件包。
    
-   `synopkg install <package-name>`：安装指定的软件包。
    
-   `synopkg remove <package-name>`：删除指定的软件包。
    
-   `synopkg upgrade <package-name>`：升级指定的软件包。
