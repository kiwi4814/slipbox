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