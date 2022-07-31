## 安装zsh

查看当前终端：

```bash
echo $SHELL
```

![image-20220529205620086](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/202205292056227.png)

可以看到目前使用的是bash，所以我们需要先安装zsh：

```
yum update
```

```bash
yum install -y zsh
```

其中-y参数的意思是同意所有的安装选项。

![image-20220529222804755](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/202205292228927.png)

切换到root用户，设置zsh为默认的shell：

```bash
chsh -s /bin/zsh
```

![image-20220529223104158](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/202205292231235.png)

安装其他所需的工具：

```bash
yum install -y git
```



使用自动脚本安装oh-my-zsh：

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

![image-20220529225741648](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/202205292257057.png)

这里可能出现远程服务器无法连接github的情况，可以通过临时修改hosts解决。



## 配置zsh

