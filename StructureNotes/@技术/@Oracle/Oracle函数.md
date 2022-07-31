# Oracle函数

## 基本操作

### 查看函数

```sql
SELECT *
  FROM USER_OBJECTS AA
 WHERE AA.OBJECT_TYPE = 'FUNCTION'
 ORDER BY AA.LAST_DDL_TIME DESC;
```



##不常见函数

###`Oracle`树操作

```sql
SELECT RPAD('-', 2 * (LEVEL - 1), '|') || T.VC_TEAM_NAME as PATH
      ,CONNECT_BY_ROOT T.VC_TEAM_NAME AS ROOTNAME
      ,CONNECT_BY_ISLEAF AS ISLEAF
      ,LEVEL AS NODEDEEPTH
      ,SYS_CONNECT_BY_PATH(T.VC_TEAM_NAME, '/') AS PARENTTEAM
      ,t.*
  FROM P_BASEINFO_TEAM T
 -- WHERE T.L_ID = 224
 START WITH T.L_PARENT_TEAM_ID = 0
CONNECT BY PRIOR T.L_ID = T.L_PARENT_TEAM_ID;

RPAD(string, padded_length[, pad_string])  -- 用一组特定的字符填充字符串的右侧（当string1不为空时）
CONNECT_BY_ROOT column_value               -- 返回当前节点的最顶端节点
CONNECT_BY_ISLEAF                          -- 判断是否为叶子节点，如果这个节点下面有子节点，则不为叶子节点
LEVEL                                      -- 伪列表示节点深度
SYS_CONNECT_BY_PATH(column_value, string)  -- 函数显示节点所选字段的详细路径，并用string分隔
WHERE                                      -- 条件
START WITH                                 -- 从此条记录开始
CONNECT BY PRIOR                           -- 上一条记录的L_ID等于此条记录的L_PARENT_TEAM_ID
```

###将逗号分割的数字转换为中文

 ```sql
SELECT WM_CONCAT(DECODE(TRIM(COLUMN_VALUE),
                        '1',
                        '早期项目',
                        '2',
                        '成熟项目',
                        '3',
                        '新三板项目'))
  FROM TABLE(SPLIT('1,   2   ,   3'));
 ```

### TO_CHAR

#### 数字格式化

1. 有9的地方如果有数字就显示，如果没有数字就不显示；
2. 有0的地方在没有数字的时候也会有０来占位；
3. fm表示去掉没有占位的空格；
4. 截取规则为四舍五入。

比如：

```sql
select to_char(0.3456, '999999999990.0000') from dual;
select to_char(0.3456, 'fm999999999990.0000') from dual;
```

特殊情况和解决办法：

```sql
select to_char(99, 'fm99.99'), regexp_replace(to_char(9, 'fm99.99'), '\.$', '')
  from dual
```

