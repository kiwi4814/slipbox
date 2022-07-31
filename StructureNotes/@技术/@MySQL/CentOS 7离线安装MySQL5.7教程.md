# CentOS 7离线安装MySQL 5.7



#### **操作系统：CentOs 7.7**

#### **MySQL版本：MySQL-5.7.25-x86_64**



#### **安装步骤：**

1. 查找并卸载`mariadb`

   ```shell
   # 查找当前系统下是否有mariadb
   [root@datadriver ~]$ rpm -qa | grep mariadb
   # 卸载
   mariadb-libs-5.5.64-1.el7.x86_64
   [root@datadriver ~]$ rpm -e --nodeps mariadb-libs-5.5.64-1.el7.x86_64
   ```

   

2. 卸载原有的`mysql`相关

   ```shell
   # 查找当前系统是否有mysql
   [root@datadriver ~]$ rpm -qa | grep mysql
   # 删除配置文件
   [root@datadriver ~]$ rm /etc/my.cnf
   # 查找是否存在mysql用户组和用户
   [root@datadriver ~]$ cat /etc/group | grep mysql
   [root@datadriver ~]$ cat /etc/passwd | grep mysql
   ```

   

3. 创建`mysql`用户和组

   ```shell
   # 创建用户组
   [root@datadriver ~]$ groupadd mysql
   # 创建用户
   [root@datadriver ~]$ useradd -g mysql mysql
   # 修改用户密码
   [root@datadriver ~]$ passwd mysql
   Changing password for user mysql.
   New password: 
   Retype new password: 
   passwd: all authentication tokens updated successfully.
   ```

   

4. 将`mysql`离线安装文件上传到服务器上

   （1）[下载地址](https://downloads.mysql.com/archives/community/)及文件位置

   ![image-20200312165133529](/Users/kiwi4814/Library/Application Support/typora-user-images/image-20200312165133529.png)

   

   （2）上传到服务器的`/usr/local/`目录下

   ```shell
   scp /localurl/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz root@host:/usr/local/
   ```

   

5. 解压并建立软链接

   ```shell
   # 注意：5的操作均在此目录下进行
   [root@datadriver ~]$ cd /usr/local/
   # 解压
   [root@datadriver local]$ tar -zxvf mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz
   # 创建软链接
   [root@datadriver local]$ ln -s mysql-5.7.25-linux-glibc2.12-x86_64 mysql
   # 赋予mysql用户权限
   [root@datadriver local]$ chown -R mysql:mysql mysql/
   ```

   

6. 创建相关文件，赋予`mysql`用户权限

   ```shell
   # 分别创建data tmp log文件夹
   # 此目录可自行指定，不过要和mysql配置文件中相一致
   [root@datadriver ~]$ mkdir -p /home/datadriver/mysql/{data,tmp,log}
   # 赋权
   [root@datadriver ~]$ cd /home/datadriver/
   [root@datadriver datadriver]$ chown -R mysql:mysql mysql/
   ```

   

7. 创建并修改配置文件

   ```shell
   # 这里选择将配置文件放在/etc下面，也可以放在mysql根目录下
   [root@datadriver ~]$ cd /etc
   # 创建并编辑my.cnf
   [root@datadriver etc]$ vi my.cnf
   ```

   这里给出一份配置文件作为参考：

   ```ini
   [mysql]
   default-character-set = utf8mb4
   
   [mysqld]
   #  ---------------- Basic ----------------
   server_id = 100
   port = 3306
   basedir = /usr/local/mysql
   datadir = /usr/local/mysql/data
   socket = /tmp/mysql.sock
   skip-host-cache
   skip_name_resolve = 1
   lower_case_table_names=1
   character-set-server = utf8mb4
   collation-server = utf8mb4_general_ci
   init_connect = 'SET NAMES utf8mb4'
   default-storage-engine = INNODB
   group_concat_max_len = 102400
   #skip-external-locking
   #skip-networking
   #  ---------------- Connection/File/Table ----------------
   max_connections = 10000
   max_connect_errors = 20000
   #wait_timeout = 31536000
   #interactive_timeout = 31536000
   wait_timeout = 3600
   interactive_timeout = 3600
   lock_wait_timeout = 1800
   max_allowed_packet = 1024M
   # ---------------- Thread Pool ----------------
   #thread_handling = pool-of-threads
   #thread_pool_oversubscribe = 5
   thread_cache_size = 64
   #extra_max_connections = 10
   #extra_port = 33333
   #  ---------------- log ----------------
   expire_logs_days = 8
   log-bin = mysql-bin
   binlog_format = ROW
   #  ---------------- Others ----------------
   sql_mode = NO_ENGINE_SUBSTITUTION,NO_AUTO_CREATE_USER
   ```

   

8. 安装`mysql`（要先安装依赖）

   ```shell
   # 安装相关依赖，否则会报错，此处不再演示离线安装方式，需要的自行查阅
   [root@datadriver ~]$ yum install libaio*
   # 进入到mysql /bin 目录
   [root@datadriver ~]$ cd /usr/local/myysql/bin/
   # 初始化mysql，指定用户为mysql
   # 此处如果日志中配置了log_error，则控制台不会打印数据
   [root@datadriver bin]$ ./mysqld --initialize --user=mysql
   # 查看日志
   [root@datadriver bin]$ cat ../log/error.log
   
   2020-07-29T06:04:33.666390Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
   2020-07-29T06:04:33.813204Z 0 [Warning] InnoDB: New log files created, LSN=45790
   2020-07-29T06:04:33.848783Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
   2020-07-29T06:04:33.908557Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new UUID: 5fe4d020-d161-11ea-9224-0894ef98b412.
   2020-07-29T06:04:33.909451Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
   2020-07-29T06:04:33.911251Z 1 [Note] A temporary password is generated for root@localhost: -h+#XfgW:4h2
   2020-07-29T06:04:34.357662Z 1 [Warning] 'user' entry 'root@localhost' ignored in --skip-name-resolve mode.
   2020-07-29T06:04:34.357715Z 1 [Warning] 'user' entry 'mysql.session@localhost' ignored in --skip-name-resolve mode.
   2020-07-29T06:04:34.357739Z 1 [Warning] 'user' entry 'mysql.sys@localhost' ignored in --skip-name-resolve mode.
   2020-07-29T06:04:34.357778Z 1 [Warning] 'db' entry 'performance_schema mysql.session@localhost' ignored in --skip-name-resolve mode.
   2020-07-29T06:04:34.357793Z 1 [Warning] 'db' entry 'sys mysql.sys@localhost' ignored in --skip-name-resolve mode.
   2020-07-29T06:04:34.357820Z 1 [Warning] 'proxies_priv' entry '@ root@localhost' ignored in --skip-name-resolve mode.
   2020-07-29T06:04:34.357877Z 1 [Warning] 'tables_priv' entry 'user mysql.session@localhost' ignored in --skip-name-resolve mode.
   2020-07-29T06:04:34.357898Z 1 [Warning] 'tables_priv' entry 'sys_config mysql.sys@localhost' ignored in --skip-name-resolve mode.
   
   ```

   

9. 设置开机启动

   ```shell
   # 进入应用根目录
   [root@datadriver ~]$ cd /usr/local/mysql/
   # 复制启动脚本到资源目录
   [root@datadriver mysql]$ cp ./support-files/mysql.server /etc/rc.d/init.d/mysqld
   # 增加mysqld服务控制脚本执行权限
   [root@datadriver mysql]$ chmod +x /etc/rc.d/init.d/mysqld
   # 将mysqld服务加入到系统服务
   [root@datadriver mysql]$ chkconfig --add mysqld
   # 检查mysqld服务是否已经生效
   [root@datadriver mysql]$ chkconfig --list mysqld
   ```

   

10. 切换至`mysql`用户，设置环境变量

    ```shell
    # 切换至mysql用户
    [root@datadriver ~]$ su - mysql
    # 修改配置文件，增加i
    [mysql@datadriver ~]$ vi .bash_profile 
    # 刷新配置文件使其立即生效
    # export PATH=$PATH:/home/datadriver/mysql/mysql5.7.25/bin
    [mysql@datadriver ~]$ source .bash_profile
    ```

    

11. 启动服务

    ```shell
    # 仍然在mysql用户下，启动mysql（启动用start）
    [mysql@datadriver ~]$ service mysqld restart
    # 重启的时候报警告
    Shutting down MySQL..[  OK  ]
    rm: cannot remove '/var/lock/subsys/mysql': Permission denied
    Starting MySQL.[  OK  ]
    # 切回root用户，赋权即即可
    [mysql@datadriver ~]$ su - root 
    [root@datadriver ~]$ cd /var/lock/
    [root@datadriver lock]$ chown -R mysql:mysql subsys/
    # 切回mysql重启，成功。
    [mysql@datadriver ~]$ service mysqld restart
    Shutting down MySQL..[  OK  ]
    Starting MySQL.[  OK  ]
    ```

    

12. 修改`mysql`默认密码并设置远程连接

    ```sql
    -- 修改密码
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
    set password for root@localhost=password("root");
    flush privileges;
    -- 远程连接
    use mysql;
    update user set host='%' where user='root';
    flush privileges;
    ```

