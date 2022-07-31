生产环境遇到一个问题，数据被重复消费，每隔两分钟大概就会有如下的一次报错：
```
Commit cannot be completed since the group has already rebalanced and assigned the partitions to another member. This means that the time between subsequent calls to poll() was longer than the configured max.poll.interval.ms, which typically implies that the poll loop is spending too much time message processing. You can address this either by increasing the session timeout or by reducing the maximum size of batches returned in poll() with max.poll.records.
```

直接翻译过来大概就是说，位移提交失败，原因是消费者组开启了rebalance且已然分配对应分区给其他消费者。这表明poll调用间隔超过了max.poll.interval.ms的值，这通常表示poll循环中的消息处理花费了太长的时间。解决方案有两个：1. 增加session.timeout.ms值；2. 减少max.poll.records值。

下面说说在spring-kfka这几个参数的详细含义。

`spring.kafka.secondary.max-poll-interval-ms=200000`

