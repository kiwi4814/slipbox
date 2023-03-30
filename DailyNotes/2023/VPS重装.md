## 一、基本设置

### 修改root密码

```bash
passwd
```

![image-20230330144047311](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230330144047311.webp)

推荐使用[ 密码生成器](https://suijimimashengcheng.bmcx.com/)，并且定期更换，减少服务器被入侵的风险。

### 安装必备工具

```bash
yum update -y
yum install -y python3
yum install -y wget
yum install -y vim
```

### 终端美化（ oh-my-zsh + powerLine）



## 二、常用软件

### httpd
[[centos安装httpd配置简易下载服务器]]

### ZeroTier
[[使用ZeroTier实现内网穿透教程]]

#### 维护

```
sudo systemctl start zerotier-one
sudo systemctl restart zerotier-one
```



### FRP
[[VPS + FRP 实现内网穿透及域名反向代理]]

```
frps start
frps stop
frps restart
```



### Nginx
[[安装Nginx]]

### htop

```
yum install htop
```




## 三、服务器管理

### 1Panel

```bash
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh
```

### Docker
