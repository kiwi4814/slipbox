```log
[root@kiwi4814 /]# yum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec
已加载插件：fastestmirror
Loading mirror speeds from cached hostfile
Could not retrieve mirrorlist http://mirrors.elrepo.org/mirrors-elrepo-kernel.el7 error was
12: Timeout on http://mirrors.elrepo.org/mirrors-elrepo-kernel.el7: (28, 'Connection timed out after 30001 milliseconds')
 * base: la.mirrors.clouvider.net
 * elrepo-kernel: elrepo.org
 * extras: opencolo.mm.fcix.net
 * updates: repos.lax.layerhost.com
软件包 wget-1.14-18.el7_6.1.x86_64 已安装并且是最新版本
无须任何处理
--2023-03-08 03:00:29--  https://download.bt.cn/install/install_6.0.sh
正在解析主机 download.bt.cn (download.bt.cn)... 103.179.243.14, 2001:19f0:7001:54fc:5400:2ff:fe9b:97f9
正在连接 download.bt.cn (download.bt.cn)|103.179.243.14|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度：34178 (33K) [application/octet-stream]
正在保存至: “install.sh”

100%[========================================================================================>] 34,178      --.-K/s 用时 0s

2023-03-08 03:00:35 (96.1 MB/s) - 已保存 “install.sh” [34178/34178])


+----------------------------------------------------------------------
| Bt-WebPanel FOR CentOS/Ubuntu/Debian
+----------------------------------------------------------------------
| Copyright © 2015-2099 BT-SOFT(http://www.bt.cn) All rights reserved.
+----------------------------------------------------------------------
| The WebPanel URL will be http://SERVER_IP:8888 when installed.
+----------------------------------------------------------------------
| 为了您的正常使用，请确保使用全新或纯净的系统安装宝塔面板，不支持已部署项目/环境的系统安装
+----------------------------------------------------------------------

Do you want to install Bt-Panel to the /www directory now?(y/n): y

----------------------------------------------------------------------
为了您的面板使用安全，建议您开启面板SSL，开启后请使用https访问宝塔面板
输入y回车即开启面板SSL并进行下一步安装
输入n回车跳过面板SSL配置，直接进行安装
10秒后将跳过SSL配置，直接进行面板安装
----------------------------------------------------------------------

是否确定开启面板SSL ? (y/n): y
----------------------------------------------------
检查已有其他Web/mysql环境，安装宝塔可能影响现有站点及数据
Web/mysql service is alreday installed,Can't install panel
----------------------------------------------------
已知风险/Enter yes to force installation
输入yes强制安装: yes
---------------------------------------------
Selected download node...
Download node: https://dg2.bt.cn
---------------------------------------------
Swap total sizse: 533500
Synchronizing system time...
Wed Mar  8 03:01:18 EST 2023
Loaded plugins: fastestmirror
base                                                                                                       | 3.6 kB  00:00:00
Could not retrieve mirrorlist http://mirrors.elrepo.org/mirrors-elrepo-kernel.el7 error was
12: Timeout on http://mirrors.elrepo.org/mirrors-elrepo-kernel.el7: (28, 'Connection timed out after 30001 milliseconds')
elrepo-kernel                                                                                              | 3.0 kB  00:00:00
extras                                                                                                     | 2.9 kB  00:00:00
updates                                                                                                    | 2.9 kB  00:00:00
Loading mirror speeds from cached hostfile
 * base: ridgewireless.mm.fcix.net
 * elrepo-kernel: elrepo.org
 * extras: mirror.chpc.utah.edu
 * updates: la.mirrors.clouvider.net
Resolving Dependencies
--> Running transaction check
---> Package ntp.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed
--> Processing Dependency: ntpdate = 4.2.6p5-29.el7.centos.2 for package: ntp-4.2.6p5-29.el7.centos.2.x86_64
--> Processing Dependency: libcrypto.so.10(OPENSSL_1.0.2)(64bit) for package: ntp-4.2.6p5-29.el7.centos.2.x86_64
--> Processing Dependency: libopts.so.25()(64bit) for package: ntp-4.2.6p5-29.el7.centos.2.x86_64
--> Running transaction check
---> Package autogen-libopts.x86_64 0:5.18-5.el7 will be installed
---> Package ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2 will be installed
---> Package openssl-libs.x86_64 1:1.0.1e-60.el7 will be updated
--> Processing Dependency: openssl-libs(x86-64) = 1:1.0.1e-60.el7 for package: 1:openssl-1.0.1e-60.el7.x86_64
---> Package openssl-libs.x86_64 1:1.0.2k-25.el7_9 will be an update
--> Running transaction check
---> Package openssl.x86_64 1:1.0.1e-60.el7 will be updated
---> Package openssl.x86_64 1:1.0.2k-25.el7_9 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

==================================================================================================================================
 Package                          Arch                    Version                                  Repository                Size
==================================================================================================================================
Installing:
 ntp                              x86_64                  4.2.6p5-29.el7.centos.2                  base                     549 k
Installing for dependencies:
 autogen-libopts                  x86_64                  5.18-5.el7                               base                      66 k
 ntpdate                          x86_64                  4.2.6p5-29.el7.centos.2                  base                      87 k
Updating for dependencies:
 openssl                          x86_64                  1:1.0.2k-25.el7_9                        updates                  494 k
 openssl-libs                     x86_64                  1:1.0.2k-25.el7_9                        updates                  1.2 M

Transaction Summary
==================================================================================================================================
Install  1 Package  (+2 Dependent packages)
Upgrade             ( 2 Dependent packages)

Total download size: 2.4 M
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
(1/5): openssl-1.0.2k-25.el7_9.x86_64.rpm                                                                  | 494 kB  00:00:00
(2/5): openssl-libs-1.0.2k-25.el7_9.x86_64.rpm                                                             | 1.2 MB  00:00:00
(3/5): ntpdate-4.2.6p5-29.el7.centos.2.x86_64.rpm                                                          |  87 kB  00:00:00
(4/5): ntp-4.2.6p5-29.el7.centos.2.x86_64.rpm                                                              | 549 kB  00:00:00
(5/5): autogen-libopts-5.18-5.el7.x86_64.rpm                                                               |  66 kB  00:00:01
----------------------------------------------------------------------------------------------------------------------------------
Total                                                                                             1.7 MB/s | 2.4 MB  00:00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Updating   : 1:openssl-libs-1.0.2k-25.el7_9.x86_64                                                                          1/7
  Installing : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                                                                         2/7
  Installing : autogen-libopts-5.18-5.el7.x86_64                                                                              3/7
  Installing : ntp-4.2.6p5-29.el7.centos.2.x86_64                                                                             4/7
  Updating   : 1:openssl-1.0.2k-25.el7_9.x86_64                                                                               5/7
  Cleanup    : 1:openssl-1.0.1e-60.el7.x86_64                                                                                 6/7
  Cleanup    : 1:openssl-libs-1.0.1e-60.el7.x86_64                                                                            7/7
  Verifying  : 1:openssl-libs-1.0.2k-25.el7_9.x86_64                                                                          1/7
  Verifying  : autogen-libopts-5.18-5.el7.x86_64                                                                              2/7
  Verifying  : 1:openssl-1.0.2k-25.el7_9.x86_64                                                                               3/7
  Verifying  : ntpdate-4.2.6p5-29.el7.centos.2.x86_64                                                                         4/7
  Verifying  : ntp-4.2.6p5-29.el7.centos.2.x86_64                                                                             5/7
  Verifying  : 1:openssl-libs-1.0.1e-60.el7.x86_64                                                                            6/7
  Verifying  : 1:openssl-1.0.1e-60.el7.x86_64                                                                                 7/7

Installed:
  ntp.x86_64 0:4.2.6p5-29.el7.centos.2

Dependency Installed:
  autogen-libopts.x86_64 0:5.18-5.el7                           ntpdate.x86_64 0:4.2.6p5-29.el7.centos.2

Dependency Updated:
  openssl.x86_64 1:1.0.2k-25.el7_9                              openssl-libs.x86_64 1:1.0.2k-25.el7_9

Complete!
 8 Mar 16:02:02 ntpdate[20364]: step time serv
 ===============
 ===============
 Installing collected packages: pycparser, cffi, cryptography, pyOpenSSl
ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
aliyun-python-sdk-core 2.13.30 requires cryptography<3.3,>=2.9.2, but you have cryptography 39.0.2 which is incompatible.
Successfully installed cffi-1.15.1 cryptography-39.0.2 pyOpenSSl-23.0.0 pycparser-2.21
WARNING: You are using pip version 20.3.3; however, version 23.0.1 is available.
You should consider upgrading via the '/www/server/panel/pyenv/bin/python3.7 -m pip install --upgrade pip' command.
1
Starting Bt-Panel... Bt-Panel (pid 21169) already running
Starting Bt-Tasks... Bt-Tasks (pid 21188) already running
username: onv4iav7
Stopping Bt-Tasks...	done
Stopping Bt-Panel...	done
Starting Bt-Panel....	done
Starting Bt-Tasks... 	done
Loaded plugins: fastestmirror
epel/x86_64/metalink                                                                                       |  24 kB  00:00:00
https://ridgewireless.mm.fcix.net/epel/7/x86_64/repodata/repomd.xml: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
It was impossible to connect to the CentOS servers.
This could mean a connectivity issue in your environment, such as the requirement to configure a proxy,
or a transparent proxy that tampers with TLS security, or an incorrect system clock.
Please collect information about the specific failure that occurs in your environment,
using the instructions in: https://access.redhat.com/solutions/1527033 and create a bug on https://bugs.centos.org/

https://abqix.mm.fcix.net/epel/7/x86_64/repodata/repomd.xml: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
https://mirror.fcix.net/epel/7/x86_64/repodata/repomd.xml: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
epel                                                                                                       | 4.7 kB  00:00:00
epel/x86_64/group_gz           FAILED
https://ridgewireless.mm.fcix.net/epel/7/x86_64/repodata/e4cea0a9cc6c17b6a5a433398d9a5fec9eb7bd89dde2d4a6bc6adbf7c5e18b54-comps-Everything.x86_64.xml.gz: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
epel/x86_64/updateinfo         FAILED
https://abqix.mm.fcix.net/epel/7/x86_64/repodata/6a19b409df69bdc3da1f18dae03e1dc0d6a3683f283f3fde3014588caabdfad9-updateinfo.xml.bz2: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
epel/x86_64/group_gz           FAILED
https://abqix.mm.fcix.net/epel/7/x86_64/repodata/e4cea0a9cc6c17b6a5a433398d9a5fec9eb7bd89dde2d4a6bc6adbf7c5e18b54-comps-Everything.x86_64.xml.gz: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
epel/x86_64/primary_db         FAILED
https://ridgewireless.mm.fcix.net/epel/7/x86_64/repodata/91d754299f9915762e7ec1ecaf416a8954b7110cbf4cbe7d775a19cb201a04cc-primary.sqlite.bz2: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
epel/x86_64/updateinfo         FAILED
https://ridgewireless.mm.fcix.net/epel/7/x86_64/repodata/6a19b409df69bdc3da1f18dae03e1dc0d6a3683f283f3fde3014588caabdfad9-updateinfo.xml.bz2: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
epel/x86_64/primary_db         FAILED
https://abqix.mm.fcix.net/epel/7/x86_64/repodata/91d754299f9915762e7ec1ecaf416a8954b7110cbf4cbe7d775a19cb201a04cc-primary.sqlite.bz2: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
epel/x86_64/updateinfo         FAILED                                                           ]  0.0 B/s |    0 B  --:--:-- ETA
https://mirror.atl.genesisadaptive.com/epel/7/x86_64/repodata/6a19b409df69bdc3da1f18dae03e1dc0d6a3683f283f3fde3014588caabdfad9-updateinfo.xml.bz2: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
(1/3): epel/x86_64/group_gz                                                                                |  99 kB  00:00:00
(2/3): epel/x86_64/primary_db                                                                              | 7.0 MB  00:00:01
epel/x86_64/updateinfo         FAILED
https://epel.mirror.shastacoe.net/epel/7/x86_64/repodata/6a19b409df69bdc3da1f18dae03e1dc0d6a3683f283f3fde3014588caabdfad9-updateinfo.xml.bz2: [Errno 14] curl#60 - "The certificate issuer's certificate has expired. Check your system date and time."
Trying other mirror.
(3/3): epel/x86_64/updateinfo                                                                              | 1.0 MB  00:00:00
Loading mirror speeds from cached hostfile
Could not retrieve mirrorlist http://mirrors.elrepo.org/mirrors-elrepo-kernel.el7 error was
12: Timeout on http://mirrors.elrepo.org/mirrors-elrepo-kernel.el7: (28, 'Connection timed out after 30002 milliseconds')
 * base: ridgewireless.mm.fcix.net
 * elrepo-kernel: elrepo.org
 * epel: d2lzkl7pfhq30w.cloudfront.net
 * extras: mirror.chpc.utah.edu
 * updates: la.mirrors.clouvider.net
Resolving Dependencies
--> Running transaction check
---> Package firewalld.noarch 0:0.4.3.2-8.el7 will be updated
---> Package firewalld.noarch 0:0.6.3-13.el7_9 will be an update
--> Processing Dependency: python-firewall = 0.6.3-13.el7_9 for package: firewalld-0.6.3-13.el7_9.noarch
--> Processing Dependency: firewalld-filesystem = 0.6.3-13.el7_9 for package: firewalld-0.6.3-13.el7_9.noarch
--> Running transaction check
---> Package firewalld-filesystem.noarch 0:0.4.3.2-8.el7 will be updated
---> Package firewalld-filesystem.noarch 0:0.6.3-13.el7_9 will be an update
---> Package python-firewall.noarch 0:0.4.3.2-8.el7 will be updated
---> Package python-firewall.noarch 0:0.6.3-13.el7_9 will be an update
--> Processing Conflict: firewalld-0.6.3-13.el7_9.noarch conflicts selinux-policy < 3.13.1-118.el7
--> Restarting Dependency Resolution with new changes.
--> Running transaction check
---> Package selinux-policy.noarch 0:3.13.1-102.el7 will be updated
--> Processing Dependency: selinux-policy = 3.13.1-102.el7 for package: selinux-policy-targeted-3.13.1-102.el7.noarch
--> Processing Dependency: selinux-policy = 3.13.1-102.el7 for package: selinux-policy-targeted-3.13.1-102.el7.noarch
---> Package selinux-policy.noarch 0:3.13.1-268.el7_9.2 will be an update
--> Processing Dependency: policycoreutils >= 2.5-24 for package: selinux-policy-3.13.1-268.el7_9.2.noarch
--> Processing Dependency: libsemanage >= 2.5-13 for package: selinux-policy-3.13.1-268.el7_9.2.noarch
--> Running transaction check
---> Package libsemanage.x86_64 0:2.5-4.el7 will be updated
---> Package libsemanage.x86_64 0:2.5-14.el7 will be an update
---> Package policycoreutils.x86_64 0:2.5-8.el7 will be updated
---> Package policycoreutils.x86_64 0:2.5-34.el7 will be an update
---> Package selinux-policy-targeted.noarch 0:3.13.1-102.el7 will be updated
---> Package selinux-policy-targeted.noarch 0:3.13.1-268.el7_9.2 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

==================================================================================================================================
 Package                                 Arch                   Version                             Repository               Size
==================================================================================================================================
Updating:
 firewalld                               noarch                 0.6.3-13.el7_9                      updates                 449 k
 selinux-policy                          noarch                 3.13.1-268.el7_9.2                  updates                 498 k
Updating for dependencies:
 firewalld-filesystem                    noarch                 0.6.3-13.el7_9                      updates                  51 k
 libsemanage                             x86_64                 2.5-14.el7                          base                    151 k
 policycoreutils                         x86_64                 2.5-34.el7                          base                    917 k
 python-firewall                         noarch                 0.6.3-13.el7_9                      updates                 355 k
 selinux-policy-targeted                 noarch                 3.13.1-268.el7_9.2                  updates                 7.0 M

Transaction Summary
==================================================================================================================================
Upgrade  2 Packages (+5 Dependent packages)

Total download size: 9.4 M
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
(1/7): firewalld-0.6.3-13.el7_9.noarch.rpm                                                                 | 449 kB  00:00:00
(2/7): firewalld-filesystem-0.6.3-13.el7_9.noarch.rpm                                                      |  51 kB  00:00:00
(3/7): python-firewall-0.6.3-13.el7_9.noarch.rpm                                                           | 355 kB  00:00:00
(4/7): selinux-policy-3.13.1-268.el7_9.2.noarch.rpm                                                        | 498 kB  00:00:00
(5/7): libsemanage-2.5-14.el7.x86_64.rpm                                                                   | 151 kB  00:00:00
(6/7): policycoreutils-2.5-34.el7.x86_64.rpm                                                               | 917 kB  00:00:00
(7/7): selinux-policy-targeted-3.13.1-268.el7_9.2.noarch.rpm                                               | 7.0 MB  00:00:00
----------------------------------------------------------------------------------------------------------------------------------
Total                                                                                              18 MB/s | 9.4 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Updating   : libsemanage-2.5-14.el7.x86_64                                                                                 1/14
  Updating   : policycoreutils-2.5-34.el7.x86_64                                                                             2/14
  Updating   : selinux-policy-3.13.1-268.el7_9.2.noarch                                                                      3/14
  Updating   : python-firewall-0.6.3-13.el7_9.noarch                                                                         4/14
  Updating   : firewalld-filesystem-0.6.3-13.el7_9.noarch                                                                    5/14
  Updating   : firewalld-0.6.3-13.el7_9.noarch                                                                               6/14
  Updating   : selinux-policy-targeted-3.13.1-268.el7_9.2.noarch                                                             7/14
  Cleanup    : firewalld-0.4.3.2-8.el7.noarch                                                                                8/14
  Cleanup    : selinux-policy-targeted-3.13.1-102.el7.noarch                                                                 9/14
  Cleanup    : selinux-policy-3.13.1-102.el7.noarch                                                                         10/14
  Cleanup    : firewalld-filesystem-0.4.3.2-8.el7.noarch                                                                    11/14
  Cleanup    : python-firewall-0.4.3.2-8.el7.noarch                                                                         12/14
  Cleanup    : policycoreutils-2.5-8.el7.x86_64                                                                             13/14
  Cleanup    : libsemanage-2.5-4.el7.x86_64                                                                                 14/14
  Verifying  : selinux-policy-targeted-3.13.1-268.el7_9.2.noarch                                                             1/14
  Verifying  : policycoreutils-2.5-34.el7.x86_64                                                                             2/14
  Verifying  : libsemanage-2.5-14.el7.x86_64                                                                                 3/14
  Verifying  : firewalld-filesystem-0.6.3-13.el7_9.noarch                                                                    4/14
  Verifying  : firewalld-0.6.3-13.el7_9.noarch                                                                               5/14
  Verifying  : selinux-policy-3.13.1-268.el7_9.2.noarch                                                                      6/14
  Verifying  : python-firewall-0.6.3-13.el7_9.noarch                                                                         7/14
  Verifying  : firewalld-filesystem-0.4.3.2-8.el7.noarch                                                                     8/14
  Verifying  : firewalld-0.4.3.2-8.el7.noarch                                                                                9/14
  Verifying  : python-firewall-0.4.3.2-8.el7.noarch                                                                         10/14
  Verifying  : policycoreutils-2.5-8.el7.x86_64                                                                             11/14
  Verifying  : libsemanage-2.5-4.el7.x86_64                                                                                 12/14
  Verifying  : selinux-policy-targeted-3.13.1-102.el7.noarch                                                                13/14
  Verifying  : selinux-policy-3.13.1-102.el7.noarch                                                                         14/14

Updated:
  firewalld.noarch 0:0.6.3-13.el7_9                           selinux-policy.noarch 0:3.13.1-268.el7_9.2

Dependency Updated:
  firewalld-filesystem.noarch 0:0.6.3-13.el7_9                          libsemanage.x86_64 0:2.5-14.el7
  policycoreutils.x86_64 0:2.5-34.el7                                   python-firewall.noarch 0:0.6.3-13.el7_9
  selinux-policy-targeted.noarch 0:3.13.1-268.el7_9.2

Complete!
Created symlink from /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service to /usr/lib/systemd/system/firewalld.service.
Created symlink from /etc/systemd/system/multi-user.target.wants/firewalld.service to /usr/lib/systemd/system/firewalld.service.
success
curl: (28) Operation timed out after 10001 milliseconds with 0 out of 0 bytes received
==================================================================
Congratulations! Installed successfully!
==================================================================
外网面板地址: https://89.208.254.83:29621/30f690d0
内网面板地址: https://89.208.254.83:29621/30f690d0
username: onv4iav7
password: 2e63b02f
If you cannot access the panel,
release the following panel port [29621] in the security group
若无法访问面板，请检查防火墙/安全组是否有放行面板[29621]端口
因已开启面板自签证书，访问面板会提示不匹配证书，请参考以下链接配置证书
https://www.bt.cn/bbs/thread-105443-1-1.html
==================================================================
Time consumed: 7 Minute!
```

