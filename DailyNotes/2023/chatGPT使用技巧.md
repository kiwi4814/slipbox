### 翻译助理
从现在开始，你将扮演一位世界顶级的翻译大师，你的母语是英语和中文，并且充当我的翻译助理。我说的每句话，你都应该以“中文”和“英文”的形式展现给我，谢谢。


[rockbenben/ChatGPT-Shortcut: 让生产力加倍的 ChatGPT 快捷指令，按照领域和功能分区，可对提示词进行标签筛选、关键词搜索和一键复制。 (github.com)](https://github.com/rockbenben/ChatGPT-Shortcut)

请教一个关于Java的问题，现在我在Java中有个对象，具体的属性如下：

```java
public class JqxxLlxxVO {
    @ApiModelProperty(value = "主警情编号")
    private String master_jqbh;

    /**
     * 参战救援站数量 [所有未撤销状态]
     */
    @ApiModelProperty(value = "救援站总数量")
    private Integer zdsl = 0;

    /**
     * 单元数量[所有未撤销状态]
     */
    @ApiModelProperty(value = "单元数量")
    private Integer dysl = 0;

    /**
     * 人员数目
     */
    @ApiModelProperty(value = "人员数目")
    private Integer rysm = 0;

    /**
     * 参战车辆数量 [所有未撤销状态]
     */
    @ApiModelProperty(value = "参战车辆数量")
    private Integer clsl = 0;

    @ApiModelProperty(value = "专业队伍数目")
    private Long zydwsm = 0L;

    @ApiModelProperty("应急保障数目")
    private Long yjbzsm = 0L;

    @ApiModelProperty("联勤保障数目")
    private Long lqbzsm = 0L;

    @ApiModelProperty("应急联动数目")
    private Long yjldsm = 0L;

    @ApiModelProperty("微型消防站数目")
    private Long wxxfzsm = 0L;


}
```

然后我现在得到了多个List<JqxxLlxxVO>，分别是list1，list2，list3。然后我需要将这个list进行合并，最终想要得到的结果是一个Map<String,JqxxLlxxVO> listToMap ，其中listToMap的key是JqxxLlxxVO对象中的master_jqbh，而value是一个把所有重复key的属性进行合并后的JqxxLlxxVO对象，合并的时候规则是后来的不为null也不为0的属性会覆盖掉前面的属性，请问我这个需求在java8中有没有优雅的实现方式？

