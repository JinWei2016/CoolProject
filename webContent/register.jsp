<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/login.css">
<title>注册页面</title>
</head>
<body style="background-image:url('image/register/registerBackground.jpg')">
<jsp:include  page="navigator.jsp"/>
<div class= "content">
<form class="form-horizontal " role="form" name="registerForm" action="<%=request.getContextPath()%>/registerServlet" method="post" onsubmit="return check()">
    <div class="form-group" > 
             <label for="lastname" class="control-label myLabel" style="color: #ffffff">用户名</label>
             <div >
            <input type="text" class="form-control" id="username" name="username"   placeholder="请输入用户名" > 
             </div>
        </div> 
        <div class="form-group" >
        <label for="lastname" class=" control-label myLabel" style="color: #ffffff">密码</label>
        <div >
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
        </div>
        </div>
        <div class="form-group" >
        <label for="lastname" class=" control-label myLabel " style="color: #ffffff">确认密码</label>
        <div >
            <input type="password" class="form-control" id="password2" name="password2" placeholder="再次输入密码">
        </div>
        </div>
        <div class="form-group">
        <label for="lastname" class=" control-label myLabel" style="color: #ffffff">邮箱</label>
        <div>
            <input type="text" class="form-control" id="email" name="email" placeholder="请输入您邮箱" >
        </div>
    </div>
    <div class="form-group" >
            <label for="lastname" class="control-label myLabel" style="color: #ffffff">验证码</label>
         <div class="verifyArea">
         <div class="verifyInput">
            <input type="text" class="form-control" id="verify" name="verify" placeholder="请输入右侧验证码">
         </div>
         
         <div class="verifyPic">
            <input type="text" class="form-control" id="verify" placeholder="验证码">
         </div>
         </div>
       </div>

    <div class="form-group formBtn">
        <div>
            <button class="btn btn-lg btn-primary btn-self" onclick ="return check();">注册</button>
        </div>
    </div>
</form>
</div>
<div class="info">
    <%-- 介绍命名规范 --%>
</div>
</body>
<script>
function check(){
    if(document.getElementById("username").value==""){
        document.getElementById("username").placeholder="不能为空";
        return false;
    }
    
    var str =document.getElementById("username").value; 
    var reg = /^[a-zA-Z\d]\w{3,11}[a-zA-Z\d]$/;
    
    if(!reg.test(str)){
    document.getElementById("username").value="";
    document.getElementById("username").placeholder="包含非法字符";
     return false;
    }
    
    if(document.getElementById("password").value==""){
           document.getElementById("password").placeholder="不能为空";
            return false;  
    }
    
    if(document.getElementById("password").value!=document.getElementById("password2").value){
         document.getElementById("password2").value="";
         document.getElementById("password2").placeholder="两次输入不一致";
         return false; 
    }
    
    if(document.getElementById("email").value==""){
           document.getElementById("email").placeholder="不能为空";
    return false;
    }
    
    
    var temp = document.getElementById("email");
    
    var myreg = /^[0-9a-z][0-9a-z\-\_\.]+@([0-9a-z][0-9a-z\-]*\.)+[a-z]{2,}$/i
    if(!myreg.test(temp.value))

    {
    document.getElementById("email").value="";
    document.getElementById("email").placeholder="包含非法字符";
    return false;
    }
    re= /select|update|delete|exec|count|'|"|=|;|>|<|%/i;
    if((re.test(document.getElementById ("username") .value) )||(re.test(document.getElementById("password").value))||(re.test(document.getElementById("password2").value))||(re.test(document.getElementById("email").value))||(re.test(document.getElementById("verify")).value))
    {
        document.getElementById("verify").placeholder="请检查信息是否存在非法字符";
        return false;
    }
    return true;
}
</script>
</html>