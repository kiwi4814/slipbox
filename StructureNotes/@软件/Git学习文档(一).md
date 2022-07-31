

# Git学习文档（一）：基础操作

## 一、获取git仓库的方法

### 1. 在现有目录中初始化仓库

```shell
$ git init
```
该命令将创建一个名为 `.git` 的子目录，这个子目录含有你初始化的 Git 仓库中所有的必须文件，这些文件是 Git 仓库的骨干。 但是，在这个时候，我们仅仅是做了一个初始化的操作，你的项目里的文件还没有被跟踪。
跟踪原有的旧文件并提交:

```shell
$ git add *.c
$ git add LICENSE
$ git commit -m 'initial project version'
```

### 2. 克隆现有的仓库

```shell
$ git clone https://github.com/libgit2/libgit2 mylibgit
```
上面的命令会**从远程仓库拉取下所有数据**放入`.git`文件夹，然后从中读取最新版本的文件的拷贝。最后的`mylibgit`是自定义本地仓库的名字。

### 3.`clone`和`checkout`的区别

Git 克隆的是该 Git 仓库服务器上的几乎所有数据，而不是仅仅复制完成你的工作所需要文件。 当你执行 `git clone` 命令的时候，默认配置下远程 Git 仓库中的每一个文件的每一个版本都将被拉取下来。 事实上，如果你的服务器的磁盘坏掉了，你通常可以使用任何一个克隆下来的用户端来重建服务器上的仓库（虽然可能会丢失某些服务器端的挂钩设置，但是所有版本的数据仍在。


##  二、记录每次更新到仓库
请记住，你工作目录下的每一个文件都不外乎这两种状态：已跟踪或未跟踪。 已跟踪的文件是指那些被纳入了版本控制的文件，在上一次快照中有它们的记录，在工作一段时间后，它们的状态可能处于未修改，已修改或已放入暂存区。 工作目录中除已跟踪文件以外的所有其它文件都属于未跟踪文件，它们既不存在于上次快照的记录中，也没有放入暂存区。 初次克隆某个仓库的时候，工作目录中的所有文件都属于已跟踪文件，并处于未修改状态。

###1. 查看状态
`git status` 自上次提交以来所做的所有改动
`git diff` 只显示尚未暂存的改动(也就是不在stage区域中的已跟踪文件的改动的详细对比)
- 当前做的那些更新还没有暂存？
- 有哪些更新已经暂存起来准备好了下次提交
  `git diff -- cashed` 查看已经暂存起来的变化
  `git +status -s`或`git status --s`或`git status --short` 得到一种更为紧凑的格式输出
  其中:
- `??`   新增的未追踪文件
- `A`     新增到暂存区的文件
- ` M`   右`M`表示改文件被修改了但是还没有放入暂存区
- `M `   左`M`表示改文件被修改了并放入了暂存区
- `MM`   在工作区被修改并提交到了暂存区后又在工作区中被修改了
- `AM`  在工作区的未追踪文件被提交到了暂存区之后又在工作区中被修改了
### 2. 添加到暂存区
`git add .` 提交当前文件夹下的所有文件，注意：这也会提交所有的已忽略文件
`git add 1.txt` 将当前文件夹下的`1.txt`放入暂存区
`git add *.c` 匹配当前文件夹下的`.c`后缀的所有文件并放入暂存区

###3. 提交更新
现在的暂存区域已经准备妥当可以提交了。 在此之前，请一定要确认还有什么修改过的或新建的文件还没有 `git add` 过，否则提交的时候不会记录这些还没暂存起来的变化。 这些修改过的文件只保留在本地磁盘。 所以，每次准备提交前，先用 `git status` 看下，是不是都已暂存起来了， 然后再运行提交命令 `git commit`：
**vim**退出编辑器：`ESC ：wq`
```
$ git commit 
```

这种方式会启动文本编辑器以便输入本次提交的说明。
**请查看`git help`获取`commit`的更多详细信息**

### 4. 移除文件
usage: `git rm [<options>] [--] <file>...`

1. 使用`git rm`命令的前提是文件已纳入`git`版本控制系统中
2. `git rm`命令本质是从本地仓库中删除文件（本地也会删除）
3. 当文件已经修改并放入暂存区（stage）时，无法直接删除，需要`git rm --cached（不会删除本地文件）`  或者`git rm -f（从本地仓库删除）`
4. 在`commit`之前对文件先`git rm--cached`再`git add`的操作不会对文件有任何影响
5. `git rm` 命令后面可以列出文件或者目录的名字，也可以使用 `glob 模式`（`shell`所使用的简化的正则表达式）
    其他用法： 
```
-n, --dry-run         dry run
-q, --quiet           do not list removed files
--cached              only remove from the index
-f, --force           override the up-to-date check
-r                    allow recursive removal
--ignore-unmatch      exit with a zero status even if nothing matched
```
### 5.`git`文件改名 
`$ git mv file_from file_to` 
 不像其它的 VCS 系统，Git 并不显式跟踪文件移动操作。 如果在 Git 中重命名了某个文件，仓库中存储的元数据并不会体现出这是一次改名操作。
运行 git mv 就相当于运行了下面三条命令：

```
$ mv README.md README
$ git rm README.md
$ git add README
```
### 6.查看提交历史
默认不用任何参数的话，git log 会按提交时间列出所有的更新，最近的更新排在最上面。 这个命令会列出每个提交的 SHA-1 校验、作者的名字、电子邮件地址、提交时间以及提交说明。

- `$ git log -p` :显示每次提交的内容差异，可以加上 -2 来仅显示最近两次提交，即`$ git log -p -2`
- `$ git log --stat` ：显示每次提交的简略的统计信息，`--stat` 选项在每次提交的下面列出额所有被修改过的文件、有多少文件被修改了以及被修改过的文件的哪些行被移除或是添加了。 在每次提交的最后还有一个总结。
- `$ git log --pretty=oneline` ： 这个选项可以指定使用不同于默认格式的方式展示提交历史。 这个选项有一些内建的子选项供你使用。 比如用 `oneline` 将每个提交放在一行显示，查看的提交数很大时非常有用。 另外还有 `short`，`full` 和 `fuller` 可以用，展示的信息或多或少有些不同，请自己动手实践一下看看效果如何。
- `git log --pretty=format` ： `format`可以定制要显示的记录格式，这样的输出对后期提取分析格外有用 — 因为你知道输出的格式不会随着Git的更新而发生改变。比如`$ git log --pretty=format:"%h - %an, %ar : %s"`显示的分别是提交对象的简短哈希字串，作者（author）的名字，作者修订日期，按多久以前的方式显示，提交说明。其他选项可查阅资料。
- 常用选项列表
| 选项              | 说明                                                         |
| :---------------- | :----------------------------------------------------------- |
| `-p`              | 按补丁格式显示每个更新之间的差异。                           |
| `--stat`          | 显示每次更新的文件修改统计信息。                             |
| `--shortstat`     | 只显示 --stat 中最后的行数修改添加移除统计。                 |
| `--name-only`     | 仅在提交信息后显示已修改的文件清单。                         |
| `--name-status`   | 显示新增、修改、删除的文件清单。                             |
| `--abbrev-commit` | 仅显示 SHA-1 的前几个字符，而非所有的 40 个字符。            |
| `--relative-date` | 使用较短的相对时间显示（比如，“2 weeks ago”）。              |
| `--graph`         | 显示 ASCII 图形表示的分支合并历史。                          |
| `--pretty`        | 使用其他格式显示历史提交信息。可用的选项包括 oneline，short，full，fuller 和 format（后跟指定格式）。 |

- `git log`的限制选项
| 选项                | 说明                               |
| :------------------ | :--------------------------------- |
| `-(n)`              | 仅显示最近的 n 条提交              |
| `--since, --after`  | 仅显示指定时间之后的提交。         |
| `--until, --before` | 仅显示指定时间之前的提交。         |
| `--author`          | 仅显示指定作者相关的提交。         |
| `--committer`       | 仅显示指定提交者相关的提交。       |
| `--grep`            | 仅显示含指定关键字的提交           |
| `-S`                | 仅显示添加或移除了某个关键字的提交 |
例子：比如要查看 Git 仓库中，2008 年 10 月期间，Junio Hamano 提交的但未合并的测试文件，可以用下面的查询命令：

```
$ git log --pretty="%h - %s" --author=gitster --since="2008-10-01" \
   --before="2008-11-01" --no-merges -- t/
5610e3b - Fix testcase failure when extended attributes are in use
acd3b9e - Enhance hold_lock_file_for_{update,append}() API
f563754 - demonstrate breakage of detached checkout with symbolic link HEAD
d1a43f2 - reset --hard/read-tree --reset -u: remove unmerged new paths
51a94af - Fix "checkout --track -b newbranch" on detached HEAD
b0ad11e - pull: allow "git pull origin $something:$current_branch" into an unborn branch
```

在近40000条提交中，上面的输出仅列出了符合条件的6条记录。

### 7. 撤销操作
在任何一个阶段，你都有可能想要撤消某些操作。 这里，我们将会学习几个撤消你所做修改的基本工具。 注意，有些撤消操作是不可逆的。 这是在使用 Git 的过程中，会因为操作失误而导致之前的工作丢失的少有的几个地方之一。
##### (1) 重新提交
**`$ git commit --amend`**
例如，你提交后发现忘记了暂存某些需要的修改，可以像下面这样操作：

```
$ git commit -m 'initial commit'
$ git add forgotten_file
$ git commit --amend
```
最终你只会有**一个提交** - 第二次提交将代替第一次提交的结果。

##### (2) 取消暂存的文件
**`$ git reset HEAD <file>…`**
将文件从`stage`区移除的命令

##### (3) 撤消对文件的修改
**`git checkout — [file]`**
如何方便地撤消修改 - 将它还原成上次提交时的样子（或者刚克隆完的样子，或者刚把它放入工作目录时的样子）

