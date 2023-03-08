随机挑几篇笔记展示成双链放在下面

1. 笔记一

主题：计算机网络

1. 协议的分类

- 按照作用范围分类
  - 通信协议
  - 网络层协议
  - 运输层协议
  - 应用层协议
- 按照交互方式分类
  - 面向连接的协议（TCP）
  - 无连接的协议（UDP）
- 按照数据交换方式分类
  - 基于电路交换的协议（PSTN）
  - 基于分组交换的协议（Internet）

2. OSI七层模型

- 物理层：传输0/1比特流，物理特性与接口有关。
- 数据链路层：将比特流组织成帧，进行差错控制和流量控制。
- 网络层：提供数据包的传输和路由选择，实现跨网络通信。
- 运输层：提供端到端可靠传输和差错控制，实现进程间通信。
- 会话层：负责建立、管理和终止会话。
- 表示层：将数据格式化为应用程序能处理的格式，如加密、压缩等。
- 应用层：提供用户接口和服务。

3. TCP/IP四层模型

- 网络接口层（或物理链路层）：负责将网络数据帧转换为比特流发送到物理介质上。
- 网际互联层（或网络层）：负责将IP数据报从源主机发送到目标主机，并实现路由选择。
- 运输层：提供端到端可靠传输和差错控制，包括TCP和UDP两个协议。
- 应用程序层：包括HTTP、FTP、SMTP等各种应用程序。

2. 笔记二

主题：操作系统

1. 进程管理

进程是指正在执行中的程序。操作系统通过进程管理来分配资源、调度任务、保护内存等。

进程状态：

- 就绪态（Ready）：正在等待分配处理器资源；
- 执行态（Running）：正在使用处理器执行指令；
- 阻塞态（Blocked）：因为某些原因不能运行而暂停；
- 终止态（Terminated）: 进程已经结束。

进程调度算法：

常见的调度算法有先来先服务调度算法、最短作业优先调度算法、时间片轮转调度算法等。不同的算法有不同的优缺点，在实际应用中需要根据具体情况选择合适数量和类型的算法。

2. 内存管理

内存管理是操作系统对内存空间进行分配、回收和保护等工作。常见的内存管理技术包括分页式内存管理、段式内存管理和虚拟内存技术。

虚拟内存技术是操作系统利用硬盘空间来扩展物理内存空间。虚拟地址空间被划分为多个页面，每个页面大小通常为4KB或者8KB，并按需加载到物理内存中。如果当前需要访问一个未加载到物理内存中的页面，则操作系统会将其从硬盘读取到物理内存中。

3. 文件系统

文件系统是操作系统对文件进行组织、分配和保护等工作。常见的文件系统包括FAT32文件系统、NTFS文件系统以及EXT4文件系统等。

文件是计算机上保存数据内容以及相关属性信息的一种逻辑单位，可以通过路径名来访问。不同类型的文件可以根据其属性进行分类，如文本文件、二进制文件等。

4. IO设备管理

IO设备是指计算机外部连接到计算机上并能够与之进行信息交换的各类设备。IO设备管理涉及到设备驱动程序编写、设备访问权限控制以及IO缓冲区设计等问题。


write an outline about 'how to find a Remote development work?'
Outline: How to Find Remote Development Work

I. Introduction
- Explanation of remote development work
- Advantages of remote work

II. Identify your skills and experience
- Assess your strengths and weaknesses
- Determine what type of remote work you are interested in
- Research the most in-demand skills for remote developers

III. Search for Remote Development Jobs
- Check popular job search websites such as LinkedIn, Indeed, and Glassdoor
- Look for remote-specific job boards such as Remote.co, We Work Remotely, and FlexJobs
- Utilize social media platforms like Twitter, Facebook and Reddit to find job leads

IV. Network with other developers 
- Join online communities such as GitHub, Stack Overflow, and HackerRank 
- Attend virtual events or webinars related to your field 
- Connect with other professionals on LinkedIn or other social media platforms 

V. Create a Compelling Resume & Portfolio 
- Tailor your resume to fit the specific job requirements 
- Showcase your best work in a portfolio website or GitHub profile 
- Highlight any relevant experiences working remotely 

VI. Prepare for Interviews 
- Research the company prior to the interview 
- Practice answering common interview questions for remote positions 
- Have a reliable internet connection and quiet workspace ready for video interviews 

VII. Conclusion
 - Recap of key points on finding remote development work  
 - Encouragement to continue seeking opportunities




