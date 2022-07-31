## 根版本数据库初始化流程

### 杀掉所有相关进程（可选）

```sql
-- 查看当前登录用户和缺省表空间
SELECT USERNAME,DEFAULT_TABLESPACE FROM USER_USERS;
-- 查询相关进程
SELECT SID, SERIAL#, USERNAME FROM V$SESSION WHERE USERNAME LIKE 'INVEST_HXNY%';
-- 16和60分别对应上述SQL中的SID和SERIAL#
ALTER SYSTEM KILL SESSION '16, 60';
```

### 删除之前已存在的用户和表空间

```sql
-- 删除用户
DROP USER invest_hxny CASCADE;
-- 删除表空间
DROP TABLESPACE DATA_INVEST_HXNY INCLUDING CONTENTS AND DATAFILES;
```

### 创建新用户和表空间

```sql
--创建表空间
CREATE TABLESPACE DATA_INVEST_HXNY DATAFILE 'D:\Oradata\orcl\DATA_INVEST_HXNY.DBF' SIZE 400M AUTOEXTEND ON;
--创建用户
CREATE USER invest_hxny IDENTIFIED BY invest_hxny DEFAULT TABLESPACE DATA_INVEST_HXNY;
--赋予用户登录权限
GRANT DBA TO invest_hxny;
```

### 导入之前的准备

由于第一次导出时遇到错误:

```verilog
已经完成 ZHS16GBK 字符集和 AL16UTF16 NCHAR 字符集中的导入
导出客户机使用 AL32UTF8 字符集 (可能的字符集转换)
. 正在将 INVEST_HUAXING_TEST 的对象导入到 INVEST_HXNY
IMP-00017: 由于 ORACLE 错误 2304, 以下语句失败:
 "CREATE TYPE "P_DATE_ARRAY" TIMESTAMP '2017-07-18:13:34:03' OID '3C9C519A288"
 "B40AC96C50C369B7C09C7'   is varray(1000000) of date"
IMP-00003: 遇到 ORACLE 错误 2304
ORA-02304: 无效的对象标识符文字
```

原因是当我们使用`exp/imp`工具进行同数据库实例（`Instance`）不同`Schema`之间数据拷贝时，如果`Schema`中有`type`类型，就会出现问题错误。([原贴链接](http://www.linuxidc.com/Linux/2012-06/63946.htm))

所以在使用`exp/imp`工具导入之前，就手动将`type`对象创建好。这样最多在`imp`设置`ignore=y`的时候报错对象重复。

```sql
CREATE OR REPLACE TYPE "P_DATE_ARRAY" IS VARRAY(1000000) OF DATE
/
CREATE OR REPLACE TYPE "TABLETYPE" AS TABLE OF VARCHAR2(32676)
/
CREATE OR REPLACE TYPE "TYPE_SPLIT" AS TABLE OF VARCHAR2(5000)
/
CREATE OR REPLACE TYPE "T_AMOUNT_ARRAY" IS VARRAY(1000000) OF NUMBER
/
CREATE OR REPLACE TYPE "t_amount_array_"
/
```

### 导入含数据的旧数据库文件

执行`exp_hxny.bat`文件

```shell
imp invest_hxny/invest_hxny file=D:/Oradata/dmp/invest_huaxing_1018.dmp full=y log=invest_huaxing_1018.log commit=y ignore=y
```

### 清库

```sql
SELECT 'TRUNCATE TABLE ' || TNAME || ';'
  FROM TAB
 WHERE TABTYPE = 'TABLE'
   AND NOT (TNAME LIKE 'ACT_%')
   AND NOT (TNAME = 'E_DIM' OR TNAME = 'E_MENU_ITEM' OR TNAME = 'SYS_ROLE' OR
        TNAME = 'SYS_USER' OR TNAME = 'SYS_ROLE_ACTION' OR
        TNAME = 'SYS_ACTION' OR TNAME = 'SYS_USER_ROLE' OR
        TNAME = 'P_DOC_TYPE' OR TNAME = 'FIN_REPORT_TYPE' OR
        TNAME = 'D_PROVIN' OR TNAME = 'D_PROVIN' OR
        TNAME = 'D_INDUSTRY_TYPE' OR TNAME = 'D_COUNTRY' OR
        TNAME = 'D_CODE' OR TNAME = 'E_NC_FSMID_CURRRATE' OR
        TNAME = 'P_RISKWARN_MOULD' OR TNAME = 'WC_MODEL_DETAIL');
```

### 处理`truncate`过程中遇到的`oracle`错误

**`ORA-02266: 表中的唯一/主键被启用的外部关键字引用`**

对每个报此错误的表执行下面的语句：

```sql
alter table TABLE_NAME disable primary key cascade;
truncate table TABLE_NAME;
alter table TABLE_NAME enable primary key;
```

比如在此例中：

```sql
alter table P_CUSTOM_REPORT_SQL disable primary key cascade;
truncate table P_CUSTOM_REPORT_SQL;
alter table P_CUSTOM_REPORT_SQL enable primary key;

alter table QRTZ_JOB_DETAILS disable primary key cascade;
truncate table QRTZ_JOB_DETAILS;
alter table QRTZ_JOB_DETAILS enable primary key;

alter table QRTZ_TRIGGERS disable primary key cascade;
truncate table QRTZ_TRIGGERS;
alter table QRTZ_TRIGGERS enable primary key;

alter table T_BUSINESS_TRACE_YEAR disable primary key cascade;
truncate table T_BUSINESS_TRACE_YEAR;
alter table T_BUSINESS_TRACE_YEAR enable primary key;

alter table T_PROJECT_PRELIMINARY disable primary key cascade;
truncate table T_PROJECT_PRELIMINARY;
alter table T_PROJECT_PRELIMINARY enable primary key;

alter table T_TRANSACTION_BASE disable primary key cascade;
truncate table T_TRANSACTION_BASE;
alter table T_TRANSACTION_BASE enable primary key;

alter table WC_BASE_INFO disable primary key cascade;
truncate table WC_BASE_INFO;
alter table WC_BASE_INFO enable primary key;

```

### 流程引擎相关表的删除和创建

先后执行`流程中心更新及配置\camunda-oracle-init\drop `以及`流程中心更新及配置\camunda-oracle-init\create `下的`SQL`文件。

另外，在`drop`完成后，系统会生成`BIN$`开头的表，原因是：

从`oracle10g`开始删除数据库表的时候不是真正删除，而是放到了`recyclebin`中，这个过程类似`windows`删除文件放到了回收站。 
删除表后系统会自动的给这些表重命名，就是那些`BIN$`开头的表。

一些常用的相关操作：

```sql
-- 查看删除的表的详细信息
show recyclebin;
select * from recyclebin; 
-- 撤销删除的表
flashback table 原表名 to before drop;
-- 清空回收站
purge recyclebin;
-- 不经过回收站直接删除
drop table table_name purge; 
-- 停用数据库的回收功能
alert system set '_recyclebin' = false; -- 10.1版本 
alert system set recyclebin = off; 		-- 10.2版本
```

#### 删除某些表的非管理员数据

```sql
DELETE FROM SYS_ROLE_ACTION SRA WHERE SRA.L_ROLE_ID !=200;
DELETE FROM SYS_USER_ROLE SUR WHERE SUR.L_USER_ID !=21;
DELETE FROM SYS_USER SU WHERE SU.L_USER_ID !=21;
```

#### 后续操作

```sql
-- 新增顶级部门
INSERT INTO SYS_DEPARTMENT (L_DEPARTMENT_ID, VC_NAME, VC_REMARK, L_PARENT_DEPARTMENT_ID, L_STATUS, L_LEADER_ID, L_TYPE, L_RESOURCE_TYPE, L_DEPT_ORD, VC_ASSISTANT_EMAIL)
VALUES (1, '顶级部门', NULL, 0, 0, NULL, NULL, 0, NULL, NULL);

-- 新增顶级团队
INSERT INTO P_BASEINFO_TEAM (L_ID, L_PARENT_TEAM_ID, VC_TEAM_NAME, L_TEAM_LEADER, D_ENTER_TIME, D_UPDATE_TIME, VC_REMARK, VC_TYPE, IS_SHARE)
VALUES (1, 0, '顶级团队', NULL, SYSDATE, SYSDATE, NULL, '1', NULL);

-- 新增系统管理员(如果没有清空SYS_USER表，则不需要执行)
INSERT INTO SYS_USER (L_USER_ID, VC_NAME, L_SEX, VC_USER_NAME, VC_PASSWORD, VC_ID_CARD_NO, VC_ADDRESS, VC_PHONE, VC_FAX, VC_EMAIL, VC_MOBILE, VC_REMARK, L_STATUS, VC_COMPANY, VC_PRICE, L_GRADE, VC_AD_VALUE, VC_USER_TYPE, VC_BIRTHDAY, L_LEAVE, VC_ISLOCK, N_ERROR_TIMES, LOCK_TIMESTAMP)
VALUES (21, '系统管理员', 0, 'admin', '21218cca77804d2ba1922c33e0151105', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2', NULL, 0, 'n', NULL, NULL);

-- 新增管理员和角色的关联(如果没有清空SYS_USER_ROLE表，则不需要执行)
INSERT INTO SYS_USER_ROLE (L_USER_ID, L_ROLE_ID, L_TEAM_ID, L_PROJECT_ID)
VALUES (21, 200, NULL, NULL);

```

#### 查验表空间、函数和存储过程等

```
select * from user_tables
```

