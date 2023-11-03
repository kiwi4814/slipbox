> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [v2xtls.org](https://v2xtls.org/%E4%B8%80%E9%94%AE%E6%90%AD%E5%BB%BAtelegram%E7%9A%84mtproto%E4%BB%A3%E7%90%86/)

> MTProto 协议介绍 MTProto 协议是 Telegram 为了对抗网络封锁开发的专用代理（MTProxy … 继续阅读一键搭建 Telegram 的 MTProto 代理

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/mtproto%E4%BB%A3%E7%90%86-640x510.webp)

MTProto 协议介绍
------------

MTProto 协议是 [Telegram](https://telegram.org/) 为了对抗网络封锁开发的专用代理（MTProxy）协议，目前全平台的 TG 客户端中都支持 MTProto 协议和 MTProxy 代理。有了 MTProxy 代理，即使没有 VPN 或者其他代理的情况下，也能顺畅访问 TG。

本文介绍一键搭建 Telegram 的 MTProto 代理。

一键搭建 Telegram 的 MTProto 代理
--------------------------

第一步，请准备一台境外的 VPS，购买可参考 [CN2 GIA VPS 和商家推荐](https://v2xtls.org/cn2-gia-vps%e5%92%8c%e5%95%86%e5%ae%b6%e6%8e%a8%e8%8d%90/) 或 [做站 VPS 推荐](https://v2xtls.org/%e5%81%9a%e7%ab%99vps%e6%8e%a8%e8%8d%90/)，操作系统选 CentOS 7/8、Ubuntu 16/18/20，或者 Debian 8/9/10；

第二步，SSH 登录到服务器，windows 可参考 [Bitvise 连接 Linux 服务器教程](https://v2xtls.org/bitvise%e8%bf%9e%e6%8e%a5linux%e6%9c%8d%e5%8a%a1%e5%99%a8%e6%95%99%e7%a8%8b/)，mac 用户请参考 [Mac 电脑连接 Linux 教程](https://v2xtls.org/mac%e7%94%b5%e8%84%91%e8%bf%9e%e6%8e%a5linux%e6%95%99%e7%a8%8b/)；

第三步，执行下面的命令一键搭建 Telegram 的 MTProto 代理：

```
# CentOS/AliyunOS/AMI系统
yum install -y curl
bash <(curl -sL https://s.hijk.art/mtproto.sh)
# Ubuntu/Debian系统
apt install -y curl
bash <(curl -sL https://s.hijk.art/mtproto.sh)
```

输入命令后，会出现如下菜单：

[![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85MTProto%E4%BB%A3%E7%90%86.webp)](https://v2xtls.org/wp-content/uploads/2020/11/%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85MTProto%E4%BB%A3%E7%90%86.jpg)

一键安装 MTProto 代理

首次使用输入 1，然后回车，按照提示输入一个端口号并回车（端口号随便设置，不和其他软件冲突即可）。

安装成功后，会输出如下信息：

[![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/MTProxy%E4%BB%A3%E7%90%86%E4%BF%A1%E6%81%AF.webp)](https://v2xtls.org/wp-content/uploads/2020/11/MTProxy%E4%BB%A3%E7%90%86%E4%BF%A1%E6%81%AF.jpg)

MTProxy 代理信息

第三步，接下来打开 TG 客户端，参考 [配置 Telegram 走 SS/SSR/V2ray/trojan 代理](https://v2xtls.org/%e9%85%8d%e7%bd%aetelegram%e8%b5%b0ss-ssr-v2ray-trojan%e4%bb%a3%e7%90%86/) 的操作添加自定义代理，选择 MTPROTO，将一键脚本输出的 IP、端口和密钥填上去，点击保存：

[![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/Telegram%E9%85%8D%E7%BD%AEMTProxy%E4%BB%A3%E7%90%86.webp)](https://v2xtls.org/wp-content/uploads/2020/11/Telegram%E9%85%8D%E7%BD%AEMTProxy%E4%BB%A3%E7%90%86.jpg)

Telegram 配置 MTProxy 代理

接下来，就可以在不开启代理 / VPN 的情况下使用 TG 客户端了。

注意事项
----

1.  目前 MTProto 已经发展到第三代，已经不建议使用 [V2ray](https://v2xtls.org/v2ray/) 内置的 MTProto 来搭建
2.  本脚本使用了 [9seconds](https://github.com/9seconds/mtg) 的 docker 镜像搭建；
3.  因为 docker 访问外网需求，因此禁用了 VPS 的防火墙。如果你的 VPS 用于网站等重要业务，不建议使用本脚本搭建；
4.  如果有国内 VPS，建议使用 [中转](https://v2xtls.org/%e4%bd%bf%e7%94%a8%e5%9b%bd%e5%86%85%e6%9c%8d%e5%8a%a1%e5%99%a8%e4%b8%ad%e8%bd%ac%e6%b5%81%e9%87%8f/)，防止被封；
5.  MTProto 很可能过一段时间就导致被封，稳妥的方法还是使用[带伪装的 V2ray](https://v2xtls.org/v2ray%e5%b8%a6%e4%bc%aa%e8%a3%85%e4%b8%80%e9%94%ae%e8%84%9a%e6%9c%ac/) 或者 [trojan](https://v2xtls.org/trojan%e4%b8%80%e9%94%ae%e8%84%9a%e6%9c%ac/)，然后参考 [配置 Telegram 走 SS/SSR/V2ray/trojan 代理](https://v2xtls.org/%e9%85%8d%e7%bd%aetelegram%e8%b5%b0ss-ssr-v2ray-trojan%e4%bb%a3%e7%90%86/) 的操作使用 TG。

参考
--

1.  [V2ray 带伪装一键脚本](https://v2xtls.org/v2ray%e5%b8%a6%e4%bc%aa%e8%a3%85%e4%b8%80%e9%94%ae%e8%84%9a%e6%9c%ac/)
2.  [V2ray 的 VLESS 协议介绍和使用教程](https://v2xtls.org/v2ray%e7%9a%84vless%e5%8d%8f%e8%ae%ae%e4%bb%8b%e7%bb%8d%e5%92%8c%e4%bd%bf%e7%94%a8%e6%95%99%e7%a8%8b/)
3.  [CN2 GIA VPS 和商家推荐](https://v2xtls.org/cn2-gia-vps%e5%92%8c%e5%95%86%e5%ae%b6%e6%8e%a8%e8%8d%90/)