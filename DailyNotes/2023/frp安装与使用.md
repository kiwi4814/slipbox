最近入手了一个搬瓦工 CN2 GIA 服务器，目的之一是打算给家里的黑群晖做内网穿透用，稍微比较了下目前内网穿透的一些方案，最后决定使用 frp 来实现内网穿透。此外，我在NameSilo上注册了一个域名

`xxx.com`，而最终想实现的效果是，当我访问 `dsm.xxx.com` 的时候自动跳转到群晖管理入口，而当我访问 `drive.xxx.com` 跳转到网盘，诸如此类等等。



下面记录下安装的过程，仅供参考。



**VPS系统信息：CentOS Linux release 7.9.2009**

**VPS公网IP：111.22.33.44**

**群晖系统版本：DSM 6.2-23739**



## frp 介绍



## 服务端安装

关于如何安装， [frp官方中文文档](https://gofrp.org/docs/) 有比较详细的介绍了，此外官网还有很多不同场景下的使用方法，本文主要是入门使用，故感兴趣的可以自行跳转研究。



此外，想要省事一点可以直接使用[一键安装脚本](https://github.com/MvsCode/frps-onekey)来进行安装，以下内容引用自安装脚本Readme文件，感谢原作者的无私奉献。

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
>```
>wget https://gitee.com/mvscode/frps-onekey/raw/master/install-frps.sh -O ./install-frps.sh
>chmod 700 ./install-frps.sh
>./install-frps.sh install
>```
>
>##### Github
>
>```
>wget https://raw.githubusercontent.com/MvsCode/frps-onekey/master/install-frps.sh -O ./install-frps.sh
>chmod 700 ./install-frps.sh
>./install-frps.sh install
>```
>
>#### Uninstall（卸载）
>
>```
>./install-frps.sh uninstall
>```
>
>#### Update（更新）
>
>```
>./install-frps.sh update
>```
>
>#### Server management（服务管理器）
>
>```
>Usage: /etc/init.d/frps {start|stop|restart|status|config|version}
>```

安装过程中，根据提示输入或选择自己想要配置的值即可。另外，这里选择的接口需要在防火墙放开。



最终生成的配置文件如下：（路径）

```ini
# [common] is integral section
[common]
# A literal address or host name for IPv6 must be enclosed
# in square brackets, as in "[::1]:80", "[ipv6-host]:http" or "[ipv6-host%zone]:80"
bind_addr = 0.0.0.0
bind_port = 5668
# udp port used for kcp protocol, it can be same with 'bind_port'
# if not set, kcp is disabled in frps
kcp_bind_port = 5668
# if you want to configure or reload frps by dashboard, dashboard_port must be set
dashboard_port = 6668
# dashboard assets directory(only for debug mode)
dashboard_user = admin
dashboard_pwd = ******
# assets_dir = ./static
vhost_http_port = 84
vhost_https_port = 668
# console or real logFile path like ./frps.log
log_file = ./frps.log
# debug, info, warn, error
log_level = debug
log_max_days = 3
# auth token
token = ************
# It is convenient to use subdomain configure for http、https type when many people use one frps server together.
subdomain_host = 你的服务器IP
# only allow frpc to bind ports you list, if you set nothing, there won't be any limit
#allow_ports = 1-65535
# pool_count in each proxy will change to max_pool_count if they exceed the maximum value
max_pool_count = 50
# if tcp stream multiplexing is used, default is true
tcp_mux = true
```

安装完成后，可以在浏览器中直接访问 111.22.33.44:6668 来打开管理界面，

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



如果你想要将客户端的 [http://192.168.50.100:5000](http://192.168.50.100:5000/) 映射到服务端的 11.22.33.44:5447，需要在客户端的配置文件中添加如下的隧道配置：

```
makefileCopy code
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

如果客户端配置正确，且服务端和客户端之间的网络连接畅通，你应该可以通过 [http://11.22.33.44:5447](http://11.22.33.44:5447/) 访问到客户端本地的应用了。



## 域名配置



## Nginx映射



## 群晖映射

