/*
 * 注册时校验用户名是否为空以及用户名只能为4-12位，只能是是字母（大小写敏感），数字，下划线，不能以下划线开头和结尾
 * 如果要更改用户名规定字数，在w{}中更改
 * author 金威
 */

function chenkNameForm(oField){//oField为文本框对象
	var str = oField.value; 
	var reg = /^[a-zA-Z\d]\w{3,11}[a-zA-Z\d]$/;//正则代表用户名就是4-12位的样子吧，只能是字母（大小写敏感），数字，下划线，不能以下划线开头和结尾
	if(!reg.test(str)){	
	oField.placeholder="用户名格式不正确！";
	 return false;
	}
}
