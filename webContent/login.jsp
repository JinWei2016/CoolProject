<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding='utf-8'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
</head>
<body>
<%if(request.getAttribute("msg")!=null){%>
	<div>
	   <%=request.getAttribute("msg")%>
	</div>
<%} %>
    <form action="<%= request.getContextPath() %>/checkUserServlet" method="post" name="loginForm">
        <%
        if(request.getAttribute("returnUrl")!=null){%>
            <input type = 'hidden' name ='returnUrl' value=<%=request.getAttribute("returnUrl") %>>
        <%
        }
        %>
        username:<input type= "text" name="username" placeholder=""/><br/>
        password:<input type ="password" name= "password" placeholder="" /><br/>
        
        <input type="submit" value= "login" onclick ="return check(this);"/>
        <input type= "reset" value= "reset"/>
    </form>
</body>

<script type = "text/javascript">
function check(form){
	if(document.forms.loginForm.username.value==""){
		document.forms.loginForm.username.placeholder="please enter username!";
		return false;
	}
	if(document.forms.loginForm.password.value==""){
        document.forms.loginForm.password.placeholder="please enter password!";
        return false;  
    }

}
</script>
</html>