/*
  * 防止sql注入
  * 在需要防注入的文本框中输入
  * onblur="return AntiSqlValid(this)");//防止Sql脚本注入
  *  author 金威
  */
 
 function AntiSqlValid(oField )//oField为文本框对象
 {
     re= /select|update|delete|exec|count|'|"|=|;|>|<|%/i;
     if ( re.test(oField.value) )//查找输入文本中是否有sql关键字
     {
     alert("请您不要在参数中输入特殊字符和SQL关键字！"); //注意中文乱码
     oField.value = "";
     oField.className="errInfo";
     oField.focus();
     return false;
     }
 }