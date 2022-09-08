操作系统：  CentOS 7.6 64bit

### 安装步骤

#### 1. 下载MySQL yum包

```bash
wget http://repo.mysql.com/mysql57-community-release-el7-11.noarch.rpm
```

安装日志：

```
--2022-09-08 22:55:04--  http://repo.mysql.com/mysql57-community-release-el7-11.noarch.rpm
Resolving repo.mysql.com (repo.mysql.com)... 23.206.160.230
Connecting to repo.mysql.com (repo.mysql.com)|23.206.160.230|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 25680 (25K) [application/x-redhat-package-manager]
Saving to: ‘mysql57-community-release-el7-11.noarch.rpm’

100%[=========================================================================================================================================================================>] 25,680      31.8KB/s   in 0.8s

2022-09-08 22:55:06 (31.8 KB/s) - ‘mysql57-community-release-el7-11.noarch.rpm’ saved [25680/25680]
```



#### 2. 安装MySQL源

```bash
rpm -Uvh mysql57-community-release-el7-11.noarch.rpm
```

安装日志：

```
warning: mysql57-community-release-el7-11.noarch.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:mysql57-community-release-el7-11 ################################# [100%]
```

#### 3. 安装MySQL服务端（需要等待一段时间）

```bash
yum install -y mysql-community-server
```

安装过程报错：

```
......
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
Importing GPG key 0x5072E1F5:
 Userid     : "MySQL Release Engineering <mysql-build@oss.oracle.com>"
 Fingerprint: a4a9 4068 76fc bd3c 4567 70c8 8c71 8d3b 5072 e1f5
 Package    : mysql57-community-release-el7-11.noarch (installed)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql


Public key for mysql-community-client-5.7.39-1.el7.x86_64.rpm is not installed


 Failing package is: mysql-community-client-5.7.39-1.el7.x86_64
 GPG Keys are configured as: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
```

原因是Mysql的GPG升级了，需要重新获取:

```bash
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
```

然后再次执行`yum install -y mysql-community-server`:

```
......
Total size: 210 M
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Warning: RPMDB altered outside of yum.
  Installing : mysql-community-common-5.7.39-1.el7.x86_64 			1/6
  Installing : mysql-community-libs-5.7.39-1.el7.x86_64 			2/6
  Installing : mysql-community-client-5.7.39-1.el7.x86_64 			3/6
  Installing : mysql-community-server-5.7.39-1.el7.x86_64 			4/6
  Installing : mysql-community-libs-compat-5.7.39-1.el7.x86_64 		5/6
  Erasing    : 1:mariadb-libs-5.5.68-1.el7.x86_64 					6/6
  Verifying  : mysql-community-client-5.7.39-1.el7.x86_64 			1/6
  Verifying  : mysql-community-server-5.7.39-1.el7.x86_64 			2/6
  Verifying  : mysql-community-common-5.7.39-1.el7.x86_64 			3/6
  Verifying  : mysql-community-libs-5.7.39-1.el7.x86_64 			4/6
  Verifying  : mysql-community-libs-compat-5.7.39-1.el7.x86_64 		5/6
  Verifying  : 1:mariadb-libs-5.5.68-1.el7.x86_64 					6/6

Installed:
  mysql-community-libs.x86_64 0:5.7.39-1.el7                         mysql-community-libs-compat.x86_64 0:5.7.39-1.el7                         mysql-community-server.x86_64 0:5.7.39-1.el7

Dependency Installed:
  mysql-community-client.x86_64 0:5.7.39-1.el7                                                             mysql-community-common.x86_64 0:5.7.39-1.el7

Replaced:
  mariadb-libs.x86_64 1:5.5.68-1.el7

Complete!
```



#### 4. 启动MySQL

```bash
systemctl start mysqld.service
```

#### 5. 检查是否启动成功

```bash
systemctl status mysqld.service
```

```
 mysqld.service - MySQL Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2022-09-08 23:08:46 CST; 7s ago
     Docs: man:mysqld(8)
           http://dev.mysql.com/doc/refman/en/using-systemd.html
  Process: 22378 ExecStart=/usr/sbin/mysqld --daemonize --pid-file=/var/run/mysqld/mysqld.pid $MYSQLD_OPTS (code=exited, status=0/SUCCESS)
  Process: 22290 ExecStartPre=/usr/bin/mysqld_pre_systemd (code=exited, status=0/SUCCESS)
 Main PID: 22381 (mysqld)
    Tasks: 27
   Memory: 327.0M
   CGroup: /system.slice/mysqld.service
           └─22381 /usr/sbin/mysqld --daemonize --pid-file=/var/run/mysqld/mysqld.pid

Sep 08 23:08:35 VM-12-8-centos systemd[1]: Starting MySQL Server...
Sep 08 23:08:46 VM-12-8-centos systemd[1]: Started MySQL Server.
```



#### 6. 获取临时密码
