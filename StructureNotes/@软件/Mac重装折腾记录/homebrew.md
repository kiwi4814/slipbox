

执行命令：

```
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" `
```

然后报错：

```
Error: The Ruby Homebrew installer is now disabled and has been rewritten in
Bash. Please migrate to the following command:
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

是因为默认已经是bash模式了，按照提示执行命令：

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

之后按照提示一步步操作安装即可。

中间遇到报错：

```
==> Downloading and installing Homebrew...
fatal: unable to access 'https://github.com/Homebrew/brew/': LibreSSL SSL_read: error:02FFF03C:system library:func(4095):Operation timed out, errno 60
Failed during: git fetch --force origin
```

这是因为默认是从git获取homebrew的，git的网络有时候不是很好，所以可以将git代理出去：

```
git config --global https.proxy http://127.0.0.1:61485
git config --global https.proxy https://127.0.0.1:61485
```

再次执行安装命令即可。

```
==> Downloading and installing Homebrew...
......
==> Tapping homebrew/core
......
```

中间会经历上面两个等待下载的过程，耐心等待即可。

```
==> Checking for `sudo` access (which may request your password)...
Password:
==> This script will install:
/usr/local/bin/brew
/usr/local/share/doc/homebrew
/usr/local/share/man/man1/brew.1
/usr/local/share/zsh/site-functions/_brew
/usr/local/etc/bash_completion.d/brew
/usr/local/Homebrew

Press RETURN/ENTER to continue or any other key to abort:
==> /usr/bin/sudo /usr/sbin/chown -R heqifeng:admin /usr/local/Homebrew
==> Downloading and installing Homebrew...
HEAD is now at 11cdffb4f Merge pull request #14235 from Homebrew/dependabot/bundler/Library/Homebrew/json_schemer-0.2.24
==> Installation successful!

==> Homebrew has enabled anonymous aggregate formulae and cask analytics.
Read the analytics documentation (and how to opt-out) here:
  https://docs.brew.sh/Analytics
No analytics data has been sent yet (nor will any be during this install run).

==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
  https://github.com/Homebrew/brew#donations

==> Next steps:
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh
```

### 安装常用的软件

```
brew install node
brew install maven
brew install pandoc
```



### 使用科大源安装HomeBrew

首先在命令行运行如下几条命令设置环境变量：

```
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
```

之后在命令行运行 Homebrew 安装脚本：

```
/bin/bash -c "$(curl -fsSL https://github.com/Homebrew/install/raw/HEAD/install.sh)"
```

初次安装 Homebrew / Linuxbrew 时，如果无法下载安装脚本， 可以使用 [jsDelivr CDN](https://cdn.jsdelivr.net/gh/Homebrew/install@HEAD/install.sh) 下载 `install.sh`。

```
/bin/bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/Homebrew/install@HEAD/install.sh)"
```

```
echo 'export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"' >> ~/.zshrc
echo 'export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"' >> ~/.zshrc
echo 'export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"' >> ~/.zshrc

```