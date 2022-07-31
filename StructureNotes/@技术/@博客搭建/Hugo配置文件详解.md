---
Date: 2021-12-31 15:47:10
---
- MetaData
	- Date : 2021-12-31 15:47:10
	- DailyNotes : [[2021-12-31_周五]]
	- Link : [Configure Hugo](https://gohugo.io/getting-started/configuration/)
	- Tag : #ZK卡片 #Hugo 
# Hugo配置

## 一、Hugo配置

## 二、配置项

#### `archetypeDir` 

- 默认值："archetypes"
- 说明：指定archetypes的默认文件夹

#### `assetDir` 

- 默认值："assets"
- 说明：指定assets的默认文件夹

#### `contentDir` 

- 默认值："data"
- 说明：指定data的默认文件夹

#### `dataDir ` 

- 默认值："archetypes"
- 说明：指定archetypes的默认文件夹

#### `publishDir ` 

- 默认值："public"
- 说明：指定public的默认文件夹

#### `themesDir  ` 

- 默认值："themes"
- 说明：指定themes的默认文件夹

#### `baseURL` 

- 默认值：
- 说明：根目录的主机名（和路径）, 比如https://bep.is/。这个设置不影响你在本地运行，只会影响你部署到云端后，公开浏览的结果，若设置错误，网站就会异常，甚至暂时消失。

#### `blackfriday ` 

- 默认值：

- 说明：‎[Blackfriday](https://github.com/russross/blackfriday)是Hugo 中使用的[Markdown](http://daringfireball.net/projects/markdown/)渲染引擎。Hugo中的Blackfriday的默认设置已经很健全，可以适用于大多数的情况。

  但是同时Hugo还提供了一些选项对应于Blackfriday源码里的选项。

#### `build ` 
```toml
[build]
  noJSConfigInAssets = false
  useResourceCacheWhen = 'fallback'
  writeStats = false
```
- 默认值：
- 说明：‎构建相关的参数集合
  - **useResourceCacheWhen**：设置何时将 `/resources/_gen` 中的缓存资源用于 PostCSS 和 ToCSS 。有效值 `never`，`always` 和`fallback`。 最后一个值表示如果 PostCSS/扩展版本 不可用，则将尝试缓存。
  - **writeStats** ：
  - **noJSConfigInAssets**：


#### `buildDrafts ` 

- 默认值：false
- 说明：‎构建的时候是否包括草稿

#### `buildExpired ` 

- 默认值：false
- 说明：‎构建的时候是否包含过期的文章

#### `buildFuture ` 

- 默认值：false
- 说明：‎构建的时候是否包含发布日期在将来的文章

#### `caches ` 

- 默认值：
- 说明：‎配置缓存文件的配置组，详见[Configure Hugo](https://gohugo.io/getting-started/configuration/#configure-file-caches)

#### `cascade  ` 

- 默认值：
- 说明：‎级联配置

#### `canonifyURLs ` 

- 默认值：false
- 说明：‎将URL相对路径变为绝对路径

#### `copyright ` 

- 默认值：
- 说明：‎网站的版权声明，通常在页脚展示

#### `defaultContentLanguage ` 

- 默认值：
- 说明：‎没有语言指示符的内容将默认为此语言。

#### `defaultContentLanguageInSubdir ` 

- 默认值：
- 说明：‎

#### `disableAliases ` 

- 默认值：false
- 说明：‎禁用别名重定向。

#### `disableHugoGeneratorInject ` 

- 默认值：false
- 说明：‎

#### `disableKinds ` 

- 默认值：[]
- 说明：‎此选项可以禁用指定的Kinds。允许的值有：`"page"`, `"home"`, `"section"`, `"taxonomy"`, `"term"`, `"RSS"`, `"sitemap"`, `"robotsTXT"`, `"404"`.

#### `disableLiveReload ` 

- 默认值：false
- 说明：‎禁用浏览器窗口的自动实时重载

#### `disablePathToLower ` 

- 默认值：false
- 说明：‎不要将URL /路径转换为小写。

#### `enableEmoji ` 

- 默认值：false
- 说明：‎启用emoji表情

#### `enableGitInfo ` 

- 默认值：false
- 说明：‎如果Hugo项目是git项目，为每个页面启用.GitInfo。这将自动为你的页面增加`LastMod`参数，其值为此页面在git记录上的最后一次提交日期。

#### `enableInlineShortcodes ` 

- 默认值：false
- 说明：‎启用内联 shortcode支持，具体请查看[Create Your Own Shortcodes](https://gohugo.io/templates/shortcode-templates/#inline-shortcodes)

#### `enableMissingTranslationPlaceholders ` 

- 默认值：false
- 说明：‎如果缺少翻译，则显示占位符而不是默认值或空字符串。

#### `enableRobotsTXT ` 

- 默认值：false
- 说明：‎是否生成robots.txt文件

#### `frontmatter ` 

- 默认值：

  ```toml
  [frontmatter]
    date = ['date', 'publishDate', 'lastmod']
    expiryDate = ['expiryDate']
    lastmod = [':git', 'lastmod', 'date', 'publishDate']
    publishDate = ['publishDate', 'date']
  ```

- 说明：‎详细可查看[Configure Hugo](https://gohugo.io/getting-started/configuration/#configure-front-matter)，亦可查看[[对Front Matter的个人理解]]

#### `footnoteAnchorPrefix ` 

- 默认值：
- 说明：‎脚注锚的前缀。

#### `footnoteReturnLinkContents ` 

- 默认值：
- 说明：显示脚注返回链接的文本。

#### `googleAnalytics ` 

- 默认值：
- 说明：‎谷歌Analytics跟踪ID。

#### `hasCJKLanguage ` 

- 默认值：false
- 说明：‎如果为true，则在内容中自动检测中文/日语/韩语语言。

#### `imaging ` 

- 默认值：
- 说明：‎图片处理相关配置

#### `languageCode ` 

- 默认值：""
- 说明：‎RFC 5646定义的语言标记。

#### `languages ` 

- 默认值：
- 说明：‎配置语言

#### `disableLanguages ` 

- 默认值：
- 说明：‎禁用语言

#### `markup ` 

- 默认值：
- 说明：‎markdown语法相关配置

#### `mediaTypes ` 

- 默认值：
- 说明：‎自定义媒体格式

#### `menus ` 

- 默认值：
- 说明：[‎菜单配置](https://gohugo.io/content-management/menus/#add-non-content-entries-to-a-menu)

#### `minify ` 

- 默认值：
- 说明：‎压缩配置

#### `module ` 

- 默认值：
- 说明：‎没太搞懂，[Configure Modules | Hugo (gohugo.io)](https://gohugo.io/hugo-modules/configuration/)

#### `newContentEditor ` 

- 默认值：
- 说明：‎创建新内容时要使用的编辑器。

#### `noChmod ` 

- 默认值：
- 说明：‎不要同步文件的权限模式。

#### `noTimes ` 

- 默认值：
- 说明：‎不要同步文件的修改时间。

#### `outputFormats ` 

- 默认值：
- 说明：‎定义文件的输出格式

#### `paginate` 

- 默认值：
- 说明：‎分页参数

#### `paginatePath ` 

- 默认值： “page”
- 说明：‎分页期间使用的路径元素

#### `permalinks ` 

- 默认值：
- 说明：‎永久链接，详见 [Content Management](https://gohugo.io/content-management/urls/#permalinks).

#### `pluralizeListTitles ` 

- 默认值：
- 说明：‎采用复数形式列表中的标题。

#### `related ` 

- 默认值：
- 说明：‎

#### `relativeURLs ` 

- 默认值：
- 说明：‎

#### `refLinksErrorLevel ` 

- 默认值：
- 说明：‎

#### `refLinksNotFoundURL ` 

- 默认值：
- 说明：‎

#### `removePathAccents` 

- 默认值：
- 说明：‎

#### `rssLimit` 

- 默认值：
- 说明：‎

#### `sectionPagesMenu ` 

- 默认值：
- 说明：‎

#### `security ` 

- 默认值：
- 说明：‎

#### `sitemap ` 

- 默认值：
- 说明：‎

#### `baseURL` 

- 默认值：
- 说明：‎

#### `summaryLength ` 

- 默认值：
- 说明：‎

#### `taxonomies ` 

- 默认值：
- 说明：‎

#### `theme ` 

- 默认值：
- 说明：‎

#### `timeout ` 

- 默认值：
- 说明：‎

#### `timeZone ` 

- 默认值：
- 说明：‎

#### `title ` 

- 默认值：
- 说明：‎

#### `titleCaseStyle ` 

- 默认值：
- 说明：‎

#### `uglyURLs ` 

- 默认值：
- 说明：‎

#### `watch ` 

- 默认值：
- 说明：‎