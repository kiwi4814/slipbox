1. 安装依赖

   ```
   yum install -y make gcc cc gcc-c++ wget openssl-devel libevent libevent-devel openssl
   ```

   ```
   Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager
   
   This system is not registered with an entitlement server. You can use subscription-manager to register.
   
   Determining fastest mirrors
   base                                                                                                                           | 3.6 kB  00:00:00
   docker-ce-stable                                                                                                               | 3.5 kB  00:00:00
   epel                                                                                                                           | 4.7 kB  00:00:00
   extras                                                                                                                         | 2.9 kB  00:00:00
   updates                                                                                                                        | 2.9 kB  00:00:00
   (1/6): epel/x86_64/group_gz                                                                                                    |  99 kB  00:00:00
   (2/6): docker-ce-stable/7/x86_64/primary_db                                                                                    | 117 kB  00:00:00
   (3/6): extras/7/x86_64/primary_db                                                                                              | 250 kB  00:00:00
   (4/6): epel/x86_64/updateinfo                                                                                                  | 1.0 MB  00:00:01
   (5/6): epel/x86_64/primary_db                                                                                                  | 7.0 MB  00:00:06
   (6/6): updates/7/x86_64/primary_db                                                                                             |  22 MB  00:00:23
   Package 1:make-3.82-24.el7.x86_64 already installed and latest version
   Package gcc-4.8.5-44.el7.x86_64 already installed and latest version
   No package cc available.
   Package gcc-c++-4.8.5-44.el7.x86_64 already installed and latest version
   Package wget-1.14-18.el7_6.1.x86_64 already installed and latest version
   Package 1:openssl-devel-1.0.2k-26.el7_9.x86_64 already installed and latest version
   Package 1:openssl-1.0.2k-26.el7_9.x86_64 already installed and latest version
   Resolving Dependencies
   --> Running transaction check
   ---> Package libevent.x86_64 0:2.0.21-4.el7 will be installed
   ---> Package libevent-devel.x86_64 0:2.0.21-4.el7 will be installed
   --> Finished Dependency Resolution
   
   Dependencies Resolved
   
   ======================================================================================================================================================
    Package                                 Arch                            Version                                  Repository                     Size
   ======================================================================================================================================================
   Installing:
    libevent                                x86_64                          2.0.21-4.el7                             base                          214 k
    libevent-devel                          x86_64                          2.0.21-4.el7                             base                           85 k
   
   Transaction Summary
   ======================================================================================================================================================
   Install  2 Packages
   
   Total download size: 298 k
   Installed size: 1.1 M
   Downloading packages:
   (1/2): libevent-devel-2.0.21-4.el7.x86_64.rpm                                                                                  |  85 kB  00:00:00
   (2/2): libevent-2.0.21-4.el7.x86_64.rpm                                                                                        | 214 kB  00:00:00
   ------------------------------------------------------------------------------------------------------------------------------------------------------
   Total                                                                                                                 791 kB/s | 298 kB  00:00:00
   Running transaction check
   Running transaction test
   Transaction test succeeded
   Running transaction
     Installing : libevent-2.0.21-4.el7.x86_64                                                                                                       1/2
     Installing : libevent-devel-2.0.21-4.el7.x86_64                                                                                                 2/2
     Verifying  : libevent-devel-2.0.21-4.el7.x86_64                                                                                                 1/2
     Verifying  : libevent-2.0.21-4.el7.x86_64                                                                                                       2/2
   
   Installed:
     libevent.x86_64 0:2.0.21-4.el7                                         libevent-devel.x86_64 0:2.0.21-4.el7
   
   Complete!
   ```

2. 安装

   ```
   yum install coturn -y
   ```

   ```
   Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-manager
   
   This system is not registered with an entitlement server. You can use subscription-manager to register.
   
   Loading mirror speeds from cached hostfile
   Resolving Dependencies
   --> Running transaction check
   ---> Package coturn.x86_64 0:4.6.2-2.el7 will be installed
   --> Processing Dependency: perl(DBI) for package: coturn-4.6.2-2.el7.x86_64
   --> Processing Dependency: perl(HTTP::Request::Common) for package: coturn-4.6.2-2.el7.x86_64
   --> Processing Dependency: telnet for package: coturn-4.6.2-2.el7.x86_64
   --> Processing Dependency: libhiredis.so.0.12()(64bit) for package: coturn-4.6.2-2.el7.x86_64
   --> Processing Dependency: libpq.so.5()(64bit) for package: coturn-4.6.2-2.el7.x86_64
   --> Running transaction check
   ---> Package hiredis.x86_64 0:0.12.1-2.el7 will be installed
   ---> Package perl-DBI.x86_64 0:1.627-4.el7 will be installed
   --> Processing Dependency: perl(RPC::PlServer) >= 0.2001 for package: perl-DBI-1.627-4.el7.x86_64
   --> Processing Dependency: perl(RPC::PlClient) >= 0.2000 for package: perl-DBI-1.627-4.el7.x86_64
   ---> Package perl-HTTP-Message.noarch 0:6.06-6.el7 will be installed
   --> Processing Dependency: perl(URI) >= 1.10 for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(LWP::MediaTypes) >= 6 for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::Uncompress::Bunzip2) >= 2.021 for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::Compress::Bzip2) >= 2.021 for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(HTTP::Date) >= 6 for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(Encode::Locale) >= 1 for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::Uncompress::RawInflate) for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::Uncompress::Inflate) for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::Uncompress::Gunzip) for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::HTML) for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::Compress::Gzip) for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(IO::Compress::Deflate) for package: perl-HTTP-Message-6.06-6.el7.noarch
   --> Processing Dependency: perl(Compress::Raw::Zlib) for package: perl-HTTP-Message-6.06-6.el7.noarch
   ---> Package postgresql-libs.x86_64 0:9.2.24-8.el7_9 will be installed
   ---> Package telnet.x86_64 1:0.17-66.el7 will be installed
   --> Running transaction check
   ---> Package perl-Compress-Raw-Zlib.x86_64 1:2.061-4.el7 will be installed
   ---> Package perl-Encode-Locale.noarch 0:1.03-5.el7 will be installed
   ---> Package perl-HTTP-Date.noarch 0:6.02-8.el7 will be installed
   --> Processing Dependency: perl(Time::Zone) for package: perl-HTTP-Date-6.02-8.el7.noarch
   ---> Package perl-IO-Compress.noarch 0:2.061-2.el7 will be installed
   --> Processing Dependency: perl(Compress::Raw::Bzip2) >= 2.061 for package: perl-IO-Compress-2.061-2.el7.noarch
   ---> Package perl-IO-HTML.noarch 0:1.00-2.el7 will be installed
   ---> Package perl-LWP-MediaTypes.noarch 0:6.02-2.el7 will be installed
   --> Processing Dependency: mailcap for package: perl-LWP-MediaTypes-6.02-2.el7.noarch
   ---> Package perl-PlRPC.noarch 0:0.2020-14.el7 will be installed
   --> Processing Dependency: perl(Net::Daemon) >= 0.13 for package: perl-PlRPC-0.2020-14.el7.noarch
   --> Processing Dependency: perl(Net::Daemon::Test) for package: perl-PlRPC-0.2020-14.el7.noarch
   --> Processing Dependency: perl(Net::Daemon::Log) for package: perl-PlRPC-0.2020-14.el7.noarch
   ---> Package perl-URI.noarch 0:1.60-9.el7 will be installed
   --> Processing Dependency: perl(Business::ISBN) for package: perl-URI-1.60-9.el7.noarch
   --> Running transaction check
   ---> Package mailcap.noarch 0:2.1.41-2.el7 will be installed
   ---> Package perl-Business-ISBN.noarch 0:2.06-2.el7 will be installed
   --> Processing Dependency: perl(Business::ISBN::Data) >= 20120719.001 for package: perl-Business-ISBN-2.06-2.el7.noarch
   ---> Package perl-Compress-Raw-Bzip2.x86_64 0:2.061-3.el7 will be installed
   ---> Package perl-Net-Daemon.noarch 0:0.48-5.el7 will be installed
   ---> Package perl-TimeDate.noarch 1:2.30-2.el7 will be installed
   --> Running transaction check
   ---> Package perl-Business-ISBN-Data.noarch 0:20120719.001-2.el7 will be installed
   --> Finished Dependency Resolution
   
   Dependencies Resolved
   
   ======================================================================================================================================================
    Package                                      Arch                        Version                                  Repository                    Size
   ======================================================================================================================================================
   Installing:
    coturn                                       x86_64                      4.6.2-2.el7                              epel                         262 k
   Installing for dependencies:
    hiredis                                      x86_64                      0.12.1-2.el7                             epel                          30 k
    mailcap                                      noarch                      2.1.41-2.el7                             base                          31 k
    perl-Business-ISBN                           noarch                      2.06-2.el7                               base                          25 k
    perl-Business-ISBN-Data                      noarch                      20120719.001-2.el7                       base                          24 k
    perl-Compress-Raw-Bzip2                      x86_64                      2.061-3.el7                              base                          32 k
    perl-Compress-Raw-Zlib                       x86_64                      1:2.061-4.el7                            base                          57 k
    perl-DBI                                     x86_64                      1.627-4.el7                              base                         802 k
    perl-Encode-Locale                           noarch                      1.03-5.el7                               base                          16 k
    perl-HTTP-Date                               noarch                      6.02-8.el7                               base                          14 k
    perl-HTTP-Message                            noarch                      6.06-6.el7                               base                          82 k
    perl-IO-Compress                             noarch                      2.061-2.el7                              base                         260 k
    perl-IO-HTML                                 noarch                      1.00-2.el7                               base                          23 k
    perl-LWP-MediaTypes                          noarch                      6.02-2.el7                               base                          24 k
    perl-Net-Daemon                              noarch                      0.48-5.el7                               base                          51 k
    perl-PlRPC                                   noarch                      0.2020-14.el7                            base                          36 k
    perl-TimeDate                                noarch                      1:2.30-2.el7                             base                          52 k
    perl-URI                                     noarch                      1.60-9.el7                               base                         106 k
    postgresql-libs                              x86_64                      9.2.24-8.el7_9                           updates                      235 k
    telnet                                       x86_64                      1:0.17-66.el7                            updates                       64 k
   
   Transaction Summary
   ======================================================================================================================================================
   Install  1 Package (+19 Dependent packages)
   
   Total download size: 2.2 M
   Installed size: 5.9 M
   Downloading packages:
   (1/20): mailcap-2.1.41-2.el7.noarch.rpm                                                                                        |  31 kB  00:00:00
   (2/20): hiredis-0.12.1-2.el7.x86_64.rpm                                                                                        |  30 kB  00:00:00
   (3/20): perl-Business-ISBN-2.06-2.el7.noarch.rpm                                                                               |  25 kB  00:00:00
   (4/20): perl-Business-ISBN-Data-20120719.001-2.el7.noarch.rpm                                                                  |  24 kB  00:00:00
   (5/20): perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64.rpm                                                                         |  32 kB  00:00:00
   (6/20): perl-Compress-Raw-Zlib-2.061-4.el7.x86_64.rpm                                                                          |  57 kB  00:00:00
   (7/20): coturn-4.6.2-2.el7.x86_64.rpm                                                                                          | 262 kB  00:00:00
   (8/20): perl-Encode-Locale-1.03-5.el7.noarch.rpm                                                                               |  16 kB  00:00:00
   (9/20): perl-HTTP-Date-6.02-8.el7.noarch.rpm                                                                                   |  14 kB  00:00:00
   (10/20): perl-HTTP-Message-6.06-6.el7.noarch.rpm                                                                               |  82 kB  00:00:00
   (11/20): perl-IO-Compress-2.061-2.el7.noarch.rpm                                                                               | 260 kB  00:00:00
   (12/20): perl-IO-HTML-1.00-2.el7.noarch.rpm                                                                                    |  23 kB  00:00:00
   (13/20): perl-LWP-MediaTypes-6.02-2.el7.noarch.rpm                                                                             |  24 kB  00:00:00
   (14/20): perl-DBI-1.627-4.el7.x86_64.rpm                                                                                       | 802 kB  00:00:00
   (15/20): perl-Net-Daemon-0.48-5.el7.noarch.rpm                                                                                 |  51 kB  00:00:00
   (16/20): perl-PlRPC-0.2020-14.el7.noarch.rpm                                                                                   |  36 kB  00:00:00
   (17/20): perl-TimeDate-2.30-2.el7.noarch.rpm                                                                                   |  52 kB  00:00:00
   (18/20): perl-URI-1.60-9.el7.noarch.rpm                                                                                        | 106 kB  00:00:00
   (19/20): telnet-0.17-66.el7.x86_64.rpm                                                                                         |  64 kB  00:00:00
   (20/20): postgresql-libs-9.2.24-8.el7_9.x86_64.rpm                                                                             | 235 kB  00:00:00
   ------------------------------------------------------------------------------------------------------------------------------------------------------
   Total                                                                                                                 1.2 MB/s | 2.2 MB  00:00:01
   Running transaction check
   Running transaction test
   Transaction test succeeded
   Running transaction
     Installing : 1:perl-Compress-Raw-Zlib-2.061-4.el7.x86_64                                                                                       1/20
     Installing : perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64                                                                                        2/20
     Installing : perl-IO-Compress-2.061-2.el7.noarch                                                                                               3/20
     Installing : perl-Net-Daemon-0.48-5.el7.noarch                                                                                                 4/20
     Installing : perl-PlRPC-0.2020-14.el7.noarch                                                                                                   5/20
     Installing : perl-DBI-1.627-4.el7.x86_64                                                                                                       6/20
     Installing : perl-IO-HTML-1.00-2.el7.noarch                                                                                                    7/20
     Installing : mailcap-2.1.41-2.el7.noarch                                                                                                       8/20
     Installing : perl-LWP-MediaTypes-6.02-2.el7.noarch                                                                                             9/20
     Installing : hiredis-0.12.1-2.el7.x86_64                                                                                                      10/20
     Installing : perl-Business-ISBN-Data-20120719.001-2.el7.noarch                                                                                11/20
     Installing : perl-Business-ISBN-2.06-2.el7.noarch                                                                                             12/20
     Installing : perl-URI-1.60-9.el7.noarch                                                                                                       13/20
     Installing : 1:perl-TimeDate-2.30-2.el7.noarch                                                                                                14/20
     Installing : perl-HTTP-Date-6.02-8.el7.noarch                                                                                                 15/20
     Installing : perl-Encode-Locale-1.03-5.el7.noarch                                                                                             16/20
     Installing : perl-HTTP-Message-6.06-6.el7.noarch                                                                                              17/20
     Installing : postgresql-libs-9.2.24-8.el7_9.x86_64                                                                                            18/20
     Installing : 1:telnet-0.17-66.el7.x86_64                                                                                                      19/20
     Installing : coturn-4.6.2-2.el7.x86_64                                                                                                        20/20
     Verifying  : 1:telnet-0.17-66.el7.x86_64                                                                                                       1/20
     Verifying  : postgresql-libs-9.2.24-8.el7_9.x86_64                                                                                             2/20
     Verifying  : perl-LWP-MediaTypes-6.02-2.el7.noarch                                                                                             3/20
     Verifying  : perl-Encode-Locale-1.03-5.el7.noarch                                                                                              4/20
     Verifying  : perl-Business-ISBN-2.06-2.el7.noarch                                                                                              5/20
     Verifying  : 1:perl-TimeDate-2.30-2.el7.noarch                                                                                                 6/20
     Verifying  : perl-Business-ISBN-Data-20120719.001-2.el7.noarch                                                                                 7/20
     Verifying  : hiredis-0.12.1-2.el7.x86_64                                                                                                       8/20
     Verifying  : mailcap-2.1.41-2.el7.noarch                                                                                                       9/20
     Verifying  : perl-IO-Compress-2.061-2.el7.noarch                                                                                              10/20
     Verifying  : perl-HTTP-Message-6.06-6.el7.noarch                                                                                              11/20
     Verifying  : perl-IO-HTML-1.00-2.el7.noarch                                                                                                   12/20
     Verifying  : perl-Net-Daemon-0.48-5.el7.noarch                                                                                                13/20
     Verifying  : coturn-4.6.2-2.el7.x86_64                                                                                                        14/20
     Verifying  : perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64                                                                                       15/20
     Verifying  : 1:perl-Compress-Raw-Zlib-2.061-4.el7.x86_64                                                                                      16/20
     Verifying  : perl-DBI-1.627-4.el7.x86_64                                                                                                      17/20
     Verifying  : perl-HTTP-Date-6.02-8.el7.noarch                                                                                                 18/20
     Verifying  : perl-PlRPC-0.2020-14.el7.noarch                                                                                                  19/20
     Verifying  : perl-URI-1.60-9.el7.noarch                                                                                                       20/20
   
   Installed:
     coturn.x86_64 0:4.6.2-2.el7
   
   Dependency Installed:
     hiredis.x86_64 0:0.12.1-2.el7                         mailcap.noarch 0:2.1.41-2.el7                  perl-Business-ISBN.noarch 0:2.06-2.el7
     perl-Business-ISBN-Data.noarch 0:20120719.001-2.el7   perl-Compress-Raw-Bzip2.x86_64 0:2.061-3.el7   perl-Compress-Raw-Zlib.x86_64 1:2.061-4.el7
     perl-DBI.x86_64 0:1.627-4.el7                         perl-Encode-Locale.noarch 0:1.03-5.el7         perl-HTTP-Date.noarch 0:6.02-8.el7
     perl-HTTP-Message.noarch 0:6.06-6.el7                 perl-IO-Compress.noarch 0:2.061-2.el7          perl-IO-HTML.noarch 0:1.00-2.el7
     perl-LWP-MediaTypes.noarch 0:6.02-2.el7               perl-Net-Daemon.noarch 0:0.48-5.el7            perl-PlRPC.noarch 0:0.2020-14.el7
     perl-TimeDate.noarch 1:2.30-2.el7                     perl-URI.noarch 0:1.60-9.el7                   postgresql-libs.x86_64 0:9.2.24-8.el7_9
     telnet.x86_64 1:0.17-66.el7
   
   Complete!
   ```

   检验是否安装成功：

   ```
   which turnserver
   ```

   看到 "/usr/bin/turnserver" 说明安装成功了

   ```
   /usr/bin/turnserver
   ```

3. **用 openssl 生成自签名证书**

   ```
   openssl req -x509 -newkey rsa:2048 -keyout /etc/turn_server_pkey.pem -out /etc/turn_server_cert.pem -days 99999 -nodes
   ```

   执行上面这行命令后，会提示让你输入一些信息:

   ```
   Generating a 2048 bit RSA private key
   ...........................................................................................................................................................................................................+++
   .........................+++
   writing new private key to '/etc/turn_server_pkey.pem'
   -----
   You are about to be asked to enter information that will be incorporated
   into your certificate request.
   What you are about to enter is what is called a Distinguished Name or a DN.
   There are quite a few fields but you can leave some blank
   For some fields there will be a default value,
   If you enter '.', the field will be left blank.
   -----
   Country Name (2 letter code) [XX]:cn
   State or Province Name (full name) []:jiangsu
   Locality Name (eg, city) [Default City]:suzhou
   Organization Name (eg, company) [Default Company Ltd]:keda
   Organizational Unit Name (eg, section) []:keda
   Common Name (eg, your name or your server's hostname) []:keda
   Email Address []:heqifeng@kedacom.com
   ```

   > 原文信息：
   >
   > ![img](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/WX20220601-110159@2x-1024x419.webp)

   信息输入完成之后，自签名证书就生成好了。证书生成的位置是：/etc/turn_server_pkey.pem 和 /etc/turn_server_cert.pem，后面配置的时候会用到这个证书。

4. 配置

   ```
   vim /etc/coturn/turnserver.conf
   ```

   > 原文信息：
   >
   > 改一下里面的这些配置，我的服务器内网 ip 是 172.25.10.25，外网 ip 是 47.111.188.168，域名是 turn.zhiboblog.com，下面配置中的 ip 和域名需要改成你自己的（经过我的实际测试，阿里云服务器按照下面的配置是可以成功搭建的，而有些服务器不行，如果不行的话可以把内网 ip 都改成公网 ip）
   >
   > ```properties
   > # 网卡名
   > relay-device=eth0
   > #内网 IP
   > listening-ip=10.165.35.213
   > listening-port=3478
   > #内网 IP
   > relay-ip=10.165.35.213
   > tls-listening-port=5349
   > # 外网 IP
   > external-ip=180.101.84.10
   > relay-threads=500
   > #打开密码验证
   > lt-cred-mech
   > cert=/etc/turn_server_cert.pem
   > pkey=/etc/turn_server_pkey.pem
   > min-port=40000
   > max-port=65535
   > #设置用户名和密码，创建 IceServer 时使用
   > user=admin:keda123#
   > # 外网 IP 绑定的域名
   > realm=keda119.kedacom.com
   > # 服务器名称，用于 OAuth 认证，默认和 realm 相同，部分浏览器本段不设可能会引发 cors 错误。
   > server-name=keda119.kedacom.com
   > # 认证密码，和前面设置的密码保持一致
   > cli-password=keda123#
   > ```

   实际操作：

   ```
   
   ```

5. 启动

   ```
   // 启动
   systemctl start coturn
   // 关闭
   systemctl stop coturn
   // 设置开机启动
   systemctl enable coturn
   ```

   查看是否启动成功

   ```
   netstat -nltp
   ```

   看到 3478 端口启动了，说明 cotrun 启动成功了。

   





目前进度：能正常启动，但无法通过外网测试，原因是端口未开。