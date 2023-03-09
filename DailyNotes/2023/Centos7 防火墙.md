## 查看防火墙状态
`systemctl status firewalld`

```
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled; vendor preset: enabled)
   Active: inactive (dead)
     Docs: man:firewalld(1)
```



## 开启或关闭防火墙命令

- 开启命令：`systemctl start firewalld`
- 临时关闭命令：`systemctl stop firewalld`
- 永久关闭命令：`systemctl disable firewalld`





## 开放指定端口



```
sudo firewall-cmd --zone=public --add-port=28336/tcp --permanent      //开启28336端口
```



```
sudo firewall-cmd --zone=public --add-port=11400-11410/tcp --permanent      //开启11400至11410端口段
```



```javascript
sudo firewall-cmd --reload      //载入防火墙配置
```