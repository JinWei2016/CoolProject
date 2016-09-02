<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/navigator.css">
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    <%-- navigator --%>
    <nav class="navbar navbar-default" id="nav">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand " href="<%=request.getContextPath()%>/index.jsp">LOGO</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=request.getContextPath()%>/map.jsp" id="mya">MAP</a></li>
        <li><a href="<%=request.getContextPath()%>/showdata.jsp" class="mya">数据中心</a></li>
        <li><a href="<%=request.getContextPath()%>/recommend.jsp" class="mya">推荐院校</a></li>
        <li><a href="<%=request.getContextPath()%>/bbs.jsp" class="mya">bbs论坛</a></li>
        <% 
        String flag="";
        Object obj = session.getAttribute("login_flag");
        if(obj!=null){
            flag = obj.toString();
        }
        if(flag.equals("login_success")){
            HttpSession s = request.getSession(); String username = (String)s.getAttribute("username");%>
            <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=username %>&nbsp;<span class="caret"></span></a>
            <ul class="dropdown-menu mymenu">
            <li><a href="<%=request.getContextPath()%>/personalPage.jsp" class="mya">个人中心</a></li>
            <li><a href="<%=request.getContextPath()%>/myfavorite.jsp" class="mya">收藏夹</a></li>
            <li><a href="<%=request.getContextPath()%>/message.jsp" class="mya">消息中心</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="<%=request.getContextPath()%>/logoutServlet" class="mya">退出</a></li>
          </ul>
        </li>
      <%}else{%>
        <li><a href="<%=request.getContextPath() %>/login.jsp"><span class="glyphicon glyphicon-user" ></span>&nbsp;登录</a><li>
        <li><a href="<%=request.getContextPath() %>/register.jsp"><span class="glyphicon glyphicon-log-in" ></span>&nbsp;注册</a></li>
<%}%>
      </ul>
    </div>
  </div>
</nav> 