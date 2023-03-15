

最近Mac电脑送修重做了系统，在搭建环境的过程中记录了一些软件的折腾记录，本文为iTerm2的相关设置。



本文默认读者已经自行安装HomeBrew、Git以及Python等开发常用工具，另外笔者所用系统版本为 macOS Ventura 13.2。

### 一、iTerm2软件设置

iTerm2的安装很简单，去[官网](https://iterm2.com/)下载或者使用HomBbrew安装均可，这里不做展开，将重点放在初始化的一些设置上。



iTerm2的主要设置都在 Settings -> Profiles里面，打开后可以设置字体、配色方案、窗口样式、ssh等，并且可以导入导出为JSON（建议设置完成后导出进行备份）。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230201144115407.webp" alt="image-20230201144115407" style="zoom: 33%;" />



在iTerm2初始化的过程中，我主要修改了代码字体、配色方案、初始化窗口的大小（默认打开iTerm界面时的窗口大小，稍微改大了一些）以及背景壁纸等外观方面的改动。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230201150934590.webp" alt="image-20230201150934590" style="zoom: 33%;" />

**1.字体**

在字体的选择上，建议使用针对icon字符做了补全的[Nerd Fonts](https://www.nerdfonts.com/)作为主要显示字体，官网提供了50多种程序员常用的字体打了补丁，并提供了下载，我选择了其中的Hack Nerd Font以及MesloLG Nerd Font，并使用HomeBrew进行了安装，安装命令为：

```bash
brew tap homebrew/cask-fonts &&
brew install --cask font-<FONT NAME>-nerd-font
```

将上面的`<FONT NAME>`换成想要安装的字体名称即可，比如：

```bash
brew tap homebrew/cask-fonts &&
brew install --cask font-meslo-lg-nerd-font
```

然后在Profiles中的Text下面选择下载好的字体即可。



**2.主题**

iTerm2最常用的主题是[Solarized](https://github.com/altercation/solarized)，官网是：https://ethanschoonover.com/solarized/

下载后解压文件夹，在文件夹中找到 `iterm2-colors-solarized` ，然后安装里面的 `Solarized Dark.itermcolors` 和 `Solarized Light.itermcolors` ，也可以在 Profiles 的 Colors 标签下面选择导入安装，安装完成选择对应的主题即可，当然根据自己的背景壁纸和字体颜色可以对主题做一些定制化的修改，自己看着舒服即可。



<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230201154934113.webp" alt="image-20230201154934113" style="zoom: 33%;" />

### 二、安装[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)



经常使用终端的程序员肯定都知道，相比于bash，zsh的功能强大很多，可以自动补全命令、参数、文件名、进程、用户名、变量、权限符等等。在Mac系统中，从 macOS Catalina 开始，就已经使用 zsh 作为默认登录 Shell 和交互式 Shell 了，如果你是更早的版本，可以参照[官网的文章](https://support.apple.com/zh-cn/HT208050)将zsh设置为默认shell。



而Oh My Zsh 是一款社区驱动的命令行工具，正如它的主页上说的，Oh My Zsh 是一种生活方式。它基于 zsh 命令行，提供了主题配置，插件机制，已经内置的便捷操作。给我们一种全新的方式使用命令行。



下面来逐步安装和配置oh-my-zsh。



使用curl或者wget的方式进行安装：

```bash
# curl 安装方式
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# wget 安装方式
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

由于网络问题，可能会出现如下报错：

```log
https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
正在解析主机 raw.githubusercontent.com (raw.githubusercontent.com)... 0.0.0.0
正在连接 raw.githubusercontent.com (raw.githubusercontent.com)|0.0.0.0|:443... 失败：Connection refused。
```

这里再提供一种离线安装的方法，使用[gitee上的镜像项目](https://gitee.com/mirrors/oh-my-zsh)，然后在tools中找到`install.sh`脚本，并在脚本目录下执行安装命令：

```bash
sudo sh ./install.sh
```

然后按照提示操作即可（Y），安装成功后显示如下界面：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131151313028.webp" alt="image-20230131151313028" style="zoom:50%;" />



### 三、安装[PowerLine](https://powerline.readthedocs.io/en/latest/installation.html)



Powerline 是一个极棒的 Vim 编辑器的状态行插件，主要用于显示状态行和提示信息，适用于很多软件，比如 bash、zsh、tmux 等等。

PowerLine是基于python开发的，所以需要使用pip安装，如果你的电脑里安装的事python2，那么命令为：

```bash
pip install powerline-status --user
```

python3把pip改成pip3即可:

```bash
pip3 install powerline-status --user
```

然后等待安装成功即可。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131152454149.webp" alt="image-20230131152454149" style="zoom:50%;" />



### 四、配置oh-my-zsh主题



oh-my-zsh支持配置丰富的主题，本文使用当下最流行的[powerlevel10k](https://github.com/romkatv/powerlevel10k)主题来做演示，想要寻找更多好看的主题，可以去[社区](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)或者参考[此文](https://www.slant.co/topics/7553/~theme-for-oh-my-zsh)中的投票。



执行安装命令：

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

下载完成后需要修改 `.zshrc` 来配置oh-my-zsh使用powerlevel10k主题：



（1）执行 `vi ~/.zshrc` 编辑配置文件，修改主题：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131161302199.webp" alt="image-20230131161302199" style="zoom: 50%;" />

（2）将图中主体部分修改为：`ZSH_THEME="powerlevel10k/powerlevel10k"`，退出VIM编辑界面后（:wq）执行 `source ~/.zshrc` ，然后自动进入powerlevel10k初始化设置界面：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230131162633820.webp" alt="image-20230131162633820" style="zoom: 50%;" />

第一步是安装推荐的字体，这里推荐选n，因为网络原因大概率会安装失败，最好是手动安装需要的字体。

从第二步开始，就是选择界面的一些风格样式，基本都是界面美化相关的（毕竟是主题设置嘛），这里不多做介绍了，大家按照提示选择对应的选项即可。



如果后续想要修改配置，再次执行 `p10k configure` 命令即可。



### 五、安装oh-my-zsh插件



oh-my-zsh支持非常多插件，都在 `~/.oh-my-zsh/plugins` 路径下，可以根据[官网文档](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)选择合适的启用。除了官方提供的插件之外，还支持自定义插件，这些插件可以安装在 `~/.oh-my-zsh/custom/plugins/`  路径下，这里演示其中两个插件的安装。



**1.zsh-autosuggestions**

**命令自动提示插件**，能够记住你平时输入的命令，下次再输入的时候就会有相应的提示。

```bash
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions
```



**2.zsh-syntax-highlighting**

**语法高亮插件**，为zsh语法提供突出展示。

```bash
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

> 如果你使用的是 `Solarized Dark` 主题，并且使用深色壁纸的话，高亮显示的语法可能不是很清晰，这时候可以将修改配置项的值：
>
> （1）找到并编辑 `.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh`
>
> （2）修改 `ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=30'` 的配置值为30（默认是8） 
>
> <img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230201164334524.webp" alt="image-20230201164334524" style="zoom:33%;" />



安装完成后，需要编辑 `.zshrc` 配置文件来启用插件（与前面安装主题的步骤相同）。

找到原本plugins的位置，将其替换为

```
plugins=(
     git
     zsh-autosuggestions
     zsh-syntax-highlighting 
)
```



至此，关于iTerm2的安装和配置就大公告成了，最终效果如下（不喜欢彩虹图标以及各类配色的可以选择更简洁的主题或者配置）。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230201164529759.webp" alt="image-20230201164529759" style="zoom:50%;" />

### 参考链接

[oh-my-zsh - Sea's Blog](https://mrseawave.github.io/blogs/articles/2021/08/29/oh-my-zsh/)

[iTerm2 + Oh My Zsh 打造舒适终端体验](https://segmentfault.com/a/1190000014992947)

