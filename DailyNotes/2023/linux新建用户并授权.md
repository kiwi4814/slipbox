> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [www.cnblogs.com](https://www.cnblogs.com/imyalost/p/9801426.html)

之前买了一台阿里云服务器，准备用来搭建一些服务，由于使用 root 用户登录进行操作比较敏感，就新建了一个用户，用来登录并进行日常操作。

这篇博客，介绍下 centos7.4 下如何新建用户并且授权。。。

**一、创建新用户**

**1、创建一个新用户：prefma**

``` 
[root@localhost ~]# adduser prefma 
```

**2、为新用户创建初始化密码**

```
[root@localhost~]# passwd prefma
Changing password for user prefma.
New password:             # 输入密码
Retype new password:      # 再次输入密码
passwd: all authentication tokens updated successfully.
```

**二、授权**

个人用户的权限只可以在本 home 下有完整权限，其他目录需要别人授权。经常需要 root 用户的权限，可以通过修改 sudoers 文件来赋予权限。

新创建的用户并不能使用 sudo 命令，需要给他添加授权。

**1、查找 sudoers 文件路径并赋予权限**

[![](http://common.cnblogs.com/images/copycode.gif)](javascript:void(0); "复制代码")

```
1 [root@localhost~]# whereis sudoers                     # 查找sudoers文件路径
2 sudoers: /etc/sudoers /etc/sudoers.d /usr/share/man/man5/sudoers.5.gz
3 [root@localhost~]# ls -l /etc/sudoers                  # 查看权限
4 -r--r----- 1 root root 3938 Sep  6  2017 /etc/sudoers  # 只有读权限
5 [root@localhost~]# chmod -v u+w /etc/sudoers           # 赋予读写权限
6 mode of ‘/etc/sudoers’ changed from 0440 (r--r-----) to 0640 (rw-r-----)
```

[![](http://common.cnblogs.com/images/copycode.gif)](javascript:void(0); "复制代码")

**2、修改 sudoers 文件**

输入命令 vim /etc/sudoers 修改 sudoers 文件，添加新用户信息：

```
Allow root to run any commands anywhere  
root ALL=(ALL) ALL  
prefma ALL=(ALL) ALL #这个是新用户
```

然后输入命令 wq! 保存修改。

**3、收回权限**

```
[root@localhost~]# chmod -v u-w /etc/sudoers  
mode of ‘/etc/sudoers’ changed from 0640 (rw-r-----) to 0440 (r--r-----)
```

**4、新用户登录**

新建连接，使用新创建的用户登录，并进行验证，比如：

```
[prefma@localhost~]$ pwd
/home/prefma
[prefma@localhost~]$ ls -l /etc/sudoers
-r--r----- 1 root root 3995 Oct 16 22:42 /etc/sudoers
```