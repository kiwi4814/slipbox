两种方法，一种修改workflow，另外一种直接将CNAME建在public文件夹下。

```
 # 创建 CNAME，这个是原始配置中没有的

 - uses: "finnp/create-file-action@master"

 env:

 FILE_NAME: "./public/CNAME"

 FILE_DATA: "kiwi4814.com"
```

本来按照我的想法把这里的./public/CNAME改成了根目录./CNAME，后来发现是不行的，就按照图示写就ok了。