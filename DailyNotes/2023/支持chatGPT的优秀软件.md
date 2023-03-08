> 本文由 [简悦 SimpRead](http://ksria.com/simpread/) 转码， 原文地址 [anotherdayu.com](https://anotherdayu.com/2023/4866/)

> 本文将介绍几种应用 ChatGPT API 的方法，并持续在 个人网站中更新，包括 Bob、Popclip 和 Siri。

> 更多相关 Chrome 插件和 Prompts 技巧请见：[https://anotherdayu.com/2023/4811/](https://anotherdayu.com/2023/4811/)

今天，OpenAI 发布了 ChatGPT API（gpt-3.5-turbo），每 1k 个 tokens 的价格为 0.002 美元，比之前的 GPT-3.5 模型便宜 10 倍。

但 API 的形式对普通用户来说并不算友好，本文将介绍几种应用 ChatGPT API 的方法，包括了几大常见使用场景，将持续更新。

感谢这些插件的开发者，将这些出色的项目开源，降低了非程序员群体使用的门槛。最近，越来越能认识到 Alfred、Bob、Popclip 这些软件的生命力，良好的框架和社区氛围，是好创意的土壤。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-02-at-21.55.32@2x-1024x496.webp)

[OpenCat](https://apps.apple.com/app/opencat/id6445999201?mt=12)，这是一个使用 API 密钥的本地桌面 ChatGPT 客户端。比起 ChatGPT 每月 20 美元的订阅费，轻度使用，通过 API 使用的价格会低很多。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-04-at-22.19.29@2x-1024x656.webp)


[ChatGPT-Telegram-Workers](https://github.com/TBXark/ChatGPT-Telegram-Workers)，是我目前看到门槛最低的 Telegram Bot 配置教程，无需服务器，通过 Cloudflare Workers 配置。[Github 文档](https://github.com/TBXark/ChatGPT-Telegram-Workers/blob/master/DEPLOY.md)已经将教程写的非常详细。

还可以生成多个 Telegram Bot，每个负责不同的功能，可玩性很高。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-1-1024x830.webp)

[Bob](https://bobtranslate.com/) 是一款非常优秀的 macOS 翻译软件，非常推荐购买。之前一直用的是 DeepL 插件，比 GPT 3.0 API 的速度快很多。

`gpt-3.5-turbo` 更新后，OpenAI API 的翻译速度得到明显提升，完全可以作为主力使用。

**安装教程：**

首先，准备好 OpenAI 的账户，打开 API keys 页面： [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys) 。点击 `create new secret key`，即可生成 API。  

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-02-at-20.07.13@2x-1024x545.webp)

下载 Bob 付费版，并设置 macOS 软件权限。

确认 Bob 在后台运行，下载插件：[openai-translator.bobplugin](https://github.com/yetone/bob-plugin-openai-translator/releases) （由 [@yetone](https://twitter.com/yetone) 开发），并双击打开 `openai-translator.bobplugin` ，插件安装成功。

之后，需要在 Bob 的「设置 - 服务」中点击 `+`，启用 OpenAI API。  

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-02-at-20.02.34@2x-1024x486.webp)

然后在「服务」中，填入 API Key，选择模型 `gpt-3.5-turbo-0301`，点击保存。

`gpt-3.5-turbo-0301` 和 `gpt-3.5-turbo` 好像没有区别。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-02-at-20.04.07@2x-1024x859.webp)

Notion Ai 使用起来非常方便，但只能在 Notion 内使用，Popclip 论坛中的一位[老哥](https://forum.popclip.app/t/a-popclip-extension-for-chatgpt-updated/1283/18)实现了这一点。这个插件只要在文本编辑器中，就能使用，如 Obsidian 和 Words，甚至是微信、Telegram 的聊天窗口。

**安装教程：**

首先，安装 Popclip，并设置 macOS 软件权限。

确认 Popclip 正在运行，选中以下代码，就会跳出 Popclip 的插件安装选项：「Install Extension」，点击即可完成安装。

```
// #popclip extension for ChatGPT
// name: ChatGPT
// icon: iconify:logos:openai-icon
// language: javascript
// module: true
// entitlements: [network]
// options: [{
//   identifier: apikey, label: API Key, type: string,
//   description: 'Obtain API key from https://platform.openai.com/account/api-keys'
// }]
const messages = []; // history of previous messages
async function chat (input, options) {
  const openai = require("axios").create({
    baseURL: "https://api.openai.com/v1",
    headers: { Authorization: `Bearer ${options.apikey}` },
  });
  messages.push({ "role": "user", "content": input.text });
  const { data } = await openai.post("/chat/completions", {
    model: "gpt-3.5-turbo", messages
  });
  messages.push(data.choices[0].message);
  return input.text.trimEnd() + "\n\n" + messages.at(-1).content.trim();
};
exports.actions = [{
  title: "ChatGPT: Chat",
  after: "paste-result",
  code: chat,
}, {
  title: "ChatGPT: Reset",
  icon: "iconify:game-icons:broom",
  requirements: [],
  after: "show-status",
  code: () => messages.length = 0 // clear the message history
}];
```

安装完成后，要在设置中输入 API，即可使用（如下图所示）。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-02-at-22.00.53@2x.webp)

然后，选中文本，点击 PopClip 中的图标即可使用（下图 gif 的测试环境是 Obsidian）。

另外，有一个扫帚形状的图标，可以重置聊天记录，开始新对话。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-02-at-21.08.18.gif)

校对和润色选中文字的 Popclip 插件，完整教程见：[ChatGPT Proofreader extension for Popclip](https://reorx.com/makers-daily/003-chatgpt-proofreader-extension-popclip/)

先下载以下两个快捷指令（原作者不详，有知道的请在评论区留言）。

**安装教程：**

先添加下面两个快捷指令。

*   GPT3.5 X Siri – 语音版尝鲜： [https://www.icloud.com/shortcuts/a8e39045960641549c603c97397cf888](https://www.icloud.com/shortcuts/a8e39045960641549c603c97397cf888)
*   GPT3.5 X Siri – 文字版尝鲜: [https://www.icloud.com/shortcuts/dc8f48a94b4b44a1ac22c0d486269492](https://www.icloud.com/shortcuts/dc8f48a94b4b44a1ac22c0d486269492)

然后，要将快捷指令的名称更改成「便于朗读的」，系统语言是中文的话，也要将快捷指令的名称改为中文（英文语言的话，快捷指令也是英文的名字）。

可以点击启动，也可以通过 Siri 启动。

语音启动 Siri 的时候要慢一些，比如我的快捷指令名叫「小西瓜」。那么说完「Hi，Siri！」之后，停顿一下，再说「小西瓜」，等手机显示「Hello, I’m GPT!」，再说指令。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-02-at-21.41.14@2x-1024x639.webp)

[OpenAI Text-Completion Workflow for Alfred](https://github.com/yohasebe/openai-text-completion-workflow)，功能挺全的。

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-1024x354.webp)

![](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/CleanShot-2023-03-05-at-00.02.22@2x-1024x933.webp)

再分享一些有趣的 OpenAI API 应用项目：

*   [Awesome ChatGPT API](https://github.com/reorx/awesome-chatgpt-api)，整理了各种基于 ChatGPT API 的工具和应用。
*   使用 OpenAI API 翻译电子书：[bilingual_book_maker](https://github.com/yihong0618/bilingual_book_maker)，每本书大概花费在 3 美元左右。
*   将小爱同学接入 chatGPT API：[xiaogpt](https://github.com/yihong0618/xiaogpt)。
*   Keyboard Maestro + ChatGPT API 的插件：[https://sspai.com/post/78631](https://sspai.com/post/78631)

近期我使用频率最高的是 Popclip 和 Bob 的插件，Alfred workflow 目前还有很多不足，期待后续更新。