<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.lang.String,entity.Post"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="userRank" value="1" id="SFUserRank" />
<link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/css/global.css" />
<link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/qa/css/qa.css" />
<link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/css/responsive.css" />
<link rel="icon" href="image/bbs/bbsIcon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/bbs/bbs.css">
<script src="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/script/debug.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bbs/summernote.css" rel="stylesheet">
<script src="js/summernote.js"></script>
<%
Post post= new Post();
String author = null;
if(request.getAttribute("content")!=null){
    post = (Post)request.getAttribute("content");
    author = (String)request.getAttribute("author");
}else{
    //读取数据失败提示
    request.setAttribute("getDetail", "failed");
    request.getRequestDispatcher("bbs.jsp").forward(request, response);
}
boolean hasFollow = false;
Post [] follows = null;
if(request.getAttribute("follows")!=null){
	hasFollow = true;
	follows = (Post[])request.getAttribute("follows");
}
if(request.getAttribute("replymsg")!=null){
	String replymsg = (String)request.getAttribute("replymsg");
	if(replymsg.equals("failed")){
		//消息提示
		
	}
}
boolean liked = false;
boolean saved = false;
if(request.getAttribute("liked")!=null&&request.getAttribute("saved")!=null){
	liked = (boolean)request.getAttribute("liked");
	saved = (boolean)request.getAttribute("saved");
}
%>
<title><%=post.getPostname() %></title>
</head>
<body data-mod="qa" class="qa-question ">

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
                    <li class="nav__item"><a href="bbs.jsp"><i class="fa fa-home"></i>home
                            </a></li>
                    <li class="nav__item"><a href="/timeline"><i class="fa fa-list-alt"></i>东南大学
                            </a></li>
                    <li class="nav__item nav__item--split"><a><span class="split"></span></a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/javascript">东北大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/php">清华大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/python">北京大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/java">中国政法大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/mysql">浙江大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/ios">厦门大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/android">武汉大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/node.js">复旦大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/html5">上海交通大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/linux">南京大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/c%2B%2B">上海财经</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/css3">西安交通大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/git">中南大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/golang">暨南大学</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/ruby">北京理工</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/vim">北京航空航天</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/docker">南京理工</a></li>
                    <li class="nav__item tag-nav__item"><a href="/t/mongodb">南京师范</a></li>
                    <li class="nav__item nav__item--more"><a class="nav__item--more-link "href="/tags "><div class="tag__more "><i class="tag__more--icon "></i><i class="tag__more--icon "></i><i class="tag__more--icon "></i></div></a></li></ul><div class="tag-mgr__box
                        hide "><input class="tag-mgr__query " type="text " placeholder="搜索关注的标签 "
                               data-tags='null'><div class="mCustomScrollbar " data-mcs-theme="minimal-dark "><ul class="tag-mgr__list "></ul></div><a href="/tags " class="btn btn-primary btn-sm tag-mgr__btn">标签管理</a></div></nav></div></div><div class="wrap ">

    <div class="post-topheader ">
        <div class="container ">
            <div class="row ">
                <div class="col-md-9 col-sm-8 col-xs-12 ">
                    

                    <div class="post-topheader__info ">


  <h1 class="h3 post-topheader__info--title " id="questionTitle ">
                            <a href="/q/1010000006747638 "><%=post.getPostname() %></a>
                        </h1>

                        <ul class="taglist--inline inline-block question__title--tag mr10 ">
                            <li class="tagPopup mb5 ">
                            <%String tagString=post.getTags();
                            String [] tag = tagString.split(",");
                            for (int i=0;i<tag.length;i++){%>
                            <a href="" class="mytag"><%=tag[i] %></a>
                            <%} %>
                            </li>
                        </ul>
                   <div class="question__author ">
                            <a href="showPersonalServlet?id=<%=post.getAuthorId() %>" class="m"><strong><%=author %></strong></a>
                            <%=post.getCreateDate() %>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 col-xs-12 hidden-xs ">
                    <ul class="post-topheader__side list-unstyled ">
                        <li>
                        <% if(!liked){%>
                                                            <button type="button" id="sideFollow " class="btn btn-default btn-sm"
                                         data-do="follow" data-type="question"
                                        data-toggle="tooltip" data-placement="right" onclick="like()">点赞
                                </button>
                                <% }else{%>
                                <button type="button" id="sideFollow " class="btn btn-default btn-sm"
                                         data-do="follow" data-type="question"
                                        data-toggle="tooltip" data-placement="right" onclick="dislike()">取消赞
                                        </button>
                                <% }%>
                                                        <strong id="likeNum"><%=post.getLikeNumber() %></strong> 点赞
                        </li>
                        <li>
                        <%if(!saved){ %>
                                                            <button type="button" id="sideBookmark" class="btn btn-default btn-sm"
                                         data-type="question" onclick="save()">收藏
                                </button>
                                <% }else{%>
                                <button type="button" id="sideFollow " class="btn btn-default btn-sm"
                                         data-do="follow" data-type="question"
                                        data-toggle="tooltip" data-placement="right" onclick="dissave()">取消收藏
                                        </button>
                                <%} %>
                                                        <strong id="saveNum"><%=post.getSaveNumber() %></strong> 收藏<strong
                                    class="no-stress" id="viewId"><%=post.getViewNumber() %></strong> 浏览
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <div class="container mt30 ">
        <div class="row ">
            <div class="col-xs-12 col-md-9 main ">

                <article class="widget-question__item ">
                    <div class="post-col ">


                    </div>

                    <div class="post-offset ">
           <div class="question fmt ">
                                                            <p><%=post.getContent() %></p>

                        </div>



                        <div class="row ">
                            <div class="post-opt col-md-8 ">
                                <ul class="list-inline mb0 ">
                                  <li><a href="javascript:void(0); " class="comments " data-target="#comment-1010000006751445 ">
                                  评论</a></li>
                                      </ul>
                                  </li>
                              </ul>
                          </div>


                      </div>
                      <div class="widget-comments hidden">
                          <div class="widget-comments__form row">

                              <form class="clearfix" method="POST">
                                  <div class="form-group mb0 widget-comments__form--input">
                                    
                                      <textarea rows="1" name="text" class="form-control mono" id="commentText-1010000006751445" placeholder="使用评论询问更多信息或提出修改意见，请不要在评论里回答问题"></textarea>

                                  </div>
                                  <div class="widget-comments__btn">
                                      <div class="pull-right">
                                          <button type="submit" class="btn btn-default postComment"  onclick="postComment(<%=post.getPostid()%>)">提交评论</button>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
              </article>
                 <div class="widget-answers ">
        <h2 class="title h4 mt30 mb20 post-title " id="answers-title ">回复列表</h2>
<%
if(hasFollow){ 
	for(int i=0;i<follows.length;i++){
%>
   <article   class="clearfix widget-answers__item">
        <div class="post-col ">
            <div class="widget-vote ">
                <button type="button" class="like " data-type="answer" data-do="like" data-toggle="tooltip "
                        data-placement="top" onclick=""
                        title="答案对人有帮助，有参考价值 ">
                    <span class="sr-only ">答案对人有帮助，有参考价值</span>
                </button>
                                <span class="count">0</span>
                <button type="button"
                        class="hate"
                        data-type="answer"
                        data-do="hate"
                        data-toggle="tooltip"
                        data-placement="bottom" onclick=""
                        title="答案没帮助，是错误的答案，答非所问 ">
                    <span class="sr-only ">答案没帮助，是错误的答案，答非所问</span>
                </button>

            </div>
        </div>

        <div class="post-offset ">
            <div class="answer fmt " >
                                    <p>回复内容</p>
                            </div>


                            <div class="row answer__info--row">
                                <div class="post-opt col-md-8 col-sm-8 col-xs-10">
                                    <ul class="list-inline mb0">

                                        <li><a href="/q/1010000006751445/a-1020000006752857"><%=follows[i].getCreateDate() %></a> <span class="text-muted">

                        </span></li>
                                      
                                        <li><a href="javascript:void(0);" class="comments"  data-target="#comment-1020000006752857">
                        评论</a></li>

                                    
                                    </ul>
                                </div>

                                <div class="col-md-2 col-sm-2 col-xs-2 answer__info--author-avatar">
                                    <a class="mr10" href="/u/lddsb"><img class="avatar-32 " data-toggle="popover" data-slug="lddsb"  src="https://sfault-avatar.b0.upaiyun.com/308/748/3087486532-57bacbb6a4f38_big64" alt=""></a>
                                </div>
                                <div class="col-md-2 col-sm-2 hidden-xs answer__info--author">
                                    <div class=" answer__info--author-warp">
                                        <a class="answer__info--author-name" title="lddsb" href="/u/lddsb">lddsb</a><span class="answer__info--author-rank">52 声望</span></div>
                                </div>
                            </div>


                            <div class="widget-comments hidden" id="comment-1020000006752857">
                                <div class="widget-comments__form row">

                                    <form class="clearfix" method="POST">
                                        <div class="form-group mb0 widget-comments__form--input">
                                            <input name="id" type="hidden" value="1020000006752857" />
                                            <textarea rows="1" name="text" class="form-control mono" id="commentText-1020000006752857" placeholder="使用评论询问更多信息或提出修改意见，请不要在评论里回答问题"></textarea>

                                        </div>
                                        <div class="widget-comments__btn">
                                            <div class="pull-right">
                                                <button type="submit" class="btn btn-default postComment" onclick="postComment(<%=follows[i].getPostid()%>)">提交评论
                        </button>

                                            </div>
                                        </div>
                                    </form>
                                    <div class="col-md-12">

                                    </div>


                                </div>
                                
                            </div>
                            
                        </div>
    </article>
<%
	}
}else{
%>


<%-- 没有内容的提示 --%>
<%
} 
%>


        <div class="text-center ">

        </div>
    </div>

<script type="text/javascript">
function postComment(postid){
	
}


        var xmlhttp;//设置全局变量
function reply() {
	<%
    if(request.getSession().getAttribute("username")==null){%>
        window.location.href="login.jsp";
    <%}%>
    var content =  "answerEditor="+document.getElementById("answerEditor").value;
    sendRequest(
            "POST",
            "${pageContext.request.contextPath}/servlet/replyServlet?author="+<%=post.getAuthorId()%>+"&content="+content+"&parent="+<%=post.getPostid()%>,
            true,
            function() {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    alert("回复成功！");
                    window.location.href="<%=request.getContextPath()%>/getDetailServlet?id="+<%=post.getPostid()%>;
                }
            });
}
function replyOperation(){
	
}
function sendRequest(method, url, isAsyns, params, action) {
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open(method, url, isAsyns);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");//这行代码很关键，用来把字符串类型的参数序列化成Form Data
    xmlhttp.send(params);
    xmlhttp.onreadystatechange = action;
}
</script>




                           <div style="padding-left: 65px;" id="goToAnswerEditor">
                                <h4>撰写回复</h4>
                                <input type="hidden">
                                <form  id="replyForm" method="post" >
                                    <div class="editor" id="questionText">
                                        <textarea id="answerEditor" name="text" class="form-control" rows="4" placeholder="撰写答案..."></textarea>
                                    </div>
                                    <div id="answerSubmit" class="hide mt15 editor-wrap">
                                        <div class="pull-right">
                                            <span id="editorStatus" class="hidden text-muted"></span>
                                            <a id="dropIt" href="javascript:void(0);" class="mr10 hidden">[舍弃]</a>
                                            <button type="button" id="answerIt" class=" btn btn-lg btn-p ml20" onclick="reply()">提交回答</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
              <div>

  <div id="footer">
                                <div class="container">
                                    <div class="row hidden-xs">
                                        
                                    </div>
                                    <div class="copyright">
                                        Copyright &copy; 2016 Coolest. 当前呈现版本 00.00.01<br>

                                    </div>

                                </div>
                            </div>

</div>
<script>
    (function (w) {
        w.SF = {
            staticUrl: "https://sf-static.b0.upaiyun.com/v-57c4094c "
        };
        w.SF.token = (function () {
    var _5n5q = 'S'//'S'
+'c'//'Cw'
+//'1vH'
'156'+//'ni'
'd'+//'y'
'770'+//'OK'
'0b7'+//'6p'
'2a'+''///*'rHg'*/'rHg'
+'2M'//'2M'
+'yk'//'yk'
+//'D'
'58'+'bf4'//'L'
+//'Sw'
'8f'+'6'//'kK'
+'3c'//'5Js'
+//'8n'
'984'+'3'//'rUk'
+'fc'//'0'
+'54f'//'2s'
, _LmE3HtB = [[0,1],[13,15],[13,15]];

    for (var i = 0; i < _LmE3HtB.length; i ++) {
        _5n5q = _5n5q.substring(0, _LmE3HtB[i][0]) + _5n5q.substring(_LmE3HtB[i][1]);
    }

    return _5n5q;
})();;
    })(window);

                var lock = {
        type: " ",
        text: '',
        table: {"ban_post ":[1,"\u4f60\u5df2\u7ecf\u88ab\u7981\u8a00, \u65e0\u6cd5\u8fdb\u884c\u6b64\u64cd\u4f5c, \u5982\u6709\u7591\u4e49\u8bf7\u63d0\u4ea4\u7533\u8bc9, \u6216\u8005\u53d1\u90ae\u4ef6\u5230pr@segmentfault.com "]}
    };
</script>

    <script crossorigin src="https://sf-static.b0.upaiyun.com/v-57c4094c/3rd/assets.js "></script>
   <script  src="js/question.js"></script>

<script async src="//sponsor.segmentfault.com/asyncjs.php "></script>

<script>
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-918487-8']);
    _gaq.push(['_trackPageview']);
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
        a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');






    ga('create', 'UA-918487-8', 'auto', {
        'userID'
    : 1030000006740729,
        'createdTime'
    : 1472369710,
        'now'
    : 1472537482 });
    ga('set', 'dimension1', 'active_registed_visitor');
    ga('send', 'pageview');

</script>

<script type='text/javascript'>
    var _vds = _vds || [];
    window._vds = _vds;
    (function() {
        _vds.push(['setAccountId', '5411b7ab1ae040ed9a4eb4a120a06ead']);
        (function() {
            var vds = document.createElement('script');
            vds.type = 'text/javascript';
            vds.async = true;
            vds.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'dn-growing.qbox.me/vds.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(vds, s);
        })();
    })();
    
</script>
<script type="text/javascript">
function like(){
	<%
	if(request.getSession().getAttribute("username")==null){%>
		window.location.href="login.jsp";
	<%}%>
	document.getElementById("likeNum").value=<%=(post.getLikeNumber()+1)%>;
	if(window.ActiveXObject) {              //IE的  
	    xmlHttpRequest = new ActionXObject("Microsoft.XMLHTTP");  
	}  
	else if(window.XMLHttpRequest) {        //除IE外的  
	    xmlHttpRequest = new XMLHttpRequest();  
	}  
	if(xmlHttpRequest != null) {
	    xmlHttpRequest.open("POST", "addLikeServlet?postid=<%=post.getPostid()%>", true);  
	    //关联好ajax的回调函数  
	    xmlHttpRequest.onreadystatechange = likeOperation;  
	      
	    //真正向服务器发送请求  
	    xmlHttpRequest.send(); 
	}
}
function likeOperation(){
	if(xmlHttpRequest.readyState == 4 ) {      //完全得到服务器的响应  
        if(xmlHttpRequest.status == 200) {      //没有异常  
            var msg = xmlHttpRequest.responseText;
            if(msg=="succeeded"){
                console.log("like succeeded");
                window.location.reload();
            }else if (msg=="failed"){
            	console.log("like failed");
            }
        }
    }
}
function save(){
	<%
    if(request.getSession().getAttribute("username")==null){%>
        window.location.href="login.jsp";
    <%}%>
	document.getElementById("saveNum").value=<%=(post.getSaveNumber()+1)%>;
	if(window.ActiveXObject) {              //IE的  
	    xmlHttpRequest = new ActionXObject("Microsoft.XMLHTTP");  
	}  
	else if(window.XMLHttpRequest) {        //除IE外的  
	    xmlHttpRequest = new XMLHttpRequest();  
	}  
	if(xmlHttpRequest != null) {
	    xmlHttpRequest.open("POST", "addFavoriteServlet?postid=<%=post.getPostid()%>", true);  
	    //关联好ajax的回调函数  
	    xmlHttpRequest.onreadystatechange = saveOperation;  
	      
	    //真正向服务器发送请求  
	    xmlHttpRequest.send(); 
	}
}
function saveOperation(){
	if(xmlHttpRequest.readyState == 4 ) {      //完全得到服务器的响应  
        if(xmlHttpRequest.status == 200) {      //没有异常  
            var msg = xmlHttpRequest.responseText;
            if(msg=="succeeded"){
            	console.log("save succeeded");
            	window.location.reload();
            }else if (msg=="failed"){
            	console.log("save failed");
            }
        }
    }
}
function dislike(){
	<%
    if(request.getSession().getAttribute("username")==null){%>
        window.location.href="login.jsp";
    <%}%>
    document.getElementById("saveNum").value=<%=(post.getSaveNumber()-1)%>;
    if(window.ActiveXObject) {              //IE的  
        xmlHttpRequest = new ActionXObject("Microsoft.XMLHTTP");  
    }  
    else if(window.XMLHttpRequest) {        //除IE外的  
        xmlHttpRequest = new XMLHttpRequest();  
    }  
    if(xmlHttpRequest != null) {
        xmlHttpRequest.open("POST", "deleteLikeServlet?postid=<%=post.getPostid()%>", true);  
        //关联好ajax的回调函数  
        xmlHttpRequest.onreadystatechange = disLikeOperation;  
          
        //真正向服务器发送请求  
        xmlHttpRequest.send(); 
    }
}
function dissave(){
	<%
    if(request.getSession().getAttribute("username")==null){%>
        window.location.href="login.jsp";
    <%}%>
    document.getElementById("saveNum").value=<%=(post.getSaveNumber()-1)%>;
    if(window.ActiveXObject) {              //IE的  
        xmlHttpRequest = new ActionXObject("Microsoft.XMLHTTP");  
    }  
    else if(window.XMLHttpRequest) {        //除IE外的  
        xmlHttpRequest = new XMLHttpRequest();  
    }  
    if(xmlHttpRequest != null) {
        xmlHttpRequest.open("POST", "deleteSaveServlet?postid=<%=post.getPostid()%>", true);  
        //关联好ajax的回调函数  
        xmlHttpRequest.onreadystatechange = disSaveOperation;  
          
        //真正向服务器发送请求  
        xmlHttpRequest.send(); 
    }
}
function disLikeOperation(){
    if(xmlHttpRequest.readyState == 4 ) {      //完全得到服务器的响应  
        if(xmlHttpRequest.status == 200) {      //没有异常  
            var msg = xmlHttpRequest.responseText;
            if(msg=="succeeded"){
                console.log("dis like succeeded");
                window.location.reload();
            }else if (msg=="failed"){
                console.log("dis like failed");
            }
        }
    }
}
function disSaveOperation(){
    if(xmlHttpRequest.readyState == 4 ) {      //完全得到服务器的响应  
        if(xmlHttpRequest.status == 200) {      //没有异常  
            var msg = xmlHttpRequest.responseText;
            if(msg=="succeeded"){
                console.log("dis save succeeded");
                window.location.reload();
            }else if (msg=="failed"){
                console.log("dis save failed");
            }
        }
    }
}
</script>

</body>
</html>