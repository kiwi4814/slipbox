> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [blog.csdn.net](https://blog.csdn.net/catoop/article/details/86694473)

群晖安装 MariaDB10 后，默认仅支持本机连接，也就是说，你的局域网电脑是连接不上的，如果需要局域网连接，需要做处理。

环境：群晖 6.2、MariaDB10

处理方法：  
1、使用 [ssh](https://so.csdn.net/so/search?q=ssh&spm=1001.2101.3001.7020) 登录到群晖  
2、进入 MariaDB 默认安装目录

```
cd /volume1/@appstore/MariaDB10/usr/local/mariadb10/bin
```

3、使用 root 登录 MariaDB，然后进行修改

```
root@HOME-NAS:/volume1/@appstore/MariaDB10/usr/local/mariadb10/bin# ./mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 20
Server version: 10.3.7-MariaDB Source distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use mysql
Database changed
MariaDB [mysql]> update user set host = '%' where user = 'root';
ERROR 1062 (23000): Duplicate entry '%-root' for key 'PRIMARY'
MariaDB [mysql]> select host,user from user;
+-----------+------+
| host      | user |
+-----------+------+
| %         | root |
| 127.0.0.1 | root |
| ::1       | root |
+-----------+------+
3 rows in set (0.000 sec)

MariaDB [mysql]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.053 sec)

MariaDB [mysql]>
```

其中 host 为 `%` 表示不限制 IP，你也可以设置具体的 IP 地址，或者网段 `192.168.1.%` 这样。  
另外，上面出现的 `ERROR 1062 (23000): Duplicate entry '%-root' for key 'PRIMARY'` 不予理会，其意思是 host 为主键，不能设置重复的值。所以我们后来的查询中，host 还是 3 个不同的值。刚刚执行的 update 语句只成功修改了数据库中一条数据。

4、不需要重启服务，即可连接登录。

（END）