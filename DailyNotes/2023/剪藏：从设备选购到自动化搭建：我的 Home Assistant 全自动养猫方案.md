> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [sspai.com](https://sspai.com/post/79141)

> Matrix 首页推荐 Matrix 是少数派的写作社区，我们主张分享真实的产品体验，有实用价值的经验与思考。

**Matrix 首页推荐**

[Matrix](https://sspai.com/matrix) 是少数派的写作社区，我们主张分享真实的产品体验，有实用价值的经验与思考。我们会不定期挑选 Matrix 最优质的文章，展示来自用户的最真实的体验和观点。

文章代表作者个人观点，少数派仅对标题和排版略作修改。

自从去年意外收养了一只流浪猫之后（详见 [小猫咪的一年](https://sspai.com/link?target=https%3A%2F%2Fyzlnew.com%2F2022%2F06%2Fcat-one-year%2F)），单身生活突然就开始「喧嚣」起来。作为一只奶牛猫，叫做 Nova 就很合理，名字来源是 DOTA2 英雄 Luna 的坐骑。Nova 经历了绝育加上眼睑内翻手术之后，跟我建立起了患难与共的革命友谊。但是作为一个典型的上班族，虽然不经常出差，也没办法时时刻刻照顾到猫，~当然更多的原因是懒~。因此从今年开始陆续购入了一些智能家居设备，尽可能使得我和 🐱 能够相安无事、和谐共处。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/d67a949504b50064753a42797bbbfc46.webp)

这是一篇鸽了快一年的文章，期间设备、想法都在演进，至此这一套系统已经平稳运行相当长一段时间，并且已经随着我搬了一次家。分享出来希望对各位 🐈 家长有所帮助。

理念目标
----

简而言之就是，在一个地方（Home Assistant）控制和同步所有猫相关的设备及状态，并实现设备联动。

如果你现在也在用自动猫砂盆、喂食器这些设备，你也一定会有这样的痛点：

*   各家设备都有一个专用 App，占用后台并且推送广告；
*   除了米家出的喂食器和饮水机等，都不支持接入米家，也就是基本没有设备联动的可能性。

系统组成
----

我把和猫相关的设备分为这样几个层次和类别：

*   智能类：即自动猫砂盆、喂食器和饮水机这三大件。如果有长期出差需求的，可以说是必不可少。
*   传感类：一般是摄像头或加上传感器，出门在外掌握猫猫动态。
*   环境类：扫地机器人、空气净化器之类清洁设备。猫虽然比较爱干净，但是扒拉出来的猫砂和换毛期一簇簇的毛发，自然会加重清洁负担。

为什么选择 Home Assistant
--------------------

我选择用自建的 Home Assistant 来管理相关设备的最主要理由很简单。以上的这些设备基本很难用一个 App 控制，每个设备都需要厂商专门的应用来使用，这就带来两个问题：

1.  我的手机上需要跑不少不必要的应用，并给我推送通知；
2.  无法完成一些跨设备的自动化操作。

尽管 Home Assistant 的搭建和维护成本不低，但是最后的效果是让我非常满意的。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/5c72c70d5abe624715e26ea0e33e19a8.webp)

我选了哪些设备
-------

### 智能类

*   自动喂食器：米家智能宠物喂食器 ⭐⭐⭐⭐
*   饮水机：米家智能宠物饮水机 ⭐⭐
*   猫砂盆：小佩智能猫厕所 PURA MAX ⭐⭐⭐

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/ac7f02b5f9e3dbe4082098637cae2f23.webp)

选择的时候主要考虑两点，一是足够安全，二是能够比较简单地接入 Home Assistant。

喂食和喂水的直接选了米家，毕竟万一自建的服务挂了，还能比较轻松地远程控制设备。而且能通过 [al-one/hass-xiaomi-miot](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2Fal-one%2Fhass-xiaomi-miot) 非常轻松地接入 Home Assistant。不过据说米家的喂食器会存在出粮偏少的情况，尽管我没有遇到，还是建议定时喂食测试几天之后确定猫合适的食量。喂水的话其实并不必要，会有比较重的清洗和耗材负担，还不如每次换一大碗新鲜的水。

猫砂盆的选择可以说是让人眼花缭乱，我选择的时候还没有能接入米家的设备，所以主要在小佩（[hasscc/petkit](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2Fhasscc%2Fpetkit)）和 Catlink（[hasscc/catlink](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2Fhasscc%2Fcatlink)） 都有比较靠谱的第三方集成。因此品牌大概是确定下来，如果有同样接入 Home Assistant 的需求，可以在 GitHub 上先搜索一下是否已经有集成。最后刚好趁着小佩的 PURA MAX 打折，就以不到 900 的价格拿下了。用了大半年的感受还是非常好的，我再也不用每天早上赶着上班急急忙忙铲屎了。其余的优缺点供大家参考：

1.  优点：安全，官方配件齐全并且不贵。猫砂盆通过前后倾倒使得结块顺着内部管道进入集便器，加上内置的传感器有点过于灵敏，整个过程基本没有卡猫可能。另外在三方店铺（比如拼多多）购买官方配件比较便宜，尤其推荐加购控砂盒。
2.  缺点：没有一键清砂功能，边缘容易粘底。这算是这个结构带来的额外的麻烦，虽然官方也售卖自动倾砂板能把所有猫砂倒入集便器，但是我试了下效率很低，并且还要自己手动去安装和卸载。同样的原因内壁容易在使用过程中变得很脏，但是非常难清洗。另外就是我家猫经常尿在边缘，因为底部是弧形的，边缘猫砂浅，经常会有粘底的猫砂需要手动铲除。不过这个问题在我换成膨润土猫砂之后完美解决了。最后小佩的第三方集成时常会出现请求失败的情况，不清楚是小佩服务器还是集成的问题，如果当下这个时间点有合适的价格我应该会选择能接入米家的产品，这样也就意味着接入 HA 也比较稳定。

除此之外，后来发现小佩之前的产品出现过安全问题，如有顾虑的谨慎购入。

### 传感类

*   摄像头：乐橙 TA3 ⭐⭐⭐
*   传感器：米家门窗传感器（查看有没有偷偷进我卧室），米家人体传感器（查看进食情况）⭐⭐

基于同样的原因，我选择了支持 ONVIF 标准的乐橙 TA3，可以比较直接接入 Home Assistant。在选择上建议大家选择带扬声器比较便宜的设备即可，使用频率不会很高。理论上也可以在 Home Assistant 搭建一套本地的目标识别服务来记录猫的行踪，但是目前我还没去折腾，仅仅在长时间离家的时候远程招呼一下猫确认情况。

传感器也不是必需的，不过因为之前租的房子比较老旧，卧室的门可以被猫挠开，所以出现过猫偷偷进去然后自己把自己锁在里面的情况，并且实在憋不住尿在了我床上。不过与其实时给我通知猫潜入的消息，我直接在拼多多买了一个插销从外面把门锁住了。

### 环境类

*   扫地机器人：石头 G10S ⭐⭐⭐⭐
*   空气净化器：米家空气净化器 F1

在今年春天猫换毛之前我从未设想过，一只 7 斤重的小猫咪能掉多少毛。后来渐渐家里地上都是北京春天地面杨絮一般的猫毛的时候，我才意识到我需要一个扫地机器人来拯救我。同样我选择了能接入米家和 Home Assistant 的石头 G10S，支持自动集尘和自动清洗拖布，并且可以加装自动上下水实现完全无人管理。如果不需要拖地功能，建议购买带自动集尘功能的即可。

另外我还二手购入了一个米家空气净化器 F1，结论是没啥卵用，对于吸附猫毛来说太为难它了，并且我也不对猫毛过敏所以没有办法评判它的具体效果。

展示、控制和自动化
---------

这部分会省略一些不必要的细节，仅提供必要的链接，毕竟都是现成的比较成熟的项目。

### 前端展示

这里先主要罗列一下用到的资源和文档。相关设备主要集中在 🐱 专属的 Tab，另外有空气净化器和扫地机器人的卡片的 Tab。

*   主题：[Minimalist](https://sspai.com/link?target=https%3A%2F%2Fui-lovelace-minimalist.github.io%2FUI%2F)
*   卡片：
    *   扫地机器人：[PiotrMachowski/lovelace-xiaomi-vacuum-map-card](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FPiotrMachowski%2Flovelace-xiaomi-vacuum-map-card)
    *   空气净化器：[denysdovhan/purifier-card](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2Fdenysdovhan%2Fpurifier-card)
*   卡片自定义：[thomasloven/lovelace-card-mod](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2Fthomasloven%2Flovelace-card-mod)
*   实体信息提取：[Templating - Home Assistant](https://sspai.com/link?target=https%3A%2F%2Fwww.home-assistant.io%2Fdocs%2Fconfiguration%2Ftemplating%2F%23limited-templates)

Minimalist 是带了相当多卡片模版的一款 HA 主题，总体来说比较容易上手配置。但是由于其实也很少会通过 UI 来控制设备，并且 HA 后续会在重新设计默认界面，引入更多的内置卡片，如果想要避免折腾慎重入坑 HA 前端。

同样扫地机器人和空气净化器的卡片我稍微用 card-mod 修改过以和其他卡片风格保持一致。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/bbdf6d394da28b305f9b304a7d94cf18.webp)

最后要额外提一下，如果要展示一些实体的属性的话，需要使用 HA 的模版语法来提取属性，并通过卡片透出。这里举一个简单的例子，从自动喂食器的 `feedserve.outfood_num` 属性来获取今天已经投喂的猫粮克数。竖线 `|` 分割的是过滤器，分别表示默认值为 0 之后乘 5，这样就把份数转化为克数了。

```
- sensor:
    - unique_id: mmgg_inland_pet_feeder_outcount
      icon: mdi:food
      name: "出粮总数"
      unit_of_measurement: "g"
      state: >
        {{ state_attr('sensor.mmgg_inland_9103_pet_feeder', 'feedserve.outfood_num') | default(0) | int(0) * 5}}

```

### 自动化

之前我是通过 Node-RED 实现自动化，后面就全部切成内置的自动化了。Node-RED 的有点是界面比较直观、上手快、容易调试，不过更推荐大家直接使用内置的自动化，是完全能够替代的。这里简单用几个例子抛砖引玉了。

#### 各种通知 🌟

前文提到我的一个主要需求是把不必要的 App 都禁用掉，这样需要 HA 来给我进行相应的通知。主要有以下几个：

*   喂食器出粮通知
*   猫上厕所通知
*   维护类通知：集便器满了、饮水机没水了、喂食器没粮了

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/c1782f69626c9b1a045c8e63d4a1a720.webp)

这里用的就是自带的 Confirmable Notification Blueprints，直接添加成脚本即可。

这里就不贴 YAML 了，本身是用 UI 配置的，这里指的注意的是文本里面也可以使用 Template 在通知里面透出相应的值。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/eeefe90bdff6adfae7f6b5625952a3f3.webp)

可以先把想要的通知脚本先制作好，然后再设置自动化触发这些通知脚本。

#### 自动喂食 🌟🌟

首先要做的是替换掉米家 App 进行自动喂食。如果使用过米家的就会发现几个痛点：

*   每天只有三个固定时间可以投喂
*   开关自动投喂必须进 App，没有办法语音和自动化，更别说周末关掉自动投喂，工作日打开自动投喂这种更复杂的需求了。

首先，我们制作一个投喂的脚本，这个脚本会触发自动喂食器进行投喂动作，这里需要通过 YAML 设置。这里调用了 [al-one/hass-xiaomi-miot](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2Fal-one%2Fhass-xiaomi-miot) 提供的 `xiaomi_miot.call_action` 服务，`siid` 和 `aiid` 确定了对目标实体执行的具体动作，可以从 [mmgg - 小米 / 米家产品库 - Xiaomi Miot Spec](https://sspai.com/link?target=https%3A%2F%2Fhome.miot-spec.com%2Fs%2Fmmgg) 这里找到对应的设备提供的指令集。投喂还需要指定份数，这个值我另外设置了一个辅助元素，默认是 5 份即 25g，可以根据自家小猫咪的食量设置。

```
alias: 投喂 Nova
fields:
  num:
    description: 投喂份数，每份 5g
    example: "3"
sequence:
  - service: xiaomi_miot.call_action
    data:
      siid: 2
      aiid: 1
      params:
        - "{{ states('input_number.tou_wei_fen_shu') }}"
      entity_id: switch.mmgg_inland_feeding_measure
mode: single
icon: mdi:food

```

紧接着我们设置一个自动化，每天固定时间调用这个脚本进行喂食，直接用 UI 设置如下图所示。注意这里设置了一个环境条件会判断另外一个辅助元素「自动喂食」是否打开，这个可以让我控制停止自动喂食计划，比如我带猫回老家或者周末在家自己喂猫。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/61047831ac3f643cc8b869341ccdeee7.webp)

#### 自动清扫猫砂盆区域 🌟🌟🌟

这个例子我们实现一下猫上完厕所之后扫地机器人自动清扫猫砂盆区域或者自动开启空气净化器。

这个自动化的逻辑很简单，猫砂盆提供了一个「进入次数」的传感器，当这个传感器变化时，会通知到我的手机，这个通知脚本已经在第一个例子里面做好了。通知提供了一个「清扫地面」的按钮，这个按钮可以触发另一个「打扫猫砂盆」的脚本。核心的动作如下，即发送 `app_zoned_cleaned` 指令来进行固定区域的清扫，参数为矩形的四个顶点。获取这个坐标值的方法请参考 [Getting zone/point/outline coordinates](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FPiotrMachowski%2Flovelace-xiaomi-vacuum-map-card%2Fdiscussions%2F318)

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/f3e07130e5650ea8cc20c96c509a3042.webp)

### 快捷控制

除去自动化，偶尔也需要手动控制。因为打开 HA 应用太慢，可以通过设置脚本为桌面快捷方式或者磁铁来控制，如果有 WearOS 手表的话，也可以设置如下右滑快捷方式开关。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/f8df8b5ee567f6926745b65e86d81089.webp)

当然如果有小爱音箱，也可以直接通过语音来控制实体或者辅助元素。

后语
--

俗话说得好，相逢即是缘、没有丑猫猫只有懒主人。如果「不幸」命中注定遇到🐱且又很懒，希望上文能对大家有一点点的帮助。猫猫敬礼 (^^ ゞ！

> 下载 [少数派 2.0 客户端](https://sspai.com/page/client) 、关注 [少数派公众号](https://sspai.com/s/J71e)，解锁全新阅读体验 📰

> 实用、好用的 [正版软件](https://sspai.com/mall)，少数派为你呈现 🚀