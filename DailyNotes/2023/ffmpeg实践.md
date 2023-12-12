### 微信语音合成整段 mp3

1. 微信语音的缓存位置：`/Users/你的用户名/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat/2.0b4.0.9/fc51623d1f590ef8e60768335176d9a5/Message/MessageTemp/ef2ba724bdc4d1f98c21562165a08e05/Audio`

其中一些动态变量包括你的用户名、微信版本名、账户 ID 、群聊 ID 等，对于 mac 来说比较简单的方式就是右键在 finder 中展示（图片）

2. 微信的语音文件后缀格式为 `.silk`，可以转为 `.mp3`，网上方法有很多，这里使用的是 [kn007/silk-v3-decode](https://github.com/kn007/silk-v3-decoder) 这个项目，按照提示安装和操作即可

   ```bash
   sh converter.sh ./input ./output mp3
   ```

3. 排序，由于文件名称都是随机字符串，这一步需要手动排序

4. 使用 ffmpeg 合为一段

   （1）生成包含文件名list的 txt 文件，可以使用 tree 命令生成然后编辑

   ```
   file '/Users/XXX/Audio/001.4544276bc618168305c91.aud.mp3'
   file '/Users/XXX/Audio/002.45444687ae60a633bac20.aud.mp3'
   file '/Users/XXX/Audio/003.45446259ac4da4a43b7df.aud.mp3'
   file '/Users/XXX/Audio/004.454478340862260ff57bf.aud.mp3'
   file '/Users/XXX/Audio/005.45449b4fcd0c3df28c69a.aud.mp3'
   file '/Users/XXX/Audio/006.45450d163409fcaab13f2.aud.mp3'
   file '/Users/XXX/Audio/007.4545176eefa10182949ae.aud.mp3'
   file '/Users/XXX/Audio/008.45452b7c797a1e40ddb80.aud.mp3'
   file '/Users/XXX/Audio/009.454538eb1c9ba3c961c3b.aud.mp3'
   file '/Users/XXX/Audio/010.45454c0ea0439ca8a9ff8.aud.mp3'
   file '/Users/XXX/Audio/011.4545551496eb018da0cb7.aud.mp3'
   file '/Users/XXX/Audio/012.45456bc8ef9e631e4d66c.aud.mp3'
   file '/Users/XXX/Audio/013.4545763e2013c9ecf6dba.aud.mp3'
   file '/Users/XXX/Audio/014.45458883e8ffb80939432.aud.mp3'
   file '/Users/XXX/Audio/015.454593f9a074b985ecff4.aud.mp3'
   file '/Users/XXX/Audio/016.4546075913a47b99f29b4.aud.mp3'
   file '/Users/XXX/Audio/017.454613e1f0657ecbc7bd2.aud.mp3'
   file '/Users/XXX/Audio/018.45462dded3fd48cbd4a79.aud.mp3'
   file '/Users/XXX/Audio/019.4546391625c18e5c4c7b7.aud.mp3'
   file '/Users/XXX/Audio/020.45464e14e28695b018d1e.aud.mp3'
   file '/Users/XXX/Audio/021.45465431b1fb3ba99a7b0.aud.mp3'
   file '/Users/XXX/Audio/022.454660cb76992c35695bd.aud.mp3'
   file '/Users/XXX/Audio/023.4546795728b7084cd0b32.aud.mp3'
   file '/Users/XXX/Audio/024.45468590d51f3bb8a8538.aud.mp3'
   file '/Users/XXX/Audio/025.45469bad6ea08e558b170.aud.mp3'
   file '/Users/XXX/Audio/026.454707eb946f9ed11e25f.aud.mp3'
   file '/Users/XXX/Audio/027.4547165a6b9389fad2922.aud.mp3'
   file '/Users/XXX/Audio/028.454722a80aac8f0b2e7ed.aud.mp3'
   file '/Users/XXX/Audio/029.454733e774d7f8e6861a6.aud.mp3'
   file '/Users/XXX/Audio/030.4547474aff5be92d666de.aud.mp3'
   file '/Users/XXX/Audio/031.454758e0597c6eb5c5842.aud.mp3'
   file '/Users/XXX/Audio/032.45476116551b60d88acee.aud.mp3'
   file '/Users/XXX/Audio/033.45477657fa2d8efc23423.aud.mp3'
   file '/Users/XXX/Audio/034.454792252e7395a02a368.aud.mp3'
   file '/Users/XXX/Audio/035.45480550fc01a0df4ae22.aud.mp3'
   file '/Users/XXX/Audio/036.4548124a6a091168363b1.aud.mp3'
   file '/Users/XXX/Audio/037.45482f6423bea3674270e.aud.mp3'
   file '/Users/XXX/Audio/038.45483a0ed1cd394148236.aud.mp3'
   file '/Users/XXX/Audio/039.454841a0d7185be58dc31.aud.mp3'
   file '/Users/XXX/Audio/040.4548517479a6d391e9f0f.aud.mp3'
   file '/Users/XXX/Audio/041.45486c5641d5d4f33b588.aud.mp3'
   file '/Users/XXX/Audio/042.45487c0e4806b9ee484bf.aud.mp3'
   file '/Users/XXX/Audio/043.4548964b1c436f063b946.aud.mp3'
   ```

   

   （2）合成，语音与语音之间间隔 0.3 秒

   ```\
   ffmpeg -f concat -safe 0 -i filelist.txt -filter_complex "[0:a]adelay=0.3|0.3|0.3|...|0.3[aout]" -map "[aout]" output.mp3
   ```

   

### 从视频文件中提取字幕文件

```
ffmpeg -i Yellowstone\ 2022\ S05E01\ BluRay\ 1080p\ TrueHD\ 5.1\ x265.10bit-CHD.mkv -c:s srt -map 0:s:0 S05E01.srt
```

报错：`Subtitle encoding currently only possible from text to text or bitmap to bitmapError initializing output stream:`

![image-20231211102757251](https://kiwi4814-1256211473.cos.ap-nanjing.myqcloud.com/img/image-20231211102757251.webp)

说明字幕是图形格式的，需要转成 sup：

```
ffmpeg -i Yellowstone\ 2022\ S05E01\ BluRay\ 1080p\ TrueHD\ 5.1\ x265.10bit-CHD.mkv -c:s copy -map 0:s:0 S05E01.sup
```

