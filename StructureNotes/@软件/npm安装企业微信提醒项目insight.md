---
Date: 2022-03-25 13:39:02
---
- MetaData
	- Date : 2022-03-25 13:39:02
	- DailyNotes : [[2022-03-25_周五]]
	- Link : [从0到1，Nginx部署Nodejs+React教程 - 简书 (jianshu.com)](https://www.jianshu.com/p/5af19b772948)
	- Tag : #ZK卡片 


团队每天开晨会，每天都要在群里@所有人取某某会议室开会，后来想不如加一个机器人来完成这个事情，一开始的想法是使用云函数来实现，后来在github上发现了造好的轮子，可以定时提醒，于是在公司的服务器上搭建了一个。在此记录一下。

[elliottssu/insight: Insight是一个可以管理企业微信群机器人的小工具，可以非常方便的往群里发布即时消息和定时消息。 (github.com)](https://github.com/Elliottssu/insight)

需要的工具：
Node、MySQL

clone项目后修改后端项目config中的配置文件，修改为自己能连接的数据库。

主要安装过程根据[从0到1，Nginx部署Nodejs+React教程 - 简书 (jianshu.com)](https://www.jianshu.com/p/5af19b772948)操作，然后启动项目使用的是pm2，安装过程如下：

```
npm i -g pm2

vim ~/.bashrc
export PATH=$PATH:/usr/local/nodejs/lib/node_modules/pm2/bin
source ~/.bashrc
pm2 status
## 启动
pm2 start npm --name "insight-front-end" -- start
pm2 start "npm run dev" --name insight-back-end
 
```



pm2相关链接：
[node.js - Can pm2 run an 'npm start' script - Stack Overflow](https://stackoverflow.com/questions/31579509/can-pm2-run-an-npm-start-script)
[node.js - How should I use pm2 command for npm run dev - Stack Overflow](https://stackoverflow.com/questions/42912067/how-should-i-use-pm2-command-for-npm-run-dev)
[➫ How to npm run start at the background ⭐️ | by Ido Montekyo | idomongo | Medium](https://medium.com/idomongodb/how-to-npm-run-start-at-the-background-%EF%B8%8F-64ddda7c1f1)

