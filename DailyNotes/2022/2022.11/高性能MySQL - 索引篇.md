## 一、索引的类型
### 1. B+ Tree

[MySQL十五：InnoDB为什么不使用跳表而是B+Tree - 掘金 (juejin.cn)](https://juejin.cn/post/7106131535857713160)



#### B+ Tree适合的查找（全键值、键值范围或键前缀查找）

在一个联合索引 `(a,b)` 中，可以查找：

- 全值匹配，比如 `a='xxx' and b='xxx'`
- 最左前缀匹配，比如 `a='xxx'`
- 最左前缀匹配，比如 `a like 'xxx%'`
- 匹配范围值，比如 `a between 'xxx1' and 'xxx2'`
- 匹配范围值2，比如  `a = 'xxx' and b like 'xxx%'`
- 覆盖索引 —— 只访问索引的查询



