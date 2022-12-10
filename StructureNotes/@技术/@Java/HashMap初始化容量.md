HashSet源码中初始化容量：

`map = new HashMap<>(Math.max((int) (c.size()/.75f) + 1, 16));`


