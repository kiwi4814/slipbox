## 服务端安装

### 1. 使用[一键安装脚本](https://github.com/MvsCode/frps-onekey)

># Frps 服务端一键配置脚本，Frp 最新版本：0.48.0
>
>*Frp 是一个高性能的反向代理应用，可以帮助您轻松地进行内网穿透，对外网提供服务，支持 tcp, http, https 等协议类型，并且 web 服务支持根据域名进行路由转发。*
>
>- 详情：fatedier (https://github.com/fatedier/frp)
>- 此脚本原作者：clangcn (https://github.com/clangcn/onekey-install-shell)
>
>## Frps-Onekey-Install-Shell For CentOS/Debian/Ubuntu/Fedora (32bit/64bit)
>
>### Install（安装）
>
>#### Gitee
>
>```
>wget https://gitee.com/mvscode/frps-onekey/raw/master/install-frps.sh -O ./install-frps.sh
>chmod 700 ./install-frps.sh
>./install-frps.sh install
>```
>
>#### Github
>
>```
>wget https://raw.githubusercontent.com/MvsCode/frps-onekey/master/install-frps.sh -O ./install-frps.sh
>chmod 700 ./install-frps.sh
>./install-frps.sh install
>```
>
>### Uninstall（卸载）
>
>```
>./install-frps.sh uninstall
>```
>
>### Update（更新）
>
>```
>./install-frps.sh update
>```
>
>### Server management（服务管理器）
>
>```
>Usage: /etc/init.d/frps {start|stop|restart|status|config|version}
>```

注意事项：开启对应的防火墙端口

最终生成的配置文件：

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

### 2. 服务端安装

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

