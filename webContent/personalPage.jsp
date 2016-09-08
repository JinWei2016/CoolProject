<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entity.User,java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <%-- Bootstrap --%>
  <link href="css/personal/bootstrap.css" rel="stylesheet" media="screen" />
  <link href="css/personal/thin-admin.css" rel="stylesheet" media="screen" />
  <link href="css/personal/font-awesome.css" rel="stylesheet" media="screen" />
  <link href="css/personal/style.css" rel="stylesheet" />
  <link href="css/personal/dashboard.css" rel="stylesheet" />
<title>个人中心</title>
</head>
<body>
<%
User user = new User();
if(request.getAttribute("personalInfo")==null){
	System.out.println("personalInfo=null");
	request.getRequestDispatcher("showPersonalServlet").forward(request, response);
}else{
	System.out.println("personalInfo=not null");
	user = (User)request.getAttribute("personalInfo");
}
%>
<div class="container">
        <%--导航栏--%>
          <div class="top-navbar header b-b"> <a data-original-title="Toggle navigation" class="toggle-side-nav pull-left" href="#"><i class="icon-reorder"></i> </a>
            <div class="brand pull-left"> <a href="index.jsp"><img src="image/personal/个人中心_1.png" /></a></div>

            <ul class="nav navbar-nav navbar-right  hidden-xs">
              <li class="dropdown"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-warning-sign"></i> <span class="badge">2</span> </a>
                <ul class="dropdown-menu extended notification">
                  <li class="title">
                    <p>您有2条新通知</p>
                  </li>
                  <li> <a href="#"> <span class="label label-success"><i class="icon-plus"></i></span> <span class="message">hello</span> <span class="time">1 mins</span> </a> </li>
                  <li> <a href="#"> <span class="label label-danger"><i class="icon-warning-sign"></i></span> <span class="message">warning</span> <span class="time">5 mins</span> </a> </li>
                  <li class="footer"> <a href="#">查看所有通知</a> </li>
                </ul>
              </li>

              <li class="dropdown"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-envelope"></i> <span class="badge">3</span> </a>
                <ul class="dropdown-menu extended notification">
                  <li class="title">
                    <p>您有三条新消息</p>
                  </li>
                  <li> <a href="#"> <span class="photo"> <img src="image/personal/profile.jpg" width="34" height="34" /></span> <span class="subject"> <span class="from">凌丽阳</span> <span class="time">Just Now</span> </span> <span class="text"> hello</span> </a> </li>
                  <li> <a href="#"> <span class="photo"><img src="image/personal/profile.jpg" width="34" height="34" /></span> <span class="subject"> <span class="from">祁辉</span> <span class="time">35 mins</span> </span> <span class="text"> 可爱 </span> </a> </li>
                  <li> <a href="#"> <span class="photo"><img src="image/personal/profile.jpg" width="34" height="34" /></span> <span class="subject"> <span class="from">姜越</span> <span class="time">5 hours</span> </span> <span class="text">黑恶势力 </span> </a> </li>
                  <li class="footer"> <a href="#">查看所有消息</a> </li>
                </ul>
              </li>
              <li class="dropdown user  hidden-xs"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-male"></i> <span class="username"><%=user.getUsername() %></span> <i class="icon-caret-down small"></i> </a>
                <ul class="dropdown-menu">
                  <li><a href="myfavorites.jsp"><i class="icon-star"></i>我的收藏</a></li>
                  <li><a href="bbs.jsp"><i class="icon-tasks"></i>BBS</a></li>
                  <li class="divider"></li>
                  <li><a href="logoutServlet"><i class="icon-key"></i>退出</a></li>
                </ul>
              </li>
            </ul>
            <form class="pull-right" >
            <input type="search" placeholder="Search..." class="search" id="search-input" />
          </form>
        </div>
      </div><%--导航栏--%>
      <%--左侧导航栏--%>
      <div class="wrapper">
        <div class="left-nav">
          <div id="side-nav">
            <ul id="nav">
              <li class="current"> <a href="personalPage.jsp"> <i class="icon-dashboard"></i> 个人信息 </a> </li>
              <li> <a href="#"> <i class="icon-desktop"></i> 我的收藏 <i class="arrow icon-angle-left"></i></a>
                <ul class="sub-menu">
                  <li> <a href="myfavorites.jsp"> <i class="icon-angle-right"></i> 图片 </a> </li>
                  <li> <a href="myfavorites.jsp"> <i class="icon-angle-right"></i>帖子</a> </li>
                  <li> <a href="myfavorites.jsp"> <i class="icon-angle-right"></i> 好友 </a> </li>
                  <li> <a href="myfavorites.jsp"> <i class="icon-angle-right"></i> 表格 </a> </li>
                </ul>
              </li>

              <li> <a href="#"> <i class="icon-folder-open-alt"></i> 消息 <span class="label label-info pull-right">5</span> <i class="arrow icon-angle-left"></i></a>
                <ul class="sub-menu">
                  <li> <a href="my-message.jsp"><span class="label label-info pull-right">2</span> <i class="icon-angle-right"></i> 系统消息</a> </li>
                  <li> <a href="my-message.jsp"><span class="label label-info pull-right">3</span> <i class="icon-angle-right"></i> 好友消息 </a> </li>

                </ul>
              </li>
            </ul>
          </div>
        </div><%--左侧导航栏--%>
        <div class="page-content">
          <div class="content container">
            <div class="row">
              <div class="col-lg-12">
                <h2 class="page-title"><%=user.getUsername()%>&nbsp;<small><%Date date = new Date(); int hour = date.getHours();/*System.out.println(hour);*/if(hour>=0&&hour<12) {%>早上好<%}else if (hour>=12&&hour<13){%>中午好<%}else if(hour>=13&&hour<18){%>下午好<%}else{%>晚上好<%}%></small></h2>
              </div>
            </div>
            <div class="row"><%--row--%>
              <div class="col-lg-8"><%--col-lg-8--%>
                <div class="widget">
                  <div class="widget-header"> <i class="icon-tasks"></i>
                    <h3>个人信息</h3>
                  </div>
                  <div class="widget-content">

                    <%--personal--%>
                    <div class="body">
                      <form data-validate="parsley" class="form-horizontal label-left" id="user-form" >
                      <div class="row">
                        <div class="col-md-4">
                          <div class="text-align-center"> <img style="height: 112px;" alt="64x64" src="image/personal/user.jpg" class="img-circle" /> </div>
                        </div>
                        <div class="col-md-8">
                          <h3 class="no-margin"><%=user.getUsername() %></h3>
                          <address>
                          <%if(user.getProvince()==null){%>
                             <h4>未设置省份</h4>
                             <%}else{ %>
                             <%=user.getProvince() %>
                             <%} %>

                           <abbr title="Work email">E-mail:</abbr> <a href="mailto:#">
                           <%if(user.getEmail()==null){%>
                             <h4>未设置邮箱</h4>
                             <%}else{ %>
                             <%=user.getEmail() %>
                             <%} %>
                           </a><br />
                           <abbr title="Work Phone">Phone:</abbr>
                           <%if(user.getPhone()==0){%>
                             <h7>未设置号码</h7>
                             <%}else{ %>
                             <%=user.getPhone() %>
                             <%} %>
                         </address>
                       </div>
                     </div>

                     <fieldset>
                      <legend class="section">Personal Info</legend>
                      <div class="control-group">
                        <div class="per_information">
                          <ul id="nav" style="list-style:none;">
                            <li><a class="title">账 号：<a class="value">1562973</a></a></li>
                            <li><a class="title">昵 称：<a class="value">llll</a></a></li>
                            <li><a class="title">个 人：<a class="value">男 20岁</a></a></li>
                            <li><a class="title">高考分数：<a class="value">600</a></a></li>
                          </ul>
                          

                           <button type="button"  class=""
                          data-toggle="modal" href="#myModal-info">修改信息</button>
                          <button type="button"  class=""
                          data-toggle="modal" href="#myModal-pwd">修改密码</button>
                        </div><%--per_information--%>
                      </div>
                    </fieldset>
                  </form>
                </div>
                <%--personal--%>

              </div>
            </div>
          </div><%--col-lg-6--%>
        </div><%--row--%>







      </div>
    </div><%--page-content--%>
  </div>
  <div class="bottom-nav footer"> 2016 &copy; personal center </div>
  <%--更改个人信息--%>
  <%--模态框--%>
        <div class="modal fade" id="myModal-info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
           <div class="model-content model_1">
            <div class="modal-header model-header_1 ">

              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >
                &times;
              </button>
              <h4 class="modal-title" id="myModalLabel">
                个人信息更改
              </h4>
            </div>
            <div class=" modal-content model-content_1 ">
             
              <center>
                <form name="modify" method="post" action="success.html" 
                class="modify-form">
                  <div>省 份：<input class="" type="text" name="province"></div>
                  <br>
                   <div>电 话：<input class="" type="text" name="telephone"></div>
                  <br>
                   <div>Email：<input class="" type="text" name="email"></div>
                  <br><br><br>

                </form>
              </center>
            </div>
            <div class="widget-footer modal-footer_1" style="text-align:center;">

              <button type="button" class="btn btn-default" data-dismiss="modal">关闭
              </button>
              <button type="button" class="btn btn-primary">
                提交更改
              </button>

            </div>
          </div>
        </div>
      </div>
        <div class="modal fade" id="myModal-pwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
           <div class="model-content model_1">
            <div class="modal-header model-header_1 ">

              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >
                &times;
              </button>
              <h4 class="modal-title" id="myModalLabel">
                密码更改
              </h4>
            </div>
            <div class=" modal-content model-content_1 ">
             
              <center>
                
                <form name="modify" method="post" action="success.html" 
                class="modify-form">
                  <div>&nbsp;&nbsp;&nbsp;&nbsp;用户名：<input class="" type="text" name="userName"></div><br>

                   <div>原始密码：<input class="" type="passWord" name="passWord"></div>
                  <br>
                  <div>&nbsp;&nbsp;&nbsp;&nbsp;新密码：<input class="" type="passWord" name="passWord"></div>
                  <br>
                  <div>确认密码：<input class="" type="passWord" name="passWord"></div>
                  <br><br><br>

                </form>
              </center>
            </div>
            <div class="widget-footer modal-footer_1" style="text-align:center;">

              <button type="button" class="btn btn-default" data-dismiss="modal">关闭
              </button>
              <button type="button" class="btn btn-primary">
                提交更改
              </button>

            </div>
          </div>
        </div>
      </div>
<%--模态框--%><%--更改个人信息--%>
 
<%-- jQuery (necessary for Bootstrap's JavaScript plugins) --%> 
<script src="js/personal/jquery.js"></script> 
<script src="js/personal/bootstrap.min.js"></script> 
      <script type="text/javascript" src="js/personal/smooth-sliding-menu.js"></script> 
 <%--改变背景--%>
<%--switcher html start--%>
<div class="demo_changer active" style="right: 0px;">
  <div class="demo-icon"></div>
  <div class="form_holder">


     <div class="predefined_styles">
            <a class="styleswitch" rel="a" href=""><img alt="" src="image/personal/a.jpg"></a>  
            <a class="styleswitch" rel="b" href=""><img alt="" src="image/personal/b.jpg"></a>
            <a class="styleswitch" rel="c" href=""><img alt="" src="image/personal/c.jpg"></a>
            <a class="styleswitch" rel="d" href=""><img alt="" src="image/personal/d.jpg"></a>
            <a class="styleswitch" rel="e" href=""><img alt="" src="image/personal/e.jpg"></a>
            <a class="styleswitch" rel="f" href=""><img alt="" src="image/personal/f.jpg"></a>
            <a class="styleswitch" rel="g" href=""><img alt="" src="image/personal/g.jpg"></a>
            <a class="styleswitch" rel="h" href=""><img alt="" src="image/personal/h.jpg"></a>
            <a class="styleswitch" rel="i" href=""><img alt="" src="image/personal/i.jpg"></a>
            <a class="styleswitch" rel="j" href=""><img alt="" src="image/personal/j.jpg"></a>
          </div>

        </div>
      </div>


      <%--switcher html end--%>
      <script src="js/personal/switcher.js"></script> 
      <script src="js/personal/moderziner.custom.js"></script> 
      <link href="css/personal/assets/switcher/switcher.css" rel="stylesheet">
      <link href="css/personal/assets/switcher/switcher-defult.css" rel="stylesheet">
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/a.css" title="a" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/b.css" title="b" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/c.css" title="c" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/d.css" title="d" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/e.css" title="e" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/f.css" title="f" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/g.css" title="g" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/h.css" title="h" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/i.css" title="i" media="all" />
      <link rel="alternate stylesheet" type="text/css" href="css/personal/assets/switcher/j.css" title="j" media="all" /><%--改变背景--%>
</body>
</html>