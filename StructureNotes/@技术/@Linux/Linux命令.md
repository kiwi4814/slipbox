查找仓库下所有的IDEA配置文件并打印

```shell
find Repositories  -name ".idea" -print
```

查找仓库下所有的IDEA配置文件并删除

```shell
find Repositories  -name ".idea" -print |xargs rm -rf
```

