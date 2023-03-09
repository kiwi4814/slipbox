我的 Linux 版本是 CentOS Linux release 7.9.2009，我想安装 nginx，请问如何操作

您可以按照以下步骤在 CentOS 7 上安装 nginx:

1.  确认系统中是否已经安装了 nginx：
    
    Copy code
    
    `nginx -v`
    
    如果系统中没有安装 nginx，则会提示找不到命令。
    
2.  安装 nginx：
    
    sqlCopy code
    
    `sudo yum install epel-release sudo yum install nginx`
    
    请注意，此过程需要使用 sudo 权限进行操作。
    
3.  启动 nginx 服务：
    
    sqlCopy code
    
    `sudo systemctl start nginx`
    
4.  确认 nginx 是否已经启动：
    
    luaCopy code
    
    `sudo systemctl status nginx`
    
    如果 nginx 已经启动，则会提示 active (running)。
    
5.  如果您希望在系统启动时自动启动 nginx 服务，请运行以下命令：
    
    bashCopy code
    
    `sudo systemctl enable nginx`
    

现在，您已经成功地在 CentOS 7 上安装了 nginx。您可以在浏览器中输入服务器的 IP 地址，以查看 nginx 默认页面。默认页面的位置是 /usr/share/nginx/html/index.html。