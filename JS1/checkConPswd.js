/*
 * 检测输入的两次密码是否一致
 * author 金威
 */ 
function checkConPswd(oField ,text){//oField和text是两个密码框的对象
	if(oField.value!=text.value){  //判断两次输入的密码是否一致
        oField.placeholder="两次输入的密码不一致";
    	 return false; 
    }
}