准备工作

安装homebrew、git（command line tool）、wget（如果有必要的话），安装python3

### 一、安装[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)



使用curl或者wget的方式进行安装：

```bash
# curl 安装方式
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# wget 安装方式
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

报错：

```log
https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
正在解析主机 raw.githubusercontent.com (raw.githubusercontent.com)... 0.0.0.0
正在连接 raw.githubusercontent.com (raw.githubusercontent.com)|0.0.0.0|:443... 失败：Connection refused。
```

由于网络原因这里可能会安装失败，故再提供一种离线安装的方法。



克隆[gitee上的镜像项目](https://gitee.com/mirrors/oh-my-zsh)，然后在tools中找到`install.sh`脚本，并在脚本目录下执行下面的命令：



```bash
sudo sh ./install.sh
```



然后按照提示操作即可，安装成功后显示如下界面：

![image-20230131151313028](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131151313028.webp)



### 二、安装[PowerLine](https://powerline.readthedocs.io/en/latest/installation.html)



在安装python3的前提下，执行命令：

```python
pip3 install powerline-status --user
```



安装成功后显示界面如下：



![image-20230131152454149](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131152454149.webp)

### 三、iTerm2软件设置

设置背景图片

设置字体

设置初始窗口大小

![image-20230131154437054](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131154437054.webp)

### 四、安装oh-my-zsh主题

#### 1.字体

这里使用[NerdFonts](https://github.com/ryanoasis/nerd-fonts)，使用homebrew安装，其他方式可以参考wiki中给出的指南。

```bash
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

#### 2.主题

oh-my-zsh主题推荐：https://www.slant.co/topics/7553/~theme-for-oh-my-zsh，这里使用当下最流行的[powerlevel10k](https://github.com/romkatv/powerlevel10k)来做演示。

**执行安装命令：**

```bash
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

配置oh-my-zsh使用powerlevel10k主题：

（1）执行 `vi ~/.zshrc` 编辑配置文件，修改主题：

![image-20230131161302199](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131161302199.webp)

（2）将图中主体部分修改为：`ZSH_THEME="powerlevel10k/powerlevel10k"`，退出VIM编辑界面后（:wq）执行 `source ~/.zshrc` ，然后自动进入powerlevel10k初始化设置界面：

![image-20230131162633820](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131162633820.webp)

按照提示选择自己的喜好配置即可。

如果后续想要修改配置，执行 `p10k configure` 命令即可。


#### 3.配色

```
git clone https://github.com/altercation/solarized
```

### 五、安装oh-my-zsh插件

#### 1.安装自动补全插件



#### 2.安装语法高亮插件

```
plugins=(
     git
     zsh-autosuggestions
     zsh-syntax-highlighting 
)
```



#### 



