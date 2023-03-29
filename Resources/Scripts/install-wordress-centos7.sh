#!/bin/bash
# centos7/8 WordPress一键安装脚本
# Author: tlanyan
# link: https://itlanyan.com

RED="\033[31m"      # Error message
GREEN="\033[32m"    # Success message
YELLOW="\033[33m"   # Warning message
BLUE="\033[36m"     # Info message
PLAIN='\033[0m'

VERSION=$1
[[ -z $1 ]] && VERSION=8.0

echo $RED "安装PHP版本：${VERSION}"

colorEcho() {
    echo -e "${1}${@:2}${PLAIN}"
}

checkSystem() {
    uid=$(id -u)
    if [[ $uid -ne 0 ]]; then
        colorEcho $RED " 请以root身份执行该脚本"
        exit 1
    fi

    res=$(command -v yum)
    if [[ "$res" = "" ]]; then
        res=$(command -v apt)
        if [[ "$res" = "" ]]; then
            colorEcho $RED " 不受支持的Linux系统"
            exit 1
        fi
        PMT="apt"
        CMD_INSTALL="apt install -y "
        CMD_REMOVE="apt remove -y "
        CMD_UPGRADE="apt update; apt upgrade -y; apt autoremove -y"
        PHP_SERVICE="php${VERSION}-fpm"
        PHP_CONFIG_FILE="/etc/php/${VERSION}/fpm/php.ini"
        PHP_POOL_FILE="/etc/php/${VERSION}/fpm/pool.d/www.conf"
    else
        PMT="yum"
        CMD_INSTALL="yum install -y "
        CMD_REMOVE="yum remove -y "
        CMD_UPGRADE="yum update -y"
        PHP_SERVICE="php-fpm"
        PHP_CONFIG_FILE="/etc/php.ini"
        PHP_POOL_FILE="/etc/php-fpm.d/www.conf"
        result=`grep -oE "[0-9.]+" /etc/centos-release`
        MAIN=${result%%.*}
    fi
    res=$(command -v systemctl)
    if [[ "$res" = "" ]]; then
        colorEcho $RED " 系统版本过低，请升级到最新版本"
        exit 1
    fi
}

collect() {
    read -p " 运行该脚本可能会导致数据库信息丢失，是否继续？[y/n]" answer
    [[ "$answer" != "y" && "$answer" != "Y" ]] && exit 0

    while true
    do
        read -p " 请输入您的域名：" DOMAIN
        if [[ ! -z "$DOMAIN" ]]; then
            break
        fi
    done
}

preInstall() {
    $PMT clean all
    [[ "$PMT" = "apt" ]] && $PMT update

    colorEcho $BLUE " 安装必要软件"
    if [[ "$PMT" = "yum" ]]; then
        $CMD_INSTALL epel-release
    fi
    $CMD_INSTALL wget vim unzip tar net-tools
}

installNginx() {
    colorEcho $BLUE " 安装nginx..."
    if [[ "$PMT" = "yum" ]]; then
        $CMD_INSTALL epel-release 
    fi
    $CMD_INSTALL nginx
    systemctl enable nginx
}

installPHP() {
    [[ "$PMT" = "apt" ]] && $PMT update
    $CMD_INSTALL curl wget ca-certificates
    if [[ "$PMT" = "yum" ]]; then 
        $CMD_INSTALL epel-release
        if [[ $MAIN -eq 7 ]]; then
            rpm -iUh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
            sed -i '0,/enabled=0/{s/enabled=0/enabled=1/}' /etc/yum.repos.d/remi-php74.repo
        else
            rpm -iUh https://rpms.remirepo.net/enterprise/remi-release-8.rpm
            sed -i '0,/enabled=0/{s/enabled=0/enabled=1/}' /etc/yum.repos.d/remi.repo
            dnf module install -y php:remi-${VERSION}
        fi
        $CMD_INSTALL php-cli php-fpm php-bcmath php-gd php-mbstring php-mysqlnd php-pdo php-opcache php-xml php-pecl-zip php-pecl-imagick php-intl
    else
        $CMD_INSTALL lsb-release gnupg2
        wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list
        $PMT update
        $CMD_INSTALL php${VERSION}-cli php${VERSION}-fpm php${VERSION}-bcmath php${VERSION}-gd php${VERSION}-mbstring php${VERSION}-mysql php${VERSION}-opcache php${VERSION}-xml php${VERSION}-zip php${VERSION}-imagick php${VERSION}-intl
        #update-alternatives --set php /usr/bin/php${VERSION}
    fi
    systemctl enable $PHP_SERVICE
}

installMysql() {
    if [[ "$PMT" = "yum" ]]; then 
        yum remove -y MariaDB-server
        if [ ! -f /etc/yum.repos.d/mariadb.repo ]; then
            if [ $MAIN -eq 7 ]; then
                echo '# MariaDB 10.5 CentOS repository list - created 2019-11-23 15:00 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.5/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' >> /etc/yum.repos.d/mariadb.repo
            else
                echo '# MariaDB 10.5 CentOS repository list - created 2020-03-11 16:29 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.5/centos8-amd64
module_hotfixes=1
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' >>  /etc/yum.repos.d/mariadb.repo
            fi
        fi
        yum install -y MariaDB-server
    else
        $PMT update
        $CMD_INSTALL mariadb-server
    fi
    systemctl enable mariadb.service
}

installRedis() {
    $CMD_INSTALL redis
    systemctl enable redis
}

installWordPress() {
    mkdir -p /var/www
    wget https://cn.wordpress.org/latest-zh_CN.tar.gz
    if [[ ! -f latest-zh_CN.tar.gz ]]; then
    	colorEcho $RED " 下载WordPress失败，请稍后重试"
	    exit 1
    fi
    tar -zxf latest-zh_CN.tar.gz
    rm -rf /var/www/$DOMAIN
    mv wordpress /var/www/$DOMAIN
    rm -rf latest-zh_CN.tar.gz
}

config() {
    # config mariadb
    systemctl start mariadb
    DBNAME="wordpress"
    DBUSER="wordpress"
    DBPASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
    mysql -uroot <<EOF
DELETE FROM mysql.user WHERE User='';
CREATE DATABASE $DBNAME default charset utf8mb4;
CREATE USER ${DBUSER}@'%' IDENTIFIED BY '${DBPASS}';
GRANT ALL PRIVILEGES ON ${DBNAME}.* to ${DBUSER}@'%';
FLUSH PRIVILEGES;
EOF

    #config php
    sed -i 's/expose_php = On/expose_php = Off/' $PHP_CONFIG_FILE
    line=`grep 'date.timezone' $PHP_CONFIG_FILE | tail -n1 | awk '{print $1}'`
    sed -i "${line}a date.timezone = Asia/Shanghai" $PHP_CONFIG_FILE
    sed -i 's/php_value\[session.save_handler\] = files/php_value\[session.save_handler\] = redis/' $PHP_POOL_FILE
    sed -i 's/php_value\[session.save_path\]    = \/var\/lib\/php\/session/php_value\[session.save_path\]    = "tcp:\/\/127.0.0.1:6379"/' $PHP_POOL_FILE

    # config wordpress
    cd /var/www/$DOMAIN
    cp wp-config-sample.php wp-config.php
    sed -i "s/database_name_here/$DBNAME/g" wp-config.php
    sed -i "s/username_here/$DBUSER/g" wp-config.php
    sed -i "s/password_here/$DBPASS/g" wp-config.php
    sed -i "s/utf8/utf8mb4/g" wp-config.php
    perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php
    if [[ "$PMT" = "yum" ]]; then
        user="apache"
        # config nginx
        [[ $MAIN -eq 7 ]] && upstream="127.0.0.1:9000" || upstream="php-fpm"
    else
        user="www-data"
        upstream="unix:/run/php/php${VERSION}-fpm.sock"
    fi
    chown -R $user:$user /var/www/${DOMAIN}

    # config nginx
    res=`id nginx 2>/dev/null`
    if [[ "$?" != "0" ]]; then
        user="www-data"
    else
        user="nginx"
    fi
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
    cat > /etc/nginx/nginx.conf<<-EOF
user $user;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for" "\$request_time"';

    access_log  /var/log/nginx/access.log  main buffer=32k flush=30s;

    server_tokens       off;
    client_max_body_size 100m;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;
    ssl_ecdh_curve secp384r1; 
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;
    ssl_session_tickets off;
    ssl_stapling on; # Requires nginx >= 1.3.7
    ssl_stapling_verify on; # Requires nginx => 1.3.7
    add_header Strict-Transport-Security "max-age=63072000; preload";
    #add_header X-Frame-Options DENY;
    add_header X-Frame-Options SAMEORIGIN;
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";

    fastcgi_cache_path /dev/shm/wordpress levels=1:2 keys_zone=wordpress:30m inactive=30m use_temp_path=off;
    fastcgi_cache_key \$request_method\$scheme\$host\$request_uri;
    fastcgi_cache_lock on;
    fastcgi_cache_use_stale error timeout invalid_header updating http_500;
    fastcgi_cache_valid 200 301 302 30m;
    fastcgi_cache_valid 404 10m;
    fastcgi_ignore_headers Expires Set-Cookie Vary;

    gzip on;
    gzip_min_length  2k;
    gzip_buffers     4 16k;
    gzip_comp_level 4;
    gzip_types
        text/css
        text/plain
        text/javascript
        application/javascript
        application/json
        application/x-javascript
        application/xml
        application/xml+rss
        application/xhtml+xml
        application/x-font-ttf
        application/x-font-opentype
        application/vnd.ms-fontobject
        image/svg+xml
        application/rss+xml
        application/atom_xml
        image/jpeg
        image/gif
        image/png
        image/icon
        image/bmp
        image/jpg;
    gzip_vary on;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;
}
EOF
    cat > /etc/nginx/conf.d/${DOMAIN}.conf<<-EOF
server {
    listen 80;
    server_name ${DOMAIN};
    
    charset utf-8;
    
    set \$host_path "/var/www/${DOMAIN}";
    access_log  /var/log/nginx/${DOMAIN}.access.log  main buffer=32k flush=30s;
    error_log /var/log/nginx/${DOMAIN}.error.log;

    root   \$host_path;

    set \$skip_cache 0;
    if (\$query_string != "") {
        set \$skip_cache 1;
    }
    if (\$request_uri ~* "/wp-admin/|/xmlrpc.php|wp-.*.php|/feed/|sitemap(_index)?.xml") {
        set \$skip_cache 1;
    }
    # 登录用户或发表评论者
    if (\$http_cookie ~* "comment_author|wordpress_[a-f0-9]+|wp-postpass|wordpress_no_cache|wordpress_logged_in") {
        set \$skip_cache 1;
    }

    location = / {
        index  index.php index.html;
        try_files /index.php?\$args /index.php?\$args;
    }

    location / {
        index  index.php index.html;
        try_files \$uri \$uri/ /index.php?\$args;
    }
    location ~ ^/\.user\.ini {
            deny all;
    }

    location ~ \.php\$ {
        try_files \$uri =404;
        fastcgi_index index.php;
        fastcgi_cache wordpress;
        fastcgi_cache_bypass \$skip_cache;
        fastcgi_no_cache \$skip_cache;
        fastcgi_pass $upstream;
        include fastcgi_params;
        fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;
    }
    location ~ \.(js|css|png|jpg|jpeg|gif|ico|swf|webp|pdf|txt|doc|docx|xls|xlsx|ppt|pptx|mov|fla|zip|rar)\$ {
        expires max;
        access_log off;
        try_files \$uri =404;
    }
}
EOF

    #disable selinux
    if [ -s /etc/selinux/config ] && grep 'SELINUX=enforcing' /etc/selinux/config; then
        sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
        setenforce 0
    fi

    # firewall
    setFirewall

    # restart service
    systemctl restart php-fpm mariadb nginx redis
}

setFirewall() {
    res=`which firewall-cmd 2>/dev/null`
    if [[ $? -eq 0 ]]; then
        systemctl status firewalld > /dev/null 2>&1
        if [[ $? -eq 0 ]];then
            firewall-cmd --permanent --add-service=http
            firewall-cmd --permanent --add-service=https
            firewall-cmd --reload
        else
            nl=`iptables -nL | nl | grep FORWARD | awk '{print $1}'`
            if [[ "$nl" != "3" ]]; then
                iptables -I INPUT -p tcp --dport 80 -j ACCEPT
                iptables -I INPUT -p tcp --dport 443 -j ACCEPT
            fi
        fi
    else
        res=`which iptables 2>/dev/null`
        if [[ $? -eq 0 ]]; then
            nl=`iptables -nL | nl | grep FORWARD | awk '{print $1}'`
            if [[ "$nl" != "3" ]]; then
                iptables -I INPUT -p tcp --dport 80 -j ACCEPT
                iptables -I INPUT -p tcp --dport 443 -j ACCEPT
            fi
        else
            res=`which ufw 2>/dev/null`
            if [[ $? -eq 0 ]]; then
                res=`ufw status | grep -i inactive`
                if [[ "$res" = "" ]]; then
                    ufw allow http
                    ufw allow https
                fi
            fi
        fi
    fi
}

function installBBR()
{
    result=$(lsmod | grep bbr)
    if [ "$result" != "" ]; then
        colorEcho $YELLOW " BBR模块已安装"
        INSTALL_BBR=false
        return
    fi
    res=`hostnamectl | grep -i openvz`
    if [ "$res" != "" ]; then
        colorEcho $YELLOW " openvz机器，跳过安装"
        INSTALL_BBR=false
        return
    fi
    
    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p
    result=$(lsmod | grep bbr)
    if [[ "$result" != "" ]]; then
        colorEcho $GREEN " BBR模块已启用"
        INSTALL_BBR=false
        return
    fi

    colorEcho $BLUE " 安装BBR模块..."
    if [[ "$PMT" = "yum" ]]; then
        if [[ "$V6_PROXY" = "" ]]; then
            rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
            rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
            $CMD_INSTALL --enablerepo=elrepo-kernel kernel-ml
            $CMD_REMOVE kernel-3.*
            grub2-set-default 0
            echo "tcp_bbr" >> /etc/modules-load.d/modules.conf
            INSTALL_BBR=true
        fi
    else
        $CMD_INSTALL --install-recommends linux-generic-hwe-16.04
        grub-set-default 0
        echo "tcp_bbr" >> /etc/modules-load.d/modules.conf
        INSTALL_BBR=true
    fi
}

showInfo() {
    echo " WordPress安装成功！"
    echo "==============================="
    echo -e " WordPress安装路径：${RED}/var/www/${DOMAIN}${PLAIN}"
    echo -e " WordPress数据库：${RED}${DBNAME}${PLAIN}"
    echo -e " WordPress数据库用户名：${RED}${DBUSER}${PLAIN}"
    echo -e " WordPress数据库密码：${RED}${DBPASS}${PLAIN}"
    echo -e " 博客访问地址：${RED}http://${DOMAIN}${PLAIN}"
    echo "==============================="

    if [ "${INSTALL_BBR}" == "true" ]; then
        echo  
        echo  为使BBR模块生效，系统将在30秒后重启
        echo  
        echo -e "您可以按 ctrl + c 取消重启，稍后输入 ${RED}reboot${PLAIN} 重启系统"
        sleep 30
        reboot
    fi
}

main() {
    checkSystem
    collect
    preInstall
    installNginx
    installPHP
    installMysql
    installWordPress
    installRedis
    installBBR

    config

    showInfo
}

main
