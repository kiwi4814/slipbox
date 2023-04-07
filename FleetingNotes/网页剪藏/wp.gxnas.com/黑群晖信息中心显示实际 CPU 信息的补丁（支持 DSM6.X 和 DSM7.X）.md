> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [wp.gxnas.com](https://wp.gxnas.com/4130.html)

> 本教程在 DS918_6.23-25426、DS918_7.01-42214、DS918_7.10-42661up4 下测试通过。

本教程在 DS918_6.23-25426、DS918_7.01-42214、DS918_7.10-42661up4 下测试通过。

1、下载补丁文件到电脑上：

（1）DSM6.X 用【[ch_cpuinfo](https://wp.gxnas.com/wp-content/uploads/2019/08/ch_cpuinfo) 】；

（2）DSM7.X 用【[ch_cpuinfo_dsm7](https://wp.gxnas.com/wp-content/uploads/2019/08/ch_cpuinfo_dsm7) 】；

2、将补丁文件上传到黑群晖的共享文件夹下，本教程把补丁文件放在共享文件夹 docker 下；

3、在群晖的控制面板开启 SSH；

4、在电脑上用 Xshell 或者 Putty 等工具，使用 root 帐户连接到群晖（如果你的群晖没有开启 root 的，需要事先开启 root，开启 root 的教程请参考：[https://wp.gxnas.com/?s=root](https://wp.gxnas.com/?s=root)）；

5、根据系统版本，输入对应版本的命令：

```
# 切换到root账户（注意：使用此命令后，输入密码时屏幕无显示，输入完成按回车即可）；
sudo -i

# 进入补丁文件所在路径（如果你不是放在这个路径的，请自己更改下面的命令）；
cd /volume1/docker

# DSM6.X调整ch_cpuinfo文件的权限；
chmod 755 ch_cpuinfo

# DSM6.X运行ch_cpuinfo文件；
./ch_cpuinfo

# DSM7.X调整ch_cpuinfo文件的权限；
chmod 755 ch_cpuinfo_dsm7

# DSM7.X运行ch_cpuinfo_dsm7文件；
./ch_cpuinfo_dsm7

# 运行后，如果从来没有打过补丁的输入1，打过旧版补丁的先选2卸载旧版本，再输入1安装补丁；
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img1d942eb4e083827d7e60dc2a624e0144.jpg)

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img1632668723-1.jpg)

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgae7eba2541f0fb27ff438c8d8c87a6aa.jpg)

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgc53d2d3b14fa5a6ed8f8bfb00f1e1e07.jpg)

6、关闭 SSH 工具，重启群晖一次；

7、再次打开控制面板的信息中心，就可以看到真实 CPU 的信息了（如果你的 CPU 是不显型号的 ES 版，此处 CPU 型号有可能只显示 00，属于正常现象）。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgddd90ee2d39e5036bd634ad1d23cc537.jpg)

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img1632668726-2.jpg)

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img1660747363-QQ20220817224113.jpg)

原文出处：https://xpenology.com/forum/topic/13030-dsm-5x6x-cpu-name-cores-infomation-change-tool/