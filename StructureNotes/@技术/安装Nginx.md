## Centos7 安装 Linux

Linux 版本： CentOS Linux release 7.9.2009



1. 确认系统中是否已经安装了 nginx：

   ```bash
   nginx -v
   ```

   如果系统中没有安装 nginx，则会提示找不到命令。

2. 安装 nginx：

   ```bash
   sudo yum install epel-release
   sudo yum install nginx
   ```

   请注意，此过程需要使用 sudo 权限进行操作。

3. 启动 nginx 服务：

   ```bash
   sudo systemctl start nginx
   ```

4. 确认 nginx 是否已经启动：

   ```bash
   sudo systemctl status nginx
   ```

   如果 nginx 已经启动，则会提示 active (running)。

5. 如果您希望在系统启动时自动启动 nginx 服务，请运行以下命令：

   ````
   sudo systemctl enable nginx
   ````

在浏览器中输入服务器的 IP 地址，以查看 nginx 默认页面。默认页面的位置是 /usr/share/nginx/html/index.html。