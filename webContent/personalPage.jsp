<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath() %>/css/personalPage.css" rel="styleSheet">
<title>Personal Page</title>
</head>
<body>
<%HttpSession s = request.getSession(); String username = (String)s.getAttribute("username");%>
Hello<%=username %>
<br/>
<a href="<%=request.getContextPath() %>/index.jsp">回到首页</a>

</body>
</html>