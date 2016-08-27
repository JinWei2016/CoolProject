<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
INDEX<br/><br/>
<a href="<%= request.getContextPath() %>/personalPage.jsp">personalPage</a>
<% 
String flag="";
Object obj = session.getAttribute("flag");

if(obj!=null){
	flag = obj.toString();
}
if(flag.equals("login_success")){
%>
    <a href="<%=request.getContextPath()%>/logoutServlet">Exit</a>
<%}else{%>
    <a href="<%=request.getContextPath()%>/login.jsp">Login</a>
<%}%>
</body>
</html>