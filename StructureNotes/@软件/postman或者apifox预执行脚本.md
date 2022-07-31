+++
title = "apifox/postman预执行脚本原理及设置"
date = 2022-06-19 19:19:20
slug = "/prescript"
draft = false
tags = ["工具","技术"]
series = ["技术"]
toc = false
+++

### 前言

当我们使用Postman或者Apifox调试后端接口的时候，大部分项目都会传入jwt-token为项目鉴权，而且jwt-token会有过期时间，Postman或者Apifox为我们提供了一个预执行脚本的功能，可以让我们每次在调用后端接口之前先去获取token并将其缓存起来，直到这个token过期。



本文将以apifox为例简单叙述下如何设置。



需要准备的事项：

1. 获取token的接口路径及入参，本文示例代码的路径为：`{BASE_URL}/oauth2/password`，参数是`username`和`password`，分别对应用户名和密码。
2. 系统token过期时间

### 步骤

首先，我们需要在我们要调试的环境中预先加一些变量。

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202206201905199.png" alt="image-20220620190454648" style="zoom: 50%;" />

需要填入的四个变量分别为：

- ACCESS_TOKEN：用来缓存jwt_token的值
- ACCESS_TOKEN_EXPIRES：用来缓存jwt_token过期的时间
- username：登录账号
- password：登录密码



然后我们在项目设置 -> 公共脚本中新建一个脚本，脚本内容如下：



```javascript
function timestampFormat(timestamp) {
    var date = new Date(timestamp);
    return date.getFullYear() +
        "-" + (date.getMonth() + 1) +
        "-" + date.getDate() +
        " " + date.getHours() +
        ":" + date.getMinutes() +
        ":" + date.getSeconds();
}

// 定义发送登录接口请求方法
function sendLoginRequest() {
    // 获取环境里的 前置URL
    const baseUrl = pm.environment.get('BASE_URL');
    console.log("前缀URL为：" + baseUrl);
    // 登录用户名，这里从环境变量 username 中获取
    const username = pm.environment.get('username');
    console.log("登录用户名为：" + username);
    // 登录密码，这里从环境变量 password 中获取
    const password = pm.environment.get('password');
    console.log("登录密码为：" + password);
    // 构造一个 POST x-www-form-urlencoded 格式请求。这里需要改成你们实际登录接口的请求参数。
    const loginRequest = {
        url: baseUrl + '/oauth2/password',
        method: 'POST',
        body: {
            mode: 'urlencoded',
            urlencoded: [
                { key: 'username', value: username },
                { key: 'password', value: password }
            ]
        }
    };

    // 发送请求。
    // pm.sendrequest 参考文档: https://www.apifox.cn/help/app/scripts/api-references/pm-reference/#pm-sendrequest
    pm.sendRequest(loginRequest, function (err, res) {
        if (err) {
            console.log(err);
        } else {
            // 读取接口返回的 json 数据。
            // 如果你的 token 信息是存放在 cookie 的，可以使用 res.cookies.get('token') 方式获取。
            // cookies 参考文档：https://www.apifox.cn/help/app/scripts/api-references/pm-reference/#pm-cookies
            const jsonData = res.json();
            // 将 accessToken 写入环境变量 ACCESS_TOKEN
            pm.environment.set('ACCESS_TOKEN', jsonData.result.jwt_token);
            console.log("更新TOKEN为：" + jsonData.result.jwt_token);
            // 将 accessTokenExpires 过期时间写入环境变量 ACCESS_TOKEN_EXPIRES
            var accessTokenExpires = new Date().getTime() + 86400000;
            pm.environment.set('ACCESS_TOKEN_EXPIRES', accessTokenExpires);
            console.log("更新TOKEN过期时间为：" + timestampFormat(accessTokenExpires));
        }
    });
}
console.log("=====开始执行前置脚本=====");
// 获取环境变量里的 ACCESS_TOKEN
const accessToken = pm.environment.get('ACCESS_TOKEN');
// console.log("当前TOKEN为：" + accessToken);
// 获取环境变量里的 ACCESS_TOKEN_EXPIRES
const accessTokenExpires = pm.environment.get('ACCESS_TOKEN_EXPIRES');
console.log("当前时间为：" + timestampFormat(new Date().getTime()));
console.log("过期时间为：" + timestampFormat(accessTokenExpires));
// 如 ACCESS_TOKEN 没有值，或 ACCESS_TOKEN_EXPIRES 已过期，则执行发送登录接口请求
const nowTime = new Date().getTime();
const send = (!accessToken) || (!accessTokenExpires) || (accessTokenExpires <= nowTime);
if (send) {
    console.log("=====TOKEN已过期，发送请求重新获取=====");
    sendLoginRequest();
}
console.log("=====结束执行前置脚本=====");

```



很简单的js脚本，其中调试的时候为了方便查看执行过程加入了一些变量的打印，可以按照需要精简。





最后，我们在环境设置页面的全局参数中增加全局变量，就可以默认让每个接口都带上jwt-token参数

<img src="https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202206201914710.png" alt="image-20220620191356450" style="zoom:50%;" />



当我们请求接口的时候，可以设置预执行脚本，选到我们刚才增加的脚本，就可以自动更新jwt-token了。

![image-20220620191600744](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com//img202206201916786.png)