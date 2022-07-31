

```shell
bash-3.2$  ssh-keygen -R "47.98.112.197"
Host 47.98.112.197 not found in /Users/kiwi4814/.ssh/known_hosts
bash-3.2$ ssh -l root 47.98.112.197
The authenticity of host '47.98.112.197 (47.98.112.197)' can't be established.
ECDSA key fingerprint is SHA256:GpxZi59LEgxwLx5/YBjTi/k29Z6CzHs07m6lciq0U+E.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '47.98.112.197' (ECDSA) to the list of known hosts.
root@47.98.112.197's password: 

Welcome to Alibaba Cloud Elastic Compute Service !

[root@kiwi ~]# rpm -qa|grep mariadb
mariadb-libs-5.5.64-1.el7.x86_64
[root@kiwi ~]# rpm -e --nodeps mariadb-libs-5.5.64-1.el7.x86_64
[root@kiwi ~]# rm /etc/my.cnf
rm: 无法删除"/etc/my.cnf": 没有那个文件或目录
[root@kiwi ~]# rpm -qa | grep mysql
[root@kiwi ~]# groupadd mysql
[root@kiwi ~]# useradd -g mysql mysql
[root@kiwi ~]# passwd mysql
更改用户 mysql 的密码 。
新的 密码：
重新输入新的 密码：
passwd：所有的身份验证令牌已经成功更新。
[root@kiwi ~]# cd /usr/local/
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
[root@kiwi local]# mv mysql-5.7.25-linux-glibc2.12-x86_64 mysql
[root@kiwi local]# ls
aegis  bin  etc  games  include  lib  lib64  libexec  mysql  mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz  sbin  share  src
[root@kiwi local]# chown -R mysql mysql/
[root@kiwi local]# chgrp -R mysql mysql/
[root@kiwi local]# cd mysql/
[root@kiwi mysql]# mkdir data
[root@kiwi mysql]# chown -R mysql:mysql data
[root@kiwi mysql]# mkdir log
[root@kiwi mysql]# chown -R mysql:mysql log
[root@kiwi mysql]# mkdir tmp
[root@kiwi mysql]# chown -R mysql:mysql tmp
[root@kiwi mysql]# ls
bin  COPYING  data  docs  include  lib  log  man  README  share  support-files  tmp
[root@kiwi mysql]# touch my.cnf
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# ls
bin  COPYING  data  docs  include  lib  log  man  my.cnf  README  share  support-files  tmp
[root@kiwi mysql]# ./mysqld --initialize --user=mysql
-bash: ./mysqld: 没有那个文件或目录
[root@kiwi mysql]# cd bin
[root@kiwi bin]# ./mysqld --initialize --user=mysql
./mysqld: error while loading shared libraries: libaio.so.1: cannot open shared object file: No such file or directory
[root@kiwi bin]# cd 
[root@kiwi ~]# yum install libaio*
已加载插件：fastestmirror
Determining fastest mirrors
base                                                                                                                   | 3.6 kB  00:00:00     
epel                                                                                                                   | 5.3 kB  00:00:00     
extras                                                                                                                 | 2.9 kB  00:00:00     
updates                                                                                                                | 2.9 kB  00:00:00     
(1/7): epel/x86_64/group_gz                                                                                            |  90 kB  00:00:00     
(2/7): base/7/x86_64/group_gz                                                                                          | 165 kB  00:00:00     
(3/7): epel/x86_64/updateinfo                                                                                          | 1.0 MB  00:00:00     
(4/7): extras/7/x86_64/primary_db                                                                                      | 164 kB  00:00:00     
(5/7): updates/7/x86_64/primary_db                                                                                     | 6.7 MB  00:00:00     
(6/7): base/7/x86_64/primary_db                                                                                        | 6.0 MB  00:00:00     
(7/7): epel/x86_64/primary_db                                                                                          | 6.7 MB  00:00:00     
正在解决依赖关系
--> 正在检查事务
---> 软件包 libaio.x86_64.0.0.3.109-13.el7 将被 安装
---> 软件包 libaio-devel.x86_64.0.0.3.109-13.el7 将被 安装
--> 解决依赖关系完成

依赖关系解决

==============================================================================================================================================
 Package                             架构                          版本                                     源                           大小
==============================================================================================================================================
正在安装:
 libaio                              x86_64                        0.3.109-13.el7                           base                         24 k
 libaio-devel                        x86_64                        0.3.109-13.el7                           base                         13 k

事务概要
==============================================================================================================================================
安装  2 软件包

总下载量：37 k
安装大小：46 k
Is this ok [y/d/N]: y
Downloading packages:
(1/2): libaio-devel-0.3.109-13.el7.x86_64.rpm                                                                          |  13 kB  00:00:00     
(2/2): libaio-0.3.109-13.el7.x86_64.rpm                                                                                |  24 kB  00:00:00     
----------------------------------------------------------------------------------------------------------------------------------------------
总计                                                                                                          268 kB/s |  37 kB  00:00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
警告：RPM 数据库已被非 yum 程序修改。
** 发现 2 个已存在的 RPM 数据库问题， 'yum check' 输出如下：
2:postfix-2.10.1-7.el7.x86_64 有缺少的需求 libmysqlclient.so.18()(64bit)
2:postfix-2.10.1-7.el7.x86_64 有缺少的需求 libmysqlclient.so.18(libmysqlclient_18)(64bit)
  正在安装    : libaio-0.3.109-13.el7.x86_64                                                                                              1/2 
  正在安装    : libaio-devel-0.3.109-13.el7.x86_64                                                                                        2/2 
  验证中      : libaio-0.3.109-13.el7.x86_64                                                                                              1/2 
  验证中      : libaio-devel-0.3.109-13.el7.x86_64                                                                                        2/2 

已安装:
  libaio.x86_64 0:0.3.109-13.el7                                     libaio-devel.x86_64 0:0.3.109-13.el7                                    

完毕！
[root@kiwi ~]# cd /usr/local/mysql/bin/
[root@kiwi bin]# ./mysqld --initialize --user=mysql
2020-03-12T10:40:03.006226Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
2020-03-12T10:40:03.723708Z 0 [Warning] InnoDB: New log files created, LSN=45790
2020-03-12T10:40:03.831165Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
2020-03-12T10:40:03.892108Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new UUID: d51ce2f8-644d-11ea-93a4-00163e126680.
2020-03-12T10:40:03.893736Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
2020-03-12T10:40:03.894310Z 1 [Note] A temporary password is generated for root@localhost: y6NU3h2.P.Sl
[root@kiwi bin]# cd ..
[root@kiwi mysql]# cd log
[root@kiwi log]# ls
[root@kiwi log]# cd ..
[root@kiwi mysql]# cd data
[root@kiwi data]# ls
auto.cnf  ib_buffer_pool  ibdata1  ib_logfile0  ib_logfile1  mysql  performance_schema  sys
[root@kiwi data]# cd ..
[root@kiwi mysql]# cp ./support-files/mysql.server /etc/rc.d/init.d/mysqld
[root@kiwi mysql]# chmod +x /etc/rc.d/init.d/mysqld
[root@kiwi mysql]# chkconfig --add mysqld
[root@kiwi mysql]# chkconfig --list mysqld

注：该输出结果只显示 SysV 服务，并不包含
原生 systemd 服务。SysV 配置数据
可能被原生 systemd 配置覆盖。 

      要列出 systemd 服务，请执行 'systemctl list-unit-files'。
      查看在具体 target 启用的服务请执行
      'systemctl list-dependencies [target]'。

mysqld          0:关    1:关    2:开    3:开    4:开    5:开    6:关
[root@kiwi mysql]# service mysqld start
Starting MySQL.2020-03-12T10:41:26.501157Z mysqld_safe error: log-error set to '/usr/local/mysql/log/error.log', however file don't exists. Create writable for user 'mysql'.
The server quit without updating PID file (/usr/local/mysql[FAILED]ql.pid).
[root@kiwi mysql]# su - mysql
[mysql@kiwi ~]$ cd /usr/local/mysql/bin/
[mysql@kiwi bin]$ service mysqld start
Starting MySQL.[  OK  ]
[mysql@kiwi bin]$ vim /etc/profile
[mysql@kiwi bin]$ su - root
Password: 
Last login: Thu Mar 12 18:28:39 CST 2020 from 180.165.101.198 on pts/0
[root@kiwi ~]# vim /etc/profile
[root@kiwi ~]# source /etc/profile
[root@kiwi ~]# su - mysql
Last login: Thu Mar 12 18:41:44 CST 2020 on pts/0
[mysql@kiwi ~]$ mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[mysql@kiwi ~]$ ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock  
[mysql@kiwi ~]$ mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[mysql@kiwi ~]$ ln -s /usr/local/mysql/tmp/mysql.sock /tmp/mysql.sock  
ln: failed to create symbolic link ‘/tmp/mysql.sock’: File exists
[mysql@kiwi ~]$ mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[mysql@kiwi ~]$ cd /usr/local/mysql/tmp/
[mysql@kiwi tmp]$ ls
mysql.sock  mysql.sock.lock
[mysql@kiwi tmp]$ rm mysql.sock
[mysql@kiwi tmp]$ rm mysql.sock.lock 
[mysql@kiwi tmp]$ cd /tmp/
[mysql@kiwi tmp]$ ls
Aegis-<Guid(5A2C30A2-A87D-490A-9281-6765EDAD7CBA)>  mysql.sock  systemd-private-1756fee557c74ddfb22c35077b9277d8-chronyd.service-fHRU13
[mysql@kiwi tmp]$ rm mysql.sock 
[mysql@kiwi tmp]$ service mysqld restart
Shutting down MySQL..[  OK  ]
rm: cannot remove '/var/lock/subsys/mysql': Permission denied
Starting MySQL.[  OK  ]
[mysql@kiwi tmp]$ su - mysql
Password: 
Last login: Thu Mar 12 18:44:12 CST 2020 on pts/0
[mysql@kiwi ~]$ service mysqld restart
Shutting down MySQL..[  OK  ]
rm: cannot remove '/var/lock/subsys/mysql': Permission denied
Starting MySQL.[  OK  ]
[mysql@kiwi ~]$ mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[mysql@kiwi ~]$ sudo chown -R _mysql:mysql /usr/local/var/mysql

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for mysql: 
mysql is not in the sudoers file.  This incident will be reported.
[mysql@kiwi ~]$ mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[mysql@kiwi ~]$ su - root
Password: 
Last login: Thu Mar 12 18:43:24 CST 2020 on pts/0
[root@kiwi ~]# sudo chown -R _mysql:mysql /usr/local/var/mysql
chown: invalid user: ‘_mysql:mysql’
[root@kiwi ~]# sudo chown -R mysql:mysql /usr/local/var/mysql
chown: cannot access ‘/usr/local/var/mysql’: No such file or directory
[root@kiwi ~]# sudo chown -R mysql:mysql /usr/local/mysql
[root@kiwi ~]# su - mysql
Last login: Thu Mar 12 18:48:14 CST 2020 on pts/0
[mysql@kiwi ~]$ mysql -uroot -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
[mysql@kiwi ~]$ su - root
Password: 
Last login: Thu Mar 12 18:49:58 CST 2020 on pts/0
[root@kiwi ~]# cd /usr/local/mysql
[root@kiwi mysql]# vi my.cnf
[root@kiwi mysql]# su - mysq;l
su: user mysq does not exist
-bash: l: command not found
[root@kiwi mysql]# su - mysql
Last login: Thu Mar 12 18:50:42 CST 2020 on pts/0
[mysql@kiwi ~]$ service mysqld restart
Shutting down MySQL..[  OK  ]
rm: cannot remove '/var/lock/subsys/mysql': Permission denied
Starting MySQL.[  OK  ]
[mysql@kiwi ~]$ mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.25-log

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> set password for root@localhost=password("root");
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> 
mysql> set password for root@localhost=password("root");
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> 
mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> 
mysql> update user set host='%' where user='root';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> 
mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> exit
Bye
[mysql@kiwi ~]$ vim /etc/profile
[mysql@kiwi ~]$ [root@kiwi ~]# cd /usr/local/mysql
-bash: [root@kiwi: command not found
[mysql@kiwi ~]$ cd /usr/local/mysql
[mysql@kiwi mysql]$ ls
bin  COPYING  data  docs  include  lib  log  man  my.cnf  README  share  support-files  tmp
[mysql@kiwi mysql]$ vi my.cnf
[mysql@kiwi mysql]$ wget http://download.redis.io/releases/redis-5.0.7.tar.gz
--2020-03-12 19:38:07--  http://download.redis.io/releases/redis-5.0.7.tar.gz
Resolving download.redis.io (download.redis.io)... 109.74.203.151
Connecting to download.redis.io (download.redis.io)|109.74.203.151|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1984203 (1.9M) [application/x-gzip]
Saving to: ‘redis-5.0.7.tar.gz’

100%[====================================================================================================>] 1,984,203   5.04KB/s   in 7m 7s  

2020-03-12 19:45:16 (4.54 KB/s) - ‘redis-5.0.7.tar.gz’ saved [1984203/1984203]

[mysql@kiwi mysql]$ 	
```

