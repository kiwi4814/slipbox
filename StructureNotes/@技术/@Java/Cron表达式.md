+++
title = "一切反动派都是纸老虎！~ 学习Cron表达式"
date = 2022-03-26 09:57:03
slug = "/cron-expression"
draft = false
tags = ["cron表达式"]
categories = ["技术"]

toc = false

+++

经常能看到形如`0 */15 * ? * *`的的一些表达式用在项目中，表示定时任务的执行频率，但一直不明白其原理。由于自己懒惰的天性，每次用到的时候照葫芦画瓢写一个或者网上生成一个，就这样凑凑活活一直用到现在。最近关于定时任务的需求激增，终于忍无可忍，决定学一学这“该死”的cron表达式，然后竟然意外地发现很简单，果然一切反动派都是纸老虎。



并且，在翻阅资料的过程中，发现大部分网站尤其是一些中文网站的关于cron的文章质量简直惨不忍睹，而且有大量的翻译错误，所以多花了一些时间查阅了资料（遗憾是没有经过我自己的实战，这样可能要花更多的时间），也尽量记录了我的一些疑问，在后续的实战过程中有新的收获都会随时更新。

## 一些问题和自己的理解

- ***cron表达式经常能看到不同位数的，比如5位，6位甚至7位的，具体怎么区分这些呢？***

  <font color="orange">首先我们要明白语境所说的cron具体是在什么场景下的，类Unix系统下的cron是一种默认的实现，此外还有其他一些实现，比如Quartz Java scheduler。以默认实现和Quartz为例作对比，有以下几点区别：</font>

  - <font color="orange">默认的cron第一位为分钟，第六位是年，年可以省略，也就是我们看到的五位和六位的区别，而Quartz从秒开始，也就是六位或者七位</font>
  - <font color="orange">默认的cron只支持`*` `,` `-`这几个特殊符号（某些情况下也支持 `/`），而Quartz还额外支持`/` `?` `L` `W` `C` `#`等特殊符号，具有强大的功能</font>
  - <font color="orange">默认的cron支持`* * * * *`这种写法，表示每分钟执行一次，而Quartz下虽然day-of-month和day-of-week这两个字段能用`?`替代`*`，但是这两个字段不能同时为`*`或者`?`</font>
  - <font color="orange">Quartz day-of-week这个字段的数字取值为1~7，其中1代表周日；区别于默认实现的0~6（0代表周日）</font>

- ***`?`的用法（既然有了`*`，为什么还要有`?` `*`和`?`能否同时用于day-of-week和day-of-month？）***

  <font color="orange">这个问题困扰了我蛮久的，后来发现这可能是Quartz的实现方式导致的，源码中的注释描述为Support for specifying both a day-of-week and a day-of-month value is
   not complete (you'll need to use the '?' character in on of these fields).</font>

- ***在L的用法中，关于"`3-L`"用在day-of-week中的真正含义？***

  <font color="orange">这里的原文为the third-to-last day of the calendar month，应该翻译为倒数第三天，此处有教程翻译成最后三天。此处请教了一些大佬，通用的理解是third-to-last中间的连字符代表了形容词，正确的理解是倒数第三天，猜测是翻译软件将连字符去掉了，所以变成了从第三天到最后一天。</font>

  

  

## Cron简介



根据维基百科的介绍，**cron**该词来源于希腊语chronos（χρόνος），原意是时间。

在类Unix系统中，cron作为一个基于时间的任务管理工具，可以让用户在固定时间、日期、间隔下，运行定期任务、命令或者脚本。在Unix系统中我们一般使用**`crontab`**命令来管理用户的定时任务，而定义**`crontab`**命令中任务的执行周期，就是cron表达式。**`crontab`**的原理及用法值得单开一文来讲解，这里不再展开，我们知道cron是什么意思即可。



## Cron表达式（CRON expression）

先来说说cron表达式的定义，cron表达式是一个由`5~6段字段`组成的字符串，字段与字段之间用空格隔开，表达的含义是一组设定好的时间。其中这`5~6段字段`的含义如下：

| 字段含义            | 是否必须 | 允许的值        | 允许的特殊字符        | 备注                                   |
| ------------------- | -------- | --------------- | --------------------- | -------------------------------------- |
| 分钟（Minutes）     | 是       | `0~59`          | `*` `,` `-` `/`       |                                        |
| 小时（Hours）       | 是       | `0~23`          | `*` `,` `-` `/`         |                                        |
| 天（Day of month）  | 是       | `1~31`          | `*` `,` `-` `/` `?` `L` `W` `C` | `?` `L` `W` `C`仅仅在特定的实现可用    |
| 月（Month）         | 是       | `1~12` 或 `JAN~DEC` | `*` `,` `-` `/`        |                                        |
| 周几（Day of week） | 是       | `0~6` 或 `SUN~SAT` | `*` `,` `-` `/` `?` `L` `#` `C` | `?` `L` `#` `C`仅仅在特定的实现可用   |
| 年（Year）          | 否       | `1970~2099`     |`*` `,` `-` `/` `?` `L` `#` | 在cron表达式的标准字段中不支持这个字段 |

**【备注】**

- 月份和周几的表达式中如果使用字母缩写表示的话，是不区分大小写的
- 在一些表达式中甚至还包含`秒`这个字段，在表达式的开头，这时候可能有7个字段
- *最新的Quazrt代码中，月份改为0~11，年份改为了1970~2199*



从上面表格中我们可以得出看到：

- cron表达式不止一种实现，并且在其他实现中支持一些更强大的功能。
- cron表达式除了支持数字还有一些特殊字符，这些字符的含义暂时还不清楚。





下面先来看看这些标准实现下的字符代表什么意思：

###### 星号（`*`）

代表任何可能的值。

###### **逗号（`,`）**

逗号表示一个逗号分开的列表，比如在第五个字段中使用"`MON,WED,FRI`"用来表示周一、周三和周五。

###### **中划线（`-`）**

中划线表示一个范围，比如2000–2020表示从2000年到2020年之间的每一年。

###### **百分号（`%`）**

除非用反斜杠(`\`)转义，否则命令中的%符号将被变为换行符，并且在第一个%之后的所有数据都将作为标准输入发送给命令。



------

上面就是标准cron表达式中定义的所有特殊字符。刚才我们说过，cron表达式不止有一种实现，在一些特殊的实现中可以支持更多的特殊字符，比如Java定时调度框架Quartz Java scheduler、Jenkins等等，它们支持的字符含义及使用方法如下：

------



###### 斜杠（`/`）

斜杠`/`可以指定步长值，比如"`*/5`"用在分钟这个字段可以用来表示每隔5分钟触发一次。

- 由于cron是无状态的，它不会记住上次触发的时间，所以并不能精确的表示频率，只能在一些特殊的值下表示（比如对于分钟这个字段可以用`*/2, */3, */4, */5, */6, */10, */12, */15, */20 和 */30`，对小时则是`*/2, */3, */4, */6, */8 和 */12`，其他以此类推）。
- 当然，并不是说步长值只能用上面列出来的项，可以随意指定，但是触发规律就可能不会按照你的期望，比如在分钟字段使用`1/45`表示每小时的01和46分触发，而`*/70`则会在每小时00分触发。

###### 字母L（`L`）

`L`代表last，表示指定的字段在周期内的最后一天，不能在指定范围或者列表的时候使用（也就是说不能用`-`和`,`）可以用在"天（day-of-month）"和"周几（day-of-week）"这两个字段的位置上，用法分别如下：

- 当L用在"天（day-of-month）"这个字段上时，表示月份的最后一天；此外，L可以和偏移值一起使用，比如"`3-L`"表示当月的倒数第三天（the third-to-last day of the calendar month）。
- 当用在"周几（day-of-week）"这个字段时，表示周的最后一天；此外，L前面可以加上0~6的数字，比如使用"`5L`"表示当月的的最后一个周五。
- L可以和W一起使用，用"`LW`"表示当月的最后一个工作日。

###### 字母W（`W`）

`W`表示weekday，`W`字段仅仅允许在"天（day-of-month）"这个字段中使用，不能单独使用，并且不能在指定范围或者列表的时候使用（也就是说不能用`-`和`,`），其含义时用来指定离指定日期最近的一个工作日（周一到周五）。

- 比如"`15W`"表示每个月离15号最近的一个工作日，如果15号是周六，那么会在14号触发，如果是周日会在16号触发。
- 另外，这个工作日不会超过给定的范围，比如"`1W`"中，1号是周六的话，触发的时间应该是3号而非上个月的最后一天。
- L可以和W一起使用，用"`LW`"表示当月的最后一个工作日。

###### 井字符（`#`）

`#`一般用于"周几（day-of-week）"这个字段，而且必须跟在数字1~5后面，用来指定给定月份的第几个"周几"，比如"5#3"的含义是给定月份的第三个周五。

> 表格中可以看到还能用于年这个字段，这时候代表什么含义呢？

###### 问号（`?`）

在一些实现中(比如Quartz)，当`?`可以使用在"天（day-of-month）"和"周几（day-of-week）"，它的含义是“无确定值”，当我们需要在其中一个字段中指定某个值，而在另外一个字段中不指定值的时候使用。但无法在这两个字段中同时使用`?`。

而在另外一些实现中，`?`代表随着Cron守护进程的启动时间，比如"`? ? * * * *`"将会被动态替换为cron进程启动的时间，如果cron进程在早上8:25启动，那么表达式将变成"`25 8 * * * *`"，并且在之后的每天早上8:25触发，知道cron进程再次重新启动。

###### 字母H（`H`）

`H`是[Jenkins系统中特有的字符](https://github.com/jenkinsci/jenkins/blob/master/core/src/main/resources/hudson/triggers/TimerTrigger/help-spec.jelly)，感兴趣的可跳转至原文或者[附录](#Jekins中关于字符H用法的一些说明)查看。



## 附录

### 一些生成器

**默认的cron表达式生成器**：[Crontab.guru](https://crontab.guru/)

**Quartz实现的cron表达式生成器**：[Cron Expression Generator](https://www.programmertools.online/generator/cron_expression.html)

### Jekins中关于字符H用法的一些说明

> To allow periodically scheduled tasks to produce even load on the system,the symbol `H` (for "hash") should be used wherever possible.
>
> 
>
> For example, using `0 0 * * *` for a dozen daily jobs will cause a large spike at midnight.
>
> 
>
> In contrast, using `H H * * *` would still execute each job once a day,but not all at the same time, better using limited resources.
>
> 
>
> The `H` symbol can be used with a range. For example, `H H(0-7) * * *` means some time between 12:00 AM (midnight) to 7:59 AM.
> You can also use step intervals with `H`, with or without ranges. The `H` symbol can be thought of as a random value over a range, but it actually is a hash of the job name, not a random function, so that the value remains stable for any given project.
>
> 
>
> Beware that for the day of month field, short cycles such as `*/3` or `H/3` will not work consistently near the end of most months, due to variable month lengths.
>
> 
>
> For example, `*/3` will run on the 1st, 4th, …31st days of a long month, then again the next day of the next month. Hashes are always chosen in the 1-28 range, so `H/3` will produce a gap between runs of between 3 and 6 days at the end of a month. (Longer cycles will also have inconsistent lengths but the effect may be relatively less noticeable.)
>
> 
>
> Empty lines and lines that start with `#` will be ignored as comments.
>
> 
>
> In addition, `@yearly`, `@annually`, `@monthly`, `@weekly`, `@daily`, `@midnight`, and `@hourly` are supported as convenient aliases.
>
> 
>
> These use the hash system for automatic balancing.
>
> 
>
> For example, `@hourly` is the same as `H * * * *` and could mean at any time during the hour. `@midnight` actually means some time between 12:00 AM and 2:59 AM.
>
> 
>
> **Examples:**
>
> ```yaml
> # Every fifteen minutes (perhaps at :07, :22, :37, :52):
> H/15 * * * *
> # Every ten minutes in the first half of every hour (three times, perhaps at :04, :14, :24):
> H(0-29)/10 * * * *
> # Once every two hours at 45 minutes past the hour starting at 9:45 AM and finishing at 3:45 PM every weekday:
> 45 9-16/2 * * 1-5
> # Once in every two hour slot between 8 AM and 4 PM every weekday (perhaps at 9:38 AM, 11:38 AM, 1:38 PM, 3:38 PM):
> H H(8-15)/2 * * 1-5
> # Once a day on the 1st and 15th of every month except December:
> H H 1,15 1-11 *
> ```

### 参考链接

[cron的维基百科](https://en.wikipedia.org/wiki/Cron#CRON_expression)

[Quartz官方网站](http://www.quartz-scheduler.org/)

[Crontab file](https://www.gnu.org/software/mcron/manual/html_node/Crontab-file.html)

[A Guide To Cron Expressions | Baeldung](https://www.baeldung.com/cron-expressions)

[quartz/CronExpression.java at quartz-2.0.x · quartz-scheduler/quartz (github.com)](https://github.com/quartz-scheduler/quartz/blob/quartz-2.0.x/quartz/src/main/java/org/quartz/CronExpression.java)

[Understanding Cron Syntax in the Job Scheduler - Cloud Manager Administrator Reference (netiq.com)](https://www.netiq.com/documentation/cloud-manager-2-5/ncm-reference/data/bexyssf.html)
