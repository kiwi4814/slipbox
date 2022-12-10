> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [hellogithub.com](https://hellogithub.com/periodical/volume/79)

> 分享 GitHub 上有趣入门级的开源项目

《HelloGitHub》第 79 期
-------------------

HelloGitHub 分享 GitHub 上有趣、入门级的开源项目，每月 28 号更新一期。 这里有好玩和入门级的开源项目、开源书籍、实战项目、企业级项目，让你用极短的时间感受到开源的魅力，对开源产生兴趣。

[](https://hellogithub.com/periodical/category/C%20%E9%A1%B9%E7%9B%AE)

Star 2wFork 2.8kWatch 658

超快的 IP 端口扫描工具。异步的 TCP 端口扫描器，特点就是快。最快能在 5 分钟内扫描完整个互联网，但要小心别把本机打挂了。

```
# 扫描指定 IP 的全部端口
masscan -p 0-65535 IP --rate=1000
```

Star 4.9kFork 947Watch 176

基于 LuaJIT 的可编写脚本的多线程基准测试工具。多用于数据库基准测试的命令行工具，经常出现在各种知名数据库的性能对比报告中。支持丰富的测试选项，比如表数量、数据条数、生成只读 SQL 等。

[](https://hellogithub.com/periodical/category/C%23%20%E9%A1%B9%E7%9B%AE)

Star 976Fork 163Watch 29

爽快利落的 Windows 平台远程桌面管理软件。该项目致力于提供优秀的远程桌面管理体验，通过启动器可以快速地连接到远程服务器，目前已支持 RDP、SSH、SFTP、FTP 等多种远程连接方式。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720568.gif)

Star 1.8wFork 1.7kWatch 273

优秀的本地媒体库管理工具。这是一个完全免费、支持中文、安装简单、跨平台、功能强大的媒体库管理系统。它能把原本躺在文件夹里的视频文件，变成包含封面、描述、评分、演员表等信息的 “影碟”，让视频整整齐齐、赏心悦目，还支持视频续播、订阅更新、多端可看，让你可以远离广告优雅地追剧。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720477.webp)

Star 5.5kFork 562Watch 131

一款开源免费的输入法词库转换程序。输入法会根据用户的输入和选词频率，形成一套符合用户输入习惯的词库，但这个词库无法直接转换到其它输入法，如果你换了输入法就需要重新习惯、养成新的词库。该项目支持 20 多种输入法的用户词库相互导入、导出以及合并词库，能够将你的输入习惯带到全新的输入法。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720104.webp)

[](https://hellogithub.com/periodical/category/C%2B%2B%20%E9%A1%B9%E7%9B%AE)

Star 4.8kFork 299Watch 80

Notepad++ 的替代品。采用 C++ 重写的跨平台文本编辑器，拥有和 Notepad++ 相似的界面和功能。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720109.webp)

Star 2wFork 4.8kWatch 829

一款简单、高效的实时视频服务器。高性能的流媒体服务器，支持 RTMP、WebRTC、HLS 和 HTTP-FLV 等协议，常用来构建直播和视频会议的后端服务。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720209.webp)

Star 1.9kFork 263Watch 26

从零编写一个 C++ 服务器的教程。该项目包含图文教程和源码，讲解了 socket、epoll、线程池、CMake 等知识点，适合有一定 C/C++ 基础的小伙伴学习。

Star 2.3wFork 1kWatch 381

保护视力的十六进制编辑器。面向逆向工程师和程序员的编辑器，可用来查看、解码、分析和编辑二进制数据。它功能丰富、界面炫酷、多彩高亮，而且项目更新积极，比如最初不支持中文路径的问题，现已解决可正常使用。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720704.webp)

[](https://hellogithub.com/periodical/category/Go%20%E9%A1%B9%E7%9B%AE)

Star 5.8kFork 181Watch 44

强大的 Kubernetes API 流量查看工具。如果把 k8s 比作操作系统，那它就是 k8s 上的 tcpdump，使用起来就像 Chrome 开发者工具一样简单直接，能够让 k8s 上微服务之间的网络通信一览无遗。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720064.webp)

Star 2kFork 169Watch 21

免费的 Kubernetes 教程。K8s 作为云原生时代的必备技能之一，多少得会一些。该教程侧重于实战引导，用 Go 写的项目作为演示对象，从最基础的容器定义开始，逐一讲述 pod、deployment、service、ingress 等资源，直到用 helm 打包部署一套完整服务。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720086.webp)

Star 1.5wFork 1.5kWatch 145

一款全面的容器安全扫描工具。目前最流行的开源容器镜像漏洞扫描工具，拥有速度快、精准度高、依赖检测、机密检查、对 CI 友好等特点。它不仅安装简单而且容易上手，仅需一条命令，即可发现镜像存在的安全漏洞。

```
# 安装
docker pull aquasec/trivy:0.33.0
# 运行
trivy image [YOUR_IMAGE_NAME]
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720631.webp)

Star 3.2kFork 228Watch 43

Go 语言的网页自动化和爬虫库。该项目是 Go 语言封装的 DevTools 协议库，实现用 Go 语言操作浏览器，自动化之前需要手动完成的操作，比如：爬取客户端渲染的页面、端到端测试、自动填写表单、模拟点击等操作。项目包含丰富的示例代码，改改就能上手使用。

```
package main

import (
    "github.com/go-rod/rod"
)

func main() {
    page := rod.New().MustConnect().MustPage("https://hellogithub.com")
    page.MustWaitLoad().MustScreenshot("a.png")
}
```

Star 2.9kFork 193Watch 22

用于解析环境变量的 Go 语言库。一般情况下项目启动时需要的配置参数，都是通过环境变量传递的。该项目就是 Go 语言用来解析环境变量的库，它简单、体积小、零依赖。

```
package main

import (
	"fmt"
	"time"

	"github.com/caarlos0/env/v6"
)

type config struct {
	Home         string        `env:"HOME"`
	Port         int           `env:"PORT" envDefault:"3000"`
	Password     string        `env:"PASSWORD,unset"`
	IsProduction bool          `env:"PRODUCTION"`
	Hosts        []string      `env:"HOSTS" envSeparator:":"`
	Duration     time.Duration `env:"DURATION"`
	TempFolder   string        `env:"TEMP_FOLDER" envDefault:"${HOME}/tmp" envExpand:"true"`
}

func main() {
	cfg := config{}
	if err := env.Parse(&cfg); err != nil {
		fmt.Printf("%+v\n", err)
	}

	fmt.Printf("%+v\n", cfg)
}
```

[](https://hellogithub.com/periodical/category/Java%20%E9%A1%B9%E7%9B%AE)

Star 2.5kFork 401Watch 42

腾讯开源的一站式微服务解决方案。基于 Spring Cloud 的服务治理框架，提供了微服务领域常见的服务注册与发现、配置中心、服务路由、限流熔断以及元数据链路透传等能力。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720483.webp)

Star 5.4kFork 1.4kWatch 386

一种 JVM 的非侵入式运行期 AOP 解决方案。简单点说就是如果线上 Java 服务出现故障，需要加一条日志定位问题，通过该项目可以在不重新部署服务的情况下，完成增加日志的操作。它还支持线上故障模拟、请求录制和结果回放等功能。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720491.webp)

Star 332Fork 64Watch 4

从零开发 Android 天气 APP。该项目介绍了如何开发一款支持天气预报、城市搜索、空气质量、自动更新等功能的 Android 应用，内含源码和配套讲解博文。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720308.webp)

[](https://hellogithub.com/periodical/category/JavaScript%20%E9%A1%B9%E7%9B%AE)

Star 3.5kFork 555Watch 56

滴滴开源的流程图编辑框架。该项目提供了一系列流程图交互和编辑的功能，支持实现脑图、ER 图、UML、工作流等各种场景。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720290.gif)

Star 3.5kFork 663Watch 62

在线编辑和演示 PPT 的应用。该项目采用 Vue3+TypeScript 构建，还原了大部分 Office PowerPoint 常用功能，支持在线编辑、演示和导出 PPT 文件。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720144.webp)

Star 5.9kFork 550Watch 115

一款最小化的浏览器。它是仅包含搜索、书签、密码管理、广告屏蔽器等最基础功能的极简浏览器，适用于 Windows、Linux、macOS 操作系统。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720995.webp)

Star 2wFork 1.5kWatch 230

可以并发执行 JavaScript 测试的工具。这是一款 Node.js 的测试运行工具，拥有简洁的 API、详细的错误输出、较高的执行效率等特点。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720201.webp)

Star 3.5kFork 123Watch 13

为你的站点提供命令面板界面的组件。这是一个即插即用的 React 组件，可以快速地为站点增加命令面板功能。让用户可以通过快捷键，灵活、交互式地访问网站。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720377.gif)

[](https://hellogithub.com/periodical/category/Kotlin%20%E9%A1%B9%E7%9B%AE)

Star 5.7kFork 808Watch 133

一款帮助建立和维持好习惯的应用。该软件完全免费、支持中文、无广告和内购，在 Google 应用商店上有 500 万的下载量。首先用户需要在 APP 上新建一个习惯，可以设置频率、量化任务、提醒时间等，每当完成一次习惯就在应用上做一个标记，后面会有详细的图表展示习惯养成情况。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720838.webp)

[](https://hellogithub.com/periodical/category/Python%20%E9%A1%B9%E7%9B%AE)

Star 1.3kFork 32Watch 9

在 “矩阵” 中进行视频会议。可以让你在视频会议时，实现类似《黑客帝国》数字雨的效果，支持 Teams/Zoom/Skype 视频软件，适用于 Windows、macOS、Linux 操作系统。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720250.gif)

Star 2.8kFork 310Watch 23

基于 PaddleOCR 的 OCR 图片转文字识别软件。完全免费、可离线使用的开源软件，支持截屏识别文字、批量导入图片、横 / 竖排文字，还可以自动忽略水印区域，适用于 Win10 操作系统。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720710.webp)

Star 5.5kFork 307Watch 52

用于生成 LaTeX 数学公式的 Python 库。LaTeX 是一种基于 ΤΕΧ 的排版系统，对于展示复杂的数学公式表现极为出色。该项目可以用 Python 函数，轻松生成复杂的 LaTeX 数学公式描述。

```
import math
import latexify

@latexify.with_latex
def solve(a, b, c):
    return (-b + math.sqrt(b**2 - 4*a*c)) / (2*a)

print(solve(1, 4, 3))
print(solve)
# 输出如下
# -1.0
# \mathrm{solve}(a, b, c)\triangleq \frac{-b + \sqrt{b^{2} - 4ac}}{2a}
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720936.webp)

Star 1wFork 884Watch 211

简单友好的 Python 任务调度库。该项目人性化的 API 设计，让开发者仅用几行代码就能轻松实现定时任务。它不依赖任何第三方库，全部代码也就一个文件 800 多行，拥有丰富的注释和单元测试，源码阅读起来十分轻松。

```
import schedule
import time

def job():
    print("I'm working...")

schedule.every(10).minutes.do(job)
schedule.every().hour.do(job)
schedule.every().day.at("10:30").do(job)
schedule.every().monday.do(job)
schedule.every().wednesday.at("13:15").do(job)
schedule.every().minute.at(":17").do(job)

while True:
    schedule.run_pending()
    time.sleep(1)
```

Star 960Fork 159Watch 17

可将 PDF 转换成 docx 文件的 Python 库。该项目通过 PyMuPDF 库提取 PDF 文件中的数据，然后采用 python-docx 库解析内容的布局、段落、图片、表格等，最后自动生成 docx 文件。

```
from pdf2docx import parse

pdf_file = '/path/to/sample.pdf'
docx_file = 'path/to/sample.docx'

# convert pdf to docx
parse(pdf_file, docx_file)
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720673.webp)

[](https://hellogithub.com/periodical/category/Ruby%20%E9%A1%B9%E7%9B%AE)

Star 1wFork 3.8kWatch 483

GitHub 官方开源的识别项目编程语言的库。该项目是 GitHub.com 网站上，用于检测开源项目编程语言占比的库。

```
# 安装
gem install github-linguist
# 在项目根目录下执行命令
github-linguist
# 结果
66.84%  264519     Ruby
24.68%  97685      C
6.57%   25999      Go
1.29%   5098       Lex
0.32%   1257       Shell
0.31%   1212       Dockerfile
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720938.webp)

[](https://hellogithub.com/periodical/category/Rust%20%E9%A1%B9%E7%9B%AE)

Star 4.5kFork 143Watch 33

神奇的 shell 历史记录工具。该项目通过 SQLite 数据库存储 shell 历史，能够显示更多的 shell 历史、命令运行时间、执行时间等信息，还支持选择、过滤、统计、同步 / 备份等操作。

```
# 搜索昨天下午3点之后记录的所有成功的 `make` 命令
atuin search --exit 0 --after "yesterday 3pm" make
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720913.gif)

Star 1.5kFork 801Watch 66

Rust 语言社区的每周摘要。该项目是由 Rust 社区发起，每周发布一期 Rust 相关动态，包括 Rust 语言的文章、视频、音频、开源项目分享，以及本周的更新 (PR)、RFC(征求意见) 和开发进度。

[](https://hellogithub.com/periodical/category/Swift%20%E9%A1%B9%E7%9B%AE)

Star 826Fork 48Watch 22

用于对 Swift 代码片段进行基准测试的库。该项目是谷歌开源的用来测试 Swift 代码片段性能的库。

```
import Benchmark

benchmark("add string reserved capacity") {
    var x: String = ""
    x.reserveCapacity(2000)
    for _ in 1...1000 {
        x += "hi"
    }
}

Benchmark.main()
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720681.webp)

Star 2kFork 164Watch 53

3D 魔方单词消消乐游戏。这是一款用 Swift 编写的 iOS 游戏，玩家可以选择 3D 立方体上的字母组成英文单词，如果一个字母被使用 3 次，该字母立方体就会消失，显示下面更多的字母。支持限时、无限、多人三种游戏模式，以及每日挑战和全球排行榜。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720060.webp)

[](https://hellogithub.com/periodical/category/%E5%85%B6%E5%AE%83)

Star 2.9kFork 228Watch 68

为动态语言生成调用图的工具。可根据源码文件生成漂亮的调用图的命令行工具，支持 Python、JavaScript、Ruby 等动态语言。

```
# 安装
pip3 install code2flow
# 使用
code2flow 文件
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720742.webp)

Star 2kFork 139Watch 38

讲解和演示哈希冲突的项目。包含了攻击介绍、演示文件和示例代码，快速理解 MD5 消息摘要算法的弱点，比如两个不同内容的文件生成相同 MD5 值。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720411.webp)

Star 6.6kFork 895Watch 177

测试 TLS/SSL 加密的工具。它可以用来检查 Web 服务是否支持 TLS/SSL 加密和协议，以及存在的缺陷。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720030.webp)

Star 1.7kFork 288Watch 349

ES 官方开源的压力测试工具。基于 Python3 的 ES 压力测试命令行工具，功能丰富支持自动创建、运行、销毁 ES 集群，以及不同数据集的测试结果比较。

```
安装：
    pip3 install esrally

运行：
    esrally

命令：
    race                Run a benchmark
    list                List configuration options
    info                Show info about a track
    create-track        Create a Rally track from existing data
    generate            Generate artifacts
    compare             Compare two races
    download            Downloads an artifact
    install             Installs an Elasticsearch node locally
    start               Starts an Elasticsearch node locally
    stop                Stops an Elasticsearch node locally
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720205.webp)

Star 787Fork 26Watch 22

让终端理解自然语言命令的工具。该项目使用 GPT-3 Codex 可将自然语言命令，转换为 PowerShell、Zsh 和 Bash 中的命令，比如输入 what‘s my IP？就能得到本机 IP。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720650.gif)

[](https://hellogithub.com/periodical/category/%E5%BC%80%E6%BA%90%E4%B9%A6%E7%B1%8D)

Star 3.1kFork 2.8kWatch 228

《Think DSP》Python 数字信号处理。本书内容是将 Python 代码和数字信号处理结合，相较于干巴巴的文字，通过代码示例更容易理解相关概念，该书作者还着有《Think Python》等图书。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720437.webp)

Star 5.9kFork 764Watch 142

《Crafting Interpreters》手撸解释器。该书作者在 Google 从事 Dart 语言的相关工作，书中内容是从一门小型自创编程语言 Lox 开始，详细介绍了如何为该语言制作解释器和虚拟机，推荐给想要学习编译原理或自创编程语言的同学。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720966.webp)

[](https://hellogithub.com/periodical/category/%E6%9C%BA%E5%99%A8%E5%AD%A6%E4%B9%A0)

Star 1.7wFork 1.4kWatch 141

OpenAI 开源的多语言识别系统。该项目是强大的自动语音识别系统，支持包括中文在内的多种语言识别。尤其是在快语速、口音、背景噪音等场景，依旧表现出色，能够达到极高的准确率。

```
import whisper

model = whisper.load_model("base")
result = model.transcribe("audio.mp3")
print(result["text"])

# 命令行使用
# $ whisper --language Chinese --model large audio.wav
# [00:00.000 --> 00:08.000] 如果他们使用航空的方式运输货物在某些航线上可能要花几天的时间才能卸货和通关
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720619.webp)

Star 1.5kFork 121Watch 60

根据文本生成 3D 人体运动的模型。论文《Human Motion Diffusion Model》第一作者开源的 PyTorch 实现。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291720509.gif)
