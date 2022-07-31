## 为什么写这个脚本？
写这个脚本的缘由来自[这个活动](https://pterclub.com/forums.php?action=viewtopic&forumid=37&topicid=6728)，由于Switch的小型DLC太多，有的游戏有高达上百个而且体积都很小，一般都不超过1M，所以为了缓解tracker服务器的压力需要将这些小型的torrent整合成一个。



对于实际操作的人来说，我们需要将一个游戏的DLC全部下载下来，然后按照区域分文件夹存放和制种，再上传等等一系列操作，这中间比较费时费力的大概就是发种的时候复制DLC的名称以及将这些种子下载下来（猫站的游戏区貌似不适用PTPP，如果有知道怎么适配的大佬麻烦告知一下，感激不尽），所以简单写了个脚本用于下载和获取页面上所有的DLC名称信息。



脚本地址：[AutoGetDLC (greasyfork.org)](https://greasyfork.org/zh-CN/scripts/444852-autogetdlc)

## 脚本的主要功能



脚本目前主要实现了两个功能：

1. 页面上在DLC的区域右侧增加了一个批量下载的按钮，用于下载页面上所有的DLC种子到本地；

   ![image-20220512130759685](https://raw.githubusercontent.com/kiwi4814/image-host/main/img/202205121308582.png)

2. 将每个DLC的标题整合成bbcode并且复制到剪切板，用于发种的时候填写游戏简介。（PS：如果不需要下载种子，只想复制简介的话，可以打开F12 console，也会将DLC信息输出出来）	![image-20220512131939615](https://raw.githubusercontent.com/kiwi4814/image-host/main/img/202205121319985.png)

## 其他说明

由于本人没有学过javascrtipt，代码都是网上查找和拼凑的，加起来也不到100行代码，难免简陋，欢迎提出指点和优化意见。



**附源码：**



```javascript
(function () {
    'use strict';
    $("b:contains('DLC (下载内容)')").after(
        "&nbsp;&nbsp;&nbsp;&nbsp;<button id= 'download-btn'>批量下载</button>"
    );
    var pterUrl = "https://pterclub.com/";
    var _dlc_tr = $("b:contains('DLC (下载内容)')").closest("tr");
    var _dlc_name = "[b]已整合以下DLC：[/b]" + "\n";
    var dlArray = new Array();
    _dlc_tr.nextAll().each(function (index) {
        var hrefHtml = $(this).find('a[title="下载本种"]').attr('href');
        if (hrefHtml !== undefined && hrefHtml != '') {
            dlArray[index] = pterUrl + hrefHtml;
        }
        var name = $(this).find('div[id="kdescr"]').find("b:eq(0)");
        if ( name.text() ){
          _dlc_name += (index + 1) + ". " + name.text() + "\n";
        }
    });
    console.log(_dlc_name);
    var btn = document.getElementById('download-btn');
    function download(name, href) {
        var a = document.createElement("a"),
            e = document.createEvent("MouseEvents");
        e.initEvent("click", false, false);
        a.href = href;
        a.download = name;
        a.dispatchEvent(e);
    }
    function sleep(millisecond) {
        return new Promise(resolve => {
            setTimeout(() => {
                resolve()
            }, millisecond)
        })
    }
    btn.onclick = async function name(params) {
        for (let index = 0; index < dlArray.length; index++) {
            download('第' + index + '个文件', dlArray[index]);
            await sleep(200);
        }
        GM_setClipboard(_dlc_name, 'text');
        btn.after("  DLC信息已复制！");
    }
})();

```

### 附发种流程
1. 确认分区并下载
2. 复制游戏名称，将移动到对应的文件夹，做种
3. 复制DLC名称并发布种子
4. 重新下载
5. 举报原种子