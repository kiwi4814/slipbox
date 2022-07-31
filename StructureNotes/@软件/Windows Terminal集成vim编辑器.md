---
Date: 2021-12-26 21:47:32
---
- MetaData
	- Date : 2021-12-26 21:47:32
	- DailyNotes : [[2021-12-26_周日]]
	- Link : 
	- Tag : #ZK卡片 #Windows

本人一直在Windows10上用Git bash进行版本管理，且git集成了vim编辑器，使用非常方便。但出于对WindowTerminal的好奇，于是安装了Windows Terminal。确实给人眼前一亮的感觉，对git的支持也很不错。于是就打算切换到Windows Terminal试试，但很快就发现在终端里掉用vim报错。
原因是terminal找不到vim可执行文件，查找后发现位于`C:\Program Files\Git\usr\bin`目录下:

此外还有许多其他的命令在此文件夹下，将bin文件路径加入系统路径即可：
在环境变量的path中加入`C:\Program Files\Git\usr\bin`，然后重新开启Windows Terminal即可。