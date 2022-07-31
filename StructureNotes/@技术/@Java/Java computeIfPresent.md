+++
title = ""
date = 2022-07-18 15:45:11
slug = "/"
draft = false
tags = ["技术","Java"]
categories = ["Java"]
toc = false
+++

## 从需求聊起

今天在项目中看到一段数据统计的代码，大概如下：

```java
for (Object o : list) {
    if (dataMap.containsKey(o.getType())) {
        dataMap.put(o.getType(), dataMap.get(o.getType()) + o.getCount());
    } else {
        dataMap.put(o.getType(), o.getCount());
    }
}
```

实现的逻辑很简单，就是统计列表中每个type的总数，类似`select count(*) from ... group by type`，但看到这段代码的时候我不禁在想，这里应该有更简洁的实现方式吧，且不说 Stream 流的 groupBy ，Map本身应该也有类似的方法才对。去看了下JDK中Map的源码，果然发现了一些方法。



为了方便理解，这里“创造“一个伪需求：**统计一篇文章中每个字符的出现次数，并且返回对应的Map**。（注意这里不是为了考察算法或者最优解，只是单纯的为了方便理解）



假定这篇文章如下：

```
Unthrifty loveliness, why dost thou spend
Upon thy self thy beauty's legacy?
Nature's bequest gives nothing, but doth lend,
And being frank she lends to those are free:
Then, beauteous niggard, why dost thou abuse
The bounteous largess given thee to give?
Profitless usurer, why dost thou use
So great a sum of sums, yet canst not live?
For having traffic with thy self alone,
Thou of thy self thy sweet self dost deceive:
Then how when nature calls thee to be gone,
What acceptable audit canst thou leave?
  Thy unused beauty must be tombed with thee,
  Which, used, lives th' executor to be.
```

很简单，按照文章最开始代码的思路，我们这么实现：

```java
    private static Map<Character, Integer> commonPut(char[] chars) {
        Map<Character, Integer> result = new ConcurrentHashMap<>();
        for (Character word : chars) {
            if (Character.isWhitespace(word)) continue;
            word = Character.toLowerCase(word);
            Integer prev = result.get(word);
            if (prev == null) {
                result.put(word, 1);
            } else {
                result.put(word, prev + 1);
            }
        }
        return result;
    }
```

其实在Map接口中，提供了很多可以在put的时候进行计算的函数，相关的函数有compute、computeIfAbsent、computeIfPresent以及merge，字面意思其实很好理解，函数的使用场景和

## compute



## computeIfAbsent



## computeIfPresent



示例代码：
```java
  
import java.util.Map;  
import java.util.concurrent.ConcurrentHashMap;  
  
public class MapCompute {  
    public static void main(String[] args) {  
  
        String words = "Unthrifty loveliness, why dost thou spend\n"  
                + "Upon thy self thy beauty's legacy?\n"  
                + "Nature's bequest gives nothing, but doth lend,\n"  
                + "And being frank she lends to those are free:\n"  
                + "Then, beauteous niggard, why dost thou abuse\n"  
                + "The bounteous largess given thee to give?\n"  
                + "Profitless usurer, why dost thou use\n"  
                + "So great a sum of sums, yet canst not live?\n"  
                + "For having traffic with thy self alone,\n"  
                + "Thou of thy self thy sweet self dost deceive:\n"  
                + "Then how when nature calls thee to be gone,\n"  
                + "What acceptable audit canst thou leave?\n"  
                + "  Thy unused beauty must be tombed with thee,\n"  
                + "  Which, used, lives th' executor to be.\n";  
        char[] chars = words.toCharArray();  
        Map<Character, Integer> result1 = commonPut(chars);  
        Map<Character, Integer> result2 = compute(chars);  
        Map<Character, Integer> result3 = merge(chars);  
        Map<Character, Integer> result4 = computeIfPresent(chars);  
        System.out.println(result1);  
        System.out.println(result2);  
        System.out.println(result3);  
        System.out.println(result4);  
  
    }  
  
    private static Map<Character, Integer> commonPut(char[] chars) {  
        Map<Character, Integer> result = new ConcurrentHashMap<>();  
        for (Character word : chars) {  
            if (Character.isWhitespace(word)) continue;  
            word = Character.toLowerCase(word);  
            Integer prev = result.get(word);  
            if (prev == null) {  
                result.put(word, 1);  
            } else {  
                result.put(word, prev + 1);  
            }  
        }  
        return result;  
    }  
  
    private static Map<Character, Integer> compute(char[] chars) {  
        Map<Character, Integer> result = new ConcurrentHashMap<>();  
        for (Character word : chars) {  
            if (Character.isWhitespace(word)) continue;  
            word = Character.toLowerCase(word);  
            result.compute(word, (k, v) -> v == null ? 1 : v + 1);  
        }  
        return result;  
    }  
  
    private static Map<Character, Integer> merge(char[] chars) {  
        Map<Character, Integer> result = new ConcurrentHashMap<>();  
        for (Character word : chars) {  
            if (Character.isWhitespace(word)) continue;  
            word = Character.toLowerCase(word);  
            result.merge(word, 1, Integer::sum);  
        }  
        return result;  
    }  
  
  
    private static Map<Character, Integer> computeIfPresent(char[] chars) {  
        Map<Character, Integer> result = new ConcurrentHashMap<>();  
        for (Character word : chars) {  
            if (Character.isWhitespace(word)) continue;  
            word = Character.toLowerCase(word);  
            result.putIfAbsent(word, 0);  
            result.computeIfPresent(word, (k, v) -> v + 1);  
        }  
        return result;  
    }  
  
  
}
```

[Map.merge() - One method to rule them all (nurkiewicz.com)](https://nurkiewicz.com/2019/03/mapmerge-one-method-to-rule-them-all.html)