### 一、下载软件本体

[PicGo/PicGo-Core: A tool for pictures uploading. Both CLI & API supports. (github.com)](https://github.com/PicGo/PicGo-Core)



### 二、安装压缩插件 

[JuZiSang/picgo-plugin-compress: Image compression plugin for PicGo (github.com)](https://github.com/JuZiSang/picgo-plugin-compress)



由于网络原因，可能会安装不上，可以参考[安装不上去。 · Issue #2 · JuZiSang/picgo-plugin-compress (github.com)](https://github.com/JuZiSang/picgo-plugin-compress/issues/2)解决，我用的这个命令成功安装。

注意这里要进入到PicGo的目录下去执行，Windows默认为：C:\Users\你的用户名\AppData\Roaming\picgo

```
npm install picgo-plugin-compress --save --registry=https://registry.npm.taobao.org
```

#### 配置压缩插件

没找到怎么改成本地压缩，直接修改了index.js的相关代码，已通过测试。

![image-20220515171002352](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220515171002352.png)

