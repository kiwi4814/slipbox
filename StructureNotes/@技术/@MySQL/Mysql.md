## 分组隐式排序

Mysql 5.7之后，group by的查询如果有order by ，必须加上limit才能生效



## 时间的处理

MySQL查看SQL_MODE

```mysql
SELECT @@GLOBAL.sql_mode;
-- NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
```

NO_ZERO_DATE表示数据库默认不以0000的形式存储时间而是null



## 内容大小写敏感的处理

针对MySQL对查询的内容不区分大小写的问题【例如导致admin和ADMIN都可以登录】的处理办法如下：

1. SQL中在大小写敏感的字段之前加上BINARY，例如：
       `select * from sys_user where BINARY vc_login_name = 'ADMIN'`
2. 修改表结构大小写敏感类型字段的排序规则为二进制utf8mb4_bin，例如：
       `ALTER TABLE sys_user MODIFY COLUMN vc_login_name VARCHAR ( 500 ) COLLATE utf8mb4_bin;`

