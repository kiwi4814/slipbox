## Hugo安装

安装Hugo：https://gohugo.io/installation/

安装Hugo Extended：https://www.npmjs.com/package/hugo-extended

## 初始化hugo项目

```
hugo new site hugo-learn
```

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230323150908627.webp" alt="image-20230323150908627" style="zoom:50%;" />

每个文件夹或文件的含义：[Directory Structure | Hugo (gohugo.io)](https://gohugo.io/getting-started/directory-structure/)

config.toml

```toml
baseURL = 'http://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'

```

接下来按照官方的 [Quick Start](https://gohugo.io/getting-started/quick-start/) 操作下

```bash
# 进入刚才创建的hugo项目根路径
cd hugo-learn
# 初始化git
git init
# 使用官方推荐的默认主题
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
# 修改主题
echo "theme = 'ananke'" >> config.toml
# 启动hugo
hugo server
```

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20230323155315957.webp" alt="image-20230323155315957" style="zoom: 50%;" />

创建第一篇文章

```text
hugo new posts/my-first-post.md
```

```
---
title: "My First Post"
date: 2022-11-20T09:03:20-08:00
draft: true
---
## Introduction

This is **bold** text, and this is *emphasized* text.

Visit the [Hugo](https://gohugo.io) website!
```

然后执行

```
hugo server -D
```



## 配置文件