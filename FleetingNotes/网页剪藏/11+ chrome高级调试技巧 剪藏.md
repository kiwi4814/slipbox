> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [juejin.cn](https://juejin.cn/post/7085135692568723492)

也许你我素未谋面，但很可能相见恨晚，我是**前端胖头鱼**

前言
--

chrome 浏览器作为前端童鞋的`老婆`，相信你一定不陌生。`调页面`、`写BUG`、`画样式`、`看php片`少了它整个世界都不香了。

不信？一起来看看我们的`老婆`有多厉害....

1#. 一键重新发起请求
------------

在与后端接口联调或排查线上 BUG 时，你是不是也经常听到他们说这句话：**你再发起一次请求试试，我这边看下为啥出错了！**

重发请求，这有一种简单到发指的方式。

1.  选中`Network`
2.  点击`Fetch/XHR`
3.  选择要重新发送的请求
4.  右键选择`Replay XHR`

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291431006.awebp)

不用刷新页面，不用走页面交互，是不是非常爽！！！

2#. 在控制台快速发起请求
--------------

还是联调或修 BUG 的场景，针对同样的请求，有时候需要**修改入参**重新发起，有啥快捷方式？

1.  选中`Network`
2.  点击`Fetch/XHR`
3.  选择`Copy as fetch`
4.  控制台粘贴代码
5.  修改参数，回车搞定

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291431128.awebp)

曾经我总是通过改代码或者手写`fetch`的方式处理，想想真是太傻了...

3#. 复制 JavaScript 变量
--------------------

假如你的代码经过计算会输出一个**复杂的对象**，且需要被复制下来发送给其他人，怎么办？

1.  使用`copy`函数，将`对象`作为入参执行即可

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291431387.awebp)

以前我总是通过`JSON.stringify(fetfishObj, null, 2)`打印到控制台，再手动复制粘贴，这效率实在是太低了...

4#. 控制台获取 Elements 面板选中的元素
--------------------------

调试网页时通过`Elements`面板选中元素后，如果想通过`JS`知道它的一些属性，如`宽`、`高`、`位置`等怎么办呢？

1.  通过`Elements`选择要调试的元素
2.  控制台直接用`$0`访问

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291431899.awebp)

5#. 截取一张全屏的网页
-------------

偶尔咱们也会有对网页截屏的需求，一屏还好，系统自带的截屏或者微信截图等都可以办到，但是要求**将超出一屏的内容也截下来咋办呢**？

1.  准备好需要截屏的内容
2.  `cmd + shift + p` 执行`Command`命令
3.  输入`Capture full size screenshot` 按下回车

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432837.awebp)

**如果要截取选中的部分元素呢？**

答案也很简单，第三步输入`Capture node screenshot`即可

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432991.awebp)

6#. 一键展开所有 DOM 元素
-----------------

调试元素时，在层级比较深的情况下，你是不是也经常一个个展开去调试？有一种更加快捷的方式

1.  按住`opt`键 + click（需要展开的最外层元素）

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432216.awebp)

7#. 控制台引用上一次执行的结果
-----------------

来看看这个场景，我猜你也一定遇到过, 对某个字符串进行了各种工序，然后我们想知道每一步执行的结果，该咋办？。

```
'fatfish'.split('').reverse().join('') // hsiftaf
复制代码
```

**你可能会这样做**

```
// 第1步
'fatfish'.split('') // ['f', 'a', 't', 'f', 'i', 's', 'h']
// 第2步
['f', 'a', 't', 'f', 'i', 's', 'h'].reverse() // ['h', 's', 'i', 'f', 't', 'a', 'f']
// 第3步
['h', 's', 'i', 'f', 't', 'a', 'f'].join('') // hsiftaf
复制代码
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432311.awebp)

**更简单的方式**

使用`$_`引用上一次操作的结果，不用每次都复制一遍

```
// 第1步
'fatfish'.split('') // ['f', 'a', 't', 'f', 'i', 's', 'h']
// 第2步
$_.reverse() // ['h', 's', 'i', 'f', 't', 'a', 'f']
// 第3步
$_.join('') // hsiftaf
复制代码
```

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432574.awebp)

8.# 快速切换主题
----------

有的同学喜欢 chrome 的白色主题，有的喜欢黑色，我们可以使用快捷键迅速切换两个主题。

2.  `cmd + shift + p` 执行`Command`命令
3.  输入`Switch to dark theme`或者`Switch to light theme`进行主题切换

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432641.awebp)

9.# "`$`"和"`$$`" 选择器
--------------------

在控制台使用`document.querySelector`和`document.querySelectorAll`选择当前页面的元素是最常见的需求了，不过着实有点太长了，咱们可以使用`$`和`$$`替代。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432298.awebp)

10.# `$i`直接在控制台安装 npm 包
-----------------------

你遇到过这个场景吗？有时候想使用比如`dayjs`或者`lodash`的某个`API`，但是又不想去官网查，如果可以在控制台直接试出来就好了。

[Console Importer](https://link.juejin.cn?target=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fconsole-importer%2Fhgajpakhafplebkdljleajgbpdmplhie%2Frelated "https://chrome.google.com/webstore/detail/console-importer/hgajpakhafplebkdljleajgbpdmplhie/related") 就是这么一个插件，用来在控制台直接安装`npm`包。

1.  安装`Console Importer`插件
2.  $i('name') 安装 npm 包

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432684.awebp)

11.# Add conditional breakpoint 条件断点的妙用
---------------------------------------

假设有下面这段代码，咱们希望食物名字是`🍫`时才触发断点，可以怎么弄？

```
const foods = [
  {
    name: '🍔',
    price: 10
  },
  {
    name: '🍫',
    price: 15
  },
  {
    name: '🍵',
    price: 20
  },
]

foods.forEach((v) => {
  console.log(v.name, v.price)
})

复制代码
```

这在大量数据下，只想对符合条件时打断点条件将会非常方便。试想如果没有条件断点咱们是不是要点 n 次 debugger？

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202211291432414.awebp)

最后
--

希望能一直给大家分享实用、基础、进阶的知识点，一起早早下班，快乐摸鱼。

期待你在**掘金**关注我：**前端胖头鱼**，也可以在**公众号**里找到我：**前端胖头鱼**。