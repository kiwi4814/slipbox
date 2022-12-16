> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [juejin.cn](https://juejin.cn/post/6981769872338321416)

> git 删除某个中间的提交记录 比如我的提交历史如下，我现在想删除 commit_B，但是不影响 commit_B 之后的提交历史 操作方法如下： 1. 首先找到 commit_B 提交之前的一次提交的 commi

git 删除某个中间的提交记录
---------------

> 在做项目时，有可能会遇到想删除某个中间的提交记录，这个提交记录之后也有人提交，但是不能删除掉之后提交的代码记录

```
1.git log获取commit信息 
2.git rebase -i (commit-id) 
commit-id 为要删除的commit的下一个commit号 
3.编辑文件，将要删除的commit之前的单词改为drop 
4.保存文件退出大功告成 
5.git log查看

复制代码

```

比如我的提交历史如下，我现在想删除 commit_B，但是不影响 commit_B 之后的提交历史

```
commit_C 

commit_B

commit_A
复制代码

```

### 操作方法如下：

> 假如要删除备注为 add c.txt commit 为 0fb295fe0e0276f0c81df61c4fd853b7a000bb5c 的这次提交

#### 1. 首先找到 commit_B 提交之前的一次提交的 commit_A

#### 2. 执行如下命令

```
git rebase -i  commit_A

复制代码

```

![](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/12aac5ea86eb426b80d2db51ba8c9b01~tplv-k3u1fbpfcp-zoom-in-crop-mark:4536:0:0:0.awebp)

#### 3. 将 commit_B 这一行前面的 pick 改为 drop，然后按照提示保存退出

#### 4. 至此已经删除了指定的 commit，可以使用 git log 查看下

git push origin HEAD --force 然后推送到远程仓库 此时 commit_B 就被干掉了，没有影响后面的提交

参考链接：[www.jianshu.com/p/2fd2467c2…](https://link.juejin.cn/?target=https%3A%2F%2Fwww.jianshu.com%2Fp%2F2fd2467c27bb "https://www.jianshu.com/p/2fd2467c27bb")