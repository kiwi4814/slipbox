> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [akshayhavale.medium.com](https://akshayhavale.medium.com/use-of-async-asynchronous-method-transactional-transaction-processing-499f6d7889a8)

> Sometimes some methods or services need to be executed asynchronously to save time

Sometimes some methods or services need to be executed asynchronously to save time

First of all, it is best to propose the method for asynchronous execution separately to form a class. Write your method in the class. You can add @Async annotation to the method to be asynchronous to indicate the method to be executed asynchronously, or it can be on the head of this class. Add @Async this annotation, but this means that all the methods in this class are executed asynchronously, then the methods in this class will appear asynchronous methods called asynchronous methods. So I suggest that asynchronous Annotate on the method

![](https://miro.medium.com/max/1400/0*pakHpyoKPtR2aZLt.png)

Then there is another point to note that the class you define must be injected into the spring container to become a Bean of spring, so you need to add @Component, otherwise you will not find this class during execution!!

This will save time happily asynchronously!!! — — however

When you execute it, you will find -_-!! It seems that there is no change, and asynchronous is also the case!! Actually-you know, you did not execute asynchronous at all

We need to add a comment @EnableAsync on the main startup class to turn on the asynchronous. This is the moment to go asynchronous!!!

So pay attention to when using asynchronous:

1. The separately proposed class must become annotated @Component to become a Spring Bean

2. Add a comment @EnableAsync on the main startup class to start the asynchronous moment

Asynchronous use with transactions:

We must ensure consistency and atomicity when performing business…

Then you need to add @Transactional transaction processing, rollback processing is performed when an exception is encountered,

Now method A calls method B. For efficiency, method B is asynchronous. In order to ensure data consistency, atomicity…

Results in the following situations:

1. Added @Transactional transaction to method A, not added to method B,

Then at this time, A throws an exception during execution (remember that B is asynchronous), then the business executed in A is rolled back, and no rollback occurs in B.

AB is abnormal only A rolls back

B is abnormal, A is executed normally, B does not end abnormally and no rollback occurs

2. Added @Transactional transaction to A and B methods:

At this time, A is abnormal, then A has rolled back, and B executes normally

Only B is abnormal, A executes normally and B rolls back

By the way, using asynchronous is equivalent to multiple threads of execution. If method B is called during the execution of method A, method B is executed after method B is executed. This is a single thread, so in order to save time, method B is asynchronous, which is done at the same time. There are two things, this is the operation of multiple threads.

Conclusion: The transactions between different threads are completely isolated, and asynchronous threads can still be called asynchronous