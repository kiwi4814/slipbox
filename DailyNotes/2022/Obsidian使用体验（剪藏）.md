---
Date: 2022-09-09 13:29:18
---
- MetaData
	- Date : 2022-09-09 13:29:18
	- DailyNotes : [[2022-09-09_周五]]
	- Link : 
	- Tag : #ZK卡片 #网页剪藏

Obsidian，可能是最适合做个人知识库的软件

——

配置好的 Obsidian，与刚开始接触的 Obsidian，看起来完全像两个不同的东西。

刚开始用的时候，我不禁疑惑：就这？网上很多人称赞，但我觉得这不就一 Markdown 编辑器吗，连 Typora 都不如。

但是配置好之后，我觉得 Obsidian 可以替代掉印象笔记、为知笔记、Zim Wiki、Notion、思源笔记、Tiddlywiki、Logseq、org-mode了。

——

所谓“配置好了”是指：

01. 主题：极简风格的 Minimal，选择浅色模式。

02. Snippets：用了 21 个 CSS 代码片段来为 Minimal 主题作补充。

- add icons to tree（目录树图标）.css
- backlinks（给双链加绿色图标）.css
- blockquotes（加粗竖线显示引用）.css
- bullet points（无序列表的不同层级用不同符号）.css
- calender emoji（突出显示日历中的今天）.css
- checkboxes advanced（突出展示任务列表的不同任务状态）.css
- homepage setting（电脑端主页设置）.css
- inline code highlight（行内代码块高亮）.css
- links（去掉预览中双链的下划线）.css
- metadata hide（隐藏metadata）.css
- minimal tweaks（高亮文件夹中当前文档并淡化其他文档）.css
- realistic highlight（模拟荧光笔效果的高亮）.css
- search（页面内搜索结果加灰色背景）.css
- strong outline（区分文档树中文件夹和文档）.css
- supercharged links gen（不同链接显示不同颜色）.css
- table bold（表格首行加粗）.css
- table border（预览中表格加边框）.css
- table shadow（表格隔行阴影）.css
- tags（编辑及预览中标签加背景色）.css
- view centered header（文档标题居中）.css
- YAML（文档参数配置）.css

03. 字体：界面字体为思源屏显臻宋，正文字体均为霞鹜文楷，代码字体为 Source Code Pro。

04. 编辑框显示行号，文档末尾显示反链。

05. 设置官方自带的核心插件。

06. 装一些第三方插件，比如 outliner、advanced table、collapse all、memos、recent files、checklist，不用太多，30 个左右。

07. 第三方插件中，尤其要学习的是 templater、quickadd、dataview 的用法，这三个插件很强大。

08. 设置面板布局，不同的布局保存为不同的工作区。

09. 设定好笔记分类结构和标签分类结构。

10. 设置 homepage、新建笔记、日记、时间戳卡片、memos、模板、附件分别放置的文件夹。

11. 设置新建笔记、日记、时间戳卡片，以及其他笔记的模板。

12. 设置一个文件夹，专门放各种索引/MOCs 其中 homepage 作为总的索引页，一个 MOC 就是一个主题清单，专门管理一个细分主题所属笔记的链接。

13. 面板布局分为左中右，左为星标/目录/标签/搜索/最新，都是为了方便找到文档，其中星标放在目录前，因为有一些笔记需要长期编辑。

14. 面板布局中间是编辑框，最右侧一分为二，上部为大纲/反链/出链/图谱，下为 memos（锁定位置）/task/日历。

15. 设置快捷键，把最顺手的一些快捷键组合，分配给你在 Obsidian 中最高频的一些操作。

16. 用git备份。

17. 购买官方提供的同步服务和发布服务。（当然，不想购买这两个付费服务，也有免费的解决方案。）

18. 手机上安装 Obsidian App。

19. 电脑浏览器安装剪藏插件，可以剪藏网页为 Markdown 格式保存到 Obsidian。

20. 用 Obsidian Pulish 发布一个网站，可以当作博客用。

——

拿上面提到的几款软件和 Obsidian 两两 PK，会发现 Obsidian 不是完美的，但是综合来看最能打：

- Markdown 语法
- 双链
- 本地存储
- 官方有同步服务
- 插件多主题多方便配置
- 社区强大，插件开发者众多
- 树状文件目录
- 长文档兼容大纲笔记
- 一键导出为 PDF
- 通过快捷键设置可以几乎全键盘操作
- 用官方发布服务很容易建个人网站
...

其他软件不是这个做不到，就是那个做不到。

- 比如 Tiddlywiki 用的是 Wikitext 语法，不像 Markdown 语法应用的那么广，哪一天不用 Obsidian 了，Markdown 语法写的文档不用转换都可以继续在别处打开，而 Tiddlywiki也有 Markdown 插件，但是用这个插件后，会限制它原本的属性设置等功能。

- 比如 Logseq 是基于 block 的大纲笔记，虽然是基于 Markdown 语法，但是里面有 Logseq 一些自定义语法，无法在别处软件中被解析，而大纲笔记复制粘贴到飞书文档中，还需要调整一下格式，挺麻烦的，Obsidian 就不用。

- 比如 Notion，也不错，但是不是本地存储，这一点我不放心。

- 比如 Org-mode，依托于 Emacs，它的功能比 Obsidian还要全面还要强大，但是学习成本太高了，不像 Obsidian 容易上手。

当然，其他软件也都各有特色，各有绝活。有的特色令我难以割舍，比如 Tiddlywiki、Logseq，但是毕竟不能用那么多，同时用很多会导致笔记散落各处，如果只选一款的话，还是 Obsidian 适合。

——

一种 IPO（输入-处理-输出）方案：

电脑记闪念：Obsidian Memos 插件
手机记闪念：滴答清单/锤子便签/Flomo
闪念整理为卡片+写长文：Obsidian
手机上查看 Obsidian：坚果云（免费方案）
手机上查看 Obsidian：Obsidian 同步服务（付费方案）
剪藏文章：Cubox/印象笔记/Joplin/简悦插件
对外分享文章或团队协作：飞书（飞书文档/飞书知识库/飞书妙记）
个人博客：Obsidian 发布服务/Obsidian+Jeykell

Obsidian 的文章，复制到飞书文档不用调格式，【而 Logseq 的文章或思源笔记的文章，复制粘贴到飞书文档中，格式还需要再调整】，所以如果工作中需要用飞书，Obsidian 更适合与飞书联用。

——

关于笔记软件和知识管理，还可以参考这一篇：

→ https://m.okjike.com/originalPosts/62b9c3cb2c5643956663f412?s=eyJ1IjoiNWVlMDYwZjBiOGNmZWEwMDE3N2JjNGE5In0%3D