> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [mp.weixin.qq.com](https://mp.weixin.qq.com/s/9ajcPiXemiNg01nMh0vPKA)

从 10 月开始做知识储备，11 月初入手 Apple TV 4K，到现在 11 月下旬基本搞明白了 Emby 类媒体服务器软件，累计投入了不少于 60 小时。所以啊，随着年龄增长，折腾一件事情最大成本不是购买它，而是用正确方式充分使用它，最直观的指标就是 — 时间。这也是我写这个「_5 分钟折腾_」系列的原因，求最小可用，得器具之便。

先说概念，我们一般观看的「流媒体」服务，例如爱奇艺、Netflix、HBO 等都是商业公司提供的在线服务，重点在服务稳定、内容可控，但缺点也比较明显，以爱奇艺为例：会员还是得看广告，内容质量参差不齐，说没就没，要是看腾讯视频上的电视剧还得再去开个会员。最近甚至有评论表示「中国电影已死」，连带着「流媒体已死」的猜测也来了，爱优腾的商业模式也确实越来越差。不管如何，打造一套自主可控的个人流媒体系统已迫在眉睫，该怎么呢？🤔️


打开搜索引擎找一下解决方案，很快你就会遇到 Emby（部分闭源）、Jellyfin（全部开源） 和 Plex 三种解决方案，Jellyfin 是在 Emby 开源分支基础上发展来的。考虑跨平台使用、解码效率、bugs 多寡等因素，我选择主流且文档丰富的 Emby 作为个人流媒体系统的技术方案。它是一个主从式架构的媒体服务器软件，可以用来整理服务器上的视频和音频，并将音频和视频流式传输到客户端设备。Emby 服务器端支持 Windows 和 Linux，客户端支持 H5 网页、Android、iOS 等操作系统。

现在确定下框架，流媒体服务包括媒体数据源、媒体存储、数据服务端、使用终端四个方面，有媒体数据我们才能观看。打开 draw.io 简单捋一下思路，见下图：

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944027.png)

◎ Emby 流媒体架构图  

考虑到实际使用体验，如果可以在使用终端上主动配置 PT 下载或者自动下载，那就可以放着不管了。👨🏻‍💻

对应上图，说一下本人的媒体服务配置（未单独注明的话都是 Docker 部署）：

*   PT 端：Transmission 保种、qBittorrent 下载、 PT Plugin Plus（ Chrome 插件 ）管理站点。
    
*   媒体服务：Emby 提供视频访问（部署本地 [R2S 软路由](http://mp.weixin.qq.com/s?__biz=MzI5MDM4NTYwOA==&mid=2247497939&idx=1&sn=9d394f32288d6c0b2c6c7ef22a962b2d&chksm=ec220374db558a6231bbc2dae933110d7a4cba38806497bb94367486d14465f6492eebd0f826&scene=21#wechat_redirect)上，外接 1T 硬盘）、ChineseSubFinder 根据刮削的 IMDB 编号获取多个网站中文字幕；阿里云盘开启 WebDAV 服务，丰富媒体数据。
    
*   电视端：Infuse 直连 Emby ，可以完整显示媒体元数据；Emby Apple TV 版直连 Emby ，各端同步播放进度。
    
*   移动端：使用 Emby 移动端和 Infuse 移动端。
    

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944181.png)

◎ 长按下载 Infuse

这一套在家庭局域网中使用十分愉快，如果想出门在外也能使用，那把 Emby 媒体服务部署云服务器上，或者使用他人维护 Emby 服务，有很多公益节点，不过夹带私货，免费是最贵的。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944609.png)

◎ 4K 资源太吃存储了 🥲

考虑到部署维护、存储等成本，建议轻度用户使用一些私有服务，可扫码体验 👇

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944254.png)

◎ 长按获取 Infuse 配置信息

最后在 Apple TV 上呈现的效果如下图：

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944340.jpeg)

在 iPhone 上呈现的效果如下图：

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944346.jpeg)

到这里，基本就实现了轻量的个人流媒体，要是你还是坚持折腾，请继续看下去。🐦

**一、PT 下载**

PT (Private Tracker) 是一种基于私有 BT Tracker 服务器的资源传播形式，经授权的用户使用受允许的客户端进行种子制作与下载。相较于传统 BT ，PT 站往往采取了严格的邀请制度以及免责制度来规避法律风险，同时要求用户客户端开启传输加密以绕过运营商的检测策略。当然，从实际上来说 PT 站的运营、使用仍然是违反了各国版权法的。

许多高清爱好者聚集在 PT 站，发布翻录的蓝光原盘、CD 资源以及录制的高清卫星电视讯号；得益于 Netflix、HBO、Apple TV 等高清流媒体在线视频平台的发展，近年也出现了一些 WEB-DL 资源。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944325.png)

◎ qBittorrent Web UI 

不同网站对于 BT 客户端的兼容性不同。尤其是 BitTorrent v2 协议推出后，与旧版本的客户端均不兼容。因此部分 PT 站会拒绝较新版本的 BT 软件。此外，普通的 PT 下载器如 Free Download Manager、迅雷、Aria2c 以及 qBittorrent-enhanced 是被严格禁止的。

*   99.9% 的 seedbox 用户选择 Rtorrent/Rutorrent，因为有些 seedbox provider 只提供这些。
    
*   大部分 Windows 用户选择了 µTorrent (uTorrent)。但是 uTorrent 3.x/4.x 并不稳定，性能也不好，内置了浏览器、工具栏等奇怪的插件。
    
*   OpenWRT 用户可能会选择 Transmission 和 qBittorrent。详见教程《[年轻人的第一台软路由](http://mp.weixin.qq.com/s?__biz=MzI5MDM4NTYwOA==&mid=2247497939&idx=1&sn=9d394f32288d6c0b2c6c7ef22a962b2d&chksm=ec220374db558a6231bbc2dae933110d7a4cba38806497bb94367486d14465f6492eebd0f826&scene=21#wechat_redirect)》
    

**二、Emby 服务部署**

登录到你的服务器上，确保已经安装好了 Docker ，直接上代码：  

```
docker pull emby/embyserver:latest
```

具体流程可参考以下两个链接 🔗

_https://hub.docker.com/r/emby/embys__erver_

_https://emby.media/download.html_

记住了，/share/docker/emby/config 是 emby 的配置路径，/share/video 是你的媒体路径。

在浏览器中打开 _http://yourip:8096_，然后进入可视化设置页面，不再赘述，按需配置即可。

**三、Emby 客户端使用**

以 Infuse 为例，打开新增文件来源，选择添加媒体服务器 - 其他 Emby，输入在你的 Emby 服务器信息即可。  

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211210944350.jpeg)

◎ 别忘了端口号

账号密码校验通过之后，就会把媒体资源自动同步到 Infuse 播放主屏幕，它们的元数据信息也会自动完成抓取。

**四、最后**  

文章写到这里，这也才是只是个人流媒体系统中的视频这一部分，还有音乐、电子书、相册、在线协作等好多可玩的，毕竟「电影已死」，那音乐呢？书籍呢？You Are What You Read，外延出去，我们应该筛选自己看什么，而不是被一套算法或者制度提供给你。具体可参考《[世界终究会更好，但也许不会。](http://mp.weixin.qq.com/s?__biz=MzI5MDM4NTYwOA==&mid=2247497829&idx=1&sn=14f18caade22d35036024990bcdbd5ce&chksm=ec2203c2db558ad47aff82d084c3fc7918124b49e091f1044a9a77571f12dade9ee3125ac244&scene=21#wechat_redirect)》

最大的收获，其实是掌控感，我们有权利接触到更好的内容，然后选择自己相信哪一种，不再受限于某种意识形态。我知道很多人担心技术门槛，其实吧，软路由加 Emby 、Clash 等软件就可以快速实现，这或许是最值得你花时间去研究的东西。写八股文不可能写一个海阔天空的未来。😮

**相关文章**

[年轻人的第一台软路由](http://mp.weixin.qq.com/s?__biz=MzI5MDM4NTYwOA==&mid=2247497939&idx=1&sn=9d394f32288d6c0b2c6c7ef22a962b2d&chksm=ec220374db558a6231bbc2dae933110d7a4cba38806497bb94367486d14465f6492eebd0f826&scene=21#wechat_redirect) 

[Apple ID 共享，含付费应用。](http://mp.weixin.qq.com/s?__biz=MzI5MDM4NTYwOA==&mid=2247497716&idx=1&sn=34a20873019d3099b7ad44facbe99609&chksm=ec220c53db55854561ae674bd0a6ab2c348f19611c86efc4aeeaccd34eba7733e1fe0a211237&scene=21#wechat_redirect)[](http://mp.weixin.qq.com/s?__biz=MzI5MDM4NTYwOA==&mid=2247497716&idx=1&sn=34a20873019d3099b7ad44facbe99609&chksm=ec220c53db55854561ae674bd0a6ab2c348f19611c86efc4aeeaccd34eba7733e1fe0a211237&scene=21#wechat_redirect)

👇 点击「阅读原文」查看私有 Emby 服务