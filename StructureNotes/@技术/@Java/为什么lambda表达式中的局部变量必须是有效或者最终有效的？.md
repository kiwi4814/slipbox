+++
title = "为什么lambda表达式中的局部变量必须是有效或者最终有效的？"
date = 2022-07-25 21:40:15
slug = "/Why-Do-We-Need-Effectively-Final"
draft = false
tags = ["技术","Java 8"]
categories = ["Java"]
toc = false

+++

>  本文主要思路源自[Why Do We Need Effectively Final? ](https://www.baeldung.com/java-lambda-effectively-final-local-variables)一文并结合自己的思考所成。

## 有效最终（effectively final）

从 Java8 开始，本地类可以访问**最终或有效最终**的封闭块的局部变量和参数。那么，什么是有效最终（effectively final）变量呢？



通常来讲，满足以下三个条件的变量我们即可以把这个变量称为有效最终（ effectively final （[§4.12.4](https://docs.oracle.com/javase/specs/jls/se8/html/jls-4.html#jls-4.12.4)））：

- 该参数没有声明 final 关键字（其实是废话，加了final的肯定就被称为 final 而非 effectively final 了）
- 该参数永远不会出现在赋值表达式的左侧（除了初始化变量的时候，比如`String s; s = "hello world!";`）
- 永远作为递增或递减的前缀和后缀运算的运算数出现（比如 `i++`中的i）



简单来说，在初始化之后就不会再进行赋值的参数或者变量，我们就可以称之为“有效最终”了。（原文为 A variable or parameter whose value is never changed after it is initialized is effectively final. ）



## lambda表达式的限制

在[JLS](https://docs.oracle.com/javase/specs/jls/se8/html/jls-15.html#jls-15.27.2)中，明确指出，在lambda表达式内部使用的任何**未在lambda表达式中声明的**局部变量（**local variable**）、形式参数（**formal parameter**）以及异常参数（**exception parameter**）都必须是final或effectively final的，否则将会出现编译错误。另外，局部变量在lambda中使用时必须时初始化过的。



在下面的代码示例中，列出了几种常见的错误情况：

```java
public class TestLambda {
    private String iv = "初始化成员变量";
    public void test() {
        List<String> list = Collections.singletonList("1");
        List<String> newList = new ArrayList<>();
        // 如果newList出现赋值，lambda表达式中就会报错
        newList = Collections.singletonList("2");
        String s1, s2;
        int i = 1;
        // 这样的初始化并不影响s1是有效最终的局部变量
        s1 = "初始化的S1";
        // 成员变量不受这个限制，可以随意赋值
        iv = "修改成员变量";
        list.forEach(t -> {
            // newList必须是最终或者有效最终
            newList.add(t);
            // s1是有效最终，所以是可以使用的
            newList.add(s1);
            // 报错，lambda表示式中无法对s2进行初始化了
            s2 = "lambda中初始化S2";
            newList.add(s2);
            // 报错，i++出现了赋值行为，破坏了i的有效最终
            newList.add(i++);
            iv = iv + "1";
            // 成员变量iv是没问题的
            iv = "lambda";
            newList.add(iv);
            System.out.println(t);
        });
        // 后续有任何赋值操作，lambda表达式中也会报错
        newList = Collections.singletonList("2");
    }
}
```





对于这种限制的原因，JLS中给出的原因是 ***The restriction to effectively final variables prohibits access to dynamically-changing local variables, whose capture would likely introduce concurrency problems.*** 翻译过来就是，Lambda表达式中禁止捕获动态变化的局部变量是因为可能会导致并发问题。



下面我们具体来看下到底会有哪些问题。

### 1. 捕获局部变量

我们先来看这么一段代码：

```java
    Supplier<Integer> incrementer(int start) {
        return () -> start++;
    }
```

当然这里是无法编译的，报错如下图所示：

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//imgimage-20220725221949827.png" alt="image-20220725221949827" style="zoom: 50%;" />



上面的代码中，lambda表达式的部分（`start++`）在`Supplier.get()`方法被调用之前都不会执行的，所以在lambda表达式捕获到局部变量start的值的时候会复制start的一份副本到lambda内部，而要求局部变量必须为最终或有效最终也是为了防止给人留下这样的印象：对lambda内部的start变量的修改可以影响到局部变量start。



再来看这段代码：

```java
public void localVariableMultithreading() {
    boolean run = true;
    executor.execute(() -> {
        while (run) {
            // do operation
        }
    });
    run = false;
}
```



上面的代码有很明显的“可见性”问题，我们知道每个线程都有自己的堆栈，那么我们如何确保while循环看到另一个堆栈中run变量的变化呢？答案可能是使用*synchronized*或*volatile*关键字。然而，由于lambda表达式中有效最终的限制，我们可以不必担心这样的复杂性。



### 2. 捕获成员变量或静态变量

在本章一开始的代码示例中，我们可以看到成员变量是不受final或者有效final的限制的，这是因为成员变量是存储在堆（heap）内存的，编译器可以保证同一个线程内永远能够获取到成员变量的最新的值。

对于多线程的情况，我们可以使用`volatile`关键字来保证可见性。 



上小节的代码我们用成员变量可以改写为：

```java
private int start = 0;

Supplier<Integer> incrementer() {
    return () -> start++;
}
```



```java
private volatile boolean run = true;

public void instanceVariableMultithreading() {
    executor.execute(() -> {
        while (run) {
            // do operation
        }
    });

    run = false;
}
```

## 总结

Java8 限制lambda表达式中使用的局部变量必须是最终或者有效最终，是因为任何在该lambda类中使用的变量都会通过自动生成的构造函数复制一份新的变量，为了保证这种同步性并且防止引起不必要的并发问题，所以做此限制。



## 参考文档

1. [Difference between final and effectively final](https://stackoverflow.com/questions/20938095/difference-between-final-and-effectively-final)
2. [Why Do We Need Effectively Final?](https://www.baeldung.com/java-lambda-effectively-final-local-variables)
3. [Why do local variables used in lambdas have to be final or effectively final?](https://stackoverflow.com/questions/58527869/why-do-local-variables-used-in-lambdas-have-to-be-final-or-effectively-final)

