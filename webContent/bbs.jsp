<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.String,entity.Post,java.sql.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <title>BBS - 首页</title>
    <meta http-equiv="Content-Type" content="text/html"  />
    <link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/css/global.css" />
    <link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/qa/css/qa.css" />
    <link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/css/responsive.css" />
    <script src="https://sf-static.b0.upaiyun.com/v-57c4094c/global/script/debug.js"></script>
    <link rel="stylesheet" href="css/bbs/bbs.css">
    <script src="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/script/debug.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link rel="icon" href="image/bbs/bbsIcon.ico" type="image/x-icon" />
</head><%-- <jsp:include  page="navigator.jsp"/>--%>
<script>
<%
Post [] post = null;
if(request.getAttribute("posts")==null){
    System.out.println("posts=null");
    request.getRequestDispatcher("getPostServlet").forward(request, response);
}else{
    System.out.println("posts=not null");
    post = (Post [])request.getAttribute("posts");
}
if(request.getAttribute("getDetail")!=null){
	if(((String)request.getAttribute("getDetail")).equals("failed")){
		//消息提示框
		
	}
}
%>

function loadMorePost(){
	
}
</script>
<body>

<%-- by lly --%>

<div class="global-nav shadow-bottom publish sf-header">
        <nav class="nav container">
            <div class="row hidden-xs">
                <div class="col-sm-9 col-md-7 col-lg-6 ">
                    <div class="bbs-header__logo">
                        <h1><a href="#">1
                    </a></h1>
                        <small>BBS</small>
                    </div>

                </div>
                <div class="col-sm-3 col-md-5 col-lg-6 text-right">
                    <form class="header-search  hidden-sm hidden-xs mr20" action="#" method="post">
                        <button class="btn btn-link"><span class="sr-only">搜索</span><span class="glyphicon glyphicon-search"></span></button>
                        <input id="searchBox" name="q" type="text" placeholder="输入关键字搜索帖子" class="form-control" value="" />
                    </form>
                    <ul class="opts list-inline hidden-xs">
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
            
            <% }else{%>
            	
            	<li><a href="<%=request.getContextPath() %>/login.jsp"><span class="glyphicon glyphicon-user" ></span>&nbsp;登录</a><li>
        <li><a href="<%=request.getContextPath() %>/register.jsp"><span class="glyphicon glyphicon-log-in" ></span>&nbsp;注册</a></li>
            	
            <%}
            %>
                    </ul>
                </div>

            </div>
        </nav>

    </div>

    <div class="bbsglobal-navTags">
        <div class="container">
            <nav class=" nav">
                <ul class="nav__list">
                    <li class="nav__item"><a href="<%=request.getContextPath() %>/bbs.jsp" class="active"><i class="fa fa-home"></i>首页
                            </a></li>
                    <li class="nav__item"><a href="/timeline"><i class="fa fa-list-alt"></i>热门推荐
                            </a></li>
                    <li class="nav__item nav__item--split"><a><span class="split"></span></a></li>
                    <li class="nav__item tag-nav__item"><a href="#">清华大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="#">北京大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="#">东南大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="#">计算机科学</a></li>
                    <li class="nav__item tag-nav__item"><a href="#">土木工程</a></li>
                    <li class="nav__item tag-nav__item"><a href="#">江苏</a></li>
                    <li class="nav__item nav__item--more" data-open="0">
                        <a class="nav__item--more-link" href="javascript:void(0)">
                            <div class="tag__more"><i class="tag__more--icon"></i><i class="tag__more--icon"></i><i class="tag__more--icon"></i></div>
                        </a>
                    </li>
                </ul>
                
               
            </nav>
        </div>
    </div>
    
    <div class="wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 main">
                    <ul class="nav nav-tabs nav-tabs-zen mb10 mt30">
                        <li class="active"><a href="">最新</a></li>
                        <li><a href="">最热</a></li>
                    </ul>
                    
                    <div class="stream-list question-stream">
                    <%-- 获取数据 --%>
    <%
    if(post==null){
    	
    	
    }else{
        int size = post.length;
        for(int i =size-1;i>=0 ;i--){
            %><%--loop --%>
            <section class="stream-list__item">
                            <div class="qa-rank">
                                <div class="votes hidden-xs">
                                    <%=post[i].getLikeNumber() %><small>点赞</small>
                                </div>
                                <div class="myanswers myanswered">
                                    <%=post[i].getCommentNumber() %><small>回答</small>
                                </div>
                                <div class="views hidden-xs">
                                    <%=post[i].getViewNumber() %><small>浏览</small>
                                </div>
                            </div>
                            <div class="summary">
                                <ul class="author list-inline">
                                    <li>
                                        <a href=""></a>
                                        <span class="split"></span>
                                        <a href="" ><%=post[i].getCreateDate() %></a>
                                    </li>
                                </ul>
                                <h2 class="mytitle"><a href="getDetailServlet?id=<%=post[i].getPostid()%>" onclick=""><%=post[i].getPostname() %></a></h2>
                                <ul class="taglist--inline ib">
                                    <%
                                    String [] tagGroup = post[i].getTags().split(",");
                                    for(int j=0;j<tagGroup.length;j++){%>
                                    	<li class="tagPopup"><a class="mytag mytag-sm" href="" data-toggle="popover" data-original-title="" data-id=""><%=tagGroup[j]%></a></li>
                                    <%}
                                    %>
                                </ul>
                            </div>
                        </section>
            <%
        }
    }
    %>   
                    </div>
                </div>
                
                <%-- 点击加载更多 
                 <form class="loadMore">
                    
                    <button  onclick="loadMorePost()">加载更多</button>
                </form> --%>
                              
                
                <div class="col-xs-12 col-md-3 side mt30">
                    <div class="side-ask alert alert-warning">
                        <p>你有什么想和大家一起分享的呢？</p>
                        <a href="<%=request.getContextPath() %>/postEditor.jsp" class="mt10 btn btn-primary btn-block">发帖</a>
                        <div class="mt10 side-system-notice">
                            <i class="fa fa-bullhorn pull-left"></i><a class="side-system-notice--title" href="">这里应该有一个链接，具体没想好</a>
                        </div>
                    </div>
                    <div class="mywidget-messages">
                        <a class="mywidget-messages__item" href="myfavorites.jsp">我的收藏</a>
                        <%-- <a class="mywidget-messages__item" href="">我的发帖</a>--%>
                        <a id="inviteCount" class="mywidget-messages__item" href="my-message.jsp">@我的</a>
                    </div>
                </div>
                <%-- 排行榜 --%>
                
        </div>
    </div>
    </div>
</body>
</html>