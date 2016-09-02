<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding='utf-8'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/login.css">
<title>用户登录</title>
</head>
<body>
<jsp:include  page="navigator.jsp"/>
<%if(request.getAttribute("msg")!=null){%>
	<div>
	   <%=request.getAttribute("msg")%>
	</div>
<%} %>
<div class= "content">
    <form action="<%= request.getContextPath() %>/checkUserServlet" method="post" name="loginForm" class="form-horizontal" role="form">
        <%
        if(request.getAttribute("returnUrl")!=null){%>
            <input type = 'hidden' name ='returnUrl' value=<%=request.getAttribute("returnUrl") %>>
        <%
        }
        %>
       <div class="form-group" > 
         <label for="lastname" class="control-label myLabel" style="color: #ffffff">用户名</label>
           <div>
             <input type="text" class="form-control myLabel" id="username" name="username" placeholder="请输入用户名" > 
           </div>
       </div> 
       <div class="form-group" >
            <label for="lastname" class="control-label myLabel" style="color: #ffffff">密码</label>
         <div>
            <input type="password" class="form-control" id="lastname" name="password" placeholder="请输入密码">
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
            <button class="btn btn-lg btn-primary btn-self" onclick ="return check();">登陆</button>
         </div>
       </div>
    </form>
</div>
</body>

<script type = "text/javascript">
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