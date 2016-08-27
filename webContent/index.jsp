<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
欢迎来到首页
</br>
<% 
String flag="";
Object obj = session.getAttribute("login_flag");
if(obj!=null){
    flag = obj.toString();
}
if(flag.equals("login_success")){%>
    <%HttpSession s = request.getSession(); String username = (String)s.getAttribute("username");%>
    <a href="<%=request.getContextPath()%>/personalPage.jsp"><%=username %></a>
    <a href="<%=request.getContextPath()%>/logoutServlet">EXIT</a>
<%}else{%>
    <a href="<%=request.getContextPath()%>/login.jsp">LOGIN</a>
    <a href="<%=request.getContextPath()%>/register.jsp">REIGISTER</a>
<%}%>
</body>
</html>