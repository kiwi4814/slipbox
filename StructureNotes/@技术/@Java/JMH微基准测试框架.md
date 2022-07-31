+++
title = "Java性能测试利器——JMH微基准测试框架"
date = 2022-03-29 18:40:45
slug = "/java-jmh"
draft = false
tags = ["技术","JMH"]
toc = false

+++



## 什么是JMH以及能用来做什么？

JMH的英文全称是Java Microbenchmark Harness， 中文名是Java微基准测试框架，是JVM团队开发的一套基于方法层面的基准测试套件。



举个例子，当我们一般想要知道一个方法或者某段代码执行的时间，会在代码的的头部和尾部分别计时，然后用两者之差作为方法的执行时间，或者使用Spring StopWatch等工具包侵入代码进行计算。下面是一个典型的例子：

```java
public class JMHTest {
    public void execute() throws InterruptedException {
        Thread.sleep(5000);
    }

    public static void main(String[] args) throws InterruptedException {
        JMHTest jmhTest = new JMHTest();
        long start = System.currentTimeMillis();
        // 执行方法
        jmhTest.execute();
        long end = System.currentTimeMillis();
        System.out.println("方法执行时间 :" + (end - start));
    }
}
```

但是这样会带来一些问题，首先这样要进行代码的侵入，当方法优化完成后要额外删除这些代码，此外这种测试方法是不精确的，要经过大量次数的测试来获取一个较为稳定的平均值（即使这样也不能完全相信这个结果）。



这时候轮到JMH就出场了。



我从网上的文章中摘抄了一段JMH典型的应用场景：

1. 当你已经找出了热点函数，而需要对热点函数进行进一步的优化时，就可以使用 JMH 对优化的效果进行定量的分析。
2. 想定量地知道某个函数需要执行多长时间，以及执行时间和输入 n 的相关性。
3. 一个函数有两种不同实现（例如JSON序列化/反序列化有Jackson和Gson实现），不知道哪种实现性能更好。



这么说似乎仍然有点抽象，我们先来在项目中实战一下吧。

## 太抽象了，写个例子吧。





## 怎么样可以更好的使用JMH？



### 参考

实战部分：[Microbenchmarking with Java | Baeldung](https://www.baeldung.com/java-microbenchmark-harness)
