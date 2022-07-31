---
Date: 2022-03-27 18:24:39
---
- MetaData
	- Date : 2022-03-27 18:24:39
	- DailyNotes : [[2022-03-27_周日]]
	- Link : [群晖 | 6.2最新获取root权限设置root密码方法 – Vedio Talk - VLOG、科技、生活、乐分享](https://www.vediotalk.com/archives/2211)
	- Tag : #ZK卡片 



#### 一、控制面板—-终端机和SNMP里，开启SSH功能

#### 二、登陆群晖的SSH，用系统默认用户登陆

```bash
ssh admin@192.168.50.100
```

#### 三、登陆后输入以下命令切换至root账号，这时还需在输入一次你的群晖登陆密码

```bash
sudo -i
```

#### 四、输入以下命令进入到ssh的目录

```bash
cd /etc/ssh
```

#### 五、给sshd_config赋予755的权限

```bash
chmod 755 sshd_config
```

#### 六、修改config配置文件内容

```bash
vi /etc/ssh/sshd_config
```

参考下面的修改，将`#PermitRootLogin prohibit-password`那一行的注释取消，然后后面的值改为yes

```
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

#### 七、重启群晖

```bash
reboot
```

#### 八、重启完成再次以系统默认账户登录群晖SSH

```bash
ssh admin@192.168.50.100
```

#### 九、再次输入以下命令切换至root账号，这时还需在输入一次你的群晖登陆密码

```bash
sudo -i
```

#### 十、输入下面命令修改root默认密码，xxx改为你要设置的密码，回车没有任何提示即可

```bash
synouser --setpw root xxx
```

#### 十一、这时再从新以root权限就可以登陆到ssh了，ip记得改为你群晖的ip哦。

```bash
ssh root@192.168.50.100
```

