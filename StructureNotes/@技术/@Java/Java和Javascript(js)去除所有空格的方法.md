# Java和Javascript(js)去除所有空格的方法

### 正则表达式详解
**解析常用空格的正则表达式**为：

```java
[　*| *|\s*]*
```

其中正则表达式`\s`等同于`[ \r\n\f\t\v]`

```php
空格：为U+00A0,不换行空格(32);
\r：回车符(CARRIAGE_RETURN)，使光标到行首，ASCII 代码 13；
\n：换行符(LINE_FEED)，使光标下移一格，ASCII 代码 10；
\f：换页符,ASCII 代码 12；
\t：横向跳进字符，ASCII 代码 9，即水平制表符；
\v：纵向跳进字符，即垂直制表符。
```

上述正则表达式中，另有两个空格，分别为

```
U+3000	12288 	全角空格，表意文字空格，CJK（中日韩）符号及标点
U+0020	160		无中断空格（SPACE），可命名文件的空格类型
```

另外正则表达式中`\s`中包含的空格为：
`U+00A0`，十进制为`32`，`HTML`代码为`&nbsp;`，为最常用的不换行空格（NO-BREAK SPACE），即正常编译器中空格键打出的空格。
此外还有其他很多空格类型，都不包含在`\s`，由于不常用所以并未列在正则表达式中。

### Java去空格

#### 去除所有空格

```java
str.replaceAll("[　*| *|\\s*]*", "");
```

#### 去除句首句尾空格

```java
str.replaceAll("^[　*| *|\\s*]*", "").replaceAll("[　*| *|\\s*]*$";
```

### Javascript的正则表达式

##### 直接量语法

**`/pattern/attributes`**

- `js`中使用`//`定义的pattern不需要任何转义，只有`""`定义的字符串才需要转义字符。
##### 构造函数
**`new RegExp(pattern, attributes);`**
##### 参数
参数 `pattern` 是一个字符串，指定了正则表达式的模式或其他正则表达式。
参数 `attributes` 是一个可选的字符串，包含属性 "g"、"i" 和 "m"，分别用于指定全局匹配、区分大小写的匹配和多行匹配。ECMAScript 标准化之前，不支持 m 属性。如果 pattern 是正则表达式，而不是字符串，则必须省略该参数。
##### 返回值
一个新的 `RegExp` 对象，具有指定的模式和标志。如果参数 `pattern` 是正则表达式而不是字符串，那么 `RegExp()` 构造函数将用与指定的 `RegExp` 相同的模式和标志创建一个新的 `RegExp` 对象。
如果不用 `new` 运算符，而将 `RegExp()` 作为函数调用，那么它的行为与用 `new` 运算符调用时一样，只是当 `pattern` 是正则表达式时，它只返回 `pattern`，而不再创建一个新的 `RegExp` 对象。
##### 抛出
`SyntaxError` - 如果 `pattern` 不是合法的正则表达式，或 `attributes` 含有 `"g"`、`"i"` 和 `"m"` 之外的字符，抛出该异常。
`TypeError` - 如果 `pattern` 是 RegExp 对象，但没有省略 `attributes` 参数，抛出该异常。

### Javascript去空格
`JS` 字符串替换操作有`replace()` 方法，但是这个方法只能替换目标字符串中第一个匹配的字符串。
如果要将目标字符串全部替换的话，`java`里可以用`replaceAll`，但是`JS` 没有提供这样的方法，所以使用正则表达式来达到`replaceAll()`的效果：

#### 全局匹配的写法1

```javascript
str.replace(/[　*| *|\s*]*/g,"");
```

`g` 的意义是：执行全局匹配（查找所有匹配而不是在找到第一个匹配后停止）。

#### 全局匹配的写法2

```javascript
str.replace(new RegExp("[　*| *|\\s*]*","gm"),"");
```

#### 增加String 对象原型方法

```javascript
String.prototype.replaceAll  = function(s1,s2){     
    return this.replace(new RegExp(s1,"gm"),s2);     
} 
```

这样就可以在`js`代码中使用`replaceAll`方法了。



oracle去空格

`SELECT REGEXP_REPLACE('dark souls sin', '\s', NULL) FROM DUAL;`