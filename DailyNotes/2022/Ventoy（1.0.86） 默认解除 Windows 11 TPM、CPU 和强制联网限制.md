---
Date: 2022-12-27 10:19:10
---
- MetaData
	- Date : 2022-12-27 10:19:10
	- DailyNotes : [[2022-12-27_周二]]
	- Link : https://www.landiannews.com/download/96697.html?utm_sources=ourl.co&utm_medium=social&utm_campaign=none
	- Tag : #ZK卡片 


自 5 月开始微软就要求 Windows 11 家庭版用户装机时必须联网并创建微软在线账户，后来这个变更也影响 Windows 11 专业版，如果用户不联网那就直接拒绝继续安装。

如果联网了后面会让用户创建或登录微软在线账户，如果不登录微软在线账户也不能继续安装。

对于这些问题微软留了个隐藏选项 [BYPASS\NRO](https://www.landiannews.com/archives/96120.html) 这个命令可以调用微软提前预留的 CMD 脚本跳过联网限制。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/202212271018812.webp)

现在 ISO 启动工具 Ventoy 已经默认集成了这个命令，当用户启动的是 Windows 11 ISO 镜像时，该软件会自动跳过 CPU、TPM 检测，同时还会自动解决必须联网的问题。

所以理论上说只要你的硬件不是十几年前的那种，那都可以使用 Ventoy 安装 Windows 11，当然安装后体验如何这个另当别论。



**以下是更新日志：**

1. 新增 `F5 工具 ---> 控制变量设置` 菜单。
2. Windows 系统下支持命令行调用 Ventoy2Disk.exe 进行安装或升级。
3. 全局控制插件中新增 `VTOY_WIN11_BYPASS_NRO` 选项，以绕过安装 Windows 11 时对在线账号的需求。
4. 默认使能全局控制插件中的 `VTOY_WIN11_BYPASS_CHECK` 和 `VTOY_WIN11_BYPASS_NRO` 选项。
5. 主题插件中新增 `resolution_fit` 选项。
6. 安装时如果选择FAT32文件系统，则MBR分区类型设置为0xC。
7. VentoyPlugson: 增加Windows系统中不同大小写的重复路径检查。
8. 相关脚本中 egrep 改为 grep -E 以消除告警。(#2083)
9. 新增菜单语言类型
10. languages.json 更新

下载地址：

南京大学镜像站：https://mirrors.nju.edu.cn/github-release/ventoy/Ventoy/LatestRelease/