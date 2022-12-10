1. 合并多个list为stream流并求和

   ```java
   int jyllrs = jyllList.stream().flatMap(l -> l.getZydws().stream()).mapToInt(ZydwVO::getDwrs).sum();
   ```

2. 分组求最小ID
```java
List<Pixixi> result = list.stream()
                    .collect(Collectors.groupingBy(Pixixi::getType, Collectors.minBy(Comparator.comparing(Pixixi::getId))))
                    .values().stream()
                    .map(Optional::get)
                    .collect(Collectors.toList());
}
```

3. 多线程流

```java
    public static void main(String[] args) {
        // 类的属性就是两个字段，一个字符串，一个数字
        List<MfsJqDpdzVo> list = new ArrayList<>();
        for (int i = 0; i < 10000000; i++) {
            list.add(new MfsJqDpdzVo(i + "", i));
        }
        // 以下两句的最终效果是一样的，并不会影响list的顺序
        Instant start = Instant.now();
        list.parallelStream().forEach(t -> t.setDpxfdzCount(t.getDpxfdzCount() + 1));
        Instant end1 = Instant.now();
        System.out.println(Duration.between(start, end1));
        list.forEach(t -> t.setDpxfdzCount(t.getDpxfdzCount() + 1));
        Instant end2 = Instant.now();
        System.out.println(Duration.between(end1, end2));
    }
```

但是请注意，并行流只有在处理特别大的流时有时间优势。比如上面的例子中，循环10000000次速度也是差不多的
