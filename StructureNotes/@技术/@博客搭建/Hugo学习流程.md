# Hugo学习流程

## 一、基础概念

### Content Section.文章分区



### Front Matter.文章元数据



## 二、文件结构

在命令行中执行 `hugo new site` 命令时将在当前目录下生成下面几个文件夹：

```
.
├── archetypes
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes
```

下面先简单介绍下这几个文件夹：

### `archetypes`

执行完`hugo new site` 命令时打开`archetypes`文件夹，可以看到里面只有一个`default.md`，里面的内容是：

```markdown
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
---
```

基于我们在按照教程入门Hugo时的一些实践，可以猜测这个就是创建博客时默认使用的模板。

事实上也正是如此，当使用`hugo new`命令创建一篇新的文章时，会基于这个`default.md`创建新的文档。

当然了，也可以选择`archetypes`文件夹下创建自己的模板，这样在使用`hugo new`命令时会根据一定的规则选择合适的模板。

### `content`

文章内容，按照Content Section分区

### `data`

数据目录，存储结构数据，可以用`YAML`，`JSON`或`TOML`格式编写数据文件，可用`.Site.Data.xxxx`的方式来获取数据

### `layouts`

模版目录，以`.html`文件形式存储模板，这些模板指定如何将内容目录中的源文件呈现到静态网站中
模版包括：主页模版、单页模板、列表模版、分类模版、模块模版等

### `static`

静态文件目录，存储所有静态内容，如：Image，CSS，JavaScript等
当Hugo建立您的网站时，静态目录内的所有文件均按原样复制生成，可有来存储效验文件、`CNAME`文件等

### `themes`

主题文件夹

### `config.toml`

配置文件



此外，还有`assets`、`config`、`resources`等。



## 二、命令参数

帮助命令——`hugo help` 

```
hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at http://gohugo.io/.

Usage:
  hugo [flags]
  hugo [command]

Available Commands:
可用的命令：
  completion  generate the autocompletion script for the specified shell
  
  config      Print the site configuration
  convert     Convert your content to different formats
  deploy      Deploy your site to a Cloud provider.
  env         Print Hugo version and environment info
  gen         A collection of several useful generators.
  help        Help about any command
  import      Import your site from others.
  list        Listing out various types of content
  mod         Various Hugo Modules helpers.
  new         Create new content for your site
  server      A high performance webserver
  version     Print the version number of Hugo

Flags:
参数：
  -b, --baseURL string             hostname (and path) to the root, e.g. http://spf13.com/
  -D, --buildDrafts                include content marked as draft
  -E, --buildExpired               include expired content
  -F, --buildFuture                include content with publishdate in the future
      --cacheDir string            filesystem path to cache directory. Defaults: $TMPDIR/hugo_cache/
      --cleanDestinationDir        remove files from destination not found in static directories
      --config string              config file (default is path/config.yaml|json|toml)
      --configDir string           config dir (default "config")
  -c, --contentDir string          filesystem path to content directory
      --debug                      debug output
  -d, --destination string         filesystem path to write files to
      --disableKinds strings       disable different kind of pages (home, RSS etc.)
      --enableGitInfo              add Git revision, date and author info to the pages
  -e, --environment string         build environment
      --forceSyncStatic            copy all files when static is changed.
      --gc                         enable to run some cleanup tasks (remove unused cache files) after the build
  -h, --help                       help for hugo
      --i18n-warnings              print missing translations
      --ignoreCache                ignores the cache directory
      --ignoreVendor               ignores any _vendor directory
      --ignoreVendorPaths string   ignores any _vendor for module paths matching the given Glob pattern
  -l, --layoutDir string           filesystem path to layout directory
      --log                        enable Logging
      --logFile string             log File path (if set, logging enabled automatically)
      --minify                     minify any supported output format (HTML, XML etc.)
      --noChmod                    don't sync permission mode of files
      --noTimes                    don't sync modification time of files
      --path-warnings              print warnings on duplicate target paths etc.
      --poll string                set this to a poll interval, e.g --poll 700ms, to use a poll based approach to watch for file system changes
      --print-mem                  print memory usage to screen at intervals
      --quiet                      build in quiet mode
      --renderToMemory             render to memory (only useful for benchmark testing)
  -s, --source string              filesystem path to read files relative from
      --templateMetrics            display metrics about template executions
      --templateMetricsHints       calculate some improvement hints when combined with --templateMetrics
  -t, --theme strings              themes to use (located in /themes/THEMENAME/)
      --themesDir string           filesystem path to themes directory
      --trace file                 write trace to file (not useful in general)
  -v, --verbose                    verbose output
      --verboseLog                 verbose logging
  -w, --watch                      watch filesystem for changes and recreate as needed

Additional help topics:
  hugo check      Contains some verification checks

Use "hugo [command] --help" for more information about a command.
```



## 三、配置文件
[[Hugo配置文件详解]]