> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [www.freeoa.net](http://www.freeoa.net/osuport/intronix/linux-tty-ptys-console_3316.html)

> 基本概念：

**基本概念：**

1、tty(终端设备的统称)：The TTY demystified，tty 一词源于 Teletypes，或者 teletypewriters，原来指的是电传打字机，是通过串行线用打印机键盘通过阅读和发送信息的东西，后来这东西被键盘与显示器取代，所以现在叫终端比较合适。终端是一种字符型设备，它有多种类型，通常使用 tty 来简称各种类型的终端设备。tty 是最早出现的一种终端设备，类似电传打字机，由 Teletype 公司生产。最初 tty 是指连接到 Unix 系统上的物理或者虚拟终端。终端是一种字符型设备，通常使用 tty 来统称各种类型的终端设备。随着时间的推移，当通过串行口能够建立起终端连接后，这个名字也用来指任何的串口设备。它还有多种类，例如串口 (ttySn、ttySACn、ttyOn)、USB 到串口的转换器(ttyUSBn)，还有需要特殊处理才能正常工作的调制解调器(比如传统的 WinModem 类设备) 等。tty 虚拟设备支持虚拟控制台，它能通过键盘及网络连接或者通过 xterm 会话登录到计算机上。

其实起初终端和控制台都不是个人电脑的概念，而是多人共用的小型中型大型计算机上的概念。  
终端为主机提供了人机接口，每个人都通过终端使用主机的资源。终端有字符终端和图形终端两种，一台主机可以连很多终端。  
控制台是一种特殊的人机接口，是人控制主机的第一人机接口。而主机对于控制台的信任度高于其他终端。

对此还可以结合内核启动代码中 init 进程打开 / dev/console 和执行两次 sys_dup(0)，以及标准输入、标准输出、标准出错，还有就是进程 fork 后的标准输入输出的复制情况来一起理解。

而个人计算机只有控制台, 没有终端。当然愿意的话，可以在串口上连一两台字符哑终端。但是 linux 按 POSIX 标准把个人计算机当成小型机来用, 在控制台上通过 getty 软件虚拟了六个字符哑终端 (或者叫虚拟控制台终端 tty1-tty6)(数量可以在 / etc/inittab 里自己调整) 和一个图型终端，在虚拟图形终端中又可以通过软件 (如 rxvt) 再虚拟无限多个伪终端(pts/0 等)。但这全是虚拟的，虽然用起来一样，但实际上没有物理实体。所以在个人计算机上只有一个实际的控制台，没有终端，所有终端都是在控制台上用软件模拟的。

2、pty(虚拟终端): 但是如果我们远程 telnet 到主机或使用 xterm 时不也需要一个终端交互么？是的，这就是虚拟终端 pty(pseudo-tty)

3、pts/ptmx(pts/ptmx 结合使用，进而实现 pty):pts(pseudo-terminal slave) 是 pty 的实现方法，与 ptmx(pseudo-terminal master) 配合使用实现 pty。

console(控制台) 与 terminal(终端)

控制台是给管理员用的，终端是提供给用户用的，当然管理员也可以使用终端来管理机器。一般来说，console 只能有一个，通常是专门的 console 设备，或者显示器，或者电脑用串口线连接也可以作为 console；而 terminal 通常会有很多，这些概念源自于大型机 (mainframe) 所以我们现有的 Linux 以及 Unix 下所称的 console，terminal 实际上都是虚拟大型机上的这两个概念。

现在有七个 TeleType(tty，我就叫它打印机吧)，同时插到了这台古老的电脑上面，这七个打印机都是可以输入东西，把数据传到电脑，电脑再返回一些数据显示到打印机的纸带上面，只不过这个纸带现在变成屏幕了。这几个打印机就是真是存在的终端。

linux 系统，默认它有且只有七个 tty，也就是七个真的终端，也就是说可以把这台电脑想成只有七台真实存在的打印机连到了这台电脑上面。(linux 将它虚拟化了)，但事实上七个控制台并不够，万一八个人操作这个电脑呢？所以在七个真的终端 (tty) 下又有许多伪终端，也可以操作电脑。

控制台一台电脑只有一个，就当他是物理真是存在的东西，在计算机内部。输出到控制台，那就是指电脑返回了一段文字，这些文字输出在控制台上面，只不过通过终端显示给了用户。在早期，计算机由于比较昂贵，一个机构里的一台主机都是很多人共享的，前提是每个人都有一个键盘和显示器，而这些键盘和显示器就叫称为终端。不过有一种终端比较特殊，那就是主机自带的键盘和显示器，不需要连线的，它主要是给管理员管理系统的，它叫做控制台。后来每个人都有钱买得起自己的计算机了，没有了共享，这两个概念也不再有什么区别，因为每个人都同时是系统管理员和用户，当我们在管理系统的时候，键盘和显示器是控制台，如果我们在使用系统，那它们就是终端。所以慢慢地终端和控制台也有原本的硬件概念演化成了软件的概念。现在的终端和控制台指的是模拟软件，我们可以把它们理解为可以输入命令行并显示程序运行过程中的信息以及程序运行结果的窗口。

**终端的概念：**

在使用 Linux 操作系统的过程中，我们可以通过终端 (terminal) 来输入命令和接收信息，用户如果想与计算机进行交互，就会使用到终端，所以说，显示器和键盘就是一种终端，我们接收显示器输出的信息，通过键盘向电脑输入信息，显示器和键盘是真实存在的物理设备，我们可以称之为物理终端。除了物理终端，还有虚拟终端、图形终端、模拟终端等终端类型。

虚拟终端：虚拟终端是基于物理终端之上，以软件的方式虚拟实现的终端，虚拟终端称之为 tty，我们可以在同一个物理终端上虚拟出多个虚拟终端，Centos6 中默认有 6 个虚拟终端，我们使用 Ctrl+Alt+Fx(f1、f2·····f6) 快捷键在这 6 个虚拟终端之间切换，linux 中一切接文件，这些虚拟终端抽象出来的文文件名称为 /dev/tty#  ，虚拟终端只能在物理主机上使用，如果通过远程工具远程到主机 (比如通过 xshell 或者 vnc 远程过来)，则无法通过快捷键切换切换到虚拟终端 。

图形终端：图形终端属于上述虚拟终端的一种，所以它基于物理终端，以软件的方式虚拟出来，但是它同时会提供桌面环境，如果启动 Centos6 的时候使用图形化启动，看到图形化桌面后，按 Ctrl+Alt+f2，就会切换到 CentOS 的第二个虚拟终端，这个虚拟终端是字符界面的虚拟终端，在第二个虚拟终端中，按 Ctrl+Alt+f1，就会又回到图形化界面，这里的图形化界面和第二个虚拟终端都是我们说到的 CentOS 中自带的 6 个虚拟终端，只不过第一个虚拟终端是图形终端，同时也是虚拟终端 tty1。

模拟终端：我们可以将模拟终端理解为一个程序，这个程序是一个终端模拟器，由终端模拟器模拟出的终端称之为模拟终端，也叫 pts，图形化启动 Centos6 中，在桌面空白处右键，单机 Open in Ternimal，即可打开一个命令行窗口，这个命令窗口就是一个模拟终端。或者我们使用远程 ssh 程序倒开的命令行界面也是一个模拟终端，模拟终端的文件 / dev/pts/#  。

终端按照其自身能力分类，可以分为：

1)、哑终端 (瘦客户端)

早期的计算机终端是通过串行 RS-232 通信的，它只能解释有限数量的控制码 (CR，LF 等)，但没有能力处理执行特殊的转义序列功能 (如清行、清屏或控制光标的位置)。简单来说就是处理能力有限的终端机，他们一般基本上只具有和机械电传打字机类似的有限功能。这种类型的终端称为哑终端。现在仍然在现代类 Unix 系统上得到支持，通过设置环境变量 TERM=dumb。哑终端有时用来指任何类型的通过 RS-232 连接的传统计算机终端，不对数据进行本地处理或本地执行用户程序的串行通信终端。哑终端有时也指功能有限，只有单色文本处理能力或直接传输每一个键入的字符而不等待主机轮询的公共计算机终端。

2)、智能终端 (胖客户端)

智能终端就是有能力处理转义序列，也就是说处理能力较强的终端机。

**Linux 终端：**

在 Linux 系统的设备特殊文件目录 / dev / 下，终端特殊设备文件一般有以下几种：

1、串行端口终端 (/dev/ttySn)

串行端口终端 (Serial Port Terminal) 是使用计算机串行端口连接的终端设备。计算机把每个串行端口都看作是一个字符设备。有段时间这些串行端口设备通常被称为终端设备，因为那时它的最大用途就是用来连接终端。这些串行端口所对应的设备名称是 / dev/tts/0(或 / dev/ttyS0),/dev/tts/1(或 / dev/ttyS1)等，设备号分别是 (4,0),(4,1) 等，分别对应于 DOS 系统下的 COM1、COM2 等。若要向一个端口发送数据，可以在命令行上把标准输出重定向到这些特殊文件名上即可。例如， 在命令行提示符下键入：echo test > /dev/ttyS1 会把单词 "test" 发送到连接在 ttyS1(COM2)端口的设备上。可接串口来实验。

2、伪终端 (/dev/pty/)

伪终端 (Pseudo Terminal) 是成对的逻辑终端设备(即 master 和 slave 设备，对 master 的操作会反映到 slave 上)。

例如 / dev/ptyp3 和 / dev/ttyp3(或者在设备文件系统中分别是 / dev/pty/m3 和 / dev/pty/s3)。它们与实际物理设备并不直接相关。如果一个程序把 ptyp3(master 设备) 看作是一个串行端口设备，则它对该端口的读 / 写操作会反映在该逻辑终端设备对应的另一个 ttyp3(slave 设备) 上面。而 ttyp3 则是另一个程序用于读写操作的逻辑设备。

这样，两个程序就可以通过这种逻辑设备进行互相交流，而其中一个使用 ttyp3 的程序则认为自己正在与一个串行端口进行通信，这很象是逻辑设备对之间的管道操作。对于 ttyp3(s3)，任何设计成使用一个串行端口设备的程序都可以使用该逻辑设备。但对于使用 ptyp3 的程序，则需要专门设计来使用 ptyp3(m3) 逻辑设备。

比如某人在网上使用 telnet 程序连接到你的计算机上，则 telnet 程序就可能会开始连接到设备 ptyp2(m2)上 (一个伪终端端口上)。此时一个 getty 程序就应该运行在对应的 ttyp2(s2) 端口上。当 telnet 从远端获取了一个字符时，该字符就会通过 m2、s2 传递给 getty 程序，而 getty 程序就会通过 s2、m2 和 telnet 程序往网络上返回 "login:" 字符串信息。这样，登录程序与 telnet 程序就通过 "伪终端" 进行通信。通过使用适当的软件，就可以把两个甚至多个伪终端设备连接到同一个物理串行端口上。

在使用设备文件系统 (device filesystem) 之前，为了得到大量的伪终端设备特殊文件，使用了比较复杂的文件名命名方式。因为只存在 16 个 ttyp(ttyp0—ttypf) 的设备文件，为了得到更多的逻辑设备对，就使用了象 q、r、s 等字符来代替 p。例如，ttys8 和 ptys8 就是一个伪终端设备对，不过这种命名方式目前 仍然在 RedHat 等 Linux 系统中使用着。

但 Linux 系统上的 Unix98 并不使用上述方法，而使用了 "pty master" 方式，例如 / dev/ptm3，它的对应端则会被自动地创建成 / dev/pts/3，这样就可以在需要时提供一个 pty 伪终端。目录 /dev/pts 是一个类型为 devpts 的文件系统，并且可以在被加载文件系统列表中看到。虽然 "文件"/dev/pts/3 看上去是设备文件系统中的一项，但其实它完全是一种不同的文件系统。

即: TELNET ---> TTYP3(S3: slave) ---> PTYP3(M3: master) ---> GETTY

我们打开一个 terminal 时系统将会在 devpts 文件系统 / dev/pts 下创建一个对应的 pts 字符文件，该 pts 字符文件节点直接由 / dev/ptmx 节点的驱动函数 ptmx_open() 调用 devpts_pty_new(tty->link)  
[tty 对应 ptmx,tty->link 对应 / dev/pts/xxx，那么 tty->link->link 又对应回 ptmx，同样 ptm_driver->other 等于 pts_driver，pts_driver->other 等于 ptm_driver] 主动创建，而非通过 netlink 的 udev 或者 hotplug 配合创建。

3、控制终端 (/dev/tty)

如果当前进程有控制终端 (Controlling Terminal) 的话，那么 / dev/tty 就是当前进程的控制终端的设备特殊文件。可以使用命令 "ps –ax" 来查看进程与哪个控制终端相连。对于你登录的 shell，/dev/tty 就是你使用的终端，设备号是(5,0)，使用命令 "tty" 可以查看它 具体对应哪个实际终端设备。/dev/tty 有些类似于到实际所使用终端设备的一个联接。

控制台终端 (/dev/ttyn, /dev/console)

在 Linux 系统中，计算机显示器通常被称为控制台终端 (Console)。它仿真了类型为 Linux 的一种终端 (TERM=Linux)，并且有一些设备特殊文件与之相关联：tty0、tty1、tty2 等。当你在控制台上登录时，使用的是 tty1。使用 Alt+[F1-F6] 组合键时，我们就可以切换到 tty2、tty3 等上面去。tty1–tty6 等称为虚拟终端，而 tty0 则是当前所使用虚拟终端的一个别名，系统所产生的信息会发送到该终端上(这时也叫控制台终端)。因此不管当前正在使用哪个虚拟终端，系统信息都会发送到控制台终端上。你可以登录到不同的虚拟终端上去，因而可以让系统同时有几个不同的会话期存在。只有系统或超级用户 root 可以向 /dev/tty0 进行写操作。

终上所述，终端的模式可做如下分类：

1)、Linux X window

X window 环境，即图形界面终端模式，类似于 Windows 的图形画界面，也就是通过鼠标的点点来完成所有的管理任务。这个通常是在测试环境或者学习环境中被用到。真实的生产环境，一般来说都是使用的非图形界面，因为对与繁忙的生产环境来说，这个图形界面是需要资源开销的，因此省省吧，也就是系统通常运行等级在 level 3。对于 X window，这个都是鼠标点击，没啥太多可说的。

有图形界面也就有文本界面终端，那对于在命令行窗口想要切换到 X window 的情形，肿么办呢？可以使用 startx 来启动图行界面。 前提如下：  
    已经安装了 X Window system，并且 X server 是能够顺利启动的；  
    tty7 并没有其他的窗口软件正在运行 (tty 后面会讲到)；  
    启动 X 所必须要的服务，例如字型服务器 (X Font Server, xfs) 必须要先启动；  
    系统已安装了 GNOME/KDE 等桌面环境；

2)、文本接口终端

这是 Linux 服务器常用的模式。如果配置了 Linux 系统运行等级为 3 的时候，Linux 启动后就直接为文本模式，在这种情况下，当我们登陆到 Linux 服务器，即表明开启了一个终端模式会话。Linux 默认的情况下会提供六个 Terminal 来让使用者登陆， 切换的方式为使用：[Ctrl] + [Alt] + [F1]~[F6]的组合按钮。那这六个终端接口如何命名呢，系统会将 [F1] ~ [F6] 命名为 tty1 ~ tty6 的操作接口环境。也就是说，当你按下 [crtl] + [Alt] + [F1] 这三个组合按钮时 (按着 [ctrl] 与[Alt]不放，再按下 [F1] 功能键)，就会进入到 tty1 的 terminal 界面中了。同样的 [F2] 就是 tty2 了！那么如何回到刚刚的 X 窗口接口呢？很简单啊！按下 [Ctrl] + [Alt] + [F1] 就可以了！ 总结如下：  
    linux 的终端机 (文字) 界面与图形界面间的切换热键为：  
    进入终端机也就是字符界面 (tty1-tty6)：[Ctrl] + [Alt] + [F1] - [F6]  
    进入图形界面 (tty7)：[Ctrl] + [Alt] + [F7]

3)、tty(终端设备的统称)

tty 一词源于 Teletypes，或 teletypewriters，原来指的是电传打字机，是通过串行线用打印机键盘通过阅读和发送信息的东西，后来这东西被键盘和显示器取代，所以现在叫终端比较合适。终端是一种字符型设备，他有多种类型，通常使用 tty 来简称各种类型的终端设备。

4)、pty(虚拟终端):

我们在使用远程 telnet 到主机或使用 xterm 时也会产生一个终端交互，这就是虚拟终端 pty(pseudo-tty) 。例如我们在 X Window 下打开的终端，以及我们在 Windows 使用 telnet 或 ssh 等方式登录 Linux 主机，此时均在使用 pty 设备 (准确的说应该是 pty 从设备)。

 5)、pts/ptmx(pts/ptmx 结合使用，进而实现 pty):

伪终端 (Pseudo Terminal) 是终端的发展，为满足现在需求 (比如网络登陆、xwindow 窗口的管理)。它是成对出现的逻辑终端设备(即 master 和 slave 设备, 对 master 的操作会反映到 slave 上。也就是说 pts(pseudo-terminal slave) 是 pty 的实现方法，和 ptmx(pseudo-terminal master)配合使用实现 pty。

Linux 系统的终端设备一般有以下几种：

(1)、控制台

系统控制台 / dev/console

/dev/console 是系统控制台，是与操作系统交互的设备。系统所产生的信息会发送到该设备上。平时我们看到的 PC 只有一个屏幕和键盘，它其实就是控制台。目前只有在单用户模式下，才允许用户登录控制台 / dev/console。(可以在单用户模式下输入 tty 命令进行确认)。

console 有缓冲的概念，为内核提供打印输出。内核把要打印的内容装入缓冲区__log_buff，然后由 console 来决定打印到哪里 (比如是 tty0 还是 ttySn 等)。console 指向激活的终端。历史上，console 指主机本身的屏幕和键盘，而 tty 指用电缆链接的其它位置的控制台。

某些情况下 console 和 tty0 是一致的，就是当前所使用的是虚拟终端，也是激活虚拟终端。所以有些资料中称 / dev/console 是到 / dev/tty0 的符号链接，但是这样说现在看来是不对的：根据内核文档，在 2.1.71 之前，/dev/console 根据不同系统设定，符号链接到 / dev/tty0 或者其他 tty＊上，在 2.1.71 版本之后则完全由内核代码内部控制它的映射。

如果一个终端设备要实现 console 功能，必须向内核注册一个 struct console 结构，一般的串口驱动中都会有。如果设备要实现 tty 功能，必须要内核的 tty 子系统注册一个 struct tty_driver 结构，注册函数在 drivers/tty/tty_io.c 中。一个设备可以同时实现 console 和 tty_driver，一般串口都这么做。

当前控制台： /dev/tty

这是应用程序中的概念，如果当前进程有控制终端 (Controlling Terminal)，那么 / dev/tty 就是当前进程控制台的设备文件。对于你登录的 shell，/dev/tty 就是你使用的控制台，设备号是(5,0)。不过它并不指任何物理意义上的控制台，/dev/tty 会映射到当前设备(使用命令 "tty" 可以查看它具体对应哪个实际物理控制台设备)。输出到 / dev/tty 的内容只会显示在当前工作终端上(无论是登录在 ttyn 中还是 pty 中)。你如果在控制台界面下(即字符界面下) 那么 dev/tty 就是映射到 dev/tty1-6 之间的一个(取决于你当前的控制台号)，但是如果你现在是在图形界面(Xwindows)，那么你会发现现在的 / dev/tty 映射到的是 / dev/pts 的伪终端上。/dev/tty 有些类似于到实际所使用终端设备的一个联接。

你可以输入命令 "tty"，将显示当前映射终端如：/dev/tty1 或者 / dev/pts/0 等。也可以使用命令 "ps -ax" 来查看其他进程与哪个控制终端相连。

在当前终端中输入 echo "tekkaman" > /dev/tty ，都会直接显示在当前的终端中。

虚拟控制台 /dev/ttyn

/dev/ttyn 是进程虚拟控制台，他们共享同一个真实的物理控制台。

如果在进程里打开一个这样的文件且该文件不是其他进程的控制台时，那该文件就是这个进程的控制台。进程 printf 数据会输出到这里。在 PC 上，用户可以使用 alt+Fn 切换控制台，看起来感觉存在多个屏幕，这种虚拟控制台对应 tty1~n，其中 ：

/dev/tty1 等代表第一个虚拟控制台

例如当使用 ALT+F2 进行切换时，系统的虚拟控制台为 / dev/tty2 ，当前控制台 (/dev/tty) 则指向 / dev/tty2

在 UNIX 系统中，计算机显示器通常被称为控制台 (Console)。它仿真了类型为 Linux 的一种终端，并且有一些设备特殊文件与之相关联：tty0、tty1、tty2 等。当你在控制台上登录时，使用的是 tty1。使用 Alt+[F1-F6] 组合键时，我们就可以切换到 tty2、tty3 等上面去。

你可以登录到不同的虚拟控制台上去，因而可以让系统同时有几个不同的会话存在。

而比较特殊的是 / dev/tty0，他代表当前虚拟控制台，是当前所使用虚拟控制台的一个别名。因此不管当前正在使用哪个虚拟控制台 (注意：这里是虚拟控制台，不包括伪终端)，系统信息都会发送到 / dev/tty0 上。只有系统或超级用户 root 可以向 / dev/tty0 进行写操作。tty0 是系统自动打开的，但不用于用户登录。在 Framebuffer 设备没有启用的系统中，可以使用 / dev/tty0 访问显卡。

(2)、伪终端 pty(pseudo-tty)

伪终端 (Pseudo Terminal) 是终端的发展，为满足现在需求 (比如网络登陆、xwindow 窗口的管理)。它是成对出现的逻辑终端设备(即 master 和 slave 设备, 对 master 的操作会反映到 slave 上)。它多用于模拟终端程序，是远程登陆(telnet、ssh、xterm 等) 后创建的控制台设备。

历史上，有两套伪终端软件接口：

BSD 接口：较简单，master 为 / dev/pty[p-za-e][0-9a-f] ;slave 为 /dev/tty[p-za-e][0-9a-f]，它们都是配对的出现的。例如 / dev/ptyp3 和 / dev/ttyp3。但由于在编程时要找到一个合适的终端需要逐个尝试，所以逐渐被放弃。

Unix 98 接口：使用一个 / dev/ptmx 作为 master 设备，在每次打开操作时会得到一个 master 设备 fd，并在 / dev/pts / 目录下得到一个 slave 设备 (如 /dev/pts/3 和 / dev/ptmx)，这样就避免了逐个尝试的麻烦。由于可能有好几千个用户登陆，所以 / dev/pts/* 是动态生成的，不象其他设备文件是构建系统时就已经产生的硬盘节点 (如果未使用 devfs、udev、mdev 等) 。第一个用户登陆，设备文件为 / dev/pts/0，第二个为 / dev/pts/1，以此类推。它们并不与实际物理设备直接相关。现在大多数系统是通过此接口实现 pty。

我们在 X Window 下打开的终端或使用 telnet 或 ssh 等方式登录 Linux 主机，此时均通过 pty 设备。例如，如果某人在网上使用 telnet 程序连接到你的计算机上，则 telnet 程序就可能会打开 / dev/ptmx 设备获取一个 fd。此时一个 getty 程序就应该运行在对应的 / dev/pts/* 上。当 telnet 从远端获取了一个字符时，该字符就会通过 ptmx、pts/* 传递给 getty 程序，而 getty 程序就会通过 pts/*、ptmx 和 telnet 程序往网络上返回 "login:" 字符串信息。这样，登录程序与 telnet 程序就通过 "伪终端" 进行通信。

telnet<--->/dev/ptmx(master)<--->pts/*(slave)<--->getty

如果一个程序把 pts/* 看作是一个串行端口设备，则它对该端口的读 / 写操作会反映在该逻辑终端设备对的另一个 / dev/ptmx 上，而 / dev/ptmx 则是另一个程序用于读写操作的逻辑设备。这样，两个程序就可以通过这种逻辑设备进行互相交流，这很象是逻辑设备对之间的管道操作。对于 pts/*，任何设计成使用一个串行端口设备的程序都可以使用该逻辑设备。但对于使用 / dev/ptmx 的程序，则需要专门设计来使用 / dev/ptmx 逻辑设备。

通过使用适当的软件，就可以把两个甚至多个伪终端设备连接到同一个物理串行端口上。

实验：  
在 X 下打开一个或 N 个终端窗口  
`#ls /dev/pts/*  `
关闭这个 X 下的终端窗口，再次运行；比较两次输出信息就明白了。  
输出为 / dev/ptmx /dev/pts/1 存在一 (master) 对多 (slave) 的情况

(3)、串口终端 (/dev/ttySn)

串行端口终端 (Serial Port Terminal) 是使用计算机串行端口连接的终端设备。计算机把每个串行端口都看作是一个字符设备。有段时间串行端口设备通常被称为终端设备，那时它的最大用途就是用来连接终端，所以这些串行端口所对应的设备名称是 / dev/tts/0(或 / dev/ttyS0)、/dev/tts/1(或 / dev /ttyS1)等，设备号分别是 (4,0)、(4,1) 等(对应于 win 系统下的 COM1、COM2 等)。若要向一个端口发送数据，可以在命令行上把标准输出重定向到这些特殊文件名上即可。

例如，在命令行提示符下键入：echo freeoa> /dev/ttyS1 会把 "freeoa" 发送到连接在 ttyS1(COM2) 端口的设备上。

在 2.6 以后的内核中，部分三星芯片 (例如 S3C24x0 等) 将串口终端设备节点命名为 ttySACn。TI 的 Omap 系列芯片从 2.6.37 开始芯片自带的 UART 设备开始使用专有的的 omap-uart 驱动，故设备节点命名为 ttyOn，以区别于使用 8250 驱动时的设备名 "ttySn"。

其实在理解以上概念的时候，如果了解终端的发展历程，就可以比较容易理解 tty、终端的概念。所以请大家阅读最后推荐的 wiki 英文网页，有助于理解上面的概念。当然，内核文档也是必不可少的参考资料，顺手翻译了一些。

对于 TTY 系统的理解 (图解)：  
![](http://www.freeoa.net/images/unixsupt/intronix/201x/tty-system-rel.png)

内核文档 / Documentation/devices.txt 翻译节选：

**** 终端设备  
Terminal, or TTY devices are a special class of character devices. A  
terminal device is any device that could act as a controlling terminal  
for a session; this includes virtual consoles, serial ports, and  
pseudoterminals .  
终端或这 TTY 设备是一类特殊的字符设备。  
一个终端设备是任何对于一个会话可以作为控制终端的设备。  
这包括虚拟控制台、串口和伪终端 (PTYs)。

All terminal devices share a common set of capabilities known as line  
disciplines; these include the common terminal line discipline as well  
as SLIP and PPP modes.  
所有终端设备共享一系列常规能力 - 线路规程。  
这包含常见的终端线路规程，例如 SLIP 和 PPP 模式。

All terminal devices are named similarly; this section explains the  
naming and use of the various types of TTYs. Note that the naming  
conventions include several historical warts; some of these are  
Linux-specific, some were inherited from other systems, and some  
reflect Linux outgrowing a borrowed convention.  
所有终端设备的命名都比较简单。本节介绍不同类型 TTY 的命名和用途。  
注意命名的约定包含了一些历史需求：  
某些是 Linux 特定的，  
某些是从其他的系统中继承下来的，  
还有一些则反映了 Linux 从借鉴来的约定中发展而来的。

A hash mark (#) in a device name is used here to indicate a decimal  
number without leading zeroes.  
设备名中的 (#) 标志用于标识一个不以 0 开头的 10 进制数。

Virtual consoles and the console device  
虚拟控制台和控制台设备

Virtual consoles are full-screen terminal displays on the system video  
monitor. Virtual consoles are named /dev/tty#, with numbering  
starting at /dev/tty1; /dev/tty0 is the current virtual console.  
/dev/tty0 is the device that should be used to access the system video  
card on those architectures for which the frame buffer devices  
(/dev/fb*) are not applicable. Do not use /dev/console  
for this purpose.  
虚拟控制台是在系统视频监视器上全屏的显示终端。  
虚拟控制台设备名为 / dev/tty#，编号开始于 / dev/tty1。  
/dev/tty0 是当前虚拟控制台。  
/dev/tty0 在那些帧缓冲设备 (/dev/fb*) 不适用的构架下可以被用来访问系统显卡。  
而 / dev/console 并不用于此目的。

The console device, /dev/console, is the device to which system  
messages should be sent, and on which logins should be permitted in  
single-user mode. Starting with Linux 2.1.71, /dev/console is managed  
by the kernel; for previous versions it should be a symbolic link to  
either /dev/tty0, a specific virtual console such as /dev/tty1, or to  
a serial port primary (tty*, not cu*) device, depending on the  
configuration of the system.  
控制台设备 / dev/console 是一个接受系统信息并在单用户模式下允许登录的设备。  
从 Linux 2.1.71 开始，/dev/console 由内核管理，  
而以前的版本是一个到 / dev/tty0、一个特定的虚拟控制台 (如 / dev/tty1) 或者一个串口主 (tty*, 非 cu*) 设备动态链接，这些依赖系统配置。

Serial ports  
串行端口

Serial ports are RS-232 serial ports and any device which simulates  
one, either in hardware (such as internal modems) or in software (such  
as the ISDN driver.) Under Linux, each serial ports has two device  
names, the primary or callin device and the alternate or callout one.  
Each kind of device is indicated by a different letter. For any  
letter X, the names of the devices are /dev/ttyX# and /dev/cux#,  
respectively; for historical reasons, /dev/ttyS# and /dev/ttyC#  
correspond to /dev/cua# and /dev/cub#. In the future, it should be  
expected that multiple letters will be used; all letters will be upper  
case for the "tty" device (e.g. /dev/ttyDP#) and lower case for the  
"cu" device (e.g. /dev/cudp#).  
串行端口是 RS-232 串口和任何类似的设备，无论是硬件的 (如内部调制解调器) 或者软件(如 ISDN 驱动)。  
在 Linux 下，每个串口有两个设备名，主要的 (callin 设备) 和备用的(callout 设备)，每类设备都通过不同的字母标识。对于任何字母 X，设备名分别是 / dev/ttyX# 和 / dev/cux#；由于历史原因，/dev/ttyS# 和 / dev/ttyC# 对应于 / dev/cua# 和 / dev/cub#。未来，对于 "tty" 多字母的名字将会被使用，所有的字母都将是大写(如 / dev/ttyDP#)，对于 "cu" 设备则使用小写字母(如 / dev/cudp#)。

The names /dev/ttyQ# and /dev/cuq# are reserved for local use.  
名字 (/dev/ttyQ# 和 / dev/cuq#) 保留，用于本地使用。

The alternate devices provide for kernel-based exclusion and somewhat  
different defaults than the primary devices. Their main purpose is to  
allow the use of serial ports with programs with no inherent or broken  
support for serial ports. Their use is deprecated, and they may be  
removed from a future version of Linux.  
备用设备提供基于内核的 exclusion 和某些与主要设备不同的默认配置。他们的主要目的是允许那些对于串口并非内部支持或是有一定问题的程序使用串口。他们的使用已经过时，他们可能会从未来的 Linux 版本中删除。

Arbitration of serial ports is provided by the use of lock files with  
the names /var/lock/LCK..ttyX#. The contents of the lock file should  
be the PID of the locking process as an ASCII number.  
串口的仲裁是通过锁文件 (/var/lock/LCK..ttyX#) 来提供的。  
锁文件的内容应该是锁定进程 PID 的 ASCII 码。

It is common practice to install links such as /dev/modem  
which point to serial ports. In order to ensure proper locking in the  
presence of these links, it is recommended that software chase  
symlinks and lock all possible names; additionally, it is recommended  
that a lock file be installed with the corresponding alternate  
device. In order to avoid deadlocks, it is recommended that the locks  
are acquired in the following order, and released in the reverse:  
安装一个例如 / dev/modem 的链接来指向串口是常见的做法。  
为了确保适当锁定在这些环节的存在，建议软件追踪符号并锁定所有可能的名字;  
此外，建议为相应的备用设备安装一个锁文件。  
为了避免死锁，建议按以下顺序获取锁，并按反向的顺序释放：  
1. The symbolic link name, if any (/var/lock/LCK..modem)  
2. The "tty" name (/var/lock/LCK..ttyS2)  
3. The alternate device name (/var/lock/LCK..cua2)  
1、符号链接名，如果有 (/var/lock/LCK..modem)  
2、"tty" 名 (/var/lock/LCK..ttyS2)  
3、备用设备名 (/var/lock/LCK..cua2)  
In the case of nested symbolic links, the lock files should be  
installed in the order the symlinks are resolved.  
在符号链接嵌套的情况下，锁定文件应按照符号链接的顺序来安装以解决问题。

Under no circumstances should an application hold a lock while waiting  
for another to be released. In addition, applications which attempt  
to create lock files for the corresponding alternate device names  
should take into account the possibility of being used on a non-serial  
port TTY, for which no alternate device would exist.  
在任何情况下，应用程序应该等待另一个程序释放锁后，持有这个锁。  
此外，试图为相应的备用设备名创建锁文件的应用程序应考虑被用于非串口的 TTY 端口的可能性，此时没有备用设备存在。

Pseudoterminals (PTYs)  
伪终端 (PTYs)

Pseudoterminals, or PTYs, are used to create login sessions or provide  
other capabilities requiring a TTY line discipline (including SLIP or  
PPP capability) to arbitrary data-generation processes. Each PTY has  
a master side, named /dev/pty[p-za-e][0-9a-f], and a slave side, named  
/dev/tty[p-za-e][0-9a-f]. The kernel arbitrates the use of PTYs by  
allowing each master side to be opened only once.  
伪终端 (或 PTYs) 用于创建登录会话或提供给其他需要 tty 线路规程 (包括 SLIP 或 PPP 能力) 能力以生成数据的进程。  
每个 PTY 有一个主端 (/dev/pty[p-za-e][0-9a-f]) 和一个从端(/dev/tty[p-za-e][0-9a-f])。  
内核通过只允许每个主端仅允许打开一次来仲裁 PTY 的使用。

Once the master side has been opened, the corresponding slave device  
can be used in the same manner as any TTY device. The master and  
slave devices are connected by the kernel, generating the equivalent  
of a bidirectional pipe with TTY capabilities.  
一旦主端被打开，相应的从设备可以像任何 TTY 设备一样的方式被使用。  
主从设备都和内核连接，产生相当于一个带 TTY 功能的双向管道。

Recent versions of the Linux kernels and GNU libc contain support for  
the System V/Unix98 naming scheme for PTYs, which assigns a common  
device, /dev/ptmx, to all the masters (opening it will automatically  
give you a previously unassigned PTY) and a subdirectory, /dev/pts,  
for the slaves; the slaves are named with decimal integers (/dev/pts/#  
in our notation). This removes the problem of exhausting the  
namespace and enables the kernel to automatically create the device  
nodes for the slaves on demand using the "devpts" filesystem.  
Linux 内核的最近版本和 GNU 库包含了对于 System V 和 Unix98 对 PTY 命名方式的支持。  
它分配一个共用的设备 (/dev/ptmx) 给所有的主端 (打开它会自动给你一个以前未分配的 PTY) 和一个子目录 (/dev/pts) 用于从端；从端通过十进制整数 (/dev/pts/#) 命名。  
这消除了命名空间枯竭的问题，并使内核通过 "devpts" 文件系统按需自动为从端动创建设备节点。

tty  
tty 原意是远程输入机 (teletypewriter) 的意思。现在在 unix 系统中，tty 的意思是 text terminal 的意思。

tty: terminal(终端),console(控制台)  
pty: pseudo terminal (ssh,gnome-terminal,konsole,xfce4-terminal,lxterminal)  
ptmx: pseudo terminal master x (/dev/ptmx)  
pts: pseudo terminal slave (/dev/pts/0)

/dev/tty*     终端  
/dev/ttyS*    串口终端  
/dev/ttyUSB*  USB 转串口终端  
/dev/ptmx     pty 主设备  
/dev/pts/*    pty 从设备

ssh 登录一台 Linux 服务器执行 w 查看谁在线。

TTY 即 pts/0，即 / dev/pts/0。

伪终端 pts 的工作依赖 / dev/ptmx 和 / dev/pts/0 的主从驱动，相关的 man 手册：  
http://www.man7.org/linux/man-pages/man4/tty.4.html  
http://www.man7.org/linux/man-pages/man7/pty.7.html  
http://www.man7.org/linux/man-pages/man4/pts.4.html

ptmx, pts - pseudoterminal master and slave

The file /dev/ptmx is a character file with major number 5 and minor number 2, usually of mode 0666 and owner.group of root.root.  It is used to create a pseudoterminal master and slave pair.

另外在 Linux 桌面打开一个 gnome-terminal 标签页也会在 / dev/pts 下生成一个对应的字符设备文件。

Unix-like 系统的 console, terminal, tty 和 pty：这些物理设备在 Unix-like 系统中依然存在，只不过被抽象成了设备文件了 (device file)，毕竟 Unix 中一切皆文件。在 /dev 目录下可以找到它们的影子。/dev/console 是一个 字符型的设备文件。

$ ls -l /dev/console  
crw------- 1 root root 5, 1 Sep  1 20:25 /dev/console

terminal 和 tty

在 GNU/Linux 和 Mac OS X 上，都有 terminal 程序，打开一个 terminal 程序就对应一个 tty (text terminal) 设备文件。做实验验证一下。打开一个 terminal：  
$ echo 'freeoa' > /dev/tty  
freeoa

往 /dev/tty 写入内容会在当前 terminal 里回显。如果同时存在两个 terminal 呢？再打开一个 terminal 试试看：$ echo 'freeoa' > /dev/tty  
freeoa

同样再当前 terminal 回显，但是回头看看一个 terminal，并没有显示‘freeoa’。 其实每次打开 terminal 时会有个唯一的 tty 文件与其对应，上面第一次打开的 terminal 对应的是 /dev/ttys000，第二次打开的 terminal 对应的是 / dev/ttys001，而 /dev/tty 会根据当前活动的 terminal 去找到对应文件 ttys000 或者 ttys001。基于上面的解释，可以实现在一个 terminal 上向另外一个 terminal 上写内容，在第一个 terminal 上执行：  
$ echo freeoa > /dev/ttys001  
freeoa

会显示在第二个 terminal 上。pty 知道了 tty，pty(pseudo tty) 伪 tty(text terminal) 就没什么玄妙的了。

pty 在什么场景下用到呢？使用 ssh 客户端 远程连接到服务器系统上，那么用户操作的文本界面就是一个虚拟终端，对应一个 / dev/ptys。dev/pty 可以有多个，比如 /dev/ptys1, /dev/ptys2 等，对应多个 ssh 连接。向系统上其他用户发送消息利用上面的知识，可以在伪终端上向其他用户发送消息，同样其他用户可以发送消息过来，简直就是 IM 工具。

示例：  
1. 使用 w 命令找到当前系统登录的用户以及其所在的伪终端。  
$ w  
freeoa pts/28   172.23.0.18      14:56    0.00s  0.40s  0.04s sshd: freeoa [priv]  
damon    pts/30   172.23.0.38      15:36    1:58m  0.06s  0.06s -bash

输出的第一列是用户名，第二列是其伪终端。

2. 给用户发消息  
$ echo 'hello damon, how about go out for fun this evening?' > /dev/pts/30

其实有个 Linux 工具 write 可以做同样的事，可以试试看。在打开对第一个终端上 (pts/28) 执行：write freeoa pts/30 然后进入 "等待你输入消息" 对状态，继续输入，回车后输入对内容会显示在 pts/30 终端上。顺便提一下，write 命令受 mesg 命令影响。mesg 控制着其他用户是否有权向你的终端写入消息。当对方 (比如 pts/30) 上执行了 mesg n 命令，表示关闭其他用户当写入权限。这时如果使用 write freeoa pts/30 就发送消息了。 但是可用通过向 /dev/pts/30 写入消息绕过 mesg 的限制。

ttyS0~ ttyS3 (串行端口终端) 指的是电脑的各个物理接口 (这些都是串口，不是并口)，外部的终端通过这些物理接口与电脑连接 ，从而实现和电脑进行交互。例如：dmesg |grep tty 可以查看开启的接口 (串口)

目前连接远程服务器或者直接在服务器上面操作等都是通过创建虚拟终端的形式。比如 pts/1 和 tty1 虚拟终端, 其中 tty 表示直接登录机器生成的而 pts 表示远程连接生成的。其中远程连接是通过 sshd 服务进行创建 session 会话和 bash 进程 (所以可以看到有 sshd 进程，同时虚拟终端可以创建多个，这是依赖 ptmx 功能，sshd 通过与 ptmx 通讯，ptmx 在和相对应的 pts 通讯从而达到多个虚拟终端的效果)。ttyn 使用 tmux 模拟的，pts 是远程连接产生的，当前就是 pts/2        。

例如：在 centos 系统中的图像界面中打开的 terminal 就是一个 pts 但是整个图形界面是一个 tty，centos 切换到命令行界面后输入 tty 命令时输出就是 tty1 或 ttyn 了，这时候的命令行界面与图形界面的运行级别是一样的，通过命令行创建的所有进程都是属于 tty1 终端的。

注意：tty 就是 ttyS 的虚拟版本，只是不需要通过外部线路进行连接了。远程连接服务器需要 sshd 服务，sshd 和 tty 没有联系，远程连接是因为本地有终端模拟器，本机连接就需要内核直接模拟一个模拟器了，所有远程是 pts，本机是 tty 。     

从上面的流程中可以看出来对用户空间的程序来说它们没有区别，都是一样的；从内核角度来看 pts 的另一端连接的是 ptmx，而 tty 的另一端连接的是内核的终端模拟器，ptmx 和终端模拟器都只是负责维护会话和转发数据包；再看看 ptmx 和内核终端模拟器的另一端，ptmx 的另一端连接的是用户空间的应用程序，如 sshd、tmux 等，而内核终端模拟器的另一端连接的是具体的硬件，如键盘和显示器。

**终端相关的命令：**

who 命令

使用 who 命令，查看当前有多少终端连接到了服务器。   

# who  
root     tty2         2018-07-23 13:40  
root     tty1         2018-07-23 13:34 (:0)  
root     pts/0        2018-07-23 13:34 (:0.0)  
root     pts/1        2018-07-23 14:38 (192.168.131.1)

从显示结果我们可以看到，四个终端都是 root 用户登录的，tty2 就是我按 Ctrl+Alt+f2 调用的虚拟终端，tty1 是系统启动后默认进入的图形化界面（图形终端），pts/0 是从图形化界面右键菜单中打开的模拟终端，pts/1 是我通过 xshell 这种 ssh 工具打开的模拟终端。只键入 w ，显示有哪些用户已经登录终端、登录时间以及在做什么等信息，信息比 who 命令返回的更详细。

who am i 命令或者 tty 命令

使用 who am i 命令查看当前使用的终端是哪一个终端。

# who am i  
root     pts/1        2018-07-23 14:38 (192.168.131.1)

在 ssh 工具中键入了 who am i 命令，所以返回的结果显示，我当前使用的终端类型为 pts 类型，终端编号为 pts/1 ，同时还返回了这个终端的登录时间以及客户端 IP。

使用 tty 命令也可以查看当前终端  
# tty  
/dev/pts/1

chvt 命令

使用 chvt 命令在各个虚拟终端之间切换，chvt 可以看成是 change virtual terminal 的缩写，所以 chvt 只能在各个虚拟终端之间切换，并不能在 pts 和 tty 之间切换，所以不要在 ssh 远程工具中执行 chvt 命令，也不要在 vnc 的显示界面中执行 chvt 命令，因为 ssh 远程工具和 vnc 远程工具打开的终端都是 pts 类型的模拟终端。

假如我们使用 Ctrl+Alt+f2 快捷键打开了第二个虚拟终端（tty2），又使用 Ctrl+Alt+f3 打开了第三个虚拟终端（tty3），再加上系统启动后默认进入的图形化界面（tty1）。那么我们可以在图形化界面中打开一个命令行终端（模拟终端），然后在模拟终端中输入如下命令即可从图形化界面（tty1）切换到第三个虚拟终端（tty3）。

# chvt 3

在图形化命令行中，执行完 chvt3 后，应该已经切换到 tty3 了，我们在当前的 tty3 中输入 chvt 1 就又能切换到图形界面（图形虚拟终端）中了。

**SSH 远程访问的终端**

重点这里的 Terminal 可能是任何地方的程序，比如 windows 上的 putty，所以不讨论客户端的 Terminal 程序是怎么和键盘、显示器交互的。由于 Terminal 要和 ssh 服务器打交道，所以肯定要实现 ssh 的客户端功能。这里将建立连接和收发数据分两条线路解释，为了描述简洁，这里以 sshd 代替 ssh 服务器程序：

建立连接：  
1.Terminal 请求和 sshd 建立连接。  
2. 如果验证通过，sshd 将创建一个新的 session。  
3. 调用 API(posix_openpt()) 请求 ptmx 创建一个 pts，创建成功后，sshd 将得到和 ptmx 关联的 fd，并将该 fd 和 session 关联起来。  
4. 同时 sshd 创建 shell 进程，将新创建的 pts 和 shell 绑定。

收发消息：  
1.Terminal 收到键盘的输入，Terminal 通过 ssh 协议将数据发往 sshd。  
2.sshd 收到客户端的数据后，根据它自己管理的 session，找到该客户端对应的关联到 ptmx 上的 fd。  
3. 往找到的 fd 上写入客户端发过来的数据。  
4.ptmx 收到数据后，根据 fd 找到对应的 pts(该对应关系由 ptmx 自动维护)，将数据包转发给对应的 pts。  
5.pts 收到数据包后，检查绑定到自己上面的当前前端进程组，将数据包发给该进程组的 leader。  
6. 由于 pts 上只有 shell，所以 shell 的 read 函数就收到了该数据包。  
7.shell 对收到的数据包进行处理，然后输出处理结果 (也可能没有输出)。  
8.shell 通过 write 函数将结果写入 pts。  
9.pts 将结果转发给 ptmx。  
10.ptmx 根据 pts 找到对应的 fd，往该 fd 写入结果。  
11.sshd 收到该 fd 的结果后，找到对应的 session，然后将结果发给对应的客户端。

SSH + Screen/Tmux      

常用 Linux 的同学应该对 screen 和 tmux 不陌生，通过它们启动的进程，就算网络断开了，也不会受到影响继续执行，下次连上去时还能看到进程的所有输出，还能继续接着干活。这种情况要稍微复杂一点，不过原理都是一样的，前半部分和普通 ssh 的方式是一样的，只是 pts/0 关联的前端进程不是 shell 了，而是变成了 tmux 客户端，所以 ssh 客户端发过来的数据包都会被 tmux 客户端收到，然后由 tmux 客户端转发给 tmux 服务器，而 tmux 服务器干的活和 ssh 的类似，也是维护一堆的 session，为每个 session 创建一个 pts，然后将 tmux 客户端发过来的数据转发给相应的 pts。由于 tmux 服务器只和 tmux 客户端打交道，和 sshd 没有关系，当终端和 sshd 的连接断开时，虽然 pts/0 会被关闭，和它相关的 shell 和 tmux 客户端也将被 kill 掉，但不会影响 tmux 服务器，当下次再用 tmux 客户端连上 tmux 服务器时，看到的还是上次的内容。

**FAQ: 终端和控制台**

Q：/dev/console 是什么？  
A：/dev/console 即控制台，是与操作系统交互的设备，系统将一些信息直接输出到控制台上。目前只有在单用户模式下，才允许用户登录控制台。

Q:/dev/tty 是什么？  
A：tty 设备包括虚拟控制台，串口以及伪终端设备。/dev/tty 代表当前 tty 设备，在当前的终端中输入 echo "hello" > /dev/tty ，都会直接显示在当前的终端中。

Q:/dev/ttyS * 是什么？  
A:/dev/ttyS * 是串行终端设备。

Q:/dev/pty * 是什么？  
A:/dev/pty * 即伪终端，所谓伪终端是逻辑上的终端设备，多用于模拟终端程序。例如，我们在 X Window 下打开的终端，以及我们在 Windows 使用 telnet 或 ssh 等方式登录 Linux 主机，此时均在使用 pty 设备 (准确的说在使用 pty 从设备)。

Q：/dev/tty0 与 / dev/tty1 …/dev/tty63 是什么？它们之间有什么区别？  
A：/dev/tty0 代表当前虚拟控制台，而 / dev/tty1 等代表第一个虚拟控制台，例如当使用 ALT+F2 进行切换时，系统的虚拟控制台为 / dev/tty2 ，当前的控制台则指向 / dev/tty2

Q：如何确定当前所在的终端 (或控制台)？  
A：使用 tty 命令可以确定当前的终端或者控制台。

Q：/dev/console 是到 / dev/tty0 的符号链接吗？  
A: 目前的大多数文本中都称 / dev/console 是到 / dev/tty0 的链接 (包括《Linux 内核源代码情景分析》)，但是这样说是不确切的。根据内核文档，在 2.1.71 之前，/dev/console 根据不同系统的设定可以链接到 / dev/tty0 或者其他 tty＊上，在 2.1.71 版本之后则完 全由内核控制。目前，只有在单用户模式下可以登录 / dev/console(可以在单用户模式下输入 tty 命令进行确认)。

Q：/dev/tty0 与 / dev/fb * 有什么区别？  
A: 在 Framebuffer 设备没有启用的系统中，可以使用 / dev/tty0 访问显卡。

Q：关于终端和控制台的区别可以参考哪些文本？  
A: 可以参考内核文档中的 Documents/devices.txt 中关于 "TERMINAL DEVICES" 的章节。另外，《Linux 内核源代码情景分析》的 8.7 节 以及《Operating Systems : Design and Implementation》中的 3.9 节 (第 3 版中为 3.8 节) 都对终端设备的概念和历史做了很好的介绍。另外在《Modern Operating system》中也有对终端设备的介绍，由于与《Operating Systems : Design and Implementation》的作者相同，所以文本内容也大致相同。需要注意的一点是《Operating Systems : Design and Implementation》中将终端设备分为 3 类，而《Modern Operating system》将终端硬件设备分为 2 类，差别在于前者将 X Terminal 作为一个类别。  
PS：只有 2410 的 2.6 才叫 ttySAC0，9200 等的还是叫 ttyS0。

本文总结自互联网，感谢众多网友。

**钱魏 Way 的此类文章：[命令行界面 (CLI)、终端 (Terminal)、Shell、TTY](https://www.biaodianfu.com/linux-desktop-environment.html)**

命令行界面 (CLI)

命令行界面，通俗来讲，就是你看过的那种满屏幕都是字符的界面。命令行界面 (英语：Command-line Interface，缩写：CLI) 是在图形用户界面得到普及之前使用最为广泛的用户界面，它通常不支持鼠标，用户通过键盘输入指令，计算机接收到指令后，予以执行。

在图形用户界面 (GUI) 已经完全普及的今天，普通用户在日常使用电脑的过程中几乎不用手动输入任何命令，大部分操作都是点点鼠标就能完成，而熟练使用命令行操作似乎已经成为高逼格的代名词。事实上，现在依然有着很多的软件开发者、系统管理员，或者是高级用户在使用命令行界面操作计算机。其中很大一个原因，就是效率：在熟记命令的前提下，使用命令行界面往往要比使用图形用户界面来得快。命令行操作的高效率等优点，也是现在许多图形化的计算机系统依然没有放弃提供命令行操作方式的原因。就连 Windows 都有自带 cmd.exe 和 PowerShell 等命令行程序。

**终端 (Terminal)：人与机器交互的接口**

在计算机领域，终端 (Terminal) 则是一种用来让用户输入数据至计算机，以及显示其计算结果的机器。也就是说，终端只是一种用于与计算机进行交互的输入输出设备，其本身并不提供运算处理功能。想要充分理解终端，我们得回溯历史，去看看终端的起源。

历史上的终端

在大型机 (Mainframe) 和小型机 (Minicomputer) 的时代里，计算机曾经非常昂贵且巨大，不像现在这样人手一台。这些笨重的计算机通常被安置在单独的房间内，而操作计算机的人们坐在另外的房间里，通过某些设备与计算机进行交互。这种设备就叫做 终端 (Terminal)，也叫终端机。

![](http://www.freeoa.net/images/unixsupt/intronix//201x/clitsh-terminal.jpg)

早期的终端一般是一种叫做 电传打字机 (Teletype) 的设备。为啥呢？因为 Unix 的创始人 Ken Thompson 和 Dennis Ritchie 想让 Unix 成为一个多用户系统。多用户系统就意味着要给每个用户配置一个终端，每个用户都要有一个显示器、一个键盘。但当时所有的计算机设备都非常昂贵 (包括显示器)，而且键盘和主机是集成在一起的，根本没有独立的键盘。后来他们机智地找到了一样东西，那就是 ASR-33 电传打字机。虽然电传打字机原本的用途是在电报线路上收发电报，但是它既有可以发送信号的键盘，又能把接收到的信号打印在纸带上，完全可以作为人机交互设备使用。而且最重要的是，价格低廉。于是，他们把很多台 ASR-33 连接到计算机上，让每个用户都可以在终端登录并操作主机。就这样，他们创造了计算机历史上第一个真正的多用户操作系统 Unix，而电传打字机就成为了第一个 Unix 终端。

控制台 (Console)

上面我们说过，在历史上，终端是连接到计算机上的一种带输入输出功能的外设。但是有一个终端与众不同，它与计算机主机是一体的，是计算机的一个组成部分。这个特殊的终端就叫做 控制台 (Console)。顾名思义，控制台是用于管理主机的，只能给系统管理员使用，有着比普通终端更大的权限。一台计算机上一般只有一个控制台，但是可以连接很多个终端。

![](http://www.freeoa.net/images/unixsupt/intronix//201x/clitsh-console.jpg)

上图，左边的是 Console，右边的是 Terminal。

放在现在我们可能难以理解为什么会有控制台和终端的区分，不过就像上一节所说的，当时都是很多个用户通过终端去访问一台计算机，而专门管理那些大块头机器的系统管理员另有其人。普通用户用的就是普通的终端，而系统管理员用的终端比较牛逼，所以就被叫做控制台。不过随着个人计算机的普及，控制台 (Console) 与终端 (Terminal) 的概念已经逐渐模糊。在现代，我们的键盘与显示器既可以认为是控制台，也可以认为是普通的终端。当你在管理系统时，它们是控制台；当你在做一般的工作时 (浏览网页、编辑文档等)，它们就是终端。我们自己既是一般用户，也是系统管理员。因此，现在 Console 与 Terminal 基本被看作是同义词。

字符终端与图形终端

终端也有不同的种类。字符终端 (Character Terminal) 也叫文本终端 (Text Terminal)，是只能接收和显示文本信息的终端。早期的终端全部是字符终端。字符终端也分为 哑终端 (Dumb Terminal) 和所谓的智能终端 (Intelligent Terminal)，因为后者可以理解转义序列、定位光标和显示位置，比较聪明，而哑终端不行。

![](http://www.freeoa.net/images/unixsupt/intronix//201x/clitsh-character-terminal.jpg)

DEC 公司在 1978 年制造的 [VT100](https://en.wikipedia.org/wiki/VT100)，由于其设计良好并且是第一批支持 ANSI 转义序列与光标控制的智能终端，获得了空前的成功。VT100 不仅是史上最流行的字符终端，更是成为了字符终端事实上的标准。随着技术的进步，图形终端 (Graphical Terminal) 也开始出现在公众的视野中。图形终端不但可以接收和显示文本信息，也可以显示图形与图像。著名的图形终端有 [Tektronix 4010](https://en.wikipedia.org/wiki/Tektronix_4010) 系列。不过现在专门的图形终端已经极为少见，他们基本上已经被全功能显示器所取代。

终端模拟器 (Terminal Emulator)

随着计算机的进化，我们已经见不到专门的终端硬件了，取而代之的则是键盘与显示器。但是没有了终端，我们要怎么与那些传统的、不兼容图形接口的命令行程序 (比如说 GNU 工具集里的大部分命令) 交互呢？这些程序并不能直接读取我们的键盘输入，也没办法把计算结果显示在我们的显示器上。

这时候我们就需要一个程序来模拟传统终端的行为，即终端模拟器 (Terminal Emulator)。严格来讲，Terminal Emulator 的译名应该是「终端仿真器」。对于那些命令行 (CLI) 程序，终端模拟器会「假装」成一个传统终端设备；而对于现代的图形接口，终端模拟器会「假装」成一个 GUI 程序。一个终端模拟器的标准工作流程是这样的：  
捕获你的键盘输入；  
将输入发送给命令行程序 (程序会认为这是从一个真正的终端设备输入的)；  
拿到命令行程序的输出结果 (STDOUT 以及 STDERR)；  
调用图形接口 (比如 X11)，将输出结果渲染至显示器。

终端模拟器有很多，这里就举几个经典的例子：  
GNU/Linux：gnome-terminal、Konsole  
macOS：app、iTerm2  
Windows：[Win32 控制台](https://zh.wikipedia.org/wiki/Win32%E6%8E%A7%E5%88%B6%E5%8F%B0)、ConEmu 等

在专门的终端硬件已经基本上仅存于计算机博物馆的现代，人们通常图省事，直接称呼终端模拟器为「终端」。

终端窗口 (Terminal Window) 与虚拟控制台 (Virtual Console)

大部分终端模拟器都是在图形用户界面 (GUI) 中运行的，但是也有例外。比如在 GNU/Linux 操作系统中，按下 Ctrl + Alt + F1,F2…F6 等组合键可以切换出好几个黑色的全屏终端界面，而按下 Ctrl + Alt + F7 才是切换回图形界面。虽然它们并不运行在图形界面中，但其实它们也是终端模拟器的一种。

![](http://www.freeoa.net/images/unixsupt/intronix//201x/clitsh-terminal-window.jpg)

这些全屏的终端界面与那些运行在 GUI 下的终端模拟器的唯一区别就是它们是由操作系统内核直接提供的。这些由内核直接提供的终端界面被叫做虚拟控制台 (Virtual Console)，而上面提到的那些运行在图形界面上的终端模拟器则被叫做终端窗口 (Terminal Window)。除此之外并没有什么差别。当然了，因为终端窗口是跑在图形界面上的，所有如果图形界面宕掉了那它们也就跟着完蛋了。这时候你至少还可以切换到 Virtual Console 去救火，因为它们由内核直接提供，只要系统本身不出问题一般都可用。

**TTY**

简单来说，tty 就是终端的统称。为什么呢？最早的 Unix 终端是 ASR-33 电传打字机。而电传打字机 (Teletype/Teletypewriter) 的英文缩写就是 tty，即 tty 这个名称的来源。由于 Unix 被设计为一个多用户操作系统，所以人们会在计算机上连接多个终端 (在当时，这些终端全都是电传打字机)。Unix 系统为了支持这些电传打字机，就设计了名为 tty 的子系统，将具体的硬件设备抽象为操作系统内部位于 /dev/tty* 的设备文件。

为什么要把电传打字机这个硬件设备抽象成「tty 设备」文件呢？有兴趣可以去了解一下 Unix 操作系统中 Everything is a file 的概念。

![](http://www.freeoa.net/images/unixsupt/intronix//201x/clitsh-tty.jpg)

随着计算机的发展，终端设备已经不再限制于电传打字机，但是 tty 这个名称还是就这么留了下来。久而久之，它们的概念就混淆在了一起。所以在现代，tty 设备就是终端设备，终端设备就是 tty 设备，无需区分。由于早期计算机上的[串行端口 (Serial Port)](https://en.wikipedia.org/wiki/Serial_port) 最大的用途就是连接终端设备，所以当时的 Unix 会把串口上的设备也同样抽象为 tty 设备 (位于 /dev/ttyS*)。因此，现在人们也经常将串口设备称呼为 tty 设备。在 tty 子系统中后来还衍生出了 pty、ptmx、pts 等概念，这里就不详细展开了。有兴趣可以参考一下这篇文章：[Linux TTY/PTS 概述](https://segmentfault.com/a/1190000009082089)。

**Shell：提供用户界面的程序**

大家都知道，操作系统有一个叫做内核 (Kernel) 的东西，它管理着整台计算机的硬件，是现代操作系统中最基本的部分。但是，内核处于系统的底层，是不能让普通用户随意操作的，不然一个不小心系统就崩溃了。但我们总还是要让用户操作系统的，怎么办呢？这就需要一个专门的程序，它接受用户输入的命令，然后帮我们与内核沟通，最后让内核完成我们的任务。这个提供用户界面的程序被叫做 Shell(壳层)。

其实 Shell 只是提供了一个用户操作系统的入口，我们一般是通过 Shell 去调用其他各种各样的应用程序，最后来达成我们的目的。比如说我们想要知道一个文件的内容，我们会在 Shell 中输入命令 cat foo.txt，然后 Shell 会帮我们运行 cat 这个程序，cat 再去调用内核提供的 open 等系统调用来获取文件的内容。虽然并不是 Shell 直接去与内核交互，但广义上可以认为是 Shell 提供了与内核交互的用户界面。至于为什么叫做 Shell，看下图就知道啦。

![](http://www.freeoa.net/images/unixsupt/intronix/201x/clitsh-shell.jpg)

Shell 通常可以分为两种：命令行 Shell 与 图形 Shell。顾名思义，前者提供一个命令行界面 (CLI)，后者提供一个图形用户界面 (GUI)。Windows 下的 explorer.exe 就是一个典型的图形 Shell(没错，它确实是，因为它接受来自你的指令，并且会帮你与内核交互完成你的指令)。

常见或历史上知名的命令行 Shell 有：

适用于 Unix 及类 Unix 系统：  
    sh (Bourne shell)，最经典的 Unix shell；  
    bash (Bourne-Again shell)，目前绝大多数 Linux 发行版的默认 shell；  
    zsh (Z shell)，功能比上面更加强大的 shell；  
    fish (Friendly interactive shell)，专注于易用性与友好用户体验的 shell；

Windows：  
    exe (命令提示符)  
    PowerShell。

另外还有其他各种各样的 Shell 程序。

**Shell 与终端的分工**

现在我们知道，终端干的活儿是从用户这里接收输入 (键盘、鼠标等输入设备)，扔给 Shell，然后把 Shell 返回的结果展示给用户 (比如通过显示器)。而 Shell 干的活儿是从终端那里拿到用户输入的命令，解析后交给操作系统内核去执行，并把执行结果返回给终端。不过 Shell 与终端的分工有一些容易混淆的地方，这里以例子进行说明：

终端将用户的键盘输入转换为控制序列 (除了字符以外的按键，比如左方向键 → ^[[D)，Shell 则解析并执行收到的控制序列 (比如 ^[[D → 将光标向左移动)；

不过也有例外，比如终端在接收到 Ctrl + C 组合键时，不会把这个按键转发给当前的程序，而是会发送一个 SIGINT 信号 (默认情况下，这会导致进程终止)。其他类似的特殊组合键有 Ctrl-Z 与 Ctrl-\ 等，可以通过 stty -a 命令查看当前终端的设置。

Shell 发出类似「把前景色改为红色 (控制序列为 \033[31m)」「显示 foo」等指令

终端接收这些指令，并且照着 Shell 说的做，于是你就看到了终端上输出了一行红色的 foo

除非被重定向，否则 Shell 永远不会知道它所执行命令的输出结果。我们可以在终端窗口中上下翻页查看过去的输出内容，这完全是终端提供的 feature，与 Shell 没有半毛钱关系；

命令提示符 (Prompt) 是一个完全的 Shell 概念，与终端无关；

行编辑、输入历史与自动补全等功能是由 Shell 提供的 (比如 fish 这个 Shell 就有着很好用的历史命令与命令自动补全功能)。不过终端也能自己实现这些功能，比如说 XShell 这个终端模拟器就可以在本地写完一行命令，然后整条发送给远程服务器中的 Shell(在连接状况不佳时很有用，不然打个字都要卡半天)；

终端中的复制粘贴功能 (Shift + Insert 或者鼠标右键等) 基本上都是由终端提供的。举个例子，Windows 默认的终端对于复制粘贴的支持很屎，而换一个终端 (例如 ConEmu) 后就可以很好地支持复制粘贴。不过 Shell 以及其他命令行程序也可以提供自己的复制粘贴机制(例如 vim)。