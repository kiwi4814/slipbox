> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [matters.news](https://matters.news/@thistlf/90530-matrix-%E5%8E%BB%E4%B8%AD%E5%BF%83%E5%8C%96-%E5%8C%BF%E5%90%8D-%E5%AE%89%E5%85%A8%E7%9A%84%E5%8D%B3%E6%97%B6%E9%80%9A%E4%BF%A1-bafyreifwvmwayjpdhmtenxilxnccmjsmkoq4lu7v7au37bob6i4oi7o6he)

> Matrix 是一个端到端加密、去中心化的即时通信协议，Matrix 协议对标的是同为即时通信软件的 Telegram，Discord。

Matrix 是一个端到端加密、去中心化的即时通信协议，Matrix 协议对标的是同为即时通信软件的 Telegram，Discord。比起这两者，Matrix 服务无需邮箱和手机号就可以注册，非常适合匿名社区的通讯，免除个人信息泄露之忧。本文介绍 Matrix 协议和它的官方客户端 Element（原名 Riot.im）。



 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633456.webp) 



Element 桌面和移动客户端截图

比起主流即时通讯软件，Matrix 有很多优点，包括：

1.  **隐私**：注册 Matrix 账号不需要邮箱和手机号，只需要用户名和密码。使用 Matrix 无需担心手机号和邮箱泄露的风险。
2.  **安全加密**：Matrix 私聊和群聊是端到端加密的，所有聊天内容加密存储、加密传输。即使是 Matrix 服务器的所有者，也无法看到用户的聊天内容。
3.  **开源**：Matrix 官方客户端和服务器软件全部开源，任何人都可以审查代码，并检查代码中的漏洞。有兴趣的人也可以用开源代码搭建自己的 Matrix 服务器。
4.  **去中心化**：Matrix 是联邦式协议，Matrix 网络由分布在世界各地，由不同个人和组织运营的服务器组成，因此 Matrix 协议不容易被单个组织垄断。

 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633509.webp) Matrix 网络是联邦式结构，由多个地位平等的服务器连接而成

“联邦式协议” 听上去难以理解，事实上，电子邮件就是一种应用最广泛的联邦式协议。每个电子邮件服务器之间的_地位平等_，在收发电子邮件时，只要指定一个电子邮件服务器和服务器上的用户，就可以通信。例如 [example@gmail.com](mailto:example@gmail.com) 这个电子邮件地址，同时包含了用户名和服务器名，example 是用户名，gmail.com 是服务器名。

在 Telegram，微信等聊天软件中，添加好友需要指定手机号或者用户名。而 Matrix 非常像电子邮件，账号名称包含用户名和服务器名。一个 matrix 账号 ID 如下：

```
example@matrix.org
```

这里 example 是用户名，matrix.org 是服务器名。Matrix 添加好友和收发电邮一样，需要填写完整的 MatrixID@服务器名。在这里就是 [example@matrix.org](mailto:example@matrix.org)。

**安全使用 Matrix**
---------------

**1. 选择服务器**

电子邮件有很多服务商，例如 Gmail，Hotmail，ProtonMail。Matrix 作为一种与之类似的联邦式协议，自然也有很多服务器可以选择。Matrix 网站上提供了一份服务器列表，可供选择注册：

[https://www.hello-matrix.net/public_servers.php](https://www.hello-matrix.net/public_servers.php)

不过，本文推荐使用 Matrix 官方的服务器 matrix.org，matrix 官方服务器安全性和稳定性有保证，配置也是最容易的。

**2. 网页版客户端 + Tor**

Matrix 协议的官方客户端叫 Element（原名 Riot.im）。Element 有桌面和移动[客户端](https://element.io/get-started)，提供和 Telegram、Discord 等聊天工具类似的体验，不过这里推荐在 [Tor 浏览器](https://www.torproject.org/download/)中使用网页版（[移动端](https://www.torproject.org/download/#android)）。并且账号注册和使用的全程都用网页版在 Tor 浏览器中完成。

Tor + 网页版的优势：

1.  **隐匿 IP**：lement 客户端配置代理比较麻烦。而在 Tor 浏览器中，不必费力配置客户端的代理，可以做到全程隐匿 IP，这让 Matrix 可以达到 Tox 和 TorMessage 的隐匿性。
2.  **易用性**：很多聊天软件网页版会比客户端少些功能。而 Element 网页版和桌面客户端的功能完全等价，界面完全相同。用户在客户端软件和网页版之间可以零成本切换。
3.  **隐蔽性**：网页版比 App 的隐蔽性更好，只要使用无痕模式登录，其它人无法发觉 Matrix 客户端的存在。

Tor + 网页版全程匿名，注册不需要邮箱和手机，打开浏览器就能使用。**全部通信高度加密，方便程度又可比论坛私信，可作为私信的加密替代。**推荐用这种方式使用 Matrix。

**注册和使用**
---------

Element 的下载页面提供网页版，也可以点以下链接直接进入注册页面。注意全过程应当用 Tor 浏览器完成。

[https://app.element.io/#/register](https://app.element.io/#/register)

首次注册如下图：

 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633726.webp) 图 1：首次注册

选择上面的 “Free” 可以选择直接在 matrix.org 服务器上注册（推荐）。选择“Premium”，可以使用 Matrix 官网提供的主机自己搭建服务器。选择“Advanced”，可以使用第三方服务器。

注册时只要提供用户名和密码即可，Email 是可选的，可以不输入。

 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633408.webp) 图 2：提示

接下来会弹出提醒，如果不绑定电子邮箱，若忘记密码则无法回复。由于这里追求匿名，点 continue 继续。

如果用 Tor 注册，接下来会有 Google reCaptcha 验证码，点完验证码之后即完成注册，如图：

 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633168.webp) 图 3：注册完成

以后若要进入 Matrix 网页版，访问 app.element.io 就可以直接登录。

**创建恢复密钥**
----------

Matrix 使用端到端加密，加密后的聊天记录又（可能）保存在多个服务器上，为了能查看历史聊天记录，需要创建恢复密钥。

恢复密钥并不复杂，本质上是给账户设置两道密码。登录密码用来登录 Matrix 账户，恢复密钥用来查看历史消息。当在新的设备上登录时，Matrix 服务器会要求验证第二道密码，没有第二密码（恢复密钥）仍然可以登录，但是无法查看历史消息。

恢复密钥的设置方法如下：

点击左上头像，选择【settings】，在右侧选择【Security & Privacy】，如图 4。

 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633730.webp) 图 4：设置

在右侧选择绿色的【Set up】按钮，弹出如下页面。

 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633243.webp) 图 5：恢复密钥选项

这里选择第二项【Enter a Security Phrase】。

接下来需要输入第二道密码，这里设置的密码就用来恢复聊天记录。设置完成后，会显示一个 12 组每组 4 个的密钥，如下图，建议把这个密钥备份并保管好。如果上面的第二道密码忘记，可以用这个密钥串解锁聊天记录：

 ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291633384.webp) 图 6：恢复密钥串

如果你需要管理这些用户名、密码、密钥串，推荐使用 [KeepassXC](https://keepassxc.org/) 等密码管理器。

**开始聊天**
--------

在 Matrix 中，知道对方的 ID（类似 [example@matrix.org](mailto:example@matrix.org) 格式），点击左边栏上边的 “+” 号（Start Chat）就可以私聊了。

群聊的方法类似。点击左边栏下方的 “+” 号（Add Room）就可以创建或加入群聊。选择 explore public rooms，可以使用加群连接加入他人群聊。群 ID 类似于以下格式:

`[https://matrix.to/#/!xTTMQbujXcFdGQJgAS:matrix.org?via=matrix.org](https://matrix.to/#/!xTTMQbujXcFdGQJgAS:matrix.org?via=matrix.org)`

也可以选择 Create new room 自行建群。

Matrix 的其它用法和主流聊天软件类似，在此不再赘述。

**更多 Matrix 资料可见**：

[1] [https://matrixim.cc/sfd2017-matrix.pdf](https://matrixim.cc/sfd2017-matrix.pdf)，北大 Matrix 兴趣社团的介绍 slides。

[2] [https://matrix.org/docs/develop,](https://matrix.org/docs/develop) Matrix 开发文档，可用于 Matrix 机器人，网桥的开发参考。也描述了很多 Matrix 的内部细节。