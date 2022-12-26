+++
title = "Mac IDEA安装插件后导致的无法启动问题"
date = 2022-08-01 13:02:19
slug = "/idea-plugin-error"
draft = false
tags = ["技术","IDEA"]
categories = ["软件"]
toc = false
+++


IDEA一直卡在启动界面，查看错误日志后发现是安装的插件（`RestfulToolkit-fix`）有问题，记录一下解决方案。


#### 一、系统版本
MacOS 12.4
IDEA 2022.1

#### 二、查看错误日志

**错误日志的路径为**

`/Users/你的用户名/Library/Logs/JetBrains/IntelliJIdea2022.1`

**错误日志**：

```log
Cannot create class com.zhaow.restful.popup.action.PopupChoiceAction (classloader=PluginClassLoader(plugin=PluginDescriptor(name=RestfulToolkit-fix, id=me.jinghong.restful.toolkit, descriptorPath=plugin.xml, path=~/Library/Application Support/JetBrains/IntelliJIdea2022.1/plugins/RestfulToolkit-fix, version=2.0.7, package=null, isBundled=false), packagePrefix=null, instanceId=273, state=active))
com.intellij.diagnostic.PluginException: Cannot create class com.zhaow.restful.popup.action.PopupChoiceAction (classloader=PluginClassLoader(plugin=PluginDescriptor(name=RestfulToolkit-fix, id=me.jinghong.restful.toolkit, descriptorPath=plugin.xml, path=~/Library/Application Support/JetBrains/IntelliJIdea2022.1/plugins/RestfulToolkit-fix, version=2.0.7, package=null, isBundled=false), packagePrefix=null, instanceId=273, state=active))

```


#### 三、解决办法



删除插件，插件的具体路径为：



`/Users/你的用户名/Library/Application Support/JetBrains/IntelliJIdea2022.1/plugins`




删除对应插件后重启之后解决。