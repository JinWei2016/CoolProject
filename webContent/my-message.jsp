<%@ page language="java" contentType="text/html; charset=UTF-8" import="entity.User,java.util.Date"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="css/personal/bootstrap.css" rel="stylesheet" media="screen" />
  <link href="css/personal/thin-admin.css" rel="stylesheet" media="screen" />
  <link href="css/personal/font-awesome.css" rel="stylesheet" media="screen" />
  <link href="css/personal/style.css" rel="stylesheet" />
  <link href="css/personal/dashboard.css" rel="stylesheet" />
<title>消息中心</title>
</head>
<body>
<%
User user = new User();
if(request.getAttribute("personalInfo")==null){
    System.out.println("personalInfo=null");
    request.getRequestDispatcher("showMessageServlet").forward(request, response);
}else{
    System.out.println("personalInfo=not null");
    user = (User)request.getAttribute("personalInfo");
}
%>
<div class="container"><%--container--%>
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
        </div><%--左侧导航栏--%>
        </div><%--left-narve--%>
        <div class="page-content">
          <div class="content container">
            <div class="row">
              <div class="col-lg-12">
                <h2 class="page-title">卢修明 <small>早上好</small></h2>
              </div>
            </div>
            <div class="row"><%--row--%>
              <div class="col-lg-6"><%--col-lg-6--%>
                <div class="widget">
                  <div class="widget-header"> <i class="icon-tasks"></i>
                    <h3>系统消息</h3>
                  </div>
                  <div class="widget-content">
                    <div class="body">
                      <div id="accordion2" class="panel-group">
                        <div class="panel">
                          <div class="panel-heading"> <a href="#collapseOne" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed"> 消息一</a> </div>
                          <div style="height: 0px;" class="panel-collapse collapse" id="collapseOne">
                            <div class="panel-body"> hello</div>
                          </div>
                        </div>
                        <div class="panel">
                          <div class="panel-heading"> <a href="#collapseTwo" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed"> 消息二</a> </div>
                          <div class="panel-collapse collapse" id="collapseTwo" style="height: 0px;">
                            <div class="panel-body"> hello </div>
                          </div>
                        </div>
                        <div class="panel">
                          <div class="panel-heading"> <a href="#collapseThree" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">  消息三 </a> </div>
                          <div class="panel-collapse collapse" id="collapseThree" style="height: 0px;">
                            <div class="panel-body"> hello</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div><%--col-lg-6--%>
              <div class="col-lg-6">
                <div class="widget">
                  <div class="widget-header"> <i class="icon-ok-sign"></i>
                    <h3>好友消息</h3>
                  </div>
                  <div class="widget-content">
                    <div class="body">
                      <div id="accordion3" class="panel-group">
                        <div class="panel">
                          <div class="panel-heading"> <a href="#collapseOneTwo" data-toggle="collapse" class="accordion-toggle collapsed"> 来自凌丽阳的消息</a> </div>
                          <div class="panel-collapse collapse" id="collapseOneTwo" style="height: 0px;">
                            <div class="panel-body" href="#message"> hello
                            </div>
                          </div>
                        </div>
                        <div class="panel">
                          <div class="panel-heading"> <a href="#collapseTwoTwo" data-toggle="collapse" class="accordion-toggle collapsed">来自祁辉的消息</a> </div>
                          <div class="panel-collapse collapse" id="collapseTwoTwo" style="height: 0px;">
                            <div class="panel-body"> hello</div>
                          </div>
                        </div>
                        <div class="panel">
                          <div class="panel-heading"> <a href="#collapseThreeTwo" data-toggle="collapse" class="accordion-toggle collapsed"> 来自姜越的消息 </a> </div>
                          <div class="panel-collapse collapse" id="collapseThreeTwo">
                            <div class="panel-body">hello</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div><%--widget-content--%>
                </div><%--row--%>


              </div>
            </div>
            <%--聊天页面--%>
            <div class="row">
              <div class="col-lg-6">
                <div class="widget">
                  <div class="widget-header"> <i class="icon-file"></i>
                    <h3>Chats</h3>
                  </div>
                  <div class="widget-content">
                    <div class="timeline-messages"> 
                      <%-- Comment --%>
                      <div class="msg-time-chat"> <a href="#" class="message-img"><img class="avatar" src="image/personal/profile.jpg" alt=""></a>
                        <div class="message-body msg-in"> <span class="arrow"></span>
                          <div class="text">
                            <p class="attribution"><a href="#">卢修明</a> at 1:55pm, 13th April 2013</p>
                            <p>Hello</p>
                          </div>
                        </div>
                      </div>
                      <%-- /comment --%> 

                      <%-- Comment --%>
                      <div class="msg-time-chat"> <a href="#" class="message-img"><img class="avatar" src="image/personal/profile.jpg" alt=""></a>
                        <div class="message-body msg-out"> <span class="arrow"></span>
                          <div class="text">
                            <p class="attribution"> <a href="#">凌丽阳 </a> at 2:01pm, 13th April 2013</p>
                            <p>hello，how are you?</p>
                          </div>
                        </div>
                      </div>
                      <%-- /comment --%> 

                      <%-- Comment --%>
                      <div class="msg-time-chat"> <a href="#" class="message-img"><img class="avatar" src="image/personal/profile.jpg" alt=""></a>
                        <div class="message-body msg-in"> <span class="arrow"></span>
                          <div class="text">
                            <p class="attribution"><a href="#">卢修明</a> at 2:03pm, 13th April 2013</p>
                            <p>I'm fine,thank you.and you?</p>
                          </div>
                        </div>
                      </div>
                      <div class="msg-time-chat"> <a href="#" class="message-img"><img class="avatar" src="image/personal/profile.jpg" alt=""></a>
                        <div class="message-body msg-out"> <span class="arrow"></span>
                          <div class="text">
                            <p class="attribution"><a href="#">凌丽阳</a> at 2:05pm, 13th April 2013</p>
                            <p>me,too.</p>
                          </div>
                        </div>
                      </div>

                      <%-- /comment --%> 

                    </div>
                    <div class="chat-form">
                      <div class="input-cont">
                        <input type="text" placeholder="Type a message here...">
                      </div>
                      <div class="btn-cont"> <a class="btn btn-warning" href="javascript:;">Send</a> </div>
                    </div>
                  </div>
                </div>
              </div><%--聊天页面--%>
            </div><%--page-content--%>
          </div>
        </div>

      
      </div>
      <div class="bottom-nav footer"> 2016 &copy; personal center  </div>

      <%-- jQuery (necessary for Bootstrap's JavaScript plugins) --%> 
      <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script> 
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