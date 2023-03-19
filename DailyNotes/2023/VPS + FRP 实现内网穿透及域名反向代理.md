最近入手了一个搬瓦工 CN2 GIA 服务器，目的之一是打算给家里的黑群晖做内网穿透用，稍微比较了下目前内网穿透的一些方案，最后决定使用 frp 来实现。此外，我在NameSilo上注册了一个域名

`xxx.com`，最终想实现的效果是，当我访问 `dsm.xxx.com` 的时候自动跳转到群晖管理入口，而当我访问 `plex.xxx.com` 跳转到家庭影院系统，等等以此类推。



下面记录下安装的过程，仅供参考。



**VPS公网IP：111.22.33.44**

**VPS系统信息：CentOS Linux release 7.9.2009**

**群晖系统版本：DSM 6.2-23739**

**安装的 frp 版本：0.48.0**



## 一、frp 介绍

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



接下来我们将分别在具有公网IP的服务器上和内网NAS设备上安装 frp 的服务端和客户端，以实现外网和内网机器（本文中就是NAS）的通信。

## 二、服务端（frps）安装

<font color = "red">【注意】：在本节中安装 frps 的时候使用了 frp 默认的80端口，这里建议改为其他端口号，因为Nginx默认也会使用80端口，启动过程中会与 frp 冲突。</font>

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

另外，这里选择的接口需要在防火墙中放开（centos7 使用 firewalld 管理防火墙）,防火墙相关的命令参考如下：

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
sudo firewall-cmd --zone=public --add-port=82/tcp --permanent
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
vhost_http_port = 82
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

## 三、客户端（frpc）安装



首先要说明的一点是，这里的客户端其实可以是所有你需要穿透出去的设备，比如家里的主机、服务器等等，另外各个系统安装的方式可能会有所差异，比如在Mac电脑下可以很方便使用HomeBrew安装： `brew install frpc`，这里以群晖NAS系统下的Docker环境来演示安装方法，其他平台使用Docker也可以照此方式安装。



这里演示两种安装方法，第一种是命令式安装，群晖的话需要开启 ssh root 后，进入到后台安装，如何开启可以看前面的文章，第二种是直接在群晖的Docker软件可视化界面上操作，Docker镜像用的是snowdreamtech 大神封装的 [docker镜像](https://hub.docker.com/r/snowdreamtech/frpc) 。

### 第一种 命令

按照下面的步骤操作即可：

```bash
# 1. 创建配置文件
sudo mkdir -p /etc/frp && sudo touch /etc/frp/frpc.ini
# 2. 编辑配置文件（配置文件示例见本节末尾）
vi /etc/frp/frpc.ini
# 3. 拉取镜像
docker pull snowdreamtech/frpc
# 4. 运行
docker run  --network host -d -v /etc/frp/frpc.ini:/etc/frp/frpc.ini --name frpc snowdreamtech/frpc
```

在启动完成后，我们可以使用Docker的相关命令查看日志和管理：

```dockerfile
# 查看启动日志
docker logs frpc
# 启动
docker start frpc
# 停止
docker stop frpc
```



### 第二种 GUI

在NAS下推荐使用此种方式，比较简单也方便统一管理，当然其实使用第一种方式这里也能展示出来，只是配置文件的位置不同罢了。

（1）打开 `filestation` ，创建或者上传配置文件 `frpc.ini` , 配置文件的内容和配置项参见本节末尾。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175234625.webp" alt="image-20230317175234625" style="zoom:50%;" />

（2）打开 `Docker套件`， 在注册表中搜索frpc，选择第一个 `snowdreamtech/frpc` 双击选择 latest 并下载

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175712133.webp" alt="image-20230317175712133" style="zoom:50%;" />

（3）在 映像 中双击刚才下载的`snowdreamtech/frpc:lastest` 并双击，开始创建容器，并打开高级设置

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175621520.webp" alt="image-20230317175621520" style="zoom: 50%;" />

（4）高级配置按照下面的步骤操作即可，要点：自启动、映射配置文件、使用与 Docker Host 相同的网络

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175523854.webp" alt="image-20230317175523854" style="zoom:50%;" />

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175507025.webp" alt="image-20230317175507025" style="zoom:50%;" />

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230317175541261.webp" alt="image-20230317175541261" style="zoom:50%;" />



（5）应用后就会自动运行 frpc

### 客户端参考配置

下面的截图中列出了客户端配置及含义：

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
remote_port = 82

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



启动成功后，如果客户端配置正确，且服务端和客户端之间的网络连接畅通，我们就可以通过 http://111.22.33.44:5000/ 来访问群晖的管理页面了，其他服务的地址以此类推即可。



但是这样的地址，首先我们可能根本记不住自己的服务器IP，也搞不清楚这么多域名映射关系，所以最好的方法是，我们把这几个地址反代成一个个方便的二级域名，就像文章开头说的那样，当我访问 http://dsm.xxx.com/ 的时候，就能跳转到 http://111.22.33.44:5000/ 了，这样的映射，实现方法又很多，下面记录一下我自己的实现方式，仅供参考。

## 四、域名配置

首先我们要去注册一个域名，提供商有很多，腾讯云、阿里云、GoDaddy、Namecheap、Namesilo等等，我是在Namesilo上注册的域名，在购买域名的时候要注意初次购买价格和续费价格，有的域名第一年很便宜，但是续费很贵，最好买续费价格不变的，然后域名的后缀可以选冷门一点的 xyz、club、top等等。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319150117132.webp" alt="image-20230319150117132" style="zoom:50%;" />



注册完成后我们访问 [个人账户管理主页](https://www.namesilo.com/account_home.php)，然后点击右上角 Manage My Domains ,打开域名的管理界面。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319150555414.webp" alt="image-20230319150555414" style="zoom:50%;" />

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319150728119.webp" alt="image-20230319150728119" style="zoom:50%;" />

按照下图中的方式增加A记录：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319151311076.webp" alt="image-20230319151311076" style="zoom:50%;" />

域名相关的设置就到这里，至于具体配置的含义和原理，笔者本身也是一知半解，就不做展开了。



接下来我们回到VPS服务器，使用Nginx来反向代理我们的应用。

## 五、Nginx映射

这里 Nginx 的安装位置与第二节相同，在VPS上服务器上安装，由于官方 yum 包是没有 Nginx 的，所以我们需要先安装三方软件源 —— EPEL-RELEASE。

安装：

```bash
sudo yum install epel-release
sudo yum install nginx
```

 启动并确认启动状态：

```bash
# 启动
sudo systemctl start nginx
# 查看启动状态，显示为 active（running）的时候则代表启动成功了
sudo systemctl status nginx
```

然后，我们来编辑配置文件 `vim /etc/nginx/nginx.conf`（默认的位置）：

找到server的位置：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319153604893.webp" alt="image-20230319153604893" style="zoom:50%;" />

将其替换为我们需要映射的域名和服务，其他的服务继续在底下增加新的server配置即可。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319153807057.webp" alt="image-20230319153807057" style="zoom:50%;" />

```ini
    ## 群晖控制面板
    server {
        listen 80;
        server_name dsm.xxx.com;
        root /usr/share/nginx/html;

        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }

        location / {
            proxy_pass http://111.22.33.44:5000/;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
```



然后重新载入nginx配置使其生效：

```nginx
nginx -s reload
```

稍等一会，我们就可以在浏览器中通过 http://drive.xxx.com/ 来访问到我们的群晖管理界面了。

## 六、群晖网盘

最后，简单介绍下群晖网盘的同步，首选我们在群晖的控制面板中去开启群晖Drive的web管理：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319155046586.webp" alt="image-20230319155046586" style="zoom:50%;" />

然后需要注意的是 frp 中映射的端口为 6690 而不是上图中的 7006，然后在群晖初始化连接的时候，可以直接填域名或者IP（不需要带端口号），这是由于群晖的默认设置造成的。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230319154737684.webp" alt="image-20230319154737684" style="zoom:50%;" />

## 七、总结

本文简要介绍了如何使用一台VPS，在外网服务器和家里的NAS服务器分别安装 frp 进行通信并且绑定到指定的二级域名的过程。但是经过实际的测试，由于这种方式所有的流量都要依赖于这个第三方服务器，所以网速势必不会太理想，尤其是晚高峰时期，但是优势在于任何时候都可以直接访问到我们的内网服务而没有设备上的限制。由于笔者本人需要进行内网穿透访问家中设备的场景有限并且设备也很固定，所以下一篇文章中我们将使用另一种方式来实现稳定高速的内网穿透。
