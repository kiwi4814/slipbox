> 本文主要介绍如何使用ZeroTier进行多台设备在不同网络下的互联（即内网穿透）



## 一、前言

上一篇文章主要讲解了如何使用 `VPS + frp` 搭建内网穿透服务以实现在外面随时访问家里的设备（NAS、路由器等），虽然最终实现了效果，但是使用下来后发现了一些弊端：

- 速度受限于VPS本身的网络带宽，即使VPS带宽很足，也有可能因为网络高峰期而出现明显的卡顿
- 所有流量都经过VPS服务器中转，如果有流量限制，那么就不能使用一些流量大的服务，比如网盘同步或者看电影

虽然 frp 对客户端没有限制，而且可以分享给任何人使用，但是对于我这种只有几台固定设备需要互联并且有大数据量传输要求的人来说显然是不够的，于是一顿检索后发现了另外一个内网穿透工具 —— ZeroTier。



ZeroTier 是一个专门用来建立点对点虚拟专用网（P2P VPN）的工具，可以简单理解为局域网，不同网络中的机器可以像在局域网里那样互相访问，而且是点对点直连，数据传输并不经由第三方服务器中转。相比于frp需要第三方服务器转发具有更稳定的速度和连接性，但是需要每个加入局域网的客户端安装zerotier，所以更适合固定的设备使用，比如在公司访问家里的NAS、在家里远程办公或者组建稳定的多人游戏局域网。



接下来，本文将从安装、使用、配置moon节点加速几个版块详细介绍下如何在各个设备使用zerotier并实现互联。

## 二、下载和安装使用

### 2.1 注册

在 [ZeroTier的官网](https://www.zerotier.com/) 注册一个账号，注册完成后会提示你 `Create A Network`:

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230313172246503.webp" alt="image-20230313172246503" style="zoom: 40%;" />

按照提示创建一个网络，会给你生成一个NETWORK ID，**请记下这个ID**（后文中统一使用 `<NETWORK_ID>` 来表示，不再赘述），后面在配置中我们将会多次使用它。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230313172427783.webp" alt="image-20230313172427783" style="zoom:40%;" />

点击记录进入详情后，我们可以看到  `Settings`、`Members`、 `Flow Rules`、 `Administrators` 四个配置，我们一般只需要关心前两项即可。

`Settings` 中我们可以设置网络的名称、描述和权限（私有or公有），在 `Settings -> Advanced` 中我们可以选择局域网IP的号段。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230314123006272.webp" alt="image-20230314123006272" style="zoom: 33%;" />

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230314122230010.webp" alt="image-20230314122230010" style="zoom: 33%;" />

`Members`中则会展示所有加入过此网络的客户端以及相关的设置信息，但是目前应该会显示 "No devices have joined this network"， 表示目前没有任何客户端加入。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230314131753967.webp" alt="image-20230314131753967" style="zoom: 33%;" />

### 2.2 安装客户端

下载页：https://www.zerotier.com/download/

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230314123741898.webp" alt="image-20230314123741898" style="zoom:50%;" />

zerotier的官网提供了多种类型的客户端方便下载和安装，下面将以其中最典型的几种来展示下如何安装和使用。

#### 2.2.1 Windows & Mac

Windows和Mac下客户端的安装方式大同小异，下载对应的安装包双击安装即可，安装完成后在托盘图标上选择 Join New Network，然后输入刚才创建好的 `<NETWORK_ID>` 即可。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230314124219810.webp" alt="image-20230314124219810" style="zoom:50%;" />



当然了，安装完成后也可以选择使用命令行进行操作————

对于windows系统，使用管理员身份打开Windows PowerShell，然后进入到 ` C:\Windows\system32>` 文件夹下（一般打开Windows PowerShell后默认就是此路径），然后执行：

```bash
zerotier-cli join <NETWORK_ID>
```

对于Mac系统比较简单，进入命令行执行：

```bash
sudo zerotier-cli join <NETWORK_ID>
```

执行完成后可以在zerotier的管理界面查看客户端是否已经在Members列表中了。

#### 2.2.2 Linux

笔者的Linux服务器为CentOS Linux release 7.9.2009，接下来依此系统为例展示如何安装zerotier：

1. 执行一键安装脚本：

   ```bash
   curl -s https://install.zerotier.com | sudo bash
   ```

2. 启动 ZeroTier 服务：

   ```bash
   sudo systemctl enable zerotier-one
   sudo systemctl start zerotier-one
   ```

3. 加入 ZeroTier 网络：

   将 ZeroTier 网络的 ID 添加到 moon 节点：

   ```bash
   sudo zerotier-cli join <NETWORK_ID>
   ```

   ```
   200 join OK
   ```

4. 等待 moon 节点加入 ZeroTier 网络：

   等待一段时间，直到 moon 节点加入了 ZeroTier 网络。可以使用以下命令检查 moon 节点是否已经加入了 ZeroTier 网络：

   ```bash
   sudo zerotier-cli info
   ```

   在输出中，可以查看 moon 节点的节点 ID 和 ZeroTier 网络的状态信息。

   ```
   200 info a4cf307835 1.10.5 ONLINE
   ```

#### 2.2.3 NAS

NAS的安装方式比较简单，在NAS的套件中心中增加[矿神群晖 SPK 套件源](https://spk7.imnks.com/)，然后在套件中心安装即可，安装完成后可SSH进入群晖的管理界面操作即可（操作命令与2.2.2小节中大同小异）。

### 2.3 网页配置

安装完客户端后，我们再回来zerotier的管理页面上，可以看到 `Members` 下面已经多出了几行，分别是我们刚刚添加的那些客户端，下图是一个示例，已经标注了关键信息：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230314120947302.webp" alt="image-20230314120947302" style="zoom:50%;" />



为了方便记忆，我们在 Name/Description 列中可以增加名称和描述，在 Auth 列中勾选复选框后，就意味着对应的机器已经加入到局域网中了，Managed IPs 就是这个机器的IP（可以是多个）。

在上面的图中，目前有三台在线的设备，分别是Mac（192.168.196.233）、腾讯云（192.168.196.110）和NAS（192.168.196.88），这三台机器的物理位置分别在公司、腾讯云以及家里，按照图中设置勾选后，我就可以在Mac机器上直接访问 http://192.168.196.88 来访问家里的NAS了。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230314131226639.webp" alt="image-20230314131226639" style="zoom:50%;" />

## 三、搭建和使用moon节点

尽管 ZeroTier 是一个点对点的网络，但在网络中仍然需要至少一个中心节点来协调和管理网络中的设备，这个中心节点被称为 "moon" 节点。ZeroTier 虚拟网络默认情况下是使用 ZeroTier 公司的 Moon 节点来提供网络控制和管理功能，所以使用公共的 Moon 节点可能存在网络延迟和带宽限制等问题，如果你恰好有闲置的VPS或者静态服务器，可以搭建一个自己的 moon 节点来改善连接体验。

下面将演示如何创建一个moon节点，仍然以Centos7为例来演示。

系统版本为 CentOS Linux release 7.9.2009， `<SERVER_IP>` 代表你的公网服务器的IP。

### 3.1 配置moon节点
#### 3.1.1 服务器安装ZeroTier

参见2.2.2小节。

#### 3.1.2 配置 moon 节点

1. 生成 moon.json 配置文件，zerotier的默认安装目录为 /var/lib/zerotier-one

   ```bash
   cd /var/lib/zerotier-one
   sudo zerotier-idtool initmoon identity.public >> moon.json
   ```

   此命令会在安装路径下生成一个 moon.json 配置文件，文件内容如下：

   ```json
   {
       "id":"c6c353f860",
       "objtype":"world",
       "roots":[
           {
               "identity":"c6c353f860:0:5d43b7fc40d85eed2aeeed069ee972fbdb2fc565c7c38186ff7a09a1b0736a9ff2ce342b7",
               "stableEndpoints":[]
           }
       ],
       "signingKey":"c2b31df775502fd78f39a0e43b87891098dedcb0304e54d6e9eacfc317039b5f4",
       "signingKey_SECRET":"87c44c52271ef2433dcff7cdd1a5528d86786d2b2ef625a06413b2f01b83cbdc26a8c2b72f2ae39840bf73b9",
       "updatesMustBeSignedBy":"c2b31df775502fd78f39a0e43b87891098719c054e09b931820dce0f48dedcb0304e54d6e9eacfc317039b5f4",
       "worldType":"moon"
   }
   ```

   

2. 编辑 moon.json 配置文件

   将配置文件中的 `"stableEndpoints": []` 修改成 `"stableEndpoints": ["<SERVER_IP>/9993"]`，将 `<SERVER_IP>` 替换成云服务器的公网 IP。

3. 开放 9993 UDP端口

   ```bash
   sudo firewall-cmd --permanent --add-port=9993/udp
   sudo firewall-cmd --reload
   ```

   这步骤也可以自己修改成自己想要的端口，在安装目录下创建 local.conf 文件，文件内容配置如下，primaryPort 即为想要配置的端口：

   ```json
   {
       "settings":{
           "primaryPort":9994
       }
   }
   ```

   关于端口，UDP官方文档注明了会使用三类端口：

   > What ports does ZeroTier use?
   >
   > It listens on three 3 UDP ports:
   >
   > - 9993 - The default
   > - A random, high numbered port derived from your ZeroTier address
   > - A random, high numbered port for use with UPnP/NAT-PMP mappings

   9993端口是一定要开的，至于其他端口，目前我也还没搞清楚是否一定要开放，等后面研究研究再来更新，原文地址[在这里](https://docs.zerotier.com/zerotier/troubleshooting/)，可以自行查阅下。

4. 生成签名文件 `.moon`

   ```json
   sudo zerotier-idtool genmoon moon.json
   ```

   此命令会在当前路径下生成一个名为 `00000xxxxxxxxxx.moon` 的签名文件，其中 `xxxxxxxxxx` 为你的 moon 节点ID，安装zerotier后会分配给你。

5. 加入moon网络

   在安装目录下创建 moons.d 文件夹并将生成的签名文件移动到此文件夹中

   ```bash
   sudo mkdir moons.d
   sudo mv 000000xxxxxxxxxx.moon moons.d
   ```

6. 重启zerotier

   ```bash
   sudo systemctl restart zerotier-one
   ```


### 3.2 其他设备使用此 Moon 节点

网络内的其他成员使用 moon 节点有两种方法， 第一种方法是在安装目录下创建 `moons.d` 文件夹，然后将刚才生成的 `00000xxxxxxxxxx.moon` 复制到文件夹内，然后重启zerotier。

各系统默认的安装目录如下：

```
Windows: C:\ProgramData\ZeroTier\One
Macintosh: /Library/Application Support/ZeroTier/One (在 Terminal 中应为 /Library/Application\ Support/ZeroTier/One)
Linux: /var/lib/zerotier-one
FreeBSD/OpenBSD: /var/db/zerotier-one
```



第二种方法较为简单，在加入同一个网络后使用 `zerotier-cli orbit` 命令直接添加 Moon 节点 ID。

Linux内核（群晖NAS、Mac、CentOS等）：

```bash
sudo zerotier-cli orbit xxxxxxxxxx xxxxxxxxxx
```

Windows系统（在 C:\Windows\system32> 路径下以管理员方式打开PowelShell后执行）：

```shell
zerotier-cli.bat orbit xxxxxxxxxx xxxxxxxxxx
```

其中 `xxxxxxxxxx` 替换为 Moon 节点的ID，节点ID如果没记录可以用命令 `sudo zerotier-cli info` 查看。



**无论哪种方式，完成后可以执行下面的命令检查是否加入成功**：

Linux内核（群晖NAS、Mac、CentOS等）执行：

```bash
sudo zerotier-cli listpeers 
或
sudo zerotier-cli listpeers | grep "MOON"
```

Windows下执行（在 C:\Windows\system32> 路径下以管理员方式打开PowelShell后）:

```shell
zerotier-cli.bat listpeers
```

列出的信息中如果包含我们自己的 moon 节点，即加入成功。

![image-20230313170749856](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230313170749856.webp)



## 参考链接

[ZeroTier Documentation](https://docs.zerotier.com/getting-started/getting-started)

[ZeroTier moon 设置教程](https://blog.zczc.cz/2018/03/14/ZeroTier-moon-设置教程/)

[简单搭建 Zerotier Moon 为虚拟网络加速](https://tvtv.fun/vps/001.html)









