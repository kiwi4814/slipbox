+++
title = "设计原则06：KISS原则和YAGNI原则"
date = 2022-03-21 13:23:16
slug = "/kiss&yagni"
draft = false
tags = ["阅读笔记","设计模式"]
categories = ["阅读笔记"]
series = ["设计模式之美"]
+++

先看下面这些小问题。

- 怎么理解 KISS 原则中“简单”两个字？
- 什么样的代码才算“简单”？
- 怎样的代码才算“复杂”？
- 如何才能写出“简单”的代码？
- YAGNI 原则跟 KISS 原则说的是一回事吗？

带着这些问题，我们进入今天的学习。

## 如何理解KISS原则？
KISS是个缩写这个我们都知道，那么它的原本英文是什么呢？网上有好多个版本，比如“`Keep It Simple and Stupid.`”，“`Keep It Short and Simple.`”，“`Keep It Simple and Straigthforword.`”等等。不过，他们表达的意思都差不多——**尽量保持简单**。



代码的可读性和可维护性是衡量代码质量非常重要的两个标准，而KISS原则就是保持代码可读和可维护的重要手段。代码足够简单就意味着很容易读懂，即使有bug也很容易维护。



那么，什么样的代码才能叫简单呢？



先来看一个例子，现在需要实现一个功能：检查输入的字符串ipAddress是否是合法的IP地址？

下面给出了三段代码实现：

```java
public class ValidIpAddress {

    // 第一种实现方式: 使用正则表达式
    public boolean isValidIpAddressV1(String ipAddress) {
        if (CharSequenceUtil.isBlank(ipAddress)) return false;
        String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
                + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
        return ipAddress.matches(regex);
    }

    // 第二种实现方式: 使用现成的工具类
    public boolean isValidIpAddressV2(String ipAddress) {
        if (CharSequenceUtil.isBlank(ipAddress)) return false;
        String[] ipUnits = CharSequenceUtil.splitToArray(ipAddress, '.');
        if (ipUnits.length != 4) {
            return false;
        }
        for (int i = 0; i < 4; ++i) {
            int ipUnitIntValue;
            try {
                ipUnitIntValue = Integer.parseInt(ipUnits[i]);
            } catch (NumberFormatException e) {
                return false;
            }
            if (ipUnitIntValue < 0 || ipUnitIntValue > 255) {
                return false;
            }
            if (i == 0 && ipUnitIntValue == 0) {
                return false;
            }
        }
        return true;
    }

    // 第三种实现方式: 不使用任何工具类
    public boolean isValidIpAddressV3(String ipAddress) {
        char[] ipChars = ipAddress.toCharArray();
        int length = ipChars.length;
        int ipUnitIntValue = -1;
        boolean isFirstUnit = true;
        int unitsCount = 0;
        for (char c : ipChars) {
            if (c == '.') {
                if (ipUnitIntValue < 0 || ipUnitIntValue > 255) return false;
                if (isFirstUnit && ipUnitIntValue == 0) return false;
                if (isFirstUnit) isFirstUnit = false;
                ipUnitIntValue = -1;
                unitsCount++;
                continue;
            }
            if (c < '0' || c > '9') {
                return false;
            }
            if (ipUnitIntValue == -1) ipUnitIntValue = 0;
            ipUnitIntValue = ipUnitIntValue * 10 + (c - '0');
        }
        if (ipUnitIntValue < 0 || ipUnitIntValue > 255) return false;
        if (unitsCount != 3) return false;
        return true;
    }
}
```

看完了上面这三种，你觉得哪一种最符合KISS原则呢？

答案是第二种，第一种方法虽然代码行数最少，实际上很复杂，因为使用了正则表达式；而第三种方法虽然没有用任何工具函数，性能也是最高的，但是由于实现方式过于复杂很容易出Bug。从性能方面来说，其实是一种过度优化。



那么，如何才能写出简单的代码呢？有下面几个原则稍微总结一下：

- 不要使用其他人可能看不懂的技术来实现代码
- 不要重复造轮子，使用已有的工具类库减少bug
- 不要过度优化，不要使用一些奇技淫巧（位运算、底层函数）

我们在做开发的时候，一定不要过度设计，不要觉得简单的东西就没有技术含量。实际上，越是能用简单的方法解决复杂的问题，越能体现一个人的能力。



## YAGNI原则

YAGNI原则的英文全称是`You Ain't Gonna Need It.`，直译过来就是：**你不会需要它。**它的意思是在软件开发中，不要去设计当前用不到的功能，不要去编写当前用不到的代码。





比如，我们的系统暂时只用 Redis 存储配置信息，以后可能会用到 ZooKeeper。根据 YAGNI 原则，在未用到 ZooKeeper 之前，我们没必要提前编写这部分代码。当然，这并不是说我们就不需要考虑代码的扩展性。我们还是要预留好扩展点，等到需要的时候，再去实现 ZooKeeper 存储配置信息这部分代码。



再比如，我们不要在项目中提前引入不需要依赖的开发包。对于 Java 程序员来说，我们经常使用 Maven 或者 Gradle 来管理依赖的类库（library）。我发现，有些同事为了避免开发中 library 包缺失而频繁地修改 Maven 或者 Gradle 配置文件，提前往项目里引入大量常用的 library 包。实际上，这样的做法也是违背 YAGNI 原则的。



从刚刚的分析我们可以看出，YAGNI 原则跟 KISS 原则并非一回事儿。KISS 原则讲的是“如何做”的问题（尽量保持简单），而 YAGNI 原则说的是“要不要做”的问题（当前不需要的就不要做）。



## 习题

> 你怎么看待在开发中重复造轮子这件事情？什么时候要重复造轮子？什么时候应该使用现成的工具类库、开源框架？

我觉得在开发中重复造轮子不一定就一定是不好的，开源类库中的很多方法其实并用不到，为了通用性可能会舍弃掉一部分性能，而相反有些公司内部才用得到的方法在开源类库中是没有的。

另外，有时候我们只需要其中很少一部分代码的时候，重复造轮子都没有问题，但是一定要做好测试，在造轮子的时候可以参考成熟的开源类库，从中学习也是不错的选择。

什么时候该使用开源框架呢？我觉得至少团队中有人很熟悉这个开源类库或者框架，能够把其中的技术实现分享给团队，这样才不会在出现相关未知问题的时候束手无策。





