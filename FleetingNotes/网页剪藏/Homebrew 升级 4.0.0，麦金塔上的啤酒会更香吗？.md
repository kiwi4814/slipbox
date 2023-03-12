> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [sspai.com](https://sspai.com/post/78587)

> TL;DRTheGood 软件信息存储方式从 git 仓库转向 JSONAPI，大幅改善了更新操作速度引入了接管手动安装应用的 --adopt 选项、PKG 安装包等实用改进 TheBad 没有改变过度分散的软件包维护 ......

**TL;DR**

**The Good**

*   软件信息存储方式从 git 仓库转向 JSON API，大幅改善了更新操作速度
*   引入了接管手动安装应用的 `--adopt` 选项、PKG 安装包等实用改进

**The Bad**

*   没有改变过度分散的软件包维护流程，延伸到用户的信任模型
*   没有改变修改安装路径权限的暴力做法

**The Ugly**

*   不懂[啤酒术语](https://sspai.com/link?target=https%3A%2F%2Fdocs.brew.sh%2FFormula-Cookbook%23homebrew-terminology)就不配用吗？

故事时间
----

很久很久以前，在遥远的麦金托比亚（Macintopia），喝啤酒是一件很不方便的事。

一群啤酒爱好者决定通过众筹改变现状。也没有什么别的，大概三件事：

首先，人们收集了大量的公开啤酒**配方**（formula），以便想喝时依样制作。这些配方统一放在档案库里，不时修订更新。人们看配方是好的。

但如果每杯啤酒都要现喝现做，未免太过麻烦。于是，人们开始预先做好很多**瓶装啤酒**（bottle），灌装后保存起来，想喝的时候就可以立马享用。人们看瓶装啤酒是好的。

还有些类型的酒，配方是保密的，或者家酿自制实在太麻烦。对于这些酒，人们就直接向生产商批发预先酿好、封装在**木桶（cask）**里的成品。人们看木桶啤酒也是好的。

事就这么成了；供应天下好啤酒的条件已经具备。2009 年 5 月，麦金托比亚家酿啤酒坊（d/b/a Homebrew）[挂牌成立](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Freleases%2Ftag%2F0.1)。

江山大改
----

时间飞逝，距离 Homebrew 初版发布转眼十年有四。其间，Homebrew 从一个名不见经传的后辈，逐渐成为 macOS 上最知名和最重要的开源项目之一；不仅跑赢了前辈 FINK 和 MacPorts，成为 macOS 上占据统治地位的软件包管理工具，而且开始向外拓展地盘，陆续支持了 Linux 和 WSL。

前不久，Hombrew 延续近年来隔年出一个大版本的传统，更新到了 4.0.0 版。根据[更新日志](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew.sh%2Fblob%2Fmaster%2F_posts%2F2023-02-16-homebrew-4.0.0.md)，4.0.0 版的重点功能是改变了安装信息的默认存取方式，正式用 JSON API 取代了 git 仓库，从而**显着**提高了安装和更新软件包的速度。

根据我的测试，「显着」一词在这里用得是恰当的。在控制其他变量的情况下，新版 Homebrew 运行 `brew update` 更新软件目录的时间差不多可以减半，从原来的二三十秒缩短到十秒出头（实际时间取决于距上次刷新的间隔）。又由于 Homebrew 每隔一段时间就会在所有安装或升级操作前强制更新一次，这也极大减少了它在「干正事」之前的等待时间。

（**注：**如果你有一段时间没有用 Homebrew 了，可以先用 `brew update` 命令（[不是](https://sspai.com/link?target=https%3A%2F%2Fdocs.brew.sh%2FFAQ%23how-do-i-update-my-local-packages) `upgrade`）确保已经升级到了 4.0.0 以上版本。这时，就可以根据更新日志的建议，丢掉两个已经用不到的官方仓库：`brew untap homebrew/core homebrew/cask`；这可以立即节约合计接近 1GB 的空间。国内用户…… 你可能还会想把环境变量 `HOMEBREW_API_DOMAIN` 改成 TUNA 之类的镜像源，详见相关[使用帮助](https://sspai.com/link?target=https%3A%2F%2Fmirrors.tuna.tsinghua.edu.cn%2Fhelp%2Fhomebrew%2F)。）

**导致这种变化的直接原因是更新所需数据量的大幅减少。**截至本文写作时，对应 Homebrew 两个官方仓库的 JSON 文件 `formula.json` 和 `cask.json` 分别在 20MB 和 4MB 左右。由于 Homebrew 还会通过 `curl --compressed` 请求压缩版本（见实现[代码](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Fblob%2F7c15dce285900c85476d445dcbc01418e61be37c%2FLibrary%2FHomebrew%2Fapi.rb%23L51)），实际的数据传输量分别接近 3.3MB 和 0.6MB。在过去，哪怕时隔几天更新一次，要下载的数据通常都不止这个规模。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/b64f0c813fcb0874ce6b5ceae1795515.webp)`formula.json` 片段

值得一提，JSON API 并不是为了 4.0.0 版才开发出来的。早在 2018 年，Homebrew 就已经[开始](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew.sh%2Fblob%2Fmaster%2F_posts%2F2018-07-15-homebrew-1.7.0.md)通过 JSON 提供软件包信息，并在 2021 年将从 JSON API 读取软件信息[作为一个隐藏选项](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Fpull%2F12305)提供给用户测试；本次新版做的事情只是[翻转](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Fpull%2F14412)了一下默认开关。

那么，为什么这项调整能带来这么大的变化？Homebrew 速度慢的问题由此被彻底解决了吗？

忆苦思甜
----

要说清楚这个问题，首先需要理解过去的 Homebrew 为什么这么慢。

让我们来忆苦思甜一番。老用户应该都还没忘，就在不久之前，找 Homebrew 买酒（装软件）的常见体验还是这样的：

1.  你告诉 Homebrew 要喝什么酒：`brew install FORMULA`。
2.  Homebrew 说，好的。但是亲，我这边后台看到距离你上次检查更新已经超过了，天啊，超过了 24 个小时。根据[内部规定](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Fblob%2Fa2b488cd10e51682b69e3a064b7e882a52d770a0%2FLibrary%2FHomebrew%2Fbrew.sh%23L291)，为了保证你喝到最新最好的啤酒，需要先更新一遍所有酒的配方。别担心，数量不多，也就七八千种，麻烦你稍等一会。
3.  你说，啥，我只是要一种酒，关所有酒什么事。
4.  但你只是问了个寂寞，因为 Homebrew 已经自顾自开始更新了。
5.  一千年过去了。你在红色黄昏的沙漠喝到了你要的啤酒。

这就是造成 Homebrew 缓慢印象的最直接原因：它实在太喜欢没事干就更新一下，而且即使只要求安装或更新一个软件，它也会意犹未尽般地顺手更新一连串软件。这本就已经如此的艰难，让我们就不要再拆穿国内用户访问 GitHub 一言难尽的速度。

不过，正如 Homebrew 在其常见问答中[解释](https://sspai.com/link?target=https%3A%2F%2Fdocs.brew.sh%2FFAQ%23why-does-brew-upgrade-formula-or-brew-install-formula-also-upgrade-a-bunch-of-other-stuff)，自动安装或更新相关软件，本身没有什么错。如果在更新一个软件的同时，不一并更新它所依赖的软件和依赖于它的软件，就很容易导致相互冲突。不只是 Homebrew，其他更老牌的包管理工具也都明确劝阻这种「部分升级」（partial upgrade）行为（例如参见 [Ubuntu](https://sspai.com/link?target=https%3A%2F%2Fhelp.ubuntu.com%2Fcommunity%2Fpartialupgrade) 和 [ArchLinux](https://sspai.com/link?target=https%3A%2F%2Fwiki.archlinux.org%2Ftitle%2FSystem_maintenance%23Partial_upgrades_are_unsupported) 的解释）。

如果说 Homebrew 有什么自我加码的地方，只不过将「完整升级」作为了默认行为，而不像其他工具那样需要用户明确指示（例如 `apt --dist-upgrade` 和 `pacman -Syu`）。

可见，频繁更新导致效率低下只是一种表象。实际上，造成 Homebrew「慢」的更本质原因，是它一些「不走寻常路」的选择。

**首先，Homebrew 长期采用 git 仓库作为「配方」（软件包安装信息）的存储方式，造成了很多额外开销。**

让我们回顾一下 Homebrew 在 4.0.0 时代之前的工作机制。在 [homebrew-core](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fhomebrew-core) 和 [homebrew-cask](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fhomebrew-cask) 两个官方仓库中，分别存储着数千个 `.rb` 格式的文件，每个文件对应着一种软件的版本号、下载地址、安装步骤等信息。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/45b6fc9a6ea16221d6f6eca727d5fe3f.webp)formula 文件样例

Homebrew 许多核心功能都是调用 `git(1)` 对这些仓库的操作。安装 Homebrew 时，这两个仓库被克隆到用户的电脑本地；而升级命令 `brew update` 的主要工作，实际上就是从服务器拉取这些仓库在远程的最新提交版本。

**这是一种非主流的做法。**放眼 Linux，常见包管理工具收录的软件信息，一般都通过**单个**文本文件或数据库文件统一存放。例如，Debian 中的 `apt` 通过 `Packages.xz` 文件（解压后是一个纯文本文件），ArchLinux 中的 `pacman` 通过 `core.db`、`community.db` 等文件来存储软件目录。升级几个软件源（或软件源的组成部分），就只要下载对应数量的文件。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/41f61026bbe8554438fdd652251487b4.webp)Debian 的 stable/main 仓库中的 Package.xz 解压后内容

而根据 Homebrew 的做法，每次更新都要下载大量零散「配方」文件；更新间隔越长，数量越多。何况相比于简单的 HTTP 下载，调用 git 命令本身就涉及读取提交记录、比较版本差异等复杂操作，额外消耗性能和时间也就不奇怪了。

当然，Homebrew 的维护者也不是傻子，他们早就知道这个问题。事实上，早期版本的 Homebrew 曾在同步远程软件仓库时使用所谓的「浅克隆」（shallow clone）方式，只获取最近一次提交（`--depth=1`），以便跳过不必要的老旧数据。然而，浅克隆方便了客户端，却把性能压力转移到服务器一侧，结果这种做法竟然惹到了 GitHub，直接被[叫停](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Fpull%2F9383)。于是，Homebrew 只能再次开始为用户克隆数百兆的完整仓库。

**同时，Homebrew 归根到底是个「民间」性质的包管理器，无法做到真正的统筹有序。**

还是以 Linux 为参照：大多数发行版内置的包管理器都有一些官方维护的软件仓库。新软件要想进入这些官方仓库并被承认为「稳定」，需要先经过严谨的测试流程。测试内容除了其本身的功能是否正常，也包括确认与仓库中其他软件（具体到特定版本）是否存在冲突。

事实上，测试流程在软件仓库维护中是如此重要，以至于对于 Debian、Fedora 这类采用标准发布方式的系统而言，一个「发布版本」（release）的本质，就是软件仓库被「冻结」在某一时刻、经过社区评议和批准的状态。即使是对于 ArchLinux 这类没有严格版本概念的「滚动」发行版，其核心软件包也是由少数资深用户负责维护和测试的。

Homebrew 的路子就野得多了。尽管 homebrew-core 和 homebrew-cask 这两个仓库名义上是项目官方所有，但其维护者来自五湖四海，大多数是软件的开发者本人或热心群众。软件包的更新流程也以 git 提交的形式开展，且大量依靠自动化流程；提交符合一些[基本格式](https://sspai.com/link?target=https%3A%2F%2Fdocs.brew.sh%2FFormula-Cookbook)的合并请求，就有比较大的几率获得通过；对新软件也没有观察测试一段时间再提供给用户下载的要求。以 Linux 世界的标准看，Homebrew 简直是比「滚动版」还更快地滚动，比「社区版」还依赖于社区。

这些「非主流设定」带来了两个间接后果。

**第一，Homebrew 的更新操作更有可能需要下载大量数据**。只要你装的软件够多、「酒瘾」够大，一天内多次检查更新都可以次次不空手而归。

相比之下，如果你使用 Debian 等系统的稳定版，只要不更新系统版本，其软件仓库中的版本将始终冻结在版本发布时的状态，每次更新能收到的最多是一些补丁、安全更新，以及第三方仓库的更新，数据量往往很有限。此外，`apt` 还会通过 `If-Modified-Since` 这一 HTTP 请求头部，事先要求服务器过滤掉没有更新的软件包信息，实际要下载的数量就更少了。

**第二，Homebrew 所收录软件的相互兼容更缺乏保证**。由于软件包的更新以一种无中心的方式开展，永远处在各自为政的奔流中，Homebrew 的软件仓库并不存在任何可称为「稳定」的时刻，可以保证那个时刻的软件版本之间没有冲突。

因此，Homebrew 激进的自动更新频率其实是一种「无奈之举」，意在通过高频更新来控制软件之间的新旧差异，进而降低相互不兼容的概率。（目前采用的 24 小时间隔已经是多次放宽后的结果，早期版本的 Homebrew 甚至只过 60 秒就会强制在后续操作前自动更新。)

更新又频繁、每次更新的数据量又大，再加上基于 git 导致的额外开销，Homebrew 确实只能说想不慢都难了。

这样，从 git 切换到 JSON 的意义就很好理解了。从此，Homebrew 转向了其他包管理工具的主流做法：通过「一个文件」而不是「一堆文件」来存储软件包信息，并且通过简单的 HTTP 请求而不是复杂的 git 操作来获取这些信息。这就在很大程度上回避了旧版 Homebrew 数据量和性能开销居高不下的问题。

目前，只有 homebrew-core 和 homebrew-cask 这两个最主要的仓库支持了 JSON API，其他 Homebrew 官方名下的仓库和第三方仓库（tap）暂时还在使用传统的 git 和 formula 文件，但即使如此，也已经足以让大多数用户感受到明显好处了。在此，我们也不妨期待 Homebrew 接下来会如何推进 JSON API 更广泛的采用。

本性难移
----

然而，Homebrew 4.0.0 的更新并不能解决所有问题。

**首先，导致 Homebrew 效率低下的本质原因 —— 过于分散的维护机制，及由此被迫采用的激进更新策略 —— 没有发生任何变化**。因此，用户尽管可以避免一些等待更新的时间，以及因 git 本身出错导致的故障，仍然不能避免使用中并不少见的软件冲突问题，仍然需要继续通过手动干预（例如使用 `brew pin`）来避免 Homebrew 过分喜新厌旧的倾向 —— 特别是对于 Node.js、Python 等攸关其他工作流程、起基础设施作用的软件。

（**注：**关于这类软件是否本就不应交给 Homebrew 管理，存在不同观点，但那超出了本文的讨论范围。）

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/08f810ef68bb8b9409b58b9dbc5e50b8.webp)xkcd 经典漫画《Python 环境》，Homebrew 在其中「地位显赫」

**还有一些长久以来受到质疑的可商榷做法，Homebrew 看起来也没有改变的打算。这方面，最典型的代表就是就是其软件安装路径的选择。**

直到两年前，Homebrew 都将 `/usr/local` 作为唯一正式支持的安装路径。只是在 3.0 版适配 ARM 架构后，才将 Apple silicon 机型的默认路径调整到 `/opt/homebrew`（Intel 机型仍然使用 `/usr/local`）。

`/usr/local` 是什么来头？根据在 Linux 世界中被广泛遵循的《[文件系统层次结构标准](https://sspai.com/link?target=https%3A%2F%2Frefspecs.linuxfoundation.org%2FFHS_3.0%2Ffhs-3.0.html)》（FHS），`/usr/local` 的用途是供管理员在本机安装**未随系统提供的软件**，这样可以与系统自带软件（一般存放在 `/usr/bin` 下）区隔，避免相互覆盖。这样说来，Homebrew 的选择貌似没什么问题 —— 通过它安装的软件确实不是 macOS 自带的。

但人们的不满并不在于 Homebrew 用了这个目录，而在于它是**怎么用**这个目录的。默认状态下，`/usr/local` 是最高权限的 root 用户所有，其他用户只能读取和执行，不能写入。但 Homebrew 在安装过程中会上演一出「鸠占鹊巢」，把 `/usr/local` 的所有者改成当前用户，并且所有普通管理员账户（admin 组）都可以读写。在 Apple silicon 机型上，Homebrew 对于本该是公共空间的 `/opt/homebrew` 也是一样的对待。

对此，Homebrew 官方[曾经](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Fcommit%2F0a8167d2dc2a2cbea581b2d252674a2266d21cf7%23diff-ef8e55479711be4a81d70a8a18978dc112bb721ec76721c5ceb8732dae4a58d4)做过解释，理由大致包括：首先，系统的默认搜索路径（`$PATH`）就包括 `/usr/local/bin`，装在这里的软件不用额外设置就能被终端识别，这难道不是很酷吗！不仅如此，给这个目录改了户口以后，用户自己安装软件就不用输密码提权了，这实在是太酷了！再说了，反正苹果自己把这里空着没用，那我不用白不用。今朝有酒今朝醉，懂伐啦？

在一些习惯了 Linux 逻辑的用户看来，这根本就是大逆不道。其危险在于，普通用户比 root 用户更容易被攻击，如果攻击者控制了普通用户，无需 root 权限就可以在被 Homebrew 改掉权限的 `/usr/local/bin` 下植入常见命令的伪造版本（设想放进一个叫做 `ls` 或者 `cd` 的恶意脚本）。于是，任何其他用户都会因为执行这个被替换的命令而触发破坏性后果。因此，在 `install` 之前先吟唱 `sudo`，就像是在祈使句之前先说「请」那样的文明社会基本礼仪。

这种谨慎当然不无道理，但对于安全模型的讨论不能脱离使用场景。诚如一些 Homebrew 的拥护者所指出，Linux 的包管理工具之所以要求严格区分权限，主要是考虑到 Linux 更多在服务器场景、多用户环境下使用。但 macOS 呢？随着苹果坚持不懈地自我阉割服务器功能，将 Apple ID 越发深入地植入系统安全和权限的方方面面， macOS 已经快要成为一个实践意义上的「单用户系统」。

在这种背景下，如果攻击者已经能接管一台 Mac 日常使用的登录账户，本身就是一个能造成足够损害的安全事故，根本不需要花什么额外心思构陷其他用户了。随着 Apple silicon 机型的普及，Homebrew 在上面占用的 `/opt/homebrew` 甚至都不在默认 `$PATH` 之中，设想的这种攻击路径就更不成立了。因此，Homebrew 的做法可能不是最稳妥的选择，但也不至于构成一票否决的因素。

相比之下，我对 Homebrew 的主要抱怨有点吹毛求疵 —— **它似乎就是不愿意学会「好好说话」，仍然坚持用难懂的啤酒术语来命名各种功能和概念。**

不知为何，这个项目对啤酒是如此执着，以至于官方《常见问答》的[第一条问题](https://sspai.com/link?target=https%3A%2F%2Fdocs.brew.sh%2FFAQ%23is-there-a-glossary-of-terms-around)竟然是一个啤酒黑话对照表。从好的方面说，对于新手上路、帮助理解，这种玩梗命名法或许能起到一定降低门槛的作用。但对于已经熟悉了其他包管理工具的用户，以及在上手之后的日常使用，你是更愿意看到这样的鬼话：

> Homebrew 首先阅读**配方**（formula），如果有中意的**瓶装版**（bottle），就直接存入**酒窖**（cellar）里的**加压桶**（keg），然后**倒**（pour）给顾客。也可以从**木桶**（cask）里直接倒酒，或者从别人的**酒头**（tap）里打酒。

还是这样的人话：

> Homebrew 首先读取**软件包定义文件**，如果有适用的**预编译二进制文件**，就下载到**统一安装路径**下**以名称和版本命名的子目录**，然后在 `bin` 目录中为其**创建符号链接**。也支持安装 **macOS 原生应用**，以及添加**第三方软件仓库**。

除了能带来一些快活的空气，我确实不知道这些难懂的话有什么好处。如果 Homebrew 使用啤酒主题术语（而不是二锅头或者别的任何酒肉主题）真的只是官方所解释的「历史巧合」，那么随着项目的发展成熟，就应该逐渐替换为更通用的表述，继续坚持小众时期的黑话只能是弊大于利。

小酌怡情
----

默认使用 JSON API 只是 Homebrew 4.0.0 最显着的变化。在此之外，更新日志还列举了很多改进点，篇幅所限不能一一说明，只挑几个我个人认为用户感知较强的：

**首先，**`**brew install**` **现在**[**新增**](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Fpull%2F14033)**了一个非常实用的选项** `**--adopt**`。这很好地解决了用 Homebrew 管理图形界面软件时，与用户手动安装版本以及软件的自动更新功能「打架」的问题。例如在以前，如果你从官网下载安装过 Notion，然后忘记了这回事，试图用 Homebrew 安装或更新，就会看到「软件已存在」的报错信息。这显然非常不智能：用户没有义务记住每个软件最初的安装渠道；既然已经装过了，那就没必要再装一遍，直接「接管」这个版本，以后一并纳入 Homebrew 的管理范围。这正是 `--adopt` 做的事：

```
platyhsu@forsa ~ % brew install notion --adopt
==> Downloading https://desktop-release.notion-static.com/Notion-2.1.12-arm64.dmg
######################################################################## 100.0%
==> Installing Cask notion
==> Purging files 
for version 2.1.12 of Cask notion
==> Installing Cask notion
==> Adopting existing App at '/Applications/Notion.app'
🍺  notion was successfully installed!
```

**其次，Homebrew 现在可以通过** `**.pkg**` **安装包安装了**。（暂未在官网正式提供，但可以[下载](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FHomebrew%2Fbrew%2Factions%2Fworkflows%2Fbuild-pkg.yml%3Fquery%3Devent%253Arelease)。）直到现在，Homebrew 官方提供的安装方式还是从终端运行安装脚本。与之相比，独立的安装包有助于回避 `curl | sh` 风格安装方式的一些安全问题，也能给不那么熟练的用户一个更友好易懂的安装选项。

**此外，Homebrew 的分析数据将从 Google Analytics 迁移到一个位于欧洲的自建服务器**。很多人或许不知道，你每次使用 Homebrew 新装一个软件，它都会匿名记录一个[统计信息](https://sspai.com/link?target=https%3A%2F%2Fdocs.brew.sh%2FAnalytics)，内容包括所安装的软件、Homebrew 版本、操作系统、CPU 架构、安装路径等。由于 Homebrew 的流行度，这已经积累除了一个相当有观察价值的[公开数据库](https://sspai.com/link?target=https%3A%2F%2Fformulae.brew.sh%2Fanalytics%2F)。如果说默认收集分析数据本身就有点容易引发争议，将数据发送给 Google 就更让不少人介意了，在数据监管日益严格的背景下也容易引发合规问题。在不停止收集的前提下，改用欧洲服务器是一个相对安全的选择。

总的来说，Homebrew 4.0.0 版的改进切实可感，称得上一个整数版本号来标记，也比以前更值得推荐给 macOS 的进阶用户，作为日常工具箱中的常备。

尽管不时有这样的声音，认为 Homebrew 是一个「路子太野」的包管理工具，甚至不如手动编译来得稳妥；但我的观点仍然是瑕不掩瑜，权衡之下，Homebrew 带来的便利还是大于潜在问题。何况，一个纯靠社区维护的包管理工具能延续十几年，并且维持稳步改进，本身就是一个可资赞赏的成就。再对比苹果自己第一方「包管理工具」——Mac App Store 的搞笑现状，Homebrew 发挥的正面效益就更不应否认了。

当然，系统维护的传统智慧告诉我们：被工具抽象掉的复杂性既没有被避免，也没有被消除，只是换了种形态被摊平到了系统的夹层中。在享受 Homebrew 便利性的同时，应当避免满足于将 brew 命令当作有求必应的魔法咒语。无论用它安装什么软件，都不应该省略阅读相关软件原始文档的必要步骤。如果尚有余力，也应当进一步了解 Homebrew 的工作机制，学习一些手动管理软件包的基本技能，以便对于 Homebrew 的能力边界建立更清醒的认识，在出现问题时知道如何排查。

挪用一句经典的洗脑广告语作为结尾时的共勉：家酿虽好，也不要贪杯噢。
