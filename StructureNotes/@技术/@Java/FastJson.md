# `FastJson`

`import`：

```java
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
```

#### 把字符串转换成`JSON`数据 

```java
JSONObject jsonObject = JSON.parseObject(jsonString);
```

#### 字符串和Java对象互转

```java
// 方法一 把json字符串转成Student对象  
Student stu1 = JSON.parseObject(jsonString, new TypeReference<Student>() {
  
});
// 方法二 把json字符串转成Student对象  
Student stu2 = JSON.parseObject(jsonString, Student.class);
// 方法三 把对象转换为JSON字符串
String studentJson = JSON.toJSONString(stu3);
```

#### 将字符串转换为数组

```java
// 转换为数组
Student[] stu2 = JSON.parseObject(jsonString, new TypeReference<Student[]>() {
  
});
```

#### 将字符串转换为`ArrayList`

```java
// 转换成ArrayList  
ArrayList<Student> list2 = JSON.parseObject(jsonText, new TypeReference<ArrayList<Student>>() {
});
```

#### Map和字符串互转

```java
public static void map2json() {
	//创建一个Map对象  
	Map<String, String> map = new HashMap<String, String>();
	map.put("username", "周伯通");
	map.put("address", "广东省仙游谷");
	map.put("age", "198");
	String json = JSON.toJSONString(map, true); //转成JSON数据  
	System.out.println(json);
	Map<String, String> map1 = (Map<String, String>) JSON.parse(json);
	//遍历数组数据
	for (String key : map1.keySet()) {
			System.out.println(key + ":" + map1.get(key));
	}
}
```



