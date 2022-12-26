# Eclipse 4.7优化

### eclipse.ini

```ini
-startup
plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar
--launcher.library
plugins/org.eclipse.equinox.launcher.win32.win32.x86_64_1.1.550.v20170928-1359
-product
org.eclipse.epp.package.jee.product
-showsplash
org.eclipse.epp.package.common
--launcher.defaultAction
openFile
--launcher.defaultAction
openFile
--launcher.appendVmargs
-vmargs
-Dosgi.requiredJavaVersion=1.8
-Dosgi.instance.area.default=@user.home/eclipse-workspace
-XX:+UseG1GC
-XX:+UseStringDeduplication
--add-modules=ALL-SYSTEM
-Dosgi.requiredJavaVersion=1.8
--add-modules=ALL-SYSTEM
#打开编译器性能优化
-XX:+AggressiveOpts
#增加永生代空间（分配新对象的地方）（译者注：在JDK 8中，取消了永生代）
-XX:PermSize=512m
-XX:MaxPermSize=512m
#增加最小最大堆的空间（含有新生代和年老代）
-Xms2048m
-Xmx2048m
#为新生代增加堆的大小
-Xmn512m
#为每个线程设置栈大小
-Xss2m
#调整垃圾收集
#-XX:+UseParallelOldGC
```

[参考](http://www.importnew.com/13942.html)

### `window->preference`

1. 关闭validation(校验项)
2. 菜单 Window =>Preferences =>General =>右边，把 Show Heap Status 打上勾就会在右下角任务栏显示内存监视器，手动清GC
3. 关闭启动项startup and shutdown
4. 关闭spelling检查
5. maven
6. 代码格式化

