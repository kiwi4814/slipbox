---
Date: 2021-12-26 21:44:34
---
- MetaData
	- Date : 2021-12-26 21:44:34
	- DailyNotes : [[2021-12-26_周日]]
	- Link : 
	- Tag : #ZK卡片 #Hugo
## 一、安装

#### Windows

github下载安装包，解压exe可执行文件到`D:\Hugo\bin`

![image-20211226182222870](https://gitee.com/kiwi4814/pictures/raw/master/img/image-20211226182222870.png)

添加环境变量`D:\Hugo\bin`到path

在命令行输入：`hugo version`来验证

```
hugo version                                      
hugo v0.91.2-1798BD3F windows/amd64 BuildDate=2021-12-23T15:33:34Z VendorInfo=gohugoio
```
### 安装hugo extend
1. 安装go环境（windows直接安装msi安装包即可）

2. 安装gcc

   ```
   winget install -e --id Bloodshed.Dev-C++
   已找到 Embarcadero Dev-C++ [Bloodshed.Dev-C++] 版本 6.3
   此应用程序由其所有者授权给你。
   Microsoft 对第三方程序包概不负责，也不向第三方程序包授予任何许可证。
   Downloading https://github.com/Embarcadero/Dev-Cpp/releases/download/v6.3/Embarcadero_Dev-Cpp_6.3_TDM-GCC_9.2_Setup.exe
     ██████████████████████████████  70.6 MB / 70.6 MB
   已成功验证安装程序哈希
   正在启动程序包安装...
   已成功安装
   ```

   以上，貌似没什么用。

   然后参考[这个链接](https://dev.to/gamegods3/how-to-install-gcc-in-windows-10-the-easier-way-422j)和[Windows环境下的安装gcc](https://zhuanlan.zhihu.com/p/47935258)安装的

   然后发现全是32位的，详情可看[这个帖子](https://blog.csdn.net/u014454538/article/details/103851926)

   于是安装了[Mingw-w64在win10下的安装使用](http://www.manongjc.com/article/23844.html)

3. 选择合适的文件夹，clone项目并尝试安装

   ```
   git clone https://github.com/gohugoio/hugo.git
   cd hugo
   go install --tags extended
   # 最后一步比较慢，跟网络有关，稍微等等
   ```
   
   检查版本：
   
   ```
   hugo version
   hugo v0.92.0-DEV+extended windows/amd64 BuildDate=unknown
   ```


## 二、使用
1. 创建一个新的网站quickstart：

   ```bash
   hugo new site quickstart
   ```

2. 为该网站增加主题

   ```bash
   cd quickstart
   git init
   git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
   # 在config.toml最后追加如下配置
   theme = 'ananke'
   ```

3. 创建一个文本网页

   ```bash
   hugo new posts/my-first-post.md
   ```

   此时会在`quickstart\content\posts`目录下看到my-first-post.md文档，内容如下：

   ```toml
   ---
   title: "My First Post"
   date: 2021-12-26T22:00:35+08:00
   draft: true
   ---
   ```

   默认情况下，draft的配置为true，这意味着这篇文章是一个草稿。

4. 发布

   ```
   hugo server -D
   Start building sites …
   hugo v0.91.2-1798BD3F windows/amd64 BuildDate=2021-12-23T15:33:34Z VendorInfo=gohugoio
   
                      | EN
   -------------------+-----
     Pages            | 10
     Paginator pages  |  0
     Non-page files   |  0
     Static files     |  1
     Processed images |  0
     Aliases          |  1
     Sitemaps         |  1
     Cleaned          |  0
   
   Built in 55 ms
   Watching for changes in D:\Hugo\quickstart\{archetypes,content,data,layouts,static,themes}
   Watching for config changes in D:\Hugo\quickstart\config.toml, D:\Hugo\quickstart\themes\ananke\config.yaml
   Environment: "development"
   Serving pages from memory
   Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
   Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
   Press Ctrl+C to stop
   ```

   **尝试访问你的网站http://localhost:1313/**

