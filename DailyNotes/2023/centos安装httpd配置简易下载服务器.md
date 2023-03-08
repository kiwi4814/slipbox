> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [juejin.cn](https://juejin.cn/post/6933128611310354440)

## 一、安装 Apache httpd 服务

查看是否安装成功命令：

```bash
httpd -v
```

如果未安装，则执行

```bash
yum -y install httpd
```

再次查看服务信息

```bash
[root@test ~]# httpd -version
Server version: Apache/2.4.6 (CentOS)
Server built:   Nov 16 2020 16:18:20
```

## 二、配置修改

### 2.1. welcome.conf 配置

```bash
vim /etc/httpd/conf.d/welcome.conf
```

将 `Options -Indexes` 修改为 `Options +Indexes`

```properties
# 
# This configuration file enables the default "Welcome" page if there
# is no default index page present for the root URL.  To disable the
# Welcome page, comment out all the lines below. 
#
# NOTE: if this file is removed, it will be restored on upgrades.
#
<LocationMatch "^/+$">
    Options +Indexes
    ErrorDocument 403 /.noindex.html
</LocationMatch>

<Directory /usr/share/httpd/noindex>
    AllowOverride None
    Require all granted
</Directory>

Alias /.noindex.html /usr/share/httpd/noindex/index.html
Alias /noindex/css/bootstrap.min.css /usr/share/httpd/noindex/css/bootstrap.min.css
Alias /noindex/css/open-sans.css /usr/share/httpd/noindex/css/open-sans.css
Alias /images/apache_pb.gif /usr/share/httpd/noindex/images/apache_pb.gif
Alias /images/poweredby.png /usr/share/httpd/noindex/images/poweredby.png

```

### 2.2. httpd.conf 配置

首先创建文件存储的文件夹

```bash
mkdir -p /usr/httpd/file
```

编辑修改 `httpd.conf`

```bash
vim /etc/httpd/conf/httpd.conf
```

#### 2.2.1. 端口

端口默认为 80

```properties
#
# Listen: Allows you to bind Apache to specific IP addresses and/or
# ports, instead of the default. See also the <VirtualHost>
# directive.
#
# Change this to Listen on specific IP addresses as shown below to 
# prevent Apache from glomming onto all bound IP addresses.
#
#Listen 12.34.56.78:80
Listen 80

```

#### 2.2.2. 文件路径

```properties
#
# DocumentRoot: The directory out of which you will serve your
# documents. By default, all requests are taken from this directory, but
# symbolic links and aliases may be used to point to other locations.
#
#DocumentRoot "/var/www/html"
DocumentRoot "/usr/httpd/file"

#
# Relax access to content within /var/www.
#
#<Directory "/var/www">
<Directory "/usr/httpd/file">
    AllowOverride None
    # Allow open access:
    Require all granted
</Directory>

# Further relax access to the default document root:
#<Directory "/var/www/html">
<Directory "/usr/httpd/file">
...
</Directory>

```

#### 2.2.3. 中文乱码问题

在 `Directory` 一栏加入 `IndexOptions Charset=UTF-8`

[`注：在FollowSymLinks之后`]

```properties
<Directory "/usr/httpd/file">
    #
    # Possible values for the Options directive are "None", "All",
    # or any combination of:
    #   Indexes Includes FollowSymLinks SymLinksifOwnerMatch ExecCGI MultiViews
    #
    # Note that "MultiViews" must be named *explicitly* --- "Options All"
    # doesn't give it to you.
    #
    # The Options directive is both complicated and important.  Please see
    # http://httpd.apache.org/docs/2.4/mod/core.html#options
    # for more information.
    #
    Options Indexes FollowSymLinks
    IndexOptions Charset=UTF-8

    #
    # AllowOverride controls what directives may be placed in .htaccess files.
    # It can be "All", "None", or any combination of the keywords:
    #   Options FileInfo AuthConfig Limit
    #
    AllowOverride None

    #
    # Controls who can get stuff from this server.
    #
    Require all granted
</Directory>


```

`httpd.conf` 文件末尾加上 `IndexOptions Charset=GB2312`

```properties
#
# EnableMMAP and EnableSendfile: On systems that support it, 
# memory-mapping or the sendfile syscall may be used to deliver
# files.  This usually improves server performance, but must
# be turned off when serving from networked-mounted 
# filesystems or if support for these functions is otherwise
# broken on your system.
# Defaults if commented: EnableMMAP On, EnableSendfile Off
#
#EnableMMAP off
EnableSendfile on
IndexOptions Charset=GB2312

```

### 2.3. autoindex.conf 配置

修改目录文件名不被截断

```bash
vim /etc/httpd/conf.d/autoindex.conf
```

找到此行

```properties
IndexOptions FancyIndexing HTMLTable VersionSort
```

修改为如下

```properties
IndexOptions FancyIndexing HTMLTable VersionSort NameWidth=*
```

三、启动 / 停止 httpd 服务
-------------------

重启 http 服务器

```bash
systemctl restart httpd
```

停止 http 服务器

```bash
systemctl stop httpd
```

四、查看 httpd 服务状态
----------------

```
[root@test file]# systemctl status httpd.service
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
   Active: active (running) since 四 2021-02-25 16:31:19 CST; 16s ago
     Docs: man:httpd(8)
           man:apachectl(8)
 Main PID: 8756 (httpd)
   Status: "Total requests: 39; Current requests/sec: 4.33; Current traffic:  10KB/sec"
   CGroup: /system.slice/httpd.service
           ├─8756 /usr/sbin/httpd -DFOREGROUND
           ├─8757 /usr/sbin/httpd -DFOREGROUND
           ├─8758 /usr/sbin/httpd -DFOREGROUND
           ├─8760 /usr/sbin/httpd -DFOREGROUND
           ├─8761 /usr/sbin/httpd -DFOREGROUND
           ├─8762 /usr/sbin/httpd -DFOREGROUND
           ├─8763 /usr/sbin/httpd -DFOREGROUND
           ├─8764 /usr/sbin/httpd -DFOREGROUND
           └─8765 /usr/sbin/httpd -DFOREGROUND

2月 25 16:31:19 test systemd[1]: Starting The Apache HTTP Server...
2月 25 16:31:19 test httpd[8756]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using fe80::ec4:7aff:fe28:86f8. Set the 'ServerName' direct...s this message
2月 25 16:31:19 test systemd[1]: Started The Apache HTTP Server.
Hint: Some lines were ellipsized, use -l to show in full.

```

之后添加文件到 `/usr/httpd/file`，输入服务器的 ip 地址就可以查看所有的文件

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/8f31f2d4889b4d50bb0b823437812e35~tplv-k3u1fbpfcp-zoom-in-crop-mark:4536:0:0:0.awebp)