+++
title = "再读JDK8中的函数式编程"
date = 2022-07-26 21:40:15
slug = "/java8-functional-programming"
draft = false
tags = ["技术","Java 8"]
categories = ["Java"]
toc = false

+++



用了好几年的JDK8 “函数式编程”，类似stream流、lambda等语法都用的“炉火纯青”了，却仍然还是免不了有时候还是需要检索一些复杂的语法，比如`flatmap`、`mapreduce`等平时很少用到的语法。想起来自己也好像只是粗略的读过，并没有任何精读，于是便有了这篇文章，在这次重新去了解函数式编程的过程中，记录了一些知识要点以及疑惑。



如果想要完整的了解JDK8的新特性，推荐[读这里](https://wizardforcel.gitbooks.io/java8-new-features/content/index.html)。当然在下文中也会摘录很多其他文章，都是在看的过程中针对自己的疑问检索的，对相关章节感兴趣的也可以跳转查看。

## 1. 函数式编程



对于函数式编程，能讲的有很多，我自己也没有完全理解，想要深入研究的小伙伴可以参见[函数式编程指北](https://llh911001.gitbooks.io/mostly-adequate-guide-chinese/content/)。



下面是结合一些文章总结出来的概述：



**Java语言的面向对象编程是对数据进行抽象；而函数式编程是对行为本身进行抽象。**其核心思想是: 使用不可变值和函数，函数对一个值进行处理，映射成另一个值。



我们知道lambda表达式本质上就是一个匿名函数，而Java8引入这一点：**把函数行为本身作为参数往下传递**，才正式开始让Java走向函数式编程。



> 扩展阅读 —— 《架构整洁之道》对于这几种编程方式的总结
>
> - 结构化编程是对程序控制权的直接转移的限制（Structured programming is discipline imposed upon direct transfer  of control.）
> - 面向对象编程是对程序控制权的间接转移的限制（Object-oriented programming is discipline imposed upon indirect transfer  of control.）
> - 函数式编程是对程序中赋值操作的限制（Functional programming is discipline imposed upon variable assignment.）



## 2.函数式接口

### default方法

在说函数式接口之前，我觉得有必要说说Java8中新增的关键字 —— default。其定义很简单，接口可以有默认的实现，不需要其实现类去实现这个方法，只需要在这个方法之前加上default关键字即可。



**那么，为什么Java8中要增加这个关键字呢？**

首先，最直接的原因，Java8中增加了lambda表达式，需要在原本的接口中增加新的方法（比如 foreach 方法），然而接口的规范要求其实现类必须实现所有的方法，所以没办法无缝兼容之前的发布版本；其次，以前只有抽象类可以增加方法体，所以当一个接口需要有一个通用的方法的时候，需要为每个实现类都复制一份相同的实现，或者写一个抽象方法去继承，但是这种方式破坏了接口设计的初衷（抽象类表示”is-a“，接口表示”like-a“）。

### 函数式接口



我们知道接口中的方法一定是抽象的，默认情况下可以省略 public 和 abstract 。平时在开发功能的时候，一般会在一个接口中定义不少抽象方法（拿一个最简单的功能来说至少有增删改查对吧），但是如果我们定义一个仅包含单个抽象方法的接口，那么这个接口就可以被称为函数式接口（**Functional Interface**），也叫做单抽象方法接口（SAM, **Single Abstract Method interfaces**）。



在 `FunctionalInterface` 的源码中，清晰的列出了以下说明：

> An informative annotation type used to indicate that an interface type declaration is intended to be a functional interface as defined by the Java Language Specification. Conceptually, a functional interface has exactly one abstract method. Since default methods have an implementation, they are not abstract. If an interface declares an abstract method overriding one of the public methods of java.lang.Object, that also does not count toward the interface's abstract method count since any implementation of the interface will have an implementation from java.lang.Object or elsewhere.
>
> 
>
> Note that instances of functional interfaces can be created with lambda expressions, method references, or constructor references.
>
> 
>
> If a type is annotated with this annotation type, compilers are required to generate an error message unless:
>
> - The type is an interface type and not an annotation type, enum, or class.
>
> - The annotated type satisfies the requirements of a functional interface.
>
> 
>
> However, the compiler will treat any interface meeting the definition of a functional interface as a functional interface regardless of whether or not a FunctionalInterface annotation is present on the interface declaration.

上面的这段注释中包含了以下几点：

- 创建函数式接口的实例可以通过 **lambda 表达式**、方法引用或者构造器引用
- 除了唯一的抽象方法外，函数式接口中还可以包含 **default 方法**（有自己的实现，并不算抽象方法）或者重写了 Object 类的方法
- 函数式接口并不需要强制加上 `@FunctionalInterface` 注解，但是加了这个注解后，编译器会去检查代码是否符合函数式接口的要求

另外，上面的注释中没有提到的，**static方法也是允许存在的**，对此我们可以看下Java中`Comparator`接口的源码：（类似的还有 Runnable、Comparable 或者 Callable 接口）

```java
@FunctionalInterface
public interface Comparator<T> {
    // 此方法即为唯一的抽象方法
  	int compare(T var1, T var2);
		
  	// 此方法继承自Object类
    boolean equals(Object var1);
		
  	// default方法，有默认的实现
    default Comparator<T> thenComparing(Comparator<? super T> var1) {
        Objects.requireNonNull(var1);
        return (Comparator)((Serializable)((var2x, var3) -> {
            int var4 = this.compare(var2x, var3);
            return var4 != 0 ? var4 : var1.compare(var2x, var3);
        }));
    }
  	// ...这里省略了其他default方法
		
  	// static方法
    static <T extends Comparable<? super T>> Comparator<T> reverseOrder() {
        return Collections.reverseOrder();
    }
		// ...这里省略了其他static类型的方法
}
```

当然了，我们也可以自己实现自己的函数式接口，最简单的实现：

```java
// 接口，@FunctionalInterface注解其实只要满足规范是可有可无的
@FunctionalInterface
public interface TestInterface {
    int add(int a, int b);
}

// 实际使用
TestInterface i = (a, b) -> a + b;
int sum = i.add(1, 3);
```



另外，JDK8本身新增了四个函数式接口，

### 参考文档

1. [Java Default Methods](https://howtodoinjava.com/java8/default-methods-in-java-8/)

2. [Functional Interfaces in Java](https://howtodoinjava.com/java/stream/functional-interface-tutorial/)



## 3. lambda表达式



首先我们还是继续以上一节中 Comparator 接口为例简单讲一下 lambda 的语法。



对于 Comparator 接口，我们可以像下面这样使用：

```java
// 下面的comparator1、2、3、4完全是等效的写法
Comparator<String> comparator1 = (String o1, String o2) -> { return o1.length() - o2.length(); };
Comparator<String> comparator2 = (o1, o2) -> o1.length() - o2.length();
Comparator<String> comparator3 = Comparator.comparingInt(o -> o.length());
Comparator<String> comparator4 = Comparator.comparingInt(String::length);

// 下面的comparator5、6、7、8也完全是等效的写法
Comparator<Student> comparator5 = (Student student1, Student student2) -> student1.getId().compareTo(student2.getId());
Comparator<Student> comparator6 = (student1, student2) -> student1.getId().compareTo(student2.getId());
Comparator<Student> comparator7 = Comparator.comparing(e -> e.getId());
Comparator<Student> comparator8 = Comparator.comparing(JbxxVO::getId);
```



注意到其中的区别了吗，其中comparator1的写法是完整的，`(String o1, String o2)`代表函数的入参，箭头符号 `->` 则是固定的格式，后面的`{}`括起来的部分则是函数的方法体。

而第二种写法则表明入参的类型是可以省略的，而且如果方法体只有一行，那么`{}`也是可以省略的。



至于comparator3和comparator4的写法是因为Comparator接口中封装了一个`comparingInt`的静态方法，进一步简化了写法：

```java
	public static <T> Comparator<T> comparingInt(ToIntFunction<? super T> keyExtractor) {
        Objects.requireNonNull(keyExtractor);
        return (Comparator<T> & Serializable)
            (c1, c2) -> Integer.compare(keyExtractor.applyAsInt(c1), keyExtractor.applyAsInt(c2));
    }
```

而3和4的区别则是因为Java8中引入了**方法引用（method references）**的简写，可以通过这种形式访问静态方法、实例方法以及构造函数。具体格式为：

1. 如果是静态方法，则是 `ClassName::methodName`，如 `Object::equals`
2. 如果是实例方法，则 是 `Instance::methodName` ，如`Object obj=new Object(); obj::equals; `
3. 如果是构造函数，则是 `ClassName::new`，如`Student::new`

### 有效最终（effectively final）

我们知道lambda表达式中如果要使用局部变量的话，这个变量必须是最终（final）或者有效最终（effectively final）的，关于这一点，具体篇幅的展开可以查看上一篇博文。





### 参考文档

1. [Lambda Expressions and Functional Interfaces: Tips and Best Practices](https://www.baeldung.com/java-8-lambda-expressions-tips)
2. [Expressions (jsl-15)](https://docs.oracle.com/javase/specs/jls/se8/html/jls-15.html#jls-15.27.2)

## 4. stream流

未完待续...





[Understanding Java 8’s Consumer, Supplier, Predicate and Function | by Somnath Musib | The Startup | Medium](https://medium.com/swlh/understanding-java-8s-consumer-supplier-predicate-and-function-c1889b9423d)













