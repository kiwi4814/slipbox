---
Date: 2022-12-12 11:02:45
---
- MetaData
	- Date : 2022-12-12 11:02:45
	- DailyNotes : [[2022-12-12_周一]]
	- Link : [Getting "Blocked mirror for repositories" maven error even after adding mirrors - Stack Overflow](https://stackoverflow.com/questions/67833372/getting-blocked-mirror-for-repositories-maven-error-even-after-adding-mirrors)
	- Tag : #ZK卡片 
	maven[升级到3.8.1](http://maven.apache.org/docs/3.8.1/release-notes.html#cve-2021-26291)后默认禁止了不安全的连接，解决办法：

1. 新版本的settings文件中去掉blocked模块
2. 旧版本迁移过来的settings.xml增加如下配置：

   ```xml
   		<mirrors>
           <mirror>
               <id>maven-default-http-blocker</id>
               <mirrorOf>external:dummy:*</mirrorOf>
               <name>Pseudo repository to mirror external repositories initially using HTTP.</name>
               <url>http://0.0.0.0/</url>
               <blocked>true</blocked>
           </mirror>
       </mirrors>
   ```

   
