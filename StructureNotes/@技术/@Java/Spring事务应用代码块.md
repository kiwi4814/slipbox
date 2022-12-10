如果需要某段代码在事务提交后执行，可以使用：
```java
// 确保发送消息的代码在事务完成后执行  
TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {  
    @Override  
    public void afterCommit() {  
        xfdzBusinessService.sendDpMessage(xfdz, ersCjxx, detailByJqbh, user);  
    }  
});
```