```shell
[root@kiwi ~]# rpm -qa|grep mariadb
mariadb-libs-5.5.64-1.el7.x86_64
[root@kiwi ~]# rpm -e --nodeps mariadb-libs-5.5.64-1.el7.x86_64
[root@kiwi ~]# rm /etc/my.cnf
rm: 无法删除"/etc/my.cnf": 没有那个文件或目录
[root@kiwi ~]# rpm -qa|grep mariadb
[root@kiwi ~]# rm /etc/my.cnf
rm: 无法删除"/etc/my.cnf": 没有那个文件或目录
[root@kiwi ~]# rm /etc/my.cnf
rm: 无法删除"/etc/my.cnf": 没有那个文件或目录
[root@kiwi ~]# rpm -qa | grep mysql
[root@kiwi ~]# cat /etc/group | grep mysql
[root@kiwi ~]# cat /etc/passwd | grep mysql 
[root@kiwi ~]# cat /etc/passwd|grep -v nologin|grep -v halt|grep -v shutdown|awk -F ":" '{print $1 "|" $3 "1" $4}' | more
root|010
sync|510
[root@kiwi ~]# groupadd mysql
[root@kiwi ~]# useradd -g mysql mysql
[root@kiwi ~]# passwd mysql
更改用户 mysql 的密码 。
新的 密码：
无效的密码： 密码少于 8 个字符
重新输入新的 密码：
抱歉，密码不匹配。
新的 密码：
重新输入新的 密码：
passwd：所有的身份验证令牌已经成功更新。
[root@kiwi ~]# cd /usr/local/
[root@kiwi local]# rz
-bash: rz: 未找到命令
[root@kiwi local]# rz
-bash: rz: 未找到命令
[root@kiwi local]# scp /Users/kiwi4814/Desktop/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz
usage: scp [-12346BCpqrv] [-c cipher] [-F ssh_config] [-i identity_file]
           [-l limit] [-o ssh_option] [-P port] [-S program]
           [[user@]host1:]file1 ... [[user@]host2:]file2
[root@kiwi local]# scp /Users/kiwi4814/Desktop/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz 47.98.112.197:mysql-5.7.25-linux-glibc2.12-x86_64.tar
The authenticity of host '47.98.112.197 (47.98.112.197)' can't be established.
ECDSA key fingerprint is SHA256:ri1N70jAjFqPtC7dFN38dtCQ58WmRRXN6YFjsw9rzD0.
ECDSA key fingerprint is MD5:55:1e:25:4c:af:ad:d1:f1:9e:f4:b6:57:1a:b4:79:5d.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '47.98.112.197' (ECDSA) to the list of known hosts.
root@47.98.112.197's password: 
/Users/kiwi4814/Desktop/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz: No such file or directory
[root@kiwi local]# scp /Users/kiwi4814/Desktop/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz 47.98.112.197:/usr/local/
root@47.98.112.197's password: 
/Users/kiwi4814/Desktop/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz: No such file or directory
[root@kiwi local]# scp /Users/kiwi4814/Desktop/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz root@47.98.112.197:/usr/local/
root@47.98.112.197's password: 
/Users/kiwi4814/Desktop/mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz: No such file or directory
[root@kiwi local]# ls
aegis  bin  etc  games  include  lib  lib64  libexec  mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz  sbin  share  src
[root@kiwi local]# ls
aegis  bin  etc  games  include  lib  lib64  libexec  mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz  sbin  share  src
[root@kiwi local]# 
[root@kiwi local]# 
[root@kiwi local]# 
[root@kiwi local]# 
[root@kiwi local]# 
[root@kiwi local]# 
[root@kiwi local]# tar -zxvf mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz 
mysql-5.7.25-linux-glibc2.12-x86_64/bin/myisam_ftdump
mysql-5.7.25-linux-glibc2.12-x86_64/bin/myisamchk
mysql-5.7.25-linux-glibc2.12-x86_64/bin/myisamlog
mysql-5.7.25-linux-glibc2.12-x86_64/bin/myisampack
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_client_test_embedded
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_config_editor
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_embedded
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_install_db
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_plugin
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_secure_installation
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_ssl_rsa_setup
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_tzinfo_to_sql
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_upgrade
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqladmin
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqlbinlog
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqlcheck
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqldump
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqlimport
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqlpump
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqlshow
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqlslap
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqltest_embedded
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqlxtest
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqld-debug
mysql-5.7.25-linux-glibc2.12-x86_64/lib/libmysqld-debug.a
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysql_config
mysql-5.7.25-linux-glibc2.12-x86_64/include/big_endian.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/binary_log_types.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/byte_order_generic.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/byte_order_generic_x86.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/decimal.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/errmsg.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/keycache.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/little_endian.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/m_ctype.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/m_string.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_alloc.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_byteorder.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_command.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_compiler.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_config.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_dbug.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_dir.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_getopt.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_global.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_list.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_sys.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_thread.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_thread_local.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/my_xml.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/client_authentication.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/client_plugin.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/client_plugin.h.pp
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/com_data.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/get_password.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/group_replication_priv.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/innodb_priv.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/mysql_lex_string.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_audit.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_audit.h.pp
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_auth.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_auth.h.pp
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_auth_common.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_ftparser.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_ftparser.h.pp
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_group_replication.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_keyring.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_keyring.h.pp
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_trace.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/plugin_validate_password.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_file.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_idle.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_mdl.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_memory.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_ps.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_socket.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_sp.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_stage.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_statement.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_table.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_thread.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/mysql_transaction.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/psi.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/psi_base.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/psi/psi_memory.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_command.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_locking.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_my_plugin_log.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_my_snprintf.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_mysql_alloc.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_mysql_keyring.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_mysql_password_policy.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_mysql_string.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_parser.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_rpl_transaction_ctx.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_rpl_transaction_write_set.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_rules_table.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_security_context.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_srv_session.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_srv_session_info.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_ssl_wrapper.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_thd_alloc.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_thd_engine_lock.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_thd_wait.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/service_thread_scheduler.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/services.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/services.h.pp
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/thread_pool_priv.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql/thread_type.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql_com.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql_com_server.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql_embed.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql_time.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysql_version.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysqld_ername.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/mysqld_error.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/plugin.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/plugin_audit.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/plugin_ftparser.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/plugin_group_replication.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/plugin_keyring.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/plugin_validate_password.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/sql_common.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/sql_state.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/sslopt-case.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/sslopt-longopts.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/sslopt-vars.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/thr_cond.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/thr_mutex.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/thr_rwlock.h
mysql-5.7.25-linux-glibc2.12-x86_64/include/typelib.h
mysql-5.7.25-linux-glibc2.12-x86_64/lib/libmysqlclient.a
mysql-5.7.25-linux-glibc2.12-x86_64/lib/libmysqlservices.a
mysql-5.7.25-linux-glibc2.12-x86_64/lib/pkgconfig/mysqlclient.pc
mysql-5.7.25-linux-glibc2.12-x86_64/share/aclocal/mysql.m4
mysql-5.7.25-linux-glibc2.12-x86_64/docs/ChangeLog
mysql-5.7.25-linux-glibc2.12-x86_64/docs/INFO_SRC
mysql-5.7.25-linux-glibc2.12-x86_64/lib/libmysqld.a
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/comp_err.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/innochecksum.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/lz4_decompress.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/my_print_defaults.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/myisam_ftdump.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/myisamchk.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/myisamlog.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/myisampack.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql.server.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_config.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_config_editor.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_install_db.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_plugin.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_secure_installation.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_ssl_rsa_setup.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_tzinfo_to_sql.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysql_upgrade.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqladmin.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqlbinlog.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqlcheck.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqld_multi.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqld_safe.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqldump.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqldumpslow.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqlimport.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqlman.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqlpump.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqlshow.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/mysqlslap.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/perror.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/replace.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/resolve_stack_dump.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/resolveip.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man1/zlib_decompress.1
mysql-5.7.25-linux-glibc2.12-x86_64/man/man8/mysqld.8
mysql-5.7.25-linux-glibc2.12-x86_64/COPYING
mysql-5.7.25-linux-glibc2.12-x86_64/README
mysql-5.7.25-linux-glibc2.12-x86_64/bin/innochecksum
mysql-5.7.25-linux-glibc2.12-x86_64/bin/lz4_decompress
mysql-5.7.25-linux-glibc2.12-x86_64/bin/my_print_defaults
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqld
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqld_multi
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqld_safe
mysql-5.7.25-linux-glibc2.12-x86_64/bin/mysqldumpslow
mysql-5.7.25-linux-glibc2.12-x86_64/bin/perror
mysql-5.7.25-linux-glibc2.12-x86_64/bin/replace
mysql-5.7.25-linux-glibc2.12-x86_64/bin/resolve_stack_dump
mysql-5.7.25-linux-glibc2.12-x86_64/bin/resolveip
mysql-5.7.25-linux-glibc2.12-x86_64/bin/zlib_decompress
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/char.bin
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/dicrc
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/left-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/matrix.bin
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/pos-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/rewrite.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/right-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/sys.dic
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_euc-jp/unk.dic
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/char.bin
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/dicrc
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/left-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/matrix.bin
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/pos-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/rewrite.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/right-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/sys.dic
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_sjis/unk.dic
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/char.bin
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/dicrc
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/left-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/matrix.bin
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/pos-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/rewrite.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/right-id.def
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/sys.dic
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/dic/ipadic_utf-8/unk.dic
mysql-5.7.25-linux-glibc2.12-x86_64/lib/mecab/etc/mecabrc
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/adt_null.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/auth_socket.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/authentication_ldap_sasl_client.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/connection_control.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/adt_null.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/auth_socket.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/authentication_ldap_sasl_client.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/connection_control.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/group_replication.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/ha_example.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/innodb_engine.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/keyring_file.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/keyring_udf.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libmemcached.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libpluginmecab.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_framework.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_services.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_services_threaded.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_session_detach.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_session_in_thd.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_session_info.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_2_sessions.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_all_col_types.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_cmds_1.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_commit.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_complex.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_errors.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_lock.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_processlist.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_replication.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_shutdown.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_sqlmode.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_stored_procedures_functions.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_sql_views_triggers.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_x_sessions_deinit.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/libtest_x_sessions_init.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/locking_service.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/mypluglib.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/mysql_no_login.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/mysqlx.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/rewrite_example.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/rewriter.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/semisync_master.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/semisync_slave.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/test_security_context.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/test_udf_services.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/validate_password.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/debug/version_token.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/group_replication.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/ha_example.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/innodb_engine.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/keyring_file.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/keyring_udf.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libmemcached.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libpluginmecab.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_framework.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_services.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_services_threaded.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_session_detach.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_session_in_thd.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_session_info.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_2_sessions.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_all_col_types.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_cmds_1.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_commit.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_complex.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_errors.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_lock.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_processlist.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_replication.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_shutdown.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_sqlmode.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_stored_procedures_functions.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_sql_views_triggers.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_x_sessions_deinit.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/libtest_x_sessions_init.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/locking_service.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/mypluglib.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/mysql_no_login.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/mysqlx.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/rewrite_example.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/rewriter.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/semisync_master.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/semisync_slave.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/test_security_context.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/test_udf_services.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/validate_password.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/plugin/version_token.so
mysql-5.7.25-linux-glibc2.12-x86_64/share/bulgarian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/Index.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/README
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/armscii8.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/ascii.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/cp1250.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/cp1251.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/cp1256.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/cp1257.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/cp850.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/cp852.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/cp866.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/dec8.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/geostd8.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/greek.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/hebrew.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/hp8.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/keybcs2.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/koi8r.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/koi8u.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/latin1.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/latin2.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/latin5.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/latin7.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/macce.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/macroman.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/charsets/swe7.xml
mysql-5.7.25-linux-glibc2.12-x86_64/share/czech/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/danish/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/dictionary.txt
mysql-5.7.25-linux-glibc2.12-x86_64/share/dutch/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/english/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/errmsg-utf8.txt
mysql-5.7.25-linux-glibc2.12-x86_64/share/estonian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/fill_help_tables.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/french/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/german/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/greek/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/hungarian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/innodb_memcached_config.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/italian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/japanese/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/korean/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/mysql_security_commands.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/mysql_sys_schema.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/mysql_system_tables.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/mysql_system_tables_data.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/mysql_test_data_timezone.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/norwegian-ny/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/norwegian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/polish/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/portuguese/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/romanian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/russian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/serbian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/slovak/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/spanish/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/swedish/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/share/ukrainian/errmsg.sys
mysql-5.7.25-linux-glibc2.12-x86_64/support-files/mysql-log-rotate
mysql-5.7.25-linux-glibc2.12-x86_64/support-files/mysqld_multi.server
mysql-5.7.25-linux-glibc2.12-x86_64/lib/libmysqlclient.so
mysql-5.7.25-linux-glibc2.12-x86_64/lib/libmysqlclient.so.20
mysql-5.7.25-linux-glibc2.12-x86_64/lib/libmysqlclient.so.20.3.12
mysql-5.7.25-linux-glibc2.12-x86_64/share/install_rewriter.sql
mysql-5.7.25-linux-glibc2.12-x86_64/share/uninstall_rewriter.sql
mysql-5.7.25-linux-glibc2.12-x86_64/support-files/magic
mysql-5.7.25-linux-glibc2.12-x86_64/support-files/mysql.server
mysql-5.7.25-linux-glibc2.12-x86_64/docs/INFO_BIN
mysql-5.7.25-linux-glibc2.12-x86_64/docs/INFO_SRC
[root@kiwi local]# ls
aegis  etc    include  lib64    mysql-5.7.25-linux-glibc2.12-x86_64         sbin   src
bin    games  lib      libexec  mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz  share
[root@kiwi local]# mv mysql-5.7.25-linux-glibc2.12-x86_64 mysql
[root@kiwi local]# ls
aegis  bin  etc  games  include  lib  lib64  libexec  mysql  mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz  sbin  share  src
[root@kiwi local]# chown -R mysql mysql/
[root@kiwi local]# chgrp -R mysql mysql/
[root@kiwi local]# cd mysql/
[root@kiwi mysql]# mkdir data
[root@kiwi mysql]# chown -R mysql:mysql data
[root@kiwi mysql]# touch my.cnf
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# bin/mysql_install_db --user=mysql --basedir=/usr/local/mysql/ --datadir=/usr/local/mysql/data/
2020-03-12 15:36:39 [WARNING] mysql_install_db is deprecated. Please consider switching to mysqld --initialize
2020-03-12 15:36:39 [ERROR]   Child process: /usr/local/mysql/bin/mysqldterminated prematurely with errno= 32
2020-03-12 15:36:39 [ERROR]   Failed to execute /usr/local/mysql/bin/mysqld --bootstrap --datadir=/usr/local/mysql/data --lc-messages-dir=/usr/local/mysql/share --lc-messages=en_US --basedir=/usr/local/mysql
-- server log begin --

-- server log end --
[root@kiwi mysql]# cp ./support-files/mysql.server /etc/init.d/mysqld
[root@kiwi mysql]# chown 777 my.cnf
[root@kiwi mysql]# ls
bin  COPYING  data  docs  include  lib  man  my.cnf  README  share  support-files
[root@kiwi mysql]# ls -l
总用量 60
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:31 bin
-rw-r--r--  1 mysql mysql 17987 12月 21 2018 COPYING
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:33 data
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:31 docs
drwxr-xr-x  3 mysql mysql  4096 3月  12 15:31 include
drwxr-xr-x  5 mysql mysql  4096 3月  12 15:31 lib
drwxr-xr-x  4 mysql mysql  4096 3月  12 15:31 man
-rw-r--r--  1   777 root    617 3月  12 15:36 my.cnf
-rw-r--r--  1 mysql mysql  2478 12月 21 2018 README
drwxr-xr-x 28 mysql mysql  4096 3月  12 15:31 share
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:31 support-files
[root@kiwi mysql]# chmod +x /etc/init.d/mysqld
[root@kiwi mysql]# 
[root@kiwi mysql]# mkdir data
mkdir: 无法创建目录"data": 文件已存在
[root@kiwi mysql]# chown -R mysql:mysql data
[root@kiwi mysql]# 
[root@kiwi mysql]# /etc/init.d/mysqld restart
MySQL server PID file could not be found!                  [失败]
Starting MySQL.Logging to '/usr/local/mysql/data/kiwi.err'.
2020-03-12T07:38:15.922332Z mysqld_safe Directory '/var/lib/mysql' for UNIX socket file don't exists.
The server quit without updating PID file (/usr/local/mysql[失败]kiwi.pid).
[root@kiwi mysql]# ps aux|grep mysql
root      1671  0.0  0.0 112728   968 pts/1    R+   15:38   0:00 grep --color=auto mysql
[root@kiwi mysql]# kill -9 1671
-bash: kill: (1671) - 没有那个进程
[root@kiwi mysql]# kill -9 112728
-bash: kill: (112728) - 没有那个进程
[root@kiwi mysql]# /etc/init.d/mysqld restart
MySQL server PID file could not be found!                  [失败]
Starting MySQL.Logging to '/usr/local/mysql/data/kiwi.err'.
2020-03-12T07:39:34.167919Z mysqld_safe Directory '/var/lib/mysql' for UNIX socket file don't exists.
The server quit without updating PID file (/usr/local/mysql[失败]kiwi.pid).
[root@kiwi mysql]# ./mysqld --initialize --user=mysql
-bash: ./mysqld: 没有那个文件或目录
[root@kiwi mysql]# mysqld --initialize --user=mysql
-bash: mysqld: 未找到命令
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# mkdir /var/lib/mysql
[root@kiwi mysql]# ls
bin  COPYING  data  docs  include  lib  man  my.cnf  README  share  support-files
[root@kiwi mysql]# cd 
[root@kiwi ~]# ls
[root@kiwi ~]# cd /var
[root@kiwi var]# ls
adm  cache  crash  db  empty  games  gopher  kerberos  lib  local  lock  log  mail  nis  opt  preserve  run  spool  tmp  yp
[root@kiwi var]# cd lib
[root@kiwi lib]# ls
alternatives  chrony  dbus      games      logrotate  misc   NetworkManager  plymouth  postfix  rpm-state  stateless  tuned
authconfig    cloud   dhclient  initramfs  machines   mysql  os-prober       polkit-1  rpm      rsyslog    systemd    yum
[root@kiwi lib]# cd mysql
[root@kiwi mysql]# ls
[root@kiwi mysql]# chmod 777  /var/lib/mysql
[root@kiwi mysql]# cd cd /usr/local/mysql
-bash: cd: cd: 没有那个文件或目录
[root@kiwi mysql]# cd /usr/local/mysql
[root@kiwi mysql]# ls
bin  COPYING  data  docs  include  lib  man  my.cnf  README  share  support-files
[root@kiwi mysql]# /etc/init.d/mysqld restart
MySQL server PID file could not be found!                  [失败]
Starting MySQL.Logging to '/usr/local/mysql/data/kiwi.err'.
The server quit without updating PID file (/usr/local/mysql[失败]kiwi.pid).
[root@kiwi mysql]# chown -R mysql:mysql /usr/local/mysql/data/
[root@kiwi mysql]# chmod -R 755 /usr/local/mysql/data
[root@kiwi mysql]# /etc/init.d/mysqld restart
MySQL server PID file could not be found!                  [失败]
Starting MySQL.Logging to '/usr/local/mysql/data/kiwi.err'.
The server quit without updating PID file (/usr/local/mysql[失败]kiwi.pid).
[root@kiwi mysql]# ps -ef|grep mysqld
root      2479  1295  0 15:47 pts/1    00:00:00 grep --color=auto mysqld
[root@kiwi mysql]# kill -9 2479
-bash: kill: (2479) - 没有那个进程
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# mysqld --initialize
-bash: mysqld: 未找到命令
[root@kiwi mysql]# ps -ef|grep mysqld
root      2492  1295  0 15:50 pts/1    00:00:00 grep --color=auto mysqld
[root@kiwi mysql]# kill -9 1295
Connection to 47.98.112.197 closed.
bash-3.2$ ssh -l root 47.98.112.197
root@47.98.112.197's password: 
Last failed login: Thu Mar 12 15:27:09 CST 2020 from 180.165.101.198 on ssh:notty
There was 1 failed login attempt since the last successful login.
Last login: Thu Mar 12 15:11:09 2020 from 180.165.101.198

Welcome to Alibaba Cloud Elastic Compute Service !

[root@kiwi ~]# cd /usr/local/mysql
[root@kiwi mysql]# cd data
[root@kiwi data]# ls
[root@kiwi data]# mysqld --initialize
-bash: mysqld: 未找到命令
[root@kiwi data]# cd bin
-bash: cd: bin: 没有那个文件或目录
[root@kiwi data]# cd ..
[root@kiwi mysql]# cd bin
[root@kiwi bin]# mysqld --initialize
-bash: mysqld: 未找到命令
[root@kiwi bin]# ls
innochecksum       mysql                       mysqld          mysqlimport                mysql_ssl_rsa_setup  resolveip
lz4_decompress     mysqladmin                  mysqld-debug    mysql_install_db           mysqltest_embedded   resolve_stack_dump
myisamchk          mysqlbinlog                 mysqld_multi    mysql_plugin               mysql_tzinfo_to_sql  zlib_decompress
myisam_ftdump      mysqlcheck                  mysqld_safe     mysqlpump                  mysql_upgrade
myisamlog          mysql_client_test_embedded  mysqldump       mysql_secure_installation  mysqlxtest
myisampack         mysql_config                mysqldumpslow   mysqlshow                  perror
my_print_defaults  mysql_config_editor         mysql_embedded  mysqlslap                  replace
[root@kiwi bin]# ./mysqld --initialize
./mysqld: error while loading shared libraries: libaio.so.1: cannot open shared object file: No such file or directory
[root@kiwi bin]# ./mysqld --initialize --user=mysql
./mysqld: error while loading shared libraries: libaio.so.1: cannot open shared object file: No such file or directory
[root@kiwi bin]# cd /usr/local/mysql
[root@kiwi mysql]# ./mysqld --initialize --user=mysql
-bash: ./mysqld: 没有那个文件或目录
[root@kiwi mysql]# ls
bin  COPYING  data  docs  include  lib  man  my.cnf  README  share  support-files
[root@kiwi mysql]# cat my.cnf 
[mysql]
socket=/var/lib/mysql/mysql.sock
# set mysql client default chararter
default-character-set=utf8mb4

[mysqld]
socket=/var/lib/mysql/mysql.sock
# set mysql server port  
port = 3306
# set mysql install base dir
basedir=/usr/local/mysql
# set the data store dir
datadir=/usr/local/mysql/data
# set the number of allow max connnection
max_connections=200
# set server charactre default encoding
character-set-server=utf8mb4
# the storage engine
default-storage-engine=INNODB
lower_case_table_names=1
max_allowed_packet=16M
explicit_defaults_for_timestamp=true

[mysql.server]
user=mysql
basedir=/usr/local/mysql
[root@kiwi mysql]# pwd
/usr/local/mysql
[root@kiwi mysql]# ll
总用量 60
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:31 bin
-rw-r--r--  1 mysql mysql 17987 12月 21 2018 COPYING
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:33 data
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:31 docs
drwxr-xr-x  3 mysql mysql  4096 3月  12 15:31 include
drwxr-xr-x  5 mysql mysql  4096 3月  12 15:31 lib
drwxr-xr-x  4 mysql mysql  4096 3月  12 15:31 man
-rw-r--r--  1   777 root    617 3月  12 15:49 my.cnf
-rw-r--r--  1 mysql mysql  2478 12月 21 2018 README
drwxr-xr-x 28 mysql mysql  4096 3月  12 15:31 share
drwxr-xr-x  2 mysql mysql  4096 3月  12 15:31 support-files
[root@kiwi mysql]# su -mysql
su：无效选项 -- y

用法：
 su [选项] [-] [USER [参数]...]

将有效用户 id 和组 id 更改为 USER 的 id。
单个 - 视为 -l。如果未指定 USER，将假定为 root。

选项：
 -m, -p, --preserve-environment  不重置环境变量
 -g, --group <组>             指定主组
 -G, --supp-group <组>        指定一个辅助组

 -, -l, --login                  使 shell 成为登录 shell
 -c, --command <命令>            使用 -c 向 shell 传递一条命令
 --session-command <命令>        使用 -c 向 shell 传递一条命令
                                 而不创建新会话
 -f, --fast                      向shell 传递 -f 选项(csh 或 tcsh)
 -s, --shell <shell>             若 /etc/shells 允许，则运行 shell

 -h, --help     显示此帮助并退出
 -V, --version  输出版本信息并退出

更多信息请参阅 su(1)。
[root@kiwi mysql]# su - mysql
[mysql@kiwi ~]$ cd /usr/local/mysql
[mysql@kiwi mysql]$ ./mysqld --initialize --user=mysql
-bash: ./mysqld: No such file or directory
[mysql@kiwi mysql]$ ./bin/mysqld --initialize --user=mysql
./bin/mysqld: error while loading shared libraries: libaio.so.1: cannot open shared object file: No such file or directory
[mysql@kiwi mysql]$ ./bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql/ --datadir=/usr/local/mysql/data/
./bin/mysqld: error while loading shared libraries: libaio.so.1: cannot open shared object file: No such file or directory
[mysql@kiwi mysql]$ yum install libaio*
Loaded plugins: fastestmirror
You need to be root to perform this command.
[mysql@kiwi mysql]$ su - root
Password: 
su: Authentication failure
[mysql@kiwi mysql]$ su - root
Password: 
Last login: Thu Mar 12 15:50:39 CST 2020 from 180.165.101.198 on pts/0
Last failed login: Thu Mar 12 16:00:44 CST 2020 on pts/0
There was 1 failed login attempt since the last successful login.
[root@kiwi ~]# yum install libaio*
Loaded plugins: fastestmirror
Determining fastest mirrors
base                                                                                                                   | 3.6 kB  00:00:00     
epel                                                                                                                   | 5.3 kB  00:00:00     
extras                                                                                                                 | 2.9 kB  00:00:00     
updates                                                                                                                | 2.9 kB  00:00:00     
(1/7): epel/x86_64/group_gz                                                                                            |  90 kB  00:00:00     
(2/7): base/7/x86_64/group_gz                                                                                          | 165 kB  00:00:00     
(3/7): epel/x86_64/updateinfo                                                                                          | 1.0 MB  00:00:00     
(4/7): extras/7/x86_64/primary_db                                                                                      | 164 kB  00:00:00     
(5/7): base/7/x86_64/primary_db                                                                                        | 6.0 MB  00:00:00     
(6/7): epel/x86_64/primary_db                                                                                          | 6.7 MB  00:00:00     
(7/7): updates/7/x86_64/primary_db                                                                                     | 6.7 MB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package libaio.x86_64 0:0.3.109-13.el7 will be installed
---> Package libaio-devel.x86_64 0:0.3.109-13.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

==============================================================================================================================================
 Package                             Arch                          Version                                  Repository                   Size
==============================================================================================================================================
Installing:
 libaio                              x86_64                        0.3.109-13.el7                           base                         24 k
 libaio-devel                        x86_64                        0.3.109-13.el7                           base                         13 k

Transaction Summary
==============================================================================================================================================
Install  2 Packages

Total download size: 37 k
Installed size: 46 k
Is this ok [y/d/N]: y
Downloading packages:
(1/2): libaio-devel-0.3.109-13.el7.x86_64.rpm                                                                          |  13 kB  00:00:00     
(2/2): libaio-0.3.109-13.el7.x86_64.rpm                                                                                |  24 kB  00:00:00     
----------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                         283 kB/s |  37 kB  00:00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Warning: RPMDB altered outside of yum.
** Found 2 pre-existing rpmdb problem(s), 'yum check' output follows:
2:postfix-2.10.1-7.el7.x86_64 has missing requires of libmysqlclient.so.18()(64bit)
2:postfix-2.10.1-7.el7.x86_64 has missing requires of libmysqlclient.so.18(libmysqlclient_18)(64bit)
  Installing : libaio-0.3.109-13.el7.x86_64                                                                                               1/2 
  Installing : libaio-devel-0.3.109-13.el7.x86_64                                                                                         2/2 
  Verifying  : libaio-0.3.109-13.el7.x86_64                                                                                               1/2 
  Verifying  : libaio-devel-0.3.109-13.el7.x86_64                                                                                         2/2 

Installed:
  libaio.x86_64 0:0.3.109-13.el7                                     libaio-devel.x86_64 0:0.3.109-13.el7                                    

Complete!
[root@kiwi ~]# ./mysqld --initialize --user=mysql
-bash: ./mysqld: No such file or directory
[root@kiwi ~]# cd /usr/local/mysql/bin/
[root@kiwi bin]# ./mysqld --initialize --user=mysql
2020-03-12T08:01:57.865426Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
2020-03-12T08:01:58.582375Z 0 [Warning] InnoDB: New log files created, LSN=45790
2020-03-12T08:01:58.697870Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
2020-03-12T08:01:58.763069Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new UUID: bf890e04-6437-11ea-8f64-00163e126680.
2020-03-12T08:01:58.766239Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
2020-03-12T08:01:58.766885Z 1 [Note] A temporary password is generated for root@localhost: :*#;bf5h/-tD
[root@kiwi bin]# service start mysql
The service command supports only basic LSB actions (start, stop, restart, try-restart, reload, force-reload, status). For other actions, please try to use systemctl.
[root@kiwi bin]# /etc/init.d/mysqld restart
MySQL server PID file could not be found!                  [FAILED]
Starting MySQL.Logging to '/usr/local/mysql/data/kiwi.err'.
                                                           [  OK  ]
[root@kiwi bin]# su - mysql
Last login: Thu Mar 12 15:56:10 CST 2020 on pts/0
[mysql@kiwi ~]$ service mysqld start
Starting MySQL[  OK  ]
[mysql@kiwi ~]$ 2020-03-12T08:03:42.767804Z mysqld_safe A mysqld process already exists

[mysql@kiwi ~]$ service mysqld restart
Shutting down MySQL..[  OK  ]
rm: cannot remove '/var/lock/subsys/mysql': Permission denied
Starting MySQL.[  OK  ]
[mysql@kiwi ~]$ mysql -uroot 
-bash: mysql: command not found
[mysql@kiwi ~]$ cd /usr/local/mysql/bin/
[mysql@kiwi bin]$ service mysqld start
Starting MySQL[  OK  ]
[mysql@kiwi bin]$ 2020-03-12T08:05:09.403164Z mysqld_safe A mysqld process already exists
^C
[mysql@kiwi bin]$ mysql -uroot
-bash: mysql: command not found
[mysql@kiwi bin]$ mysql -uroot -p
-bash: mysql: command not found
[mysql@kiwi bin]$ mysql -uroot -p
-bash: mysql: command not found
[mysql@kiwi bin]$ su -u mysql

Usage:
 su [options] [-] [USER [arg]...]

Change the effective user id and group id to that of USER.
A mere - implies -l.   If USER not given, assume root.

Options:
 -m, -p, --preserve-environment  do not reset environment variables
 -g, --group <group>             specify the primary group
 -G, --supp-group <group>        specify a supplemental group

 -, -l, --login                  make the shell a login shell
 -c, --command <command>         pass a single command to the shell with -c
 --session-command <command>     pass a single command to the shell with -c
                                 and do not create a new session
 -f, --fast                      pass -f to the shell (for csh or tcsh)
 -s, --shell <shell>             run shell if /etc/shells allows it

 -h, --help     display this help and exit
 -V, --version  output version information and exit

For more details see su(1).
[mysql@kiwi bin]$ su - mysql
Password: 
su: Authentication failure
[mysql@kiwi bin]$ Tequiero4814
-bash: Tequiero4814: command not found
[mysql@kiwi bin]$ su - mysql
Password: 
su: Authentication failure
[mysql@kiwi bin]$ su - mysql
Password: 
Last login: Thu Mar 12 16:03:38 CST 2020 on pts/0
Last failed login: Thu Mar 12 16:06:31 CST 2020 on pts/0
There were 2 failed login attempts since the last successful login.
[mysql@kiwi ~]$ mysql -uroot -p
-bash: mysql: command not found
[mysql@kiwi ~]$ vim /etc/profile
[mysql@kiwi ~]$ su - root
Password: 
Last login: Thu Mar 12 16:00:58 CST 2020 on pts/0
[root@kiwi ~]# vim /etc/profile
[root@kiwi ~]# source /etc/profile
[root@kiwi ~]# cat /root/.mysql_secret  
# Password set for user 'root@localhost' at 2020-03-12 15:36:39 
8gi=8y?NwUHC
[root@kiwi ~]# mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[root@kiwi ~]# mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[root@kiwi ~]# find / -name mysql.sock
/var/lib/mysql/mysql.sock
[root@kiwi ~]# cd /usr/local/mysql
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[root@kiwi mysql]# cp /var/lib/mysql/mysql.sock   /tmp/mysql.sock  
cp: cannot open ‘/var/lib/mysql/mysql.sock’ for reading: No such device or address
[root@kiwi mysql]# cd .
[root@kiwi mysql]# cd
[root@kiwi ~]# cp /var/lib/mysql/mysql.sock   /tmp/mysql.sock  
cp: cannot open ‘/var/lib/mysql/mysql.sock’ for reading: No such device or address
[root@kiwi ~]# ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock  
[root@kiwi ~]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
[root@kiwi ~]# ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock  
ln: failed to create symbolic link ‘/tmp/mysql.sock’: File exists
[root@kiwi ~]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
[root@kiwi ~]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
[root@kiwi ~]# cd /usr/local/mysql
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
[root@kiwi mysql]# mysql -uroot
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# mysql -uroot
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
[root@kiwi mysql]# service mysqld restart
Shutting down MySQL..                                      [  OK  ]
Starting MySQL.                                            [  OK  ]
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.25 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> set PASSWORD = PASSWORD('root');
ERROR 1290 (HY000): The MySQL server is running with the --skip-grant-tables option so it cannot execute this statement
mysql> exit;
Bye
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.7.25 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> exit;
Bye
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.7.25 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> exit;
Bye
[root@kiwi mysql]# service mysqld restart
Shutting down MySQL..                                      [  OK  ]
Starting MySQL.                                            [  OK  ]
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
[root@kiwi mysql]# cat /root/.mysql_secret  
# Password set for user 'root@localhost' at 2020-03-12 15:36:39 
8gi=8y?NwUHC
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
[root@kiwi mysql]# mysql -uroot -p 8gi=8y?NwUHC
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# service mysqld restart
Shutting down MySQL..                                      [  OK  ]
Starting MySQL.                                            [  OK  ]
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.25 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> set PASSWORD = PASSWORD('root');
ERROR 1290 (HY000): The MySQL server is running with the --skip-grant-tables option so it cannot execute this statement
mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> set PASSWORD = PASSWORD('root');
ERROR 1133 (42000): Can't find any matching row in the user table
mysql> set password for root@localhost=password("root");
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> exit
Bye
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# service mysqld restart
Shutting down MySQL..                                      [  OK  ]
Starting MySQL.                                            [  OK  ]
[root@kiwi mysql]# mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.25 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> update user set host='%' where user='root';
ERROR 1046 (3D000): No database selected
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> update user set host='%' where user='root';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> exit
Bye
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# 
```











```ini
[client]
port = 3306
socket = /tmp/mysql.sock

[mysql]
default-character-set = utf8mb4

[mysqld]
#  ---------------- Basic ----------------
server_id = 100
port = 3306
basedir = /usr/local/mysql
datadir = /home/datadriver/mysql/data
tmpdir = /home/datadriver/mysql/tmp
socket = /tmp/mysql.sock
pid-file = /home/datadriver/mysql/log/mysql.pid
skip-host-cache
skip_name_resolve = 1 
character-set-server = utf8mb4
collation-server = utf8mb4_general_ci
init_connect = 'SET NAMES utf8mb4'  
default-storage-engine = INNODB
#skip-external-locking
#skip-networking
#  ---------------- Connection/File/Table ----------------
max_connections = 10000
max_connect_errors = 20000
#wait_timeout = 31536000
#interactive_timeout = 31536000
wait_timeout = 60
interactive_timeout = 1800
lock_wait_timeout = 1800
max_allowed_packet = 1024M
# ---------------- Thread Pool ----------------
#thread_handling = pool-of-threads
#thread_pool_oversubscribe = 5
thread_cache_size = 64
#extra_max_connections = 10
#extra_port = 33333
#  ---------------- log ----------------
log_error = /home/datadriver/mysql/log/error.log
slow_query_log = 1
long_query_time = 1
slow_query_log_file = /home/datadriver/mysql/log/slow.log
log_queries_not_using_indexes = 1
log_throttle_queries_not_using_indexes = 5
min_examined_row_limit = 100 
expire_logs_days = 8
log-bin = mysql-bin
binlog_format = ROW
binlog_row_image = minimal 
#  ---------------- Others ----------------
sql_mode = NO_ENGINE_SUBSTITUTION,NO_AUTO_CREATE_USER
```

