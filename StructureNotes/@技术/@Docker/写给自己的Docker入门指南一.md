+++
title = "写给自己的Docker入门指南"
date = 2022-04-10 16:43:04
slug = "/docker01"
draft = false
tags = ["Docker","技术"]
series = ["Docker入门"]
toc = false
+++

## 



最近在群晖系统上安装了很多Docker镜像，但是很多镜像是其他人整合的包，相关资料甚少，出了问题完全摸不着头脑，所以打算系统的学一学Docker，也方便以后自己“造轮子”。关于Docker网上的教程已经满天都是了（本文参考到的文章都会列及），我再去重复一遍意义并不大，本系列文章是用来记录我是如何一步一步从零开始学习和理解Docker的。



**我的目标主要有以下几点：**

1. 了解Docker的基本概念，以前只会用一些基础的命令，现在系统的捋一遍，比如容器、镜像、常用的运维命令等；
2. Docker Desktop以及群晖的Docker操作界面的基本使用，以及如何对应到系统命令中；



下面，开始。



## Docker的安装

Docker的安装这一部分主要以windows为主。

### 1. 下载和安装Docker



[Docker Desktop](https://www.docker.com/products/docker-desktop/) 支持 64 位版本的 Windows 10 Pro，且必须开启 Hyper-V（若版本为 v1903 及以上则无需开启 Hyper-V），或者 64 位版本的 Windows 10 Home v1903 及以上版本。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20220410165928257.png" alt="image-20220410165928257" style="zoom: 67%;" />

如果系统版本小于1903，需要在控制面板 -> 程序 -> 启用或关闭Windows功能 中开启Hyper-V服务。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20220410165902117.png" alt="image-20220410165902117" style="zoom:33%;" />



此外，如果有使用winget，还可以通过下面的命令安装。

```powershell
$ winget install Docker.DockerDesktop
```

如果你的电脑中安装了WSL2，在安装的时候可以勾选：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20220410170317812.png" alt="image-20220410170317812" style="zoom: 50%;" />

安装中：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20220410170528390.png" alt="image-20220410170528390" style="zoom: 50%;" />



安装完成后重启电脑，可以看到Docker Desktop已经启动了。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20220410174945736.png" alt="image-20220410174945736" style="zoom: 33%;" />

### 2. 配置镜像加速

由于国内网络的原因，Docker的官方镜像速度不是很快，需要配置国内的镜像源，具体配置方法请参照文章[镜像加速器](https://yeasy.gitbook.io/docker_practice/install/mirror)。



配置完成后，我们先抛开软件的具体使用不说，介绍下与Docker相关的几个基本概念。

## Docker的基本概念介绍

整体的学习过程，首先看了[什么是 Docker](https://yeasy.gitbook.io/docker_practice/introduction/what)以及[为什么要用 Docker](https://yeasy.gitbook.io/docker_practice/introduction/why)这两篇文章，熟悉了what&why。

- 问题：说说Docker与虚拟机的区别？

然后来讲讲Docker的基本概念。

### 镜像、容器与仓库

#### （1）镜像（Image）

> 我们都知道，操作系统分为 **内核** 和 **用户空间**。对于 `Linux` 而言，内核启动后，会挂载 `root` 文件系统为其提供用户空间支持。而 **Docker 镜像**（`Image`），就相当于是一个 `root` 文件系统。比如官方镜像 `ubuntu:18.04` 就包含了完整的一套 Ubuntu 18.04 最小系统的 `root` 文件系统。
>
> **Docker 镜像** 是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等文件外，还包含了一些为运行时准备的一些配置参数（如匿名卷、环境变量、用户等）。镜像 **不包含** 任何动态数据，其内容在构建之后也不会被改变。



#### （2）容器（Container）

> 镜像（`Image`）和容器（`Container`）的关系，就像是面向对象程序设计中的 `类` 和 `实例` 一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。
>
> 容器的实质是进程，但与直接在宿主执行的进程不同，容器进程运行于属于自己的独立的 [命名空间](https://en.wikipedia.org/wiki/Linux_namespaces)。因此容器可以拥有自己的 `root` 文件系统、自己的网络配置、自己的进程空间，甚至自己的用户 ID 空间。容器内的进程是运行在一个隔离的环境里，使用起来，就好像是在一个独立于宿主的系统下操作一样。这种特性使得容器封装的应用比直接在宿主运行更加安全。也因为这种隔离的特性，很多人初学 Docker 时常常会混淆容器和虚拟机。



#### （3）仓库（Repository）

> 镜像构建完成后，可以很容易的在当前宿主机上运行，但是，如果需要在其它服务器上使用这个镜像，我们就需要一个集中的存储、分发镜像的服务，[Docker Registry]() 就是这样的服务。
>
> 一个 **Docker Registry** 中可以包含多个 **仓库**（`Repository`）；每个仓库可以包含多个 **标签**（`Tag`）；每个标签对应一个镜像。



举一个不恰当的例子，以一台手机来说，镜像就是APP本身，定义了这个APP所需的文件、环境以及APP的功能，是你在APP Store下载之前就已经确定好的，而容器就是真正运行着的APP的实例，你或者其他任何人都可以安装这个应用并且用来做自己的独特的事情，当然了你也可以自己同时开启多个具有同样功能的APP（这一点与常识可能不太一样，可以理解为应用的多开），而仓库就是app store，要注意这里的app store可能有不同的来源，比如一台安卓手机来说，可以从Google Play下载，也可以从各类三方应用中心下载。



### 1. 使用镜像

#### （1）获取镜像

从Docker仓库获取镜像的命令是`docker pull`，其命令格式为：

```shell
$ docker pull [选项] [Docker镜像仓库地址[:端口号]/]仓库名[:标签]
```

其中，选项可以通过`docker pull --help`命名查看，而Docker镜像仓库地址一般格式为<域名/IP>[:端口号]，而仓库名类似github，由两段组成，即<用户名>/<软件名>，对于Docker Hub，如果不给出用户名，则默认为library，也就是官方镜像。

比如说：

```
$ docker pull ubuntu:18.04
18.04: Pulling from library/ubuntu
92dc2a97ff99: Pull complete
be13a9d27eb8: Pull complete
c8299583700a: Pull complete
Digest: sha256:4bc3ae6596938cb0d9e5ac51a1152ec9dcac2a1c50829c74abd9c4361e321b26
Status: Downloaded newer image for ubuntu:18.04
docker.io/library/ubuntu:18.04
```

上面的命令中没有给出 Docker 镜像仓库地址，因此将会从 Docker Hub （`docker.io`）获取镜像。而镜像名称是 `ubuntu:18.04`，因此将会获取官方镜像 `library/ubuntu` 仓库中标签为 `18.04` 的镜像。`docker pull` 命令的输出结果最后一行给出了镜像的完整名称，即： `docker.io/library/ubuntu:18.04`。



#### （2）列出镜像

##### docker image ls

列出镜像的命令可以使用`docker image ls`.

![image-20220522160714187](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522160714187.png)

列表展示了仓库名、标签、镜像ID、创建时间以及所占用的空间。



我们可以使用`docker system df`命名查看镜像、容器、数据卷所占用的空间。

![image-20220522160901832](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522160901832.png)

##### 中间层镜像

> 为了加速镜像构建、重复利用资源，Docker 会利用 **中间层镜像**。所以在使用一段时间后，可能会看到一些依赖的中间层镜像。默认的 `docker image ls` 列表中只会显示顶层镜像，如果希望显示包括中间层镜像在内的所有镜像的话，需要加 `-a` 参数。
>
> ```dockerfile
> $ docker image ls -a
> ```
>
> 这样会看到很多无标签的镜像，与之前的虚悬镜像不同，这些无标签的镜像很多都是中间层镜像，是其它镜像所依赖的镜像。这些无标签镜像不应该删除，否则会导致上层镜像因为依赖丢失而出错。实际上，这些镜像也没必要删除，因为之前说过，相同的层只会存一遍，而这些镜像是别的镜像的依赖，因此并不会因为它们被列出来而多存了一份，无论如何你也会需要它们。只要删除那些依赖它们的镜像后，这些依赖的中间层镜像也会被连带删除。

##### 常用的参数

- 列出部分镜像：命令后加镜像的名称进行检索，或者\<名称:标签\>的格式来指定唯一的镜像

- 过滤器：`--filter`参数支持按照条件检索，比如我们希望看到在 `mongo:3.2` 之后建立的镜像，可以用下面的命令：

  ```
  $ docker image ls -f since=mongo:3.2
  REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
  redis               latest              5f515359c7f8        5 days ago          183 MB
  nginx               latest              05a60462f8ba        5 days ago          181 MB
  ```

- 只列出容器ID：`docker image ls -q`

- 格式化输出内容：`$ docker image ls --format "{{.ID}}: {{.Repository}}"`，表示只列出镜像ID和仓库名，其他类似格式可参考[GO的模板语法](https://gohugo.io/templates/introduction/)

#### （3）删除镜像

如果要删除本地的镜像，可以使用 `docker image rm` 命令，其格式为：

```
$ docker image rm [选项] <镜像1> [<镜像2> ...]
```

其中，镜像可以是镜像ID、镜像长ID、镜像名或者镜像摘要。并且，短ID只需要区分出唯一标识就可以了，比如你可以使用前三位。



像其它可以承接多个实体的命令一样，可以使用 `docker image ls -q` 来配合使用 `docker image rm`，这样可以成批的删除希望删除的镜像。我们在“镜像列表”章节介绍过很多过滤镜像列表的方式都可以拿过来使用。

比如，我们需要删除所有仓库名为 `redis` 的镜像：

```
$ docker image rm $(docker image ls -q redis)
```

或者删除所有在 `mongo:3.2` 之前的镜像：

```
$ docker image rm $(docker image ls -q -f before=mongo:3.2)
```

> ##### Untagged 和 Deleted
>
> 如果观察上面这几个命令的运行输出信息的话，你会注意到删除行为分为两类，一类是 `Untagged`，另一类是 `Deleted`。我们之前介绍过，镜像的唯一标识是其 ID 和摘要，而一个镜像可以有多个标签。
>
> 因此当我们使用上面命令删除镜像的时候，实际上是在要求删除某个标签的镜像。所以首先需要做的是将满足我们要求的所有镜像标签都取消，这就是我们看到的 `Untagged` 的信息。因为一个镜像可以对应多个标签，因此当我们删除了所指定的标签后，可能还有别的标签指向了这个镜像，如果是这种情况，那么 `Delete` 行为就不会发生。所以并非所有的 `docker image rm` 都会产生删除镜像的行为，有可能仅仅是取消了某个标签而已。
>
> 当该镜像所有的标签都被取消了，该镜像很可能会失去了存在的意义，因此会触发删除行为。镜像是多层存储结构，因此在删除的时候也是从上层向基础层方向依次进行判断删除。镜像的多层结构让镜像复用变得非常容易，因此很有可能某个其它镜像正依赖于当前镜像的某一层。这种情况，依旧不会触发删除该层的行为。直到没有任何层依赖当前层时，才会真实的删除当前层。这就是为什么，有时候会奇怪，为什么明明没有别的标签指向这个镜像，但是它还是存在的原因，也是为什么有时候会发现所删除的层数和自己 `docker pull` 看到的层数不一样的原因。
>
> 除了镜像依赖以外，还需要注意的是容器对镜像的依赖。如果有用这个镜像启动的容器存在（即使容器没有运行），那么同样不可以删除这个镜像。之前讲过，容器是以镜像为基础，再加一层容器存储层，组成这样的多层存储结构去运行的。因此该镜像如果被这个容器所依赖的，那么删除必然会导致故障。如果这些容器是不需要的，应该先将它们删除，然后再来删除镜像。

### 2. 操作容器

下载好镜像后，一般我们下一步就是启动容器了，也就是让“服务”跑起来。

#### （1）启动

启动分两种，一种是新建一个容器并启动；另外一种是将已经终止的容器重启启动。

新建容器启动的命令为`docker run`。

例如，下面的命令输出一个“hello world”，然后终止容器。

```
$ docker run ubuntu:18.04 /bin/echo 'Hello world'
```

下面这个命令则是启动一个bash终端，并且允许用户进行交互。

```
$ docker run -t -i ubuntu:18.04 /bin/bash
```

其中`-t`参数让Docker分配一个伪终端（pseudo-tty）并绑定到容器的标准输入上， `-i` 则让容器的标准输入保持打开。

`docker run`命令在后台执行的标准操作有：

- 检查本地是否存在指定的镜像，不存在就从Registry下载
- 利用镜像创建并启动一个容器
- 分配一个文件系统，并在只读的镜像层外面挂载一层可读写层
- 从宿主主机配置的网桥接口中桥接一个虚拟接口到容器中去
- 从地址池配置一个 ip 地址给容器
- 执行用户指定的应用程序
- 执行完毕后容器被终止



此外，我们可以利用`docker container start`命令，直接将一个已经终止的容器重新启动。

#### （2）守护态运行

很多时候我们需要的是让Docker在后台运行而不是直接把执行结果输出在当前宿主机下，此时可以通过增加`-d`参数来实现。

举两个例子说明一下。

如果不使用`-d`参数：

```
docker run ubuntu:18.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
```

以上命令会启动镜像并在控制台每秒钟打印出一个hello world。



如果使用了 `-d` 参数运行容器:

```
docker run -d ubuntu:18.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
```

![image-20220522172552271](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522172552271.png)

此时容器会在后台运行并不会把输出的结果 (STDOUT) 打印到宿主机上面(输出结果可以用 `docker logs` 查看)。使用 `-d` 参数启动后会返回一个唯一的 id，也可以通过 `docker container ls` 命令来查看容器信息。

![image-20220522172814387](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522172814387.png)



**容器是否会长久运行，是和 `docker run` 指定的命令有关，和 `-d` 参数无关。**

#### （3）终止

可以使用 `docker container stop` 来终止一个运行中的容器。

此外，当 Docker 容器中指定的应用终结时，容器也自动终止。

例如对于上一章节中只启动了一个终端的容器，用户通过 `exit` 命令或 `Ctrl+d` 来退出终端时，所创建的容器立刻终止。

终止状态的容器可以用 `docker container ls -a` 命令看到。例如

![image-20220522173122133](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522173122133.png)



处于终止状态的容器，可以通过 `docker container start` 命令来重新启动。

此外，`docker container restart` 命令会将一个运行态的容器终止，然后再重新启动它。

#### （4）进入容器

我们知道在使用`-d`参数时，容器启动会进入后台，对于进入后台的容器，我们需要进容器操作时可以使用 `docker attach` 命令或 `docker exec` 命令。

##### attach命令

```
$  docker run -dit ubuntu:18.04
```

![image-20220522174513063](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522174513063.png)

但是，当你在终端exit后，就会导致容器停止。

![image-20220522174723103](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522174723103.png)

##### exec命令

`docker exec` 后边可以跟多个参数，这里主要说明 `-i` `-t` 参数。

只用 `-i` 参数时，由于没有分配伪终端，界面没有我们熟悉的 Linux 命令提示符，但命令执行结果仍然可以返回。

当 `-i` `-t` 参数一起使用时，则可以看到我们熟悉的 Linux 命令提示符。

![image-20220522175222767](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522175222767.png)

然后可以使用exec命令进入终端：

![image-20220522175312673](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220522175312673.png)

如果从这个 stdin 中 exit，不会导致容器的停止。这就是为什么推荐大家使用 `docker exec` 的原因。

#### （5）导入和导出

如果要导出本地某个容器，可以使用 `docker export` 命令。

```
$ docker export 7691a814370e > ubuntu.tar
```

这样将导出容器快照到本地文件。

可以使用 `docker import` 从容器快照文件中再导入为镜像，例如：

```
$ cat ubuntu.tar | docker import - test/ubuntu:v1.0
```

此外，也可以通过指定 URL 或者某个目录来导入，例如:

```
$ docker import http://example.com/exampleimage.tgz example/imagerepo
```

*注：用户既可以使用* `docker load` *来导入镜像存储文件到本地镜像库，也可以使用* `docker import` *来导入一个容器快照到本地镜像库。这两者的区别在于容器快照文件将丢弃所有的历史记录和元数据信息（即仅保存容器当时的快照状态），而镜像存储文件将保存完整记录，体积也要大。此外，从容器快照文件导入时可以重新指定标签等元数据信息。*

#### （6）删除

可以使用 `docker container rm` 来删除一个处于终止状态的容器。例如

```
$ docker container rm trusting_newton
```

如果要删除一个运行中的容器，可以添加 `-f` 参数。Docker 会发送 `SIGKILL` 信号给容器。



此外，用 `docker container ls -a` 命令可以查看所有已经创建的包括终止状态的容器，如果数量太多要一个个删除可能会很麻烦，用下面的命令可以清理掉所有处于终止状态的容器。



### 3. 访问仓库

目前 Docker 官方维护了一个公共仓库 [Docker Hub](https://hub.docker.com/)，其中已经包括了数量超过 [2,650,000](https://hub.docker.com/search/?type=image) 的镜像。大部分需求都可以通过在 Docker Hub 中直接下载镜像来实现。

下面是常用的一些命令：

登录：`docker login`

退出：`docker logout`

查找官方镜像：`docker search 关键字`

下载官方镜像：`docker pull 镜像名称`

推送：`docker tag ubuntu:18.04 username/ubuntu:18.04`



此外，还可以搭建自己的私服，不过一般情况下个人是使用不到的，这里就不展开了。



本文大部分内容转载自[Docker — 从入门到实践](https://yeasy.gitbook.io/docker_practice/)一书，结合自己的实践和理解，主要是Docker最基本的概念，镜像、容器以及仓库的一些命令；下面一篇文章会着重于数据分卷以及Docker的网络管理。

