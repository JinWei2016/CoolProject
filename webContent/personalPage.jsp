<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="service.DoUserService,entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Personal Page</title>
</head>
<body>
<jsp:include  page="navigator.jsp"/>
<%-- get username from session --%>
<%
HttpSession s = request.getSession();
String username;
if(s.getAttribute("username")==null){
	username="";
}else{
    username = (String)s.getAttribute("username");
}
%>
<%-- navigator --%>
Hello<%=username %>
<br/>
<a href="<%=request.getContextPath() %>/index.jsp">回到首页</a>
<%-- leftMenu --%>

<%-- content --%>

    <%-- if have modify message --%>
<%
;
if(request.getAttribute("modify_msg")!=null){
	String msg= request.getAttribute("modify_msg").toString();
	if(msg.equals("failed")){%>
<%-- modify failed -- a window to show msg; --%>



<%-- end --%>
<%  }else if (msg.equals("succeeded")){%>
<%-- modify succeeded -- a window to show msg; --%>




<%--end --%>
<%  }}%>
<%-- get user information --%>
<%--
DoUserService dus = new DoUserService();
User user = dus.getUserInformation(username);
String password = user.getPassword();
String email = user.getEmail();
String province = user.getProvince();
int phone = user.getPhone();
int grade = user.getGrade();
--%>



<%-- post form --%>
<form action="<%request.getContextPath();%>/updateUserServlet" method="post">
    <input type="hidden" name = "oldUsername" value=<%=username%>>
    <p>username: <input type="text" name="fname" /></p>
    <p>password: <input type="text" name="password" /></p>
    <%-- wait for ui designer --%>
    <input type="submit" value="Submit" />
</form>
</body>
<script>
<%-- modify information--change the ui --%>
function modifyUi(){
	 
}
</script>
</html>