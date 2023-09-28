基础篇

本文先来介绍几个比较重要的概念以及相关的一些网站和软件等。

一、刮削

二、命名

其实根据目录结构的不同，我们可以将影视剧粗略的分为两种类型，电影和剧集，电影可能包括普通电影、音乐会、短片等，剧集可能包括电视剧、纪录片、动漫、综艺等等。要想正确的“自动”刮削出影视数据，首先是需要我们的命名符合一定的规范，我们来分开讲下电影和剧集在命名上的一些规则。

首先是电影，电影其实相对是很宽松的，因为正常的电影都是单文件（不包括蓝光原盘），所以只要你的名称是以电影的名称开头即可，当然一般的电影名是有相对固定的结构的，比如

.
├── docker
│  ├── moviepilot
│  │  ├── config
│  │  ├── main
│  │  └── docker-compose.yaml
│  └── nas-tools
└── 视频
   ├── link
   │  ├── 日番
   │  ├── 电影
   │  └── 电视剧
   ├── temp
   ├── 日番
   ├── 电影
   └── 电视剧





```yaml
version: "3"
services:
  moviepilot:
    image: jxxghp/moviepilot:latest
    ports:
        - 3020:3020 # web 接口
        - 3001:3001 # overseerr 接口
    restart: always
    network_mode: bridge
    hostname: moviepilot    
    volumes:   
      - /volume1/docker/moviepilot/main:/moviepilot #程序主目录，必选
      - /volume1/docker/moviepilot/config:/config #config 配置文件，必选
      - /volume1/视频:/volume1/视频
      - /volume1/docker/nas-tools:/volume1/docker/nas-tools
    environment: 
# 基础设置
      - NGINX_PORT=3020
      - PUID=0
      - PGID=0 
      - UMASK=000
      - SUPERUSER=admin   #登录账号
      - SUPERUSER_PASSWORD=  #登录密码
      - API_TOKEN=moviepilot
      - MOVIEPILOT_AUTO_UPDATE=true   #重启更新
      - PROXY_HOST=你的代理 # 代理地址
      - MOVIEPILOT_CN_UPDATE=true
      - TMDB_API_DOMAIN=api.tmdb.org      
# 下载目录设置
      - DOWNLOAD_PATH=/volume1/视频   # 下载保存目录
      - DOWNLOAD_CATEGORY=false #下载二级分类开关
      - DOWNLOAD_MOVIE_PATH=/volume1/视频/电影
      - DOWNLOAD_TV_PATH=/volume1/视频/电视剧
      - DOWNLOAD_ANIME_PATH=/volume1/视频/日番
# 媒体库目录设置
      - LIBRARY_PATH=/volume1/视频/link #媒体库目录
      - LIBRARY_MOVIE_NAME=电影   #电影目录名
      - LIBRARY_TV_NAME=电视剧    #电视剧目录名
      - LIBRARY_ANIME_NAME=日番   # 动漫目录名
      - LIBRARY_CATEGORY=true    # 媒体库自动分类功能
# 媒体库功能设置     
      - DOWNLOAD_SUBTITLE=true  # 下载站点字幕
      - DOWNLOADER_MONITOR=true  # 下载器监控
      - TORRENT_TAG=MOVIEPILOT   #种子标签
      - SCRAP_METADATA=true   # 刮削入库的媒体文件
      - REFRESH_MEDIASERVER=true    # 入库刷新媒体库
      - TRANSFER_TYPE=link      #转移方式，支持link/copy/move/softlink  
# CookieCloud设置
      - COOKIECLOUD_HOST=http://xxx:8080   #CookieCloud服务器地址 必须添加
      - COOKIECLOUD_KEY=  #cc用户KEY
      - COOKIECLOUD_PASSWORD=  #cc端对端加密密码
      - COOKIECLOUD_INTERVAL=180  # CookieCloud同步间隔（分钟）
      - USER_AGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203    #CookieCloud对应的浏览器UA，可选，同步站点后可以在管理界面中修改
#  消息通知渠道
      - MESSAGER=slack  #消息通知渠道
# slack通知
      - SLACK_OAUTH_TOKEN=xoxb-xxx #Slack Bot User OAuth Token
      - SLACK_APP_TOKEN=xapp-xxx #Slack App-Level Token
      - SLACK_CHANNEL=  #频道名称，默认全体
# 下载器设置
     ##qbittorrent设置项
      - QB_HOST=http://xxx:xxx # qbittorrent地址
      - QB_USER= #qbittorrent用户名
      - QB_PASSWORD= #qbittorrent密码
# 媒体服务器
      - MEDIASERVER=plex   
      - PLEX_HOST=http://xxx:32400 
      - PLEX_TOKEN=
      - MEDIASERVER_SYNC_INTERVAL:6   #媒体服务器同步间隔（小时）
# 用户认证
      - AUTH_SITE=audiences  #认证站点
      - AUDIENCES_UID= # 观众 ID 
      - AUDIENCES_PASSKEY= # 观众 passkey
# 其他设置
      - BIG_MEMORY_MODE=true  #大内存模式
```

