/*
 * 注册时检测输入的用户名是否为空
 * author 金威
 */
function checkNameEmpty(oField){//oField是文本框对象
	if(oField.value==""){
		oField.placeholder="please enter username!";		
		return false;
	}
	
}