---
Date: 2022-02-09 16:36:46
---
- MetaData
	- Date : 2022-02-09 16:36:46
	- DailyNotes : [[2022-02-09_周三]]
	- Link : 
	- Tag : #ZK卡片 #Java #JVM

## jstat
### jstat –gc {pid}

**显示gc相关的堆信息，查看gc的次数，及时间等。**

比如 jstat -gc {pid} 2s 3表示每隔2秒执行一次，执行三次。显示属性的含义：

- S0C：年轻代中第一个survivor（幸存区）的容量 （字节）
- S1C：年轻代中第二个survivor（幸存区）的容量 (字节)
- S0U ：年轻代中第一个survivor（幸存区）目前已使用空间 (字节)
- S1U ：年轻代中第二个survivor（幸存区）目前已使用空间 (字节)
- EC ：年轻代中Eden（伊甸园）的容量 (字节)
- EU ：年轻代中Eden（伊甸园）目前已使用空间 (字节)
- OC ：Old代的容量 (字节)
- OU ：Old代目前已使用空间 (字节)
- MC：metaspace(元空间)的容量 (字节)
- MU：metaspace(元空间)目前已使用空间 (字节)
- YGC ：从应用程序启动到采样时年轻代中gc次数
- YGCT ：从应用程序启动到采样时年轻代中gc所用时间(s)
- FGC ：从应用程序启动到采样时old代(全gc)gc次数
- FGCT ：从应用程序启动到采样时old代(全gc)gc所用时间(s)
- GCT：从应用程序启动到采样时gc用的总时间(s)

### jstat -gcutil {pid}

**统计gc信息**

-   S0 ：年轻代中第一个survivor（幸存区）已使用的占当前容量百分比
-   S1 ：年轻代中第二个survivor（幸存区）已使用的占当前容量百分比
-   E ：年轻代中Eden（伊甸园）已使用的占当前容量百分比
-   O ：old代已使用的占当前容量百分比
-   P ：perm代已使用的占当前容量百分比
-   YGC ：从应用程序启动到采样时年轻代中gc次数
-   YGCT ：从应用程序启动到采样时年轻代中gc所用时间(s)
-   FGC ：从应用程序启动到采样时old代(全gc)gc次数
-   FGCT ：从应用程序启动到采样时old代(全gc)gc所用时间(s)
-   GCT：从应用程序启动到采样时gc用的总时间(s)
