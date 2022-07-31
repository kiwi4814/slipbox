+++
title = "写给自己的Docker入门指南"
date = 2022-04-15 18:04:45
slug = "/docker02"
draft = false
tags = ["Docker","技术"]
series = ["Docker入门"]
toc = false

+++

## Docker的数据管理

在容器中管理数据主要有两种方式：数据卷（Volumes）和挂载主机目录（Bind mounts）。

### 数据卷

数据卷是一个可供一个或者多个容器使用的特殊目录，它绕过UFS，可以提供很多有用的特性：

- 数据卷可以在容器之间共享和重用
- 对数据卷的修改会立马生效
- 对数据卷的更新，不会影响镜像
- 数据卷默认会一直存在，即使容器被删除

另外，数据卷的使用，类似与Linux下对目录或文件进行mount，镜像中的被指定为挂载点的目录中的文件会复制到数据卷中（仅数据卷为空时会复制）。

#### 创建一个数据卷

```
$ docker volume create my-vol
```

**查看数据卷**

docker 



## Docker的网络管理

