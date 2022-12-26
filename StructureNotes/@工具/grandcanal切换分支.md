# `grandcanal`切换分支

1. 查看分支状态

   ```
   $ git branch
   ```


2. 创建分支

   ```
   $ git branch dev_gl
   ```

3. 切换分支

   ```
   $ git checkout dev_gl
   ```

4. 创建并切换分支【2和3的快捷方式】

   ```
   $ git checkout -b dev_gl
   ```

5. 提交分支和获取更新

   ```kotlin
   $ git push origin dev_gl
   Total 0 (delta 0), reused 0 (delta 0)
   To https://git.datadriver-inc.com/btd/GrandCanal.git
    * [new branch]      dev_gl -> dev_gl

   $ git pull origin dev_gl
   From https://git.datadriver-inc.com/btd/GrandCanal
    * branch            dev_gl     -> FETCH_HEAD
   Already up-to-date.
   ```

6. 设置`pull，push`默认分支

   ```
   -- 切换pull、push默认分支为dev_gl
   $ git branch --set-upstream-to=origin/dev_gl dev_gl
   Branch dev_gl set up to track remote branch dev_gl from origin.

   -- 从dev分支获取更新
   $ git pull origin dev
   From https://git.datadriver-inc.com/btd/GrandCanal
    * branch            dev        -> FETCH_HEAD
   Already up-to-date.

   -- 从dev_gl分支获取更新
   $ git pull origin dev_gl
   fatal: Couldn't find remote ref devev_gl
   正确方法为：
   $ git pull
   Already up-to-date.
   ```

7. 取消dev分支的跟踪（未执行）

   ```
   $ git branch --unset-upstream dev
   ```

   ​