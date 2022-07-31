备份SQL处理

1. 建表语句里可以用Root用户赋予非Super用户创建函数的权限；

   ```mysql
   SET GLOBAL LOG_BIN_TRUST_FUNCTION_CREATORS = TRUE;
   ```

2. 函数、存储过程和视图建议从SQL中分离出来，切换到对应的用户下单独执行

3. 对于某些数据库中视图与视图之间相互调用，视图与函数之间相互调用等的情况，需要自行调整SQL顺序

   例如IMPS：

   ```
   1. 视图放在最后执行
   2. 视图中的 view_contribute_object 放在视图的第一个位置
   ```



安装完新的MySQL之后：

1. 执行建库脚本
2. 创建用户并赋予权限
3. 分别执行建表脚本
4. 切换用户执行函数脚本

