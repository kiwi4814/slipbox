### 基础概念与常识
- **Java语言有哪些特点？**

  首先，Java是一种面向对象语言，支持四大特性：封装、多态、继承和抽象。此外，Java还有平台无关性、内置多线程支持、支持网络编程、可靠、安全等诸多特点。Java具有强大的生态，框架的数量、maven repo的数量都非常庞大。参考阅读[Java的生态系统为什么好？好在哪里？](https://www.zhihu.com/question/263954669)

  

- **JVM vs JDK vs JRE**

  JVM（Java ）是Java虚拟机，JDK（Java Development Kit）是Java开发套件，而JRE（Java Runtime Environment）是Java运行时环境。

  - JVM是运行Java字节码的虚拟机，JVM针对不同系统有特定的实现，目的是使用相同的字节码都会返回相同的结果。
  - JDK是功能齐全的Java SDK，拥有JRE所拥有的一切，还有编译器（javac）和工具，能够创建和编译程序
  - JRE是运行时环境，包含Java虚拟机、类库，命令和一些基础组件，不能用于创建新程序。

- 什么是字节码？采用字节码的好处是什么？

  JVM能识别的代码，就是.class文件。好处是一次编译，到处运行。

- 为什么说Java语言“编译与解释并存”？

  高级语言按照类型可分为编译型和解释型语言。

  [基本功 | Java即时编译器原理解析及实践 - 美团技术团队 (meituan.com)](https://tech.meituan.com/2020/10/22/java-jit-practice-in-meituan.html)

- Oracle JDK vs Open JDK

  

- Java和C++的区别

### 基本语法
- 字符型常量和字符串常量的区别？
  - 单引号，双引号
  - 字符型常量相当于一个整型值，可以参与表达式运算；字符串常量代表地址值
  - 字符常量（char）在Java中
- 使用过可变长参数吗？
- 注释有哪几种？注释越多越好吗？
- 标识符和关键字的区别是什么？
- Java有哪些常见的关键字？
- 自增自减运算符
- continue、break和return的区别
- 方法有哪几种类型？什么是方法的返回值？
- \==和equals的区别
- hashcode()与equals()

### 基本数据类型
- Java中的几种基本数据类型了解么？
- 包装类型的常量池技术了解么？
- 自动装箱与拆箱了解吗？原理是什么？