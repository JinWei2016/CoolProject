<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <li class="opts__item dropdown hoverDropdown write-btns"><a class="dropdownBtn" data-toggle="dropdown" href="<%=request.getContextPath()%>/personalPage.jpg">个人中心<span
                                                                   class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right ">
                                <li><a href="/ask">私信</a></li>
                                <li><a href="/write">系统消息</a></li>
                            </ul>
                        </li>
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
                        <section class="stream-list__item">
                            <div class="qa-rank">
                                <div class="votes hidden-xs">
                                    0<small>点赞</small>
                                </div>
                                <div class="myanswers myanswered">
                                    1<small>回答</small>
                                </div>
                                <div class="views hidden-xs">
                                    46<small>浏览</small>
                                </div>
                            </div>
                            <div class="summary">
                                <ul class="author list-inline">
                                    <li>
                                        <a href="">这里是发帖人</a>
                                        <span class="split"></span>
                                        <a href="">这里是发帖时间</a>
                                    </li>
                                </ul>
                                <h2 class="mytitle"><a href="">这是一条帖子的标题</a></h2>
                                <ul class="taglist--inline ib">
                                    <li class="tagPopup"><a class="mytag mytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">东南大学</a></li>
                                    <li class="tagPopup"><a class="mytag mytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">软件工程</a></li>
                                    <li class="tagPopup"><a class="mytag mymytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">南京</a></li>
                                </ul>
                            </div>
                        </section>
                        <section class="stream-list__item">
                            <div class="qa-rank">
                                <div class="votes hidden-xs">
                                    0<small>点赞</small>
                                </div>
                                <div class="myanswers myanswered">
                                    1<small>回答</small>
                                </div>
                                <div class="views hidden-xs">
                                    46<small>浏览</small>
                                </div>
                            </div>
                            <div class="summary">
                                <ul class="author list-inline">
                                    <li>
                                        <a href="">这里是发帖人</a>
                                        <span class="split"></span>
                                        <a href="">这里是发帖时间</a>
                                    </li>
                                </ul>
                                <h2 class="mytitle"><a href="">这是一条帖子的标题</a></h2>
                                <ul class="taglist--inline ib">
                                    <li class="tagPopup"><a class="mytag mytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">东南大学</a></li>
                                    <li class="tagPopup"><a class="mytag mytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">软件工程</a></li>
                                    <li class="tagPopup"><a class="mytag mymytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">南京</a></li>
                                </ul>
                            </div>
                        </section>
                        <section class="stream-list__item">
                            <div class="qa-rank">
                                <div class="votes hidden-xs">
                                    0<small>点赞</small>
                                </div>
                                <div class="myanswers myanswered">
                                    1<small>回答</small>
                                </div>
                                <div class="views hidden-xs">
                                    46<small>浏览</small>
                                </div>
                            </div>
                            <div class="summary">
                                <ul class="author list-inline">
                                    <li>
                                        <a href="">这里是发帖人</a>
                                        <span class="split"></span>
                                        <a href="">这里是发帖时间</a>
                                    </li>
                                </ul>
                                <h2 class="mytitle"><a href="">这是一条帖子的标题</a></h2>
                                <ul class="taglist--inline ib">
                                    <li class="tagPopup"><a class="mytag mytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">东南大学</a></li>
                                    <li class="tagPopup"><a class="mytag mytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">软件工程</a></li>
                                    <li class="tagPopup"><a class="mytag mymytag-sm" href="" data-toggle="popover" data-original-title="" data-id="">南京</a></li>
                                </ul>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3 side mt30">
                    <div class="side-ask alert alert-warning">
                        <p>你有什么想和大家一起分享的呢？</p>
                        <a href="<%=request.getContextPath() %>/postEditor.jsp" class="mt10 btn btn-primary btn-block">发帖</a>
                        <div class="mt10 side-system-notice">
                            <i class="fa fa-bullhorn pull-left"></i><a class="side-system-notice--title" href="">这里应该有一个链接，具体没想好</a>
                        </div>
                    </div>
                    <div class="mywidget-messages">
                        <a class="mywidget-messages__item" href="">我的收藏</a>
                        <a class="mywidget-messages__item" href="">我的发帖</a>
                        <a id="inviteCount" class="mywidget-messages__item" href="">@我的</a>
                    </div>
                </div>
                <%-- 排行榜 --%>
                
        </div>
    </div>
    </div>
</body>
</html>