+++
title = "设计模式之单例模式（singleton）"
date = 2022-06-20 18:27:39
slug = "/singleton"
draft = false
tags = ["阅读笔记","设计模式"]
categories = ["阅读笔记"]
series = ["设计模式之美"]
toc = false

+++

我们知道经典的设计模式有23种，但其实常用的并不是很多，其中，最常被提及的可能就是单例模式了。



今天主要来学习一下设计模式种最经典的单例模式。

## 一、为什么要使用单例？

### 1.1 定义

单例设计模式（Singleton Design Pattern）：一个类只允许创建一个对象（实例），那这个类就是一个单例类，这种设计模式就叫单例模式。

### 1.2 使用单例解决什么问题

这里举几个最常见的例子来说明一下，为什么我们需要使用单例这种设计模式？

#### 1.2.1 使用单例模式处理资源访问冲突

在下面的代码中，我们实现了一个往文件中打印日志的Logger类：

```java

public class Logger {
  private FileWriter writer;
  
  public Logger() {
    File file = new File("/Users/wangzheng/log.txt");
    writer = new FileWriter(file, true); //true表示追加写入
  }
  
  public void log(String message) {
    writer.write(message);
  }
}

// Logger类的应用示例：
public class UserController {
  private Logger logger = new Logger();
  
  public void login(String username, String password) {
    // ...省略业务逻辑代码...
    logger.log(username + " logined!");
  }
}

public class OrderController {
  private Logger logger = new Logger();
  
  public void create(OrderVo order) {
    // ...省略业务逻辑代码...
    logger.log("Created an order: " + order.toString());
  }
}
```

在上面的例子中，所有的日志都写入同一个文件，如果在多线程环境下，两个线程同时执行login()和create()函数，就可能出现日志信息相互覆盖的情况。

针对这种情况，我们可以给类加锁或者使用分布式锁、并发队列的方式解决，但是实现起来有点复杂了。单例模式的解决思路相比于以上几种就更加简单了。单例模式相对于之前类级别锁的好处是，不用创建那么多 Logger 对象，一方面节省内存空间，另一方面节省系统文件句柄（对于操作系统来说，文件句柄也是一种资源，不能随便浪费）。



我们将Logger设计成一个单例类，程序中只允许创建一个Logger对象，所有的线程共享使用这一个Logger对象，共享一个FileWriter对象，而FileWriter本身就是对象级别线程安全的，也就避免了多线程情况下写日志会互相覆盖的问题。按照这个思路的实现代码如下：

```java

public class Logger {
  private FileWriter writer;
  private static final Logger instance = new Logger();

  private Logger() {
    File file = new File("/Users/wangzheng/log.txt");
    writer = new FileWriter(file, true); //true表示追加写入
  }
  
  public static Logger getInstance() {
    return instance;
  }
  
  public void log(String message) {
    writer.write(mesasge);
  }
}

// Logger类的应用示例：
public class UserController {
  public void login(String username, String password) {
    // ...省略业务逻辑代码...
    Logger.getInstance().log(username + " logined!");
  }
}

public class OrderController {  
  public void create(OrderVo order) {
    // ...省略业务逻辑代码...
    Logger.getInstance().log("Created a order: " + order.toString());
  }
}
```

#### 1.2.2 表示全局唯一类

从业务概念上，如果有些数据在系统中只应保存一份，那就比较适合设计为单例类。比如配置信息类，系统中只有一个配置文件，当配置文件被加载到内存后，理所应当只应该有一份；再比如全局递增ID生成器，如果程序中有两个对象，那就会存在生成重复ID的情况。

```java
import java.util.concurrent.atomic.AtomicLong;
public class IdGenerator {
  // AtomicLong是一个Java并发库中提供的一个原子变量类型,
  // 它将一些线程不安全需要加锁的复合操作封装为了线程安全的原子操作，
  // 比如下面会用到的incrementAndGet().
  private AtomicLong id = new AtomicLong(0);
  private static final IdGenerator instance = new IdGenerator();
  private IdGenerator() {}
  public static IdGenerator getInstance() {
    return instance;
  }
  public long getId() { 
    return id.incrementAndGet();
  }
}

// IdGenerator使用举例
long id = IdGenerator.getInstance().getId();
```

## 二、如何实现一个单例

由于篇幅太长，而且参考了其他很多文章，所以将这部分单独分了出来，详见文章[如何实现一个单例模式？](https://kiwi4814.com/posts/2022/singleton-impl/)。

## 三、单例存在的问题以及替代方案

### 3.1 单例存在的问题

单例是一种很常见的设计模式，在很多类库的源码以及日常开发中都会使用到，但是，有人认为单例是一种反模式（anti-pattern），又是为什么呢？我们知道使用单例的情况一般是表示全局唯一类，比如配置信息类、连接池类、ID生成器类等等，在代码中，我们一般只需要调用类似`IdGenerator.getInstance().getId()`这样的代码就可以了，使用非常简单，但是这样的方式是有一些问题的。

1. **单例对 OOP 特性的支持不友好**（封装、抽象、继承、多态）

   首先，单例模式违背了基于接口而非实现的设计原则，也就是违背了抽象这个特性；除此之外，单例的构造函数是private的，对继承、多态也非常不友好。

2. **单例会隐藏类之间的依赖关系**

   单例模式是在函数中直接调用的，并不会显示生命，如果代码很复杂，就会影响可读性

3. **单例对代码的扩展性不友好**

   单例类只能有一个对象实例，但是如果有需求需要创建多个实例的话，就要对代码有大的改动了。

   > 在系统设计初期，我们觉得系统中只应该有一个数据库连接池，这样能方便我们控制对数据库连接资源的消耗。所以，我们把数据库连接池类设计成了单例类。但之后我们发现，系统中有些 SQL 语句运行得非常慢。这些 SQL 语句在执行的时候，长时间占用数据库连接资源，导致其他 SQL 请求无法响应。为了解决这个问题，我们希望将慢 SQL 与其他 SQL 隔离开来执行。为了实现这样的目的，我们可以在系统中创建两个数据库连接池，慢 SQL 独享一个数据库连接池，其他 SQL 独享另外一个数据库连接池，这样就能避免慢 SQL 影响到其他 SQL 的执行。

4. **单例对代码的可测试性不友好**

   单例类这种硬编码式的使用方式，无法使用mock直接替换。

5. **单例不支持有参数的构造函数**

   这里其实可以是一个思考题，就是：**单例模式如何支持有参数的构造函数？**这个问题的答案后续会整理出来。

### 3.2 单例的替代方案

如果不使用单例模式，我们怎么样来保证一个类的对象全局唯一呢？下面提供几种思路：

1. **使用静态方法实现**，这也是在项目中最常使用到的一种实现思路，但是这种方案并不能解决上一节提到的问题，并且由于不支持懒加载，所以实际上更加不灵活；
2. **将单例作为参数传递给函数**，这种是使用方法上的变更，不过能够解决单例隐藏类之间依赖关系的问题，但是其他问题依然存在；
3. **通过工厂模式、IOC 容器（比如 Spring IOC 容器）来保证**，这里暂时不展开讲解。



实际上，无论单例存在多少问题，我觉得这里并不是不推荐使用单例模式，也不是一定要使用“更优”的替代方案，针对不同的项目和需求情况，可以有针对性的分析后再决定使用哪种方式，模式没有对错，主要是看程序员如何去使用。

