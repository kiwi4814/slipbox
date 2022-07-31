# 常用JS函数

## 一、获取日期格式为`"YYYY-MM-dd"`所在月份的最后一天

```javascript
function getLastDay(year, month) {
	// 取下一个月的第一天
	var new_year = year;
	var new_month = month++;
	if(month > 11) {      
		new_month -= 12;
		new_year++;
 	}
	var new_date = new Date(new_year, new_month, 1);
	// 获取当前月的最后一天
	return (new Date(new_date.getTime() - 1000*60*60*24)).format("yyyy-MM-dd");//获取当月最后一天日期
}

Date.prototype.format = function(fmt) { 
    var o = { 
       "M+" : this.getMonth()+1,                 //月份 
       "d+" : this.getDate(),                    //日 
       "h+" : this.getHours(),                   //小时 
       "m+" : this.getMinutes(),                 //分 
       "s+" : this.getSeconds(),                 //秒 
       "q+" : Math.floor((this.getMonth()+3)/3), //季度 
       "S"  : this.getMilliseconds()             //毫秒 
   }; 
   if(/(y+)/.test(fmt)) {
           fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
   }
    for(var k in o) {
       if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
   return fmt; 
}
```
