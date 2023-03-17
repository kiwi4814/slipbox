最近入手了一个搬瓦工 CN2 GIA 服务器，目的之一是打算给家里的黑群晖做内网穿透用，稍微比较了下目前内网穿透的一些方案，最后决定使用 frp 来实现。此外，我在NameSilo上注册了一个域名

`xxx.com`，最终想实现的效果是，当我访问 `dsm.xxx.com` 的时候自动跳转到群晖管理入口，而当我访问 `drive.xxx.com` 跳转到网盘，以此类推。



下面记录下安装的过程，仅供参考。



**VPS系统信息：CentOS Linux release 7.9.2009**

**VPS公网IP：111.22.33.44**

**群晖系统版本：DSM 6.2-23739**



## frp 介绍

frp 全称为 "Fast Reverse Proxy"，是一种可以将内网服务暴露到外网的工具。通常情况下，如果我们想要从外部访问内网中的服务（比如在公司网络访问家里的设备），需要将内网中的设备（比如路由器）进行端口映射，让外网的请求能够被正确转发到内网中的对应设备上。但是这样做存在一些问题，比如安全性较差、配置复杂等。

而 frp 则提供了一种更加便捷、安全的方法。它可以将内网中的服务通过一个代理服务器暴露到外网，而无需进行端口映射。具体来说，frp 会在内网设备上运行一个客户端程序，将内网服务的请求发送给代理服务器，代理服务器再将请求转发给外网的访问者。这样就能够实现外网访问内网服务的目的。

frp 还具有一些其他的功能，比如支持 TCP/UDP 流量转发、支持多种协议等。它的配置相对简单，且性能较为优秀，因此被广泛应用于内网穿透、反向代理等场景中。



以下是官网对于 frp 的更为专业的介绍：

> frp 是一个专注于内网穿透的高性能的反向代理应用，支持 TCP、UDP、HTTP、HTTPS 等多种协议。可以将内网服务以安全、便捷的方式通过具有公网 IP 节点的中转暴露到公网。
>
> #### 为什么使用 frp ？
>
> 通过在具有公网 IP 的节点上部署 frp 服务端，可以轻松地将内网服务穿透到公网，同时提供诸多专业的功能特性，这包括：
>
> - 客户端服务端通信支持 TCP、KCP 以及 Websocket 等多种协议。
> - 采用 TCP 连接流式复用，在单个连接间承载更多请求，节省连接建立时间。
> - 代理组间的负载均衡。
> - 端口复用，多个服务通过同一个服务端端口暴露。
> - 多个原生支持的客户端插件（静态文件查看，HTTP、SOCK5 代理等），便于独立使用 frp 客户端完成某些工作。
> - 高度扩展性的服务端插件系统，方便结合自身需求进行功能扩展。
> - 服务端和客户端 UI 页面。
>
> #### 原理
>
> frp 主要由 **客户端 (frpc)** 和 **服务端 (frps)** 组成，服务端通常部署在具有公网 IP 的机器上，客户端通常部署在需要穿透的内网服务所在的机器上。
>
> 内网服务由于没有公网 IP，不能被非局域网内的其他用户访问。
>
> 用户通过访问服务端的 frps，由 frp 负责根据请求的端口或其他信息将请求路由到对应的内网机器，从而实现通信。



## 服务端安装

关于如何安装和使用示例 [frp官方中文文档](https://gofrp.org/docs/) 有比较详细的介绍了，此外官网还有很多不同场景下的使用方法，本文主要是入门使用，故对更加深入的使用方法感兴趣的可以自行跳转研究。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317155233056.webp" alt="image-20230317155233056" style="zoom:50%;" />



此外，想要省事一点的可以直接使用[一键安装脚本](https://github.com/MvsCode/frps-onekey)来进行安装，以下内容引用自安装脚本主页的介绍，感谢原作者的无私奉献。

>### Frps 服务端一键配置脚本，Frp 最新版本：0.48.0
>
>*Frp 是一个高性能的反向代理应用，可以帮助您轻松地进行内网穿透，对外网提供服务，支持 tcp, http, https 等协议类型，并且 web 服务支持根据域名进行路由转发。*
>
>- 详情：fatedier (https://github.com/fatedier/frp)
>- 此脚本原作者：clangcn (https://github.com/clangcn/onekey-install-shell)
>
>#### Install（安装）
>
>##### Gitee
>
>```bash
>wget https://gitee.com/mvscode/frps-onekey/raw/master/install-frps.sh -O ./install-frps.sh
>chmod 700 ./install-frps.sh
>./install-frps.sh install
>```
>
>##### Github
>
>```bash
>wget https://raw.githubusercontent.com/MvsCode/frps-onekey/master/install-frps.sh -O ./install-frps.sh
>chmod 700 ./install-frps.sh
>./install-frps.sh install
>```
>
>#### Uninstall（卸载）
>
>```bash
>./install-frps.sh uninstall
>```
>
>#### Update（更新）
>
>```bash
>./install-frps.sh update
>```
>
>#### Server management（服务管理器）
>
>```bash
>Usage: /etc/init.d/frps {start|stop|restart|status|config|version}
>```

安装过程中，根据提示输入或选择自己想要配置的值即可。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317163306465.webp" alt="image-20230317163306465" style="zoom:50%;" />

另外，这里选择的接口需要在防火墙中放开（centos7 使用 firewalld 管理防火墙）：

```bash
# 查看防火墙状态
sudo systemctl status firewalld
# 开启防火墙
sudo systemctl start firewalld
# 临时关闭防火墙
sudo systemctl stop firewalld
# 永久关闭防火墙
sudo systemctl disable firewalld
# 开放指定端口
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
# 重载配置
sudo firewall-cmd --reload
# 查看当前开放的端口及服务
sudo firewall-cmd --list-ports
```

此外，如果你使用的是国内运营商的服务器或者安装了iptables，还需要在防火墙管理页面允许对应的端口通过：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317172328845.webp" alt="image-20230317172328845" style="zoom:50%;" />

最终生成的配置文件如下：（路径在 `/usr/local/frps/frps.ini` ）

```ini
# [common] is integral section
[common]
# A literal address or host name for IPv6 must be enclosed
# in square brackets, as in "[::1]:80", "[ipv6-host]:http" or "[ipv6-host%zone]:80"
bind_addr = 0.0.0.0
bind_port = 5443
# udp port used for kcp protocol, it can be same with 'bind_port'
# if not set, kcp is disabled in frps
kcp_bind_port = 5443
# if you want to configure or reload frps by dashboard, dashboard_port must be set
dashboard_port = 6443
# dashboard assets directory(only for debug mode)
dashboard_user = admin
dashboard_pwd = 6pH3CLS6
# assets_dir = ./static
vhost_http_port = 80
vhost_https_port = 443
# console or real logFile path like ./frps.log
log_file = ./frps.log
# debug, info, warn, error
log_level = info
log_max_days = 3
# auth token
token = EA6QYpVmefiBsPRe
# It is convenient to use subdomain configure for http、https type when many people use one frps server together.
subdomain_host = 111.22.33.44
# only allow frpc to bind ports you list, if you set nothing, there won't be any limit
#allow_ports = 1-65535
# pool_count in each proxy will change to max_pool_count if they exceed the maximum value
max_pool_count = 50
# if tcp stream multiplexing is used, default is true
tcp_mux = true
```

安装完成后，启动

```bash
frps start
```

启动成功后即可在浏览器中直接访问 http://111.22.33.44:6443 来打开管理界面。


## 客户端安装

#### Mac

```
brew install frpc
```

```
Running `brew update --auto-update`...
==> Fetching frpc
==> Downloading https://ghcr.io/v2/homebrew/core/frpc/manifests/0.48.0
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/frpc/blobs/sha256:7c7b0aec06a94fe01ac9c9028aaedd42211a113b62d275227bbbbb9866aa252c
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:7c7b0aec06a94fe01ac9c9028aaedd42211a113b62d275227bbbbb9866aa252c?
######################################################################## 100.0%
==> Pouring frpc--0.48.0.ventura.bottle.tar.gz
==> Caveats
To start frpc now and restart at login:
  brew services start frpc
==> Summary
🍺  /usr/local/Cellar/frpc/0.48.0: 9 files, 13.4MB
==> Running `brew cleanup frpc`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
```

维护

```\
brew services start frpc
brew services stop frpc
```

#### Nas

我的客户端需要映射出去的地址为：http://192.168.50.100:5000/，我的服务端已经在服务器 11.22.33.44 端口上配置好了，BindPort 为 5447，token 为 123456，请问我的客户端该如何设置呢？

命令：

```
# 创建配置文件
mkdir /etc/frp/frpc.ini
docker pull snowdreamtech/frpc
# 运行
docker run  --network host -d -v /etc/frp/frpc.ini:/etc/frp/frpc.ini --name frpc snowdreamtech/frpc
```

GUI:

![image-20230317175712133](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175712133.webp)

![image-20230317175234625](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175234625.webp)

![image-20230317175621520](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175621520.webp)

![image-20230317175523854](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175523854.webp)

![image-20230317175541261](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175541261.webp)

![image-20230317175507025](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175507025.webp)

如果你想要将客户端的 [http://192.168.50.100:5000](http://192.168.50.100:5000/) 映射到服务端的 11.22.33.44:5447，需要在客户端的配置文件中添加如下的隧道配置：

```
[common]
server_addr = 11.22.33.44
server_port = 5447
token = 123456

[myapp]
type = tcp
local_ip = 192.168.50.100
local_port = 5000
remote_port = 5000
```

上述配置中，[common] 部分与之前的示例相同，指定了服务端的 IP 地址和端口，以及连接服务端需要提供的 token。

[myapp] 部分定义了一个名为 myapp 的隧道，使用的隧道类型为 tcp，用于将客户端的 192.168.50.100:5000 端口映射到服务端的 11.22.33.44:5447 端口上。其中，local_ip 和 local_port 分别指定了本地的 IP 地址和端口，remote_port 指定了服务端上映射出来的端口号，这里设置为 5000。

配置完成后，保存客户端的配置文件，然后启动客户端即可开始内网穿透。启动客户端的方式与启动服务端类似，需要在命令行中执行如下命令：

```
bashCopy code
./frpc -c frpc.ini
```

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317181102512.webp" alt="image-20230317181102512" style="zoom:50%;" />

完整的配置如下：

```ini
[common]
server_addr = 111.22.33.44
server_port = 5443
token = EA6QYpVmefiBsPRe

[80]
type = tcp
local_ip = 192.168.50.100
local_port = 80
remote_port = 80

[dsm]
type = tcp
local_ip = 192.168.50.100
local_port = 5000
remote_port = 5000

[drive_web]
type = tcp
local_ip = 192.168.50.100
local_port = 6690
remote_port = 6690

[plex]
type = tcp
local_ip = 192.168.50.100
local_port = 32400
remote_port = 32400
```



如果客户端配置正确，且服务端和客户端之间的网络连接畅通，你应该可以通过 [http://11.22.33.44:5447](http://11.22.33.44:5000/) 访问到客户端本地的应用了。



## 域名配置



## Nginx映射



## 群晖映射

