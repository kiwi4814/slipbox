所谓Front Matter，其实就是隐藏在MD文件最上方一些文件标签或者元数据（MetaData），默认情况下创建一篇文章时，这里会默认生成这篇文章的标题、创建日期以及草稿状态，我们可以根据Hugo提供的参数列表添加一些个性化的属性，也可以加到模板中以方便每次生成新文章时都有这些属性。



### 格式

Front Matter的格式支持YAML、TOML或者JSON，他们分别以"---"、"+++"和"{}"作为开头和结尾。

比如下面的三段代码展示了以三种不同格式撰写的Front Matter：

#### YAML

```yaml
---
categories:
- Development
- VIM
date: "2012-04-06"
description: spf13-vim is a cross platform distribution of vim plugins and resources
  for Vim.
slug: spf13-vim-3-0-release-and-new-website
tags:
- .vimrc
- plugins
- spf13-vim
- vim
title: spf13-vim 3.0 release and new website
---
```

#### TOML

```toml
+++
categories = ['Development', 'VIM']
date = '2012-04-06'
description = 'spf13-vim is a cross platform distribution of vim plugins and resources for Vim.'
slug = 'spf13-vim-3-0-release-and-new-website'
tags = ['.vimrc', 'plugins', 'spf13-vim', 'vim']
title = 'spf13-vim 3.0 release and new website'
+++
```

#### JSON

【注意】：JSON的开头和结尾必须单起一行，不要写成压缩的格式。

```json
{
   "categories": [
      "Development",
      "VIM"
   ],
   "date": "2012-04-06",
   "description": "spf13-vim is a cross platform distribution of vim plugins and resources for Vim.",
   "slug": "spf13-vim-3-0-release-and-new-website",
   "tags": [
      ".vimrc",
      "plugins",
      "spf13-vim",
      "vim"
   ],
   "title": "spf13-vim 3.0 release and new website"
}
```



### 属性

Hugo提供的属性有：

#### （1）Hugo预定义：

##### `aliases` 

- 说明：‎为当前页面增加一个或多个别名，比如你的一篇旧文章更新了，你在新的文章的aliases属性中加上新文章的链接，这时候有人访问你的旧文章时会自动跳转到新的文章页面。详见[URL Management](https://gohugo.io/content-management/urls/#aliases)。

##### `audio`

- 说明：【暂时没搞懂】

  > an array of paths to audio files related to the page; used by the `opengraph` [internal template](https://gohugo.io/templates/internal) to populate `og:audio`.

##### `cascade`

- 说明：级联

##### `date`

- 说明：分配给此页面的日期时间

##### `description`

- 说明：本文章的简述

##### `draft`

- 说明：草稿状态，在编译的时候不会编译属性为true的文章（除非编译的时候带有参数`--buildDrafts`）

##### `expiryDate`

- 说明：文章的过期时间。除非将`--buildExpired `标志传递给Hugo命令，否则将不会呈现过期的内容。

##### `headless`

- 说明：【暂时没搞懂】

  > if `true`, sets a leaf bundle to be [headless](https://gohugo.io/content-management/page-bundles/#headless-bundle).

##### `images`

- 说明：存放图片的相对路径的数组

##### `isCJKLanguage`

- 说明：**CJK文字**是[中文](https://zh.wikipedia.org/wiki/汉语)、[日文](https://zh.wikipedia.org/wiki/日文文字)和[韩文](https://zh.wikipedia.org/wiki/韓文)的统称，这些语言全部含有[汉字](https://zh.wikipedia.org/wiki/汉字)及其变体，某些会与其他文字混合使用。

##### `keywords`

- 说明：文章关键字

##### `layout`

- 说明：【暂时没搞懂】

  > the layout Hugo should select from the [lookup order](https://gohugo.io/templates/lookup-order/) when rendering the content. If a `type` is not specified in the front matter, Hugo will look for the layout of the same name in the layout directory that corresponds with a content’s section. See [“Defining a Content Type”](https://gohugo.io/content-management/types/#defining-a-content-type)

##### `lastmod`

- 说明：文章的最后修改时间。可配合Hugo配置项中的enableGitInfo。

##### `linkTitle`

- 说明：创建到本文章的链接。【暂时没搞懂】

  > used for creating links to content; if set, Hugo defaults to using the `linktitle` before the `title`. Hugo can also [order lists of content by `linktitle`](https://gohugo.io/templates/lists/#by-link-title).

##### `markup`

- 说明：实验功能，【暂时没搞懂】。

  > **experimental**; specify `"rst"` for reStructuredText (requires`rst2html`) or `"md"` (default) for Markdown.

##### `outputs`

- 说明：为文章指定输出格式，详见[Custom Output Formats | Hugo (gohugo.io)](https://gohugo.io/templates/output-formats/)

##### `publishDate`

- 说明：文章的发布日期

##### `resources`

- 说明：用于配置页面捆绑资源，详见 [Page Resources](https://gohugo.io/content-management/page-resources/).

##### `series`

- 说明：页面所属的分类，【暂时没搞懂】。

  > an array of series this page belongs to, as a subset of the `series` [taxonomy](https://gohugo.io/content-management/taxonomies/); used by the `opengraph` [internal template](https://gohugo.io/templates/internal) to populate `og:see_also`.

##### `slug`

- 说明：URL结尾的部分。

  关于此部分参见[[slug与url优化]]。

##### `summary`

- 说明：文章简要

##### `title`

- 说明：文章标题

##### `type`

- 说明：文章类型，未指定的话将自动从目录中派生。

##### `url`

- 说明：指定文章的完整路径，详见[URL Management](https://gohugo.io/content-management/urls/#set-url-in-front-matter).

##### `videos`

- 说明：an array of paths to videos related to the page; used by the `opengraph` [internal template](https://gohugo.io/templates/internal) to populate `og:video`.

##### `weight`

- 说明：文章的排序字段，值越小的越靠前，不能设置为0。

  另外，文章的排序规则为：Weight > Date > LinkTitle > FilePath

##### `<taxonomies>`

- 说明：属性的复数形式，比如tags和categories

#### （2）用户自定义

