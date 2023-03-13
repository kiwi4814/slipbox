> 本文主要介绍如何使用ZeroTier进行多台设备在不同网络下的互联（即内网穿透）



## 一、前言



## 二、下载和安装使用

### 2.1 注册

在 [ZeroTier的官网](https://www.zerotier.com/) 注册一个账号，注册完成后会提示你 `Create A Network`:

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230313172246503.webp" alt="image-20230313172246503" style="zoom: 50%;" />

按照提示创建一个网络，会给你生成一个NETWORK ID，**请记下这个ID**，后面在配置中我们将会多次使用它。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230313172427783.webp" alt="image-20230313172427783" style="zoom:50%;" />

点击记录进入详情后，我们可以看到  `Settings`、`Members`、 `Flow Rules`、 `Administrators` 四个配置，我们一般只需要关心前两项即可。

`Settings` 中我们可以设置网络的名称、描述和权限（私有or公有），按需设置即可，我们重点讲讲 `Members`。





### 2.2 安装客户端

#### 2.2.1 Windows

#### 2.2.2 Mac

#### 2.2.3 Linux

以centos为例，安装方法参见下一节中搭建moon节点的

#### 2.2.4 NAS



## 三、搭建和使用moon节点

尽管 ZeroTier 是一个点对点的网络，但在网络中仍然需要至少一个中心节点来协调和管理网络中的设备，这个中心节点被称为 "moon" 节点。ZeroTier 虚拟网络默认情况下是使用 ZeroTier 公司的 Moon 节点来提供网络控制和管理功能，所以使用公共的 Moon 节点可能存在网络延迟和带宽限制等问题，如果你恰好有闲置的VPS或者静态服务器，可以搭建一个自己的 moon 节点来改善连接体验。

以我自己的设备为例，下面演示如何安装和使用 moon 节点：

系统： CentOS Linux release 7.9.2009

### 3.1 搭建moon节点
本小节需要用到的变量值：`<NETWORK_ID>` 代表你的ZeroTier网络的ID（注册ZeroTier并创建网络后生成），`<SERVER_IP>` 代表你的公网服务器的IP

#### 3.1.1 VPS安装ZeroTier

1. 一键安装 ZeroTier：

   ```bash
   curl -s https://install.zerotier.com | sudo bash
   ```

3. 启动 ZeroTier 服务：

   ```bash
   sudo systemctl enable zerotier-one
   sudo systemctl start zerotier-one
   ```

3. 加入 ZeroTier 网络：

   将 ZeroTier 网络的 ID 添加到 moon 节点：

   ```bash
   sudo zerotier-cli join <NETWORK_ID>
   ```

   在此命令中，将 <NETWORK_ID> 替换为你要加入的 ZeroTier 网络的 ID。

   ```
   200 join OK
   ```

5. 等待 moon 节点加入 ZeroTier 网络：

   等待一段时间，直到 moon 节点加入了 ZeroTier 网络。可以使用以下命令检查 moon 节点是否已经加入了 ZeroTier 网络：

   ```bash
   sudo zerotier-cli info
   ```

   在输出中，可以查看 moon 节点的节点 ID 和 ZeroTier 网络的状态信息。
   
   ```
   200 info a4cf307835 1.10.5 ONLINE
   ```

#### 3.1.2 配置 moon 节点

1. 生成 moon.json 配置文件，zerotier默认安装目录为 /var/lib/zerotier-one

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



### 参考

[ZeroTier moon 设置教程 | 紫菜 (zczc.cz)](https://blog.zczc.cz/2018/03/14/ZeroTier-moon-设置教程/)

[No.001 简单搭建 Zerotier Moon 为虚拟网络加速 | 开源周末 (tvtv.fun)](https://tvtv.fun/vps/001.html)






I. 简介

- ZeroTier One 是什么？
- 为什么选择 ZeroTier One？

II. 安装 ZeroTier One

- 下载和安装 ZeroTier One
-  注册和配置 ZeroTier One

III. 使用 ZeroTier One

- 在 NAS 上使用 ZeroTier One
-  在服务器上使用 ZeroTier One
-  在 Mac 电脑上使用 ZeroTier One
-  在 Windows 电脑上使用 ZeroTier One

IV. ZeroTier One 的配置

- ZeroTier One 的常见配置
-  ZeroTier One 的高级配置

V. ZeroTier One 的应用

- ZeroTier One 如何解决网络隔离问题？
- ZeroTier One 如何简化远程办公？
- ZeroTier One 如何保证网络安全？

VI. 搭建 Moon 节点

- 什么是 Moon 节点？
- 如何在 Linux 上搭建 Moon 节点？

VII. 使用 Moon 节点

- 如何使用 Moon 节点连接到 ZeroTier 网络？
- 如何使用 Moon 节点连接到其他 ZeroTier 网络？

VIII. 高级话题

- ZeroTier One 的网络拓扑
-  ZeroTier One 的加密和安全性
-  ZeroTier One 的性能和可扩展性

IX. 总结

- 总结 ZeroTier One 的特点和用途
- 评估 ZeroTier One 的优缺点
- 未来展望和发展趋势

希望这个大纲对您有所帮助，祝您写作顺利！



ZeroTier One 是一款用于创建全球虚拟网络的软件。它可以将位于不同地理位置的计算机、服务器、嵌入式设备和移动设备连接在一起，形成一个虚拟的、安全的、可扩展的网络，就像所有设备在同一个物理网络中一样。

ZeroTier One 使用点对点的技术，这意味着设备之间可以直接通信，而不需要经过中心服务器或云。它还提供了端到端的加密，以确保所有数据传输都是安全的。

ZeroTier One 非常适合需要安全、灵活、跨平台的网络连接的场景，例如：

- 远程工作和远程办公
- IoT 设备和传感器网络
- 虚拟化和容器化环境
- 游戏和娱乐网络

ZeroTier One 可以在多个操作系统和平台上运行，包括 Windows、Mac、Linux、Android、iOS、嵌入式设备等。同时，它还提供了丰富的 API 和 CLI，以便用户可以在应用程序中集成和自动化网络配置和管理。



既然不需要经过中心服务器，为什么还需要 moon 节点呢?







那么我如何在我的服务器上搭建自己的 moon 节点呢？我的服务器系统是 centos 7



要在 CentOS 7 服务器上搭建自己的 ZeroTier One moon 节点，可以按照以下步骤进行操作：

1. 下载 ZeroTier One 的安装包：

```
curl -s https://install.zerotier.com | sudo bash
```

1. 安装 ZeroTier One：

```
sudo yum install zerotier-one
```

1. 启动 ZeroTier One 服务：

```
sudo systemctl enable zerotier-one
sudo systemctl start zerotier-one
```





1. 确保 moon 节点在防火墙中开放了必要的端口：

moon 节点需要开放 UDP 端口 9993 和 9994，以便其他设备可以连接到它。可以使用以下命令来打开这些端口：

```
sudo firewall-cmd --permanent --add-port=9993/udp
sudo firewall-cmd --permanent --add-port=9994/udp
sudo firewall-cmd --reload
```

在完成上述步骤之后，你的 CentOS 7 服务器就成为了一个 ZeroTier One 的 moon 节点。其他设备可以加入这个 ZeroTier 网络，并通过这个 moon 节点进行连接和通信。



我的群晖 NAS 系统如何安装 zerotier 并且加入这个网络呢



要在 Synology NAS 上安装 ZeroTier 并加入网络，可以按照以下步骤进行操作：

1. 登录到群晖 NAS 的管理界面。
2. 打开 “套件中心”，搜索 “ZeroTier”，并安装 ZeroTier 应用程序。
3. 安装完成后，打开 ZeroTier 应用程序并点击 “连接”。
4. 在弹出的对话框中输入你要加入的 ZeroTier 网络的 ID，并点击 “连接”。
5. 在弹出的对话框中，输入你的 ZeroTier 账号的邮箱地址和密码，或者使用你的 Google 或 Microsoft 账号进行登录。
6. 等待一段时间，直到群晖 NAS 成功连接到 ZeroTier 网络。可以在 ZeroTier 网站的 “网络” 页面上查看设备列表，确认你的 NAS 已经成功加入了 ZeroTier 网络。
7. 在需要与其他设备进行通信的情况下，确保 ZeroTier 网络中的其他设备也已经连接到这个网络，并且已经开启了相应的服务和端口。

在加入 ZeroTier 网络之后，你的群晖 NAS 就可以在 ZeroTier 网络中与其他设备进行通信，可以像使用本地网络一样使用它们。



但是我的 moon 节点怎么用上呢



如果你已经在你的 CentOS 7 服务器上搭建了 ZeroTier One 的 moon 节点，并且想要在 ZeroTier 网络中使用它，可以按照以下步骤进行操作：

1. 确保你的 CentOS 7 服务器已经成功加入了 ZeroTier 网络，并且已经成为了一个 moon 节点。可以使用以下命令来检查节点的状态：

```
sudo zerotier-cli info
```

在输出中，可以查看 moon 节点的节点 ID 和 ZeroTier 网络的状态信息。

1. 在其他设备上安装 ZeroTier 应用程序，并加入你的 ZeroTier 网络。如果已经加入了这个网络，可以跳过这一步。
2. 在需要使用 moon 节点的设备上，通过 ZeroTier 网络连接到你的 CentOS 7 服务器。可以使用以下命令将这些设备加入 ZeroTier 网络：

```
sudo zerotier-cli join NETWORK_ID
```

在此命令中，将 NETWORK_ID 替换为你要加入的 ZeroTier 网络的 ID。

1. 在你的应用程序或者服务中，指定你的 CentOS 7 服务器的 ZeroTier IP 地址作为目标地址。可以使用以下命令来查看你的 CentOS 7 服务器的 ZeroTier IP 地址：

```
sudo zerotier-cli listnetworks
```

在输出中，可以查看 ZeroTier 网络的详细信息，包括网络 ID、网络名称和网络范围。在 “assignedAddresses” 字段中，可以查看你的 CentOS 7 服务器的 ZeroTier IP 地址。

1. 在你的应用程序或服务中，使用你的 CentOS 7 服务器的 ZeroTier IP 地址进行通信。其他设备通过 ZeroTier 网络连接到你的 CentOS 7 服务器，就可以使用 moon 节点进行通信了。

需要注意的是，在使用 ZeroTier 网络进行通信时，要确保你的应用程序或服务已经开启了相应的端口，并且已经在你的 CentOS 7 服务器上配置了相应的防火墙规则，以便其他设备可以连接到它们。



