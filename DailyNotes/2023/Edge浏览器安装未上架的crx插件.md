---
Date : 2023-03-29 15:18:55
DailyNotes : [[2023-03-29_周三]]
Link : [基于 macOS 的 Chrome 以及 Edge 浏览器政策 / 策略配置](https://blog.csdn.net/maxsky/article/details/120205535)
Tag : #ZK卡片 #Edge #Mac
---

+++
title = "Edge浏览器安装未上架的crx插件.md"
date =  2023-03-29 15:18:55
slug = "/edge-crx"
draft = true
tags = ["edge","软件"]
categories = ["软件教程"]
series = ["疑难杂症"]
enableTOC = false

+++



今天尝试安装一个扩展商店没有上架的Chrome插件，在 github 的 release 界面下载后缀为 `crx` 的扩展文件安装后，却发现安装后为关闭状态并且无法启用，其实可以理解，毕竟不小心下载到并且双击安装也是有可能的。

![image-20230329153908029](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329153908029.webp)

经过一番检索，遂有如下的解决办法：

### 方法一（推荐）

1. 在扩展管理界面开启开发人员模式；

   ![image-20230329145847217](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329145847217.webp)

2. 将 `crx` 后缀改为 `rar` ，然后解压为文件夹；

3. 将解压后的文件夹拖入浏览器或者点击“加载解压缩的扩展”然后选择安装即可，也就是说用文件夹的形式去安装是可以的。



### 方法二

Windows下可以通过修改注册表解决，本人没有实践过，网上文章很多，故不再展开，只希望解决问题的可以尝试第一种方法，想深入了解的可以通过检索资料或者[官方文档](https://learn.microsoft.com/zh-cn/deployedge/microsoft-edge-manage-extensions-ref-guide)了解。

下面重点说下 Mac系统 下如何解决:

【注意】本方法需要使用 `python` , 并且依赖 `pyobjc` , 可以通过这个命令安装：

```bash
# python3 安装示例
brew install python
# 使用pip3安装pyobjc
pip install pyobjc
```

如果你想装 `python3`，那么将 `python` 和 `pip` 分别换成 `python` 和 `pip3` 即可。

1. 查看所需要安装的扩展的ID

   ![image-20230329160255153](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329160255153.webp)
2. 创建一个plist配置文件，内容如下，ID替换为对应的插件ID：

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
     <!-- 政策名称 -->
     <key>ExtensionInstallAllowlist</key>
     <!-- 值类型为数组 -->
     <array>
       <!-- 数组内元素为字符串扩展 ID，一行一个 -->
       <string>dcpihecpambacapedldabdbpakmachpb</string>
     </array>
     <!-- 强制安装的应用和扩展程序的列表 -->
     <!-- 如果浏览器提示扩展不安全，可通过该项强制锁定浏览器强制禁用扩展功能 -->
     <key>ExtensionInstallForcelist</key>
     <array>
       <string>dcpihecpambacapedldabdbpakmachpb</string>
     </array>
   </dict>
   </plist>
   ```

   附件：https://raw.githubusercontent.com/kiwi4814/slipbox/master/Resources/Config/com.microsoft.Edge.plist

3. 生成Mac描述文件

   接下来我们按照github的开源项目项目 [timsutton/mcxToProfile](https://github.com/timsutton/mcxToProfile) 的指引来生成Mac用的描述文件，下载项目中的 [mcxToProfile.py](https://raw.githubusercontent.com/timsutton/mcxToProfile/master/mcxToProfile.py) 脚本文件，与刚刚创建的 `com.microsoft.Edge.plist` 文件放在同一个目录下，并且在当前目录下执行下面的命令：

   ```bash
   ./mcxToProfile.py --plist ./com.microsoft.Edge.plist --identifier com.microsoft.Edge
   ```

   如果本地安装的是python3，那么可以将首行改为：`#!/usr/bin/env python3`，或者使用这个[修改好的版本](https://raw.githubusercontent.com/kiwi4814/slipbox/master/Resources/Scripts/mcxToProfile.py)。

   执行成功后会在当前目录下生成文件 `com.microsoft.Edge.mobileconfig`，双击安装会在电脑右上角提示去系统设置中进行安装：

   ![image-20230329162447846](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329162447846.webp)

4. 安装生成的脚本文件

   我们打开系统设置 -> 隐私与安全性 -> 描述文件，然后双击刚才安装的配置，确认无误后安装即可。

   ![image-20230329162557971](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329162557971.webp)

   ![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329162700105.webp)

5. 检查安装结果

   安装完成后重启浏览器，可以在 `edge://policy/` 中查看，刚才的几个政策已经被安装了。

   ![image-20230329162941454](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329162941454.webp)

   同时再去查看扩展界面，发现扩展已经被启用了。

   ![image-20230329163041106](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230329163041106.webp)

最后，如果你使用的是 Chrome浏览器，就把上面命名和脚本中的 `com.microsoft.Edge` 替换为 `com.google.Chrome` 即可。不过，一般第一种方法就可以了，第二种方法只是提供一种思路，在想要修改其他政策（不仅仅是扩展）的时候可以使用。