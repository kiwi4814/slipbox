Git 子模块是一项重要功能，多用于项目之间的相互引用。Git 的子模块初始化和更新都比较简单，然而删除一个子模块目前并没有很好的快速方法。本文也是在 Gist 上看到一个流程，因此记录一下。



### Git 删除子模块

传统在在 Git 中，为了能够删除一个子模块，需要如下繁琐的流程：

- 在`.gitmodules` 文件中删除相关记录
- 提交`.gitmodules` 文件
  - `git add .gitmodules`
- 在`.git/config` 中删除相关配置
- 删除暂存区数据
  - `git rm --cached path_to_submodule（末尾不加路径符）`
- 删除子模块
  - `rm --rf .git/modules/path_to_submodule（末尾不加路径符）`
- 提交修改
  - `git commit -m "Removed submodule "`
- 删除当前工作区数据（此时为未追踪数据）
  - `rm -rf path_to_submodule`

**现在 Git 更新了，有了 `deinit` 命令，流程简化如下：**

- Remove the submodule entry from .git/config
  - `git submodule deinit -f path/to/submodule`
- Remove the submodule directory from the superproject’s .git/modules directory
  - `rm -rf .git/modules/path/to/submodule`
- Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
  - `git rm -f path/to/submodule`

### Git 删除远程分支

```
git push --delete <remote_name> <branch_name>
```