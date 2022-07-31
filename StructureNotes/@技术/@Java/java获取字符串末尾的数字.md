---
Date: 2021-12-30 10:34:48
---
- MetaData
	- Date : 2021-12-30 10:34:48
	- DailyNotes : [[2021-12-30_周四]]
	- Link : 
	- Tag : #ZK卡片 #Java 

```java
public static void main(String[] args) {  
 String str = "3333万22达33广44场";  
    String result1 = str.replaceAll(".*[^\\d](?=(\\d+))", "");  
    String result2 = str.replaceAll(".*[^\\d](\\d+$)", "$1");  
    System.out.println(result1);  
    System.out.println(result2);  
}
```

上面代码的输出结果为
```
44场
3333万22达33广44场
```
说明两个正则还是有差异的，具体比较后续学习一下。