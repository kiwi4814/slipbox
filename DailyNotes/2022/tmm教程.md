### 使用场景介绍

当我们去各类流媒体网站上挑选影视剧时，一般都是从“海报墙”开始————首先是各种影视剧的海报和剧情简介，点进去还能看到演员、评分、预告片等各种信息。但我们自己购买或者下载的电影，是不包含这些信息的，而获取这些信息的过程叫做“刮削”。



<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211251337871.webp" alt="image-20221125133731203" style="zoom:25%;" />





提供此类信息源的主流网站有**互联网电影数据库(IMDb)**、**电影数据库分享平台(TMDB)**等等，此外还有专门针对不同影视类型专门做信息聚合的网站，比如针对动画的**AniDB**，这个我们后面会说。



下面我们介绍一下本文的主角————**TinyMediaManager**，下文简称为TMM。



**TinyMediaManager**是一个用Java/Swing编写的媒体管理工具，支持在Windows，Linux和macOS等多个平台运行，主要目的正如前面所说————影视元数据管理和刮削工具。支持从IMDB、TMDB等多个网站获取电影海报、人员信息、影视截图、预告片、字幕等等信息，并且可以很方便地管理数据源，批量重命名以及管理电影合集等等。



下面简单介绍下具体的安装和使用过程。

### 使用教程

TMM的官方下载地址为[tinyMediaManager-Download](https://www.tinymediamanager.org/download/)，可以选择平台下载合适的安装包，这里使用windows版本作为演示。在TMM以前的版本中普通版本有电影和电视剧数量的限制，但最新版本（目前最新版本是4.3.5）已经去除了这个限制，所以我们使用免费版即可，如果有更深度的需求，可以考虑支持Pro版本。



安装完成后首次打开会有设置向导，这里我们需要分别选择电影和电视剧的媒体源，即数据存储的位置，不选也没关系，我们后续可以在设置中选择。



#### 申请TMDB Api Key（可选项）

在[TMDB官网](https://www.themoviedb.org/)注册后点击右上角头像，选择“账户设置”，然后在左侧菜单栏点击“API” - “请求API密钥”。



<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211251336769.webp" alt="image-20221125133632270" style="zoom:25%;" />



点击后选择“Developer”，然后条款拉到最下面点击“接受”。



<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211251342562.webp" alt="image-20221125134215676" style="zoom:25%;" />



然后按照提示填写资料即可：



<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211251348162.webp" alt="image-20221125134807317" style="zoom:25%;" />



在申请成功后跳转到的新页面上，就可以拿到“API 密钥 (v3 auth)”，即TMDB的Api Key。

#### 电影

##### 命名的惯例

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimgimage-20221125213517234.png" alt="image-20221125213517234" style="zoom:25%;" />

##### 重命名

首先来看电影的刮削。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20221125213829144.png" alt="image-20221125213829144" style="zoom:25%;" />

在更新数据源之后，我们已经能看到上面的电影已经导入并且初始化了一些信息。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20221125214020241.png" alt="image-20221125214020241" style="zoom:25%;" />

选择自动匹配

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20221125214234216.png" alt="image-20221125214234216" style="zoom:25%;" />

对于无法精准匹配的数据，TMM会弹出确认框可以手动检索和确认

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20221125215243620.png" alt="image-20221125215243620" style="zoom:25%;" />

我们可以看到，除了国内电影的分级信息之外，其他的信息都已经抓取完毕，这时候我们查看电影的源文件的时候，发现多出了很多散乱的信息。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20221125215412637.png" alt="image-20221125215412637" style="zoom:25%;" />

这时候我们可以使用TMM的批量命名功能将其重新整理

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20221125215807758.png" alt="image-20221125215807758" style="zoom:25%;" />

#### 电视剧

##### 命名的惯例

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20221125221635361.png" alt="image-20221125221635361" style="zoom:25%;" />



##### 批量改名法