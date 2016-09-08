<%@ page language="java" contentType="text/html; charset=UTF-8" import="entity.User,java.util.Date"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- Bootstrap --%>
  <link href="css/personal/bootstrap.css" rel="stylesheet" media="screen" />
  <link href="css/personal/thin-admin.css" rel="stylesheet" media="screen" />
  <link href="css/personal/font-awesome.css" rel="stylesheet" media="screen" />
  <link href="css/personal/style.css" rel="stylesheet" />
  <link href="css/personal/dashboard.css" rel="stylesheet" />
<title>我的收藏</title>
</head>
<body>
<%
User user = new User();
if(request.getAttribute("personalInfo")==null){
    System.out.println("personalInfo=null");
    request.getRequestDispatcher("showFavoriteServlet").forward(request, response);
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
              <li > <a href="#"> <i class="icon-desktop"></i> 我的收藏 <i class="arrow icon-angle-left"></i></a>
                <ul class="sub-menu">
                  <li> <a href="#pictures"> <i class="icon-angle-right"></i> 图片 </a> </li>
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
                <h2 class="page-title">卢修明 <small>早上好</small></h2>
              </div>
            </div>

            <div class="row"><%--row--%>
              <div class="col-lg-12">
                <%--我的收藏--%>
                <div class="widget">
                  <div class="widget-header"> <i class="icon-arrow-down"></i>
                    <h3>我的收藏</h3>
                  </div>
                  <div class="widget-content">
                    <ul class="nav nav-tabs" id="myTab">
                      <li class="active"><a data-toggle="tab" href="#pictures">图片</a></li>
                      <li class=""><a data-toggle="tab" href="#my-tizi">帖子</a></li>
                      <li class=""><a data-toggle="tab" href="#my-friends">好友</a></li>
                      <li class=""><a data-toggle="tab" href="#my-tables">表格</a></li>
                    </ul>
                    <%--tab-content--%>
                    <%--我的图片--%>
                    <div class="tab-content" id="myTabContent">
                     <%--pictures--%>
                     <div id="pictures" class="tab-pane fade active in">
                      <%--图片廊--%>
                      <div id="examples" class="section examples-section">
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-1.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-1.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-2.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-2.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-3.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-3.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-4.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-4.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-5.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-5.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-6.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-6.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-7.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-7.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-md-2">
                          <div class="image-row">
                            <div class="image-set"> <a class="example-image-link" href="image/personal/gallery-photo/image-8.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward."> <img class="example-image" src="image/personal/gallery-photo/thumb-8.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                          </div>
                        </div>
                      </div><%--图片廊--%>
                    </div> <%--pictures--%>
                    <%--我的帖子--%>
                    <div id="my-tizi" class="tab-pane fade">
                      <form>

                        <div class="tizi"> <a href="666">深度探究东南大学到底是一本还是三本</a>  </div>
                        <div class="tizi"> <a href="666">深度探究东南大学到底是一本还是三本</a>  </div>
                        <div class="tizi">  <a href="666"> 深度探究东南大学到底是一本还是三本</a>  </div>
                        <div class="tizi"> <a href="666"> 深度探究东南大学到底是一本还是三本</a>  </div>
                      </form>
                    </div><%--我的帖子--%>
                    <%--我的好友--%>
                    <div id="my-friends" class="tab-pane fade">
                      <form>

                        <div class="friend"> <img src="image/personal/profile.jpg" class="img-circle"> &nbsp;&nbsp;<a href="666">凌丽阳</a>  </div>
                        <div class="friend"> <img src="image/personal/profile.jpg" class="img-circle">  &nbsp;&nbsp;<a href="666">凌丽阳</a>  </div>
                        <div class="friend"> <img src="image/personal/profile.jpg" class="img-circle">&nbsp;&nbsp; <a href="666"> 凌丽阳</a>  </div>
                        <div class="friend"> <img src="image/personal/profile.jpg" class="img-circle">&nbsp;&nbsp; <a href="666"> 凌丽阳</a>  </div>
                      </form>
                    </div><%--我的好友--%>
                    <%--我的表格--%>
                    <div id="my-tables" class="tab-pane fade">
                      <%--table--%>

                      <div class="widget widget-table action-table">
                        <div class="widget-header"> <i class="icon-th-list"></i>
                          <h3> Table </h3>
                        </div>
                        <%-- /widget-header --%>
                        <div class="widget-content">

                          <table class="table table-striped table-bordered">
                            <thead>
                              <tr>
                                <th> 资源 </th>
                                <th> 下载</th>
                                <th class="td-actions"> </th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td> abc </td>
                                <td>123 </td>
                                <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                              </tr>
                              <tr>
                                <td>abc </td>
                                <td>123 </td>
                                <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                              </tr>
                              <tr>
                                <td> abc </td>
                                <td> 123</td>
                                <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                              </tr>
                              <tr>
                                <td> abc</td>
                                <td>123 </td>
                                <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                              </tr>
                              <tr>
                                <td> abc </td>
                                <td> 123 </td>
                                <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                              </tr>
                            </tbody>
                          </table>

                        </div>
                        <%-- /widget-content --%> 
                      </div><%--table--%><%--我的表格--%>

                    </div>
                  </div><%--tab-content--%>
                </div><%--widget-content--%>
              </div><%--widget--%>
            </div>
          </div><%--row--%>
        </div>
      </div><%--page-content--%>
    </div><%----%>
    <div class="bottom-nav footer"> 2016 &copy; Tpersonal center   </div>

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