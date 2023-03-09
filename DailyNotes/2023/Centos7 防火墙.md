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
sudo firewall-cmd --zone=public --add-port=28336/tcp --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
```



```
sudo firewall-cmd --zone=public --add-port=11400-11410/tcp --permanent      //开启11400至11410端口段
```



```javascript
sudo firewall-cmd --reload      //载入防火墙配置
```



## 关闭指定端口

在 CentOS 7 中关闭指定的端口，您可以使用以下命令：

1. 查看当前开放的端口及其对应的服务：

   ```
   sudo firewall-cmd --list-ports
   ```

   或者

   ```
   sudo firewall-cmd --list-services
   ```

   这些命令将显示当前在防火墙上打开的端口或服务列表。

2. 关闭指定端口：

   ```
   sudo firewall-cmd --zone=public --remove-port=<端口号>/tcp --permanent
   ```

   将 `<端口号>` 替换为您要关闭的端口号，例如，如果要关闭 8080 端口，您可以使用以下命令：

   ```
   sudo firewall-cmd --zone=public --remove-port=8080/tcp --permanent
   ```

   这个命令将从防火墙永久规则中删除指定的端口。

3. 重新加载防火墙规则：

   ```
   sudo firewall-cmd --reload
   ```

   这个命令将重新加载防火墙规则，以确保新的规则生效。

请注意，关闭某个端口可能会影响正在使用该端口的服务或应用程序。如果您不确定要关闭哪个端口，请先确认端口对应的服务或应用程序，并确保关闭该端口不会影响这些服务或应用程序的正常运行。