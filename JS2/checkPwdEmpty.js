/*
 * 注册时检测密码是否为空
 */
function check(oField){//oField为文本框对象
if(oField.value==""){
	oField.placeholder="please enter password!";
        return false;  
    }
}