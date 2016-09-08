<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.lang.String"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>BBS - 发布帖子</title>
    <link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/css/global.css" />
    <link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/qa/css/qa.css" />
    <link rel="stylesheet" href="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/css/responsive.css" />
    <link rel="stylesheet" href="css/bbs/bbs.css">
    <script src="https://sf-static.b0.upaiyun.com/v-57bfebd9/global/script/debug.js"></script>

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
    <script src="js/summernote-zh-CN.js"></script>

    <link rel="icon" href="image/bbs/bbsIcon.ico" type="image/x-icon" />
</head>


<body data-mod="qa" class="qa-ask ">

<%
HttpSession s = request.getSession();
String username=null;
if(s.getAttribute("username")!=null)
    username = s.getAttribute("username").toString();
%>
<input type="hidden" name="author" value=<%=username %> />

    <div class="sf-header global-nav shadow-bottom publish">
        <nav class="container nav">
            <div class="row hidden-xs">
                <div class="col-sm-6">
                    <div class="bbs-header__logo">
                        <h1>
                           <a href="bbs.jsp">1</a>
                       </h1>
                        <small>&nbsp;&nbsp;发布帖子</small>
                    </div>
                </div>
                <div class="col-sm-6 text-right text-right-self">
                    <ul class="opts list-inline hidden-xs text-right-self" >
                        <li class="opts__item dropdown hoverDropdown write-btns">
                            <a class="dropdownBtn personal" data-toggle="dropdown" href="/ask"><%=username %><span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right ">
                                <li><a href="<%=request.getContextPath()%>/personalPage.jsp" class="mya">个人中心</a></li>
                                <li><a href="<%=request.getContextPath()%>/myfavorite.jsp" class="mya">收藏夹</a></li>
                                <li><a href="<%=request.getContextPath()%>/message.jsp" class="mya">消息中心</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<%=request.getContextPath()%>/logoutServlet" class="mya">退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="wrap publish">
        <div class="container">
            <form id="question" method="POST" role="form">
                <input type="hidden" value="" id="draftId">
                <input type="hidden" value="0" name="site" id="siteId">
                <div class="form-group">
                    <label for="title" class="sr-only">标题</label>
                    <input id="myTitle" type="text" name="title" required data-error="" autocomplete="off" class="form-control tagClose input-lg" placeholder="标题：简单介绍一下帖子的内容" value="">
                </div>
                <input type="hidden" name="created" data-value="" value="">

                <div class="form-group ">
                    <label for="tags" class="sr-only">标签：至少1个，最多5个</label>
                    <input class="tagsInput form-control" data-init="null" name="tags" id="tagString" type="text" placeholder="标签：选择或者填写并使用逗号,分号;分隔" data-role="tagsinput" />

                    <div role="tabpanel" class="techTags panel panel-default techTags-panel" data-tech='{"\u5f00\u53d1\u8bed\u8a00":[{"id":"1040000000089436","name":"javascript"},{"id":"1040000000089387","name":"php"},{"id":"1040000000089434","name":"css"},{"id":"1040000000089571","name":"html"},{"id":"1040000000089449","name":"java"},{"id":"1040000000089534","name":"python"},{"id":"1040000000089409","name":"html5"},{"id":"1040000000089918","name":"node.js"},{"id":"1040000000089741","name":"c++"},{"id":"1040000000089457","name":"c"},{"id":"1040000000090209","name":"objective-c"},{"id":"1040000000089669","name":"shell"},{"id":"1040000000531223","name":"swift"},{"id":"1040000000090203","name":"golang"},{"id":"1040000000089699","name":"ruby"},{"id":"1040000000089581","name":"c#"},{"id":"1040000000089686","name":"bash"},{"id":"1040000000090433","name":"asp.net"},{"id":"1040000000091262","name":"sass"},{"id":"1040000000090228","name":"scala"},{"id":"1040000000090208","name":"lua"},{"id":"1040000000161068","name":"coffeescript"},{"id":"1040000000090600","name":"less"},{"id":"1040000000365394","name":"typescript"},{"id":"1040000000090194","name":"actionscript"},{"id":"1040000000089698","name":"perl"},{"id":"1040000000090201","name":"erlang"},{"id":"1040000000311191","name":"rust"}],"\u5e73\u53f0\u6846\u67b6":[{"id":"1040000000196640","name":"laravel"},{"id":"1040000000125263","name":"flask"},{"id":"1040000000089564","name":"django"},{"id":"1040000000090103","name":"spring"},{"id":"1040000000166256","name":"express"},{"id":"1040000000089646","name":"ruby-on-rails"},{"id":"1040000000116331","name":"tornado"},{"id":"1040000000090398","name":"yii"},{"id":"1040000000622042","name":"koa"},{"id":"1040000000089638","name":"struts"}],"\u670d\u52a1\u5668":[{"id":"1040000000089392","name":"linux"},{"id":"1040000000090145","name":"nginx"},{"id":"1040000000089761","name":"apache"},{"id":"1040000000090245","name":"ubuntu"},{"id":"1040000000366352","name":"docker"},{"id":"1040000000090249","name":"centos"},{"id":"1040000000090401","name":"\u7f13\u5b58"},{"id":"1040000000090117","name":"tomcat"},{"id":"1040000000090107","name":"\u8d1f\u8f7d\u5747\u8861"},{"id":"1040000000090646","name":"unix"},{"id":"1040000000089648","name":"hadoop"},{"id":"1040000000090609","name":"windows-server"}],"\u6570\u636e\u5e93\u548c\u7f13\u5b58":[{"id":"1040000000089439","name":"mysql"},{"id":"1040000000089431","name":"redis"},{"id":"1040000000090049","name":"sql"},{"id":"1040000000089488","name":"mongodb"},{"id":"1040000000089432","name":"nosql"},{"id":"1040000000089873","name":"memcached"},{"id":"1040000000090701","name":"oracle"},{"id":"1040000000090354","name":"sqlite"},{"id":"1040000000090424","name":"sqlserver"},{"id":"1040000000090861","name":"postgresql"}],"\u5f00\u53d1\u5de5\u5177":[{"id":"1040000000089459","name":"git"},{"id":"1040000000091226","name":"github"},{"id":"1040000000089467","name":"vim"},{"id":"1040000000089579","name":"xcode"},{"id":"1040000000126097","name":"sublime-text"},{"id":"1040000000089509","name":"eclipse"},{"id":"1040000000089447","name":"svn"},{"id":"1040000000090560","name":"intellij-idea"},{"id":"1040000000090473","name":"ide"},{"id":"1040000000090186","name":"maven"},{"id":"1040000000090524","name":"atom"},{"id":"1040000000090231","name":"visual-studio"},{"id":"1040000000090216","name":"emacs"},{"id":"1040000002720957","name":"visual-studio-code"},{"id":"1040000000183694","name":"hg"},{"id":"1040000000089663","name":"textmate"}],"\u7cfb\u7edf\u8bbe\u5907":[{"id":"1040000000089442","name":"ios"},{"id":"1040000000089658","name":"android"},{"id":"1040000000089407","name":"chrome"},{"id":"1040000000089709","name":"windows"},{"id":"1040000000089498","name":"iphone"},{"id":"1040000000125504","name":"internet-explorer"},{"id":"1040000000090217","name":"firefox"},{"id":"1040000000090638","name":"ipad"},{"id":"1040000000089499","name":"safari"},{"id":"1040000000090218","name":"opera"},{"id":"1040000002871462","name":"apple-watch"}],"\u5176\u5b83":[{"id":"1040000000089409","name":"html5"},{"id":"1040000002893277","name":"react.js"},{"id":"1040000000090137","name":"\u641c\u7d22\u5f15\u64ce"},{"id":"1040000000123810","name":"virtualenv"},{"id":"1040000000090316","name":"lucene"}]}'>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#学校名称" aria-controls="type" role="tab" data-toggle="tab">学校名称</a>
                            </li>
                            <li role="presentation" class=""><a href="#专业名称" aria-controls="type" role="tab" data-toggle="tab">专业名称</a>
                            </li>
                            <li role="presentation" class=""><a href="#省份" aria-controls="type" role="tab" data-toggle="tab">省份</a>
                            </li>
                            <li role="presentation" class=""><a href="#其他" aria-controls="type" role="tab" data-toggle="tab">其他</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="学校名称">
                                <ul class="taglist--inline">
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089436","name":"清华大学"}' href="javascript: void(0);">清华大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089387","name":"北京大学"}' href="javascript: void(0);">北京大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089434","name":"复旦大学"}' href="javascript: void(0);">复旦大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089571","name":"上海交通大学"}' href="javascript: void(0);">上海交通大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089449","name":"浙江大学"}' href="javascript: void(0);">浙江大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089534","name":"南京大学"}' href="javascript: void(0);">南京大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089409","name":"东南大学"}' href="javascript: void(0);">东南大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089918","name":"中国科技大学"}' href="javascript: void(0);">中国科技大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089741","name":"武汉大学"}' href="javascript: void(0);">武汉大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089457","name":"华中科技大学"}' href="javascript: void(0);">华中科技大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090209","name":"国防科技大学"}' href="javascript: void(0);">国防科技大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089669","name":"中山大学"}' href="javascript: void(0);">中山大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000531223","name":"吉林大学"}' href="javascript: void(0);">吉林大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090203","name":"四川大学"}' href="javascript: void(0);">四川大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089699","name":"南开大学"}' href="javascript: void(0);">南开大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089581","name":"天津大学"}' href="javascript: void(0);">天津大学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089686","name":"同济大学"}' href="javascript: void(0);">同济大学</a>
                                    </li>
                                </ul>
                            </div>
                            <div role="tabpanel" class="tab-pane " id="专业名称">
                                <ul class="taglist--inline">
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000196640","name":"建筑学"}' href="javascript: void(0);">建筑学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000125263","name":"计算机科学与技术"}' href="javascript: void(0);">计算机科学与技术</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089564","name":"通讯专业"}' href="javascript: void(0);">通讯专业</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090103","name":"电气工程"}' href="javascript: void(0);">电气工程</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000166256","name":"金融学"}' href="javascript: void(0);">金融学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089646","name":"经济学"}' href="javascript: void(0);">经济学</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000116331","name":"人力资源"}' href="javascript: void(0);">人力资源</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090398","name":"工商管理"}' href="javascript: void(0);">工商管理</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000622042","name":"生物医药"}' href="javascript: void(0);">生物医药</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089638","name":"物理学"}' href="javascript: void(0);">物理学</a>
                                    </li>
                                </ul>
                            </div>
                            <div role="tabpanel" class="tab-pane " id="省份">
                                <ul class="taglist--inline">
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089392","name":"北京"}' href="javascript: void(0);">北京</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090145","name":"上海"}' href="javascript: void(0);">上海</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089761","name":"江苏"}' href="javascript: void(0);">江苏</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090245","name":"安徽"}' href="javascript: void(0);">安徽</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000366352","name":"山东"}' href="javascript: void(0);">山东</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090249","name":"广西"}' href="javascript: void(0);">广西</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090401","name":"四川"}' href="javascript: void(0);">四川</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090117","name":"广东"}' href="javascript: void(0);">广东</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090107","name":"湖南"}' href="javascript: void(0);">湖南</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090646","name":"湖北"}' href="javascript: void(0);">湖北</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089648","name":"云南"}' href="javascript: void(0);">云南</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090609","name":"山西"}' href="javascript: void(0);">山西</a>
                                    </li>
                                </ul>
                            </div>
                            <div role="tabpanel" class="tab-pane " id="其他">
                                <ul class="taglist--inline">
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089439","name":"这是什么鬼"}' href="javascript: void(0);">这是什么鬼</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089431","name":"止于至善"}' href="javascript: void(0);">止于至善</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000090049","name":"高考是什么玩意儿"}' href="javascript: void(0);">高考是什么玩意儿</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089488","name":"啦啦啦"}' href="javascript: void(0);">啦啦啦</a>
                                    </li>
                                    <li class="mb5">
                                        <a class="tag" data-tag='{"id":"1040000000089432","name":"学到了学到了"}' href="javascript: void(0);">学到了学到了</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>

                <div id="summernote" placeholder="请在这里编辑您的帖子"></div>

                <div class=" publish-footer">
                    <div class="container">
                        <div class="operations clearfix">
                            <div class="pull-right">
                                <span class="text-muted hidden" id="editorStatus">已保存</span>
                                <a id="dropIt" href="javascript:void(0);" class="mr10 hidden">[舍弃]</a>
                                <button type="button" data-toggle="tooltip" data-placement="top" data-type="question" id="publishIt" class="btn btn-primary ml10" data-text="发布帖子" onclick="postSubmit()"> 发表
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    
    <div class="modal fade" id= "modal1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">操作提示</h4>
      </div>
      <div class="modal-body">
        <p>发布成功&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="trans()">OK</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id= "modal2">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">操作提示</h4>
      </div>
      <div class="modal-body">
        <p>发布失败&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">返回</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
function legal(){
    var tagString = document.getElementById("tagString").value;
    //split....
    return true;
}
function postSubmit() {
    if(legal()){
        var content = $('#summernote').summernote('code');
        console.log('content ok');
        var username = '<%=username%>';
        var postname = document.getElementById("myTitle").value;
        var tagString = document.getElementById("tagString").value;
        
        var action = "author="+username+"&postname="+postname+"&tagString="+tagString+"&content="+content;
        console.log(action);
        
        if(window.ActiveXObject) {              //IE的  
            xmlHttpRequest = new ActionXObject("Microsoft.XMLHTTP");  
        }  
        else if(window.XMLHttpRequest) {        //除IE外的  
            xmlHttpRequest = new XMLHttpRequest();  
        }  
        if(xmlHttpRequest != null) {  
            xmlHttpRequest.open("POST", "sendPostServlet?"+action, true);  
            //关联好ajax的回调函数  
            xmlHttpRequest.onreadystatechange = ajaxCall;  
            //真正向服务器发送请求  
            xmlHttpRequest.send(); 
        }
    }else{
        //弹出消息提示框，tag不符合标准
        
        
        
        
    }
}        
function ajaxCall() {  
    if(xmlHttpRequest.readyState == 4 ) {       //完全得到服务器的响应  
        if(xmlHttpRequest.status == 200) {      //没有异常  
            var result=xmlHttpRequest.responseText;
            if(result=="succeeded"){
                //消息提示
                $('#modal1').modal('show')
                //跳转
            }else if(result=="failed"){
                //消息提示框
                $('#modal2').modal('show')
            }
        }  
    }  
}
function trans(){
	window.location.href="bbs.jsp";
}
</script>
<script>
$(document).ready(function() {
   $('#summernote').summernote({
	   lang: 'zh-CN', // default: 'en-US'
	   height: 550, // set editor height
	   minHeight: 300, // set minimum height of editor
       maxHeight: 1000, // set maximum height of editor
       focus: true // set focus to editable area after initializing summernote
    });
});

(function(w) {
    w.SF = {
        //staticUrl: "https://sf-static.b0.upaiyun.com/v-57bfebd9"
    };
    w.SF.token = (function() {
        var _7POs = 'c4' //'e9'
            + //'u'
            '15' + //'L'
            '69' + //'s'
            '8' + //'r'
            'e' + //'sYw'
            '5' + //'CLu'
            '1' + 'e7' //'o'
            + //'oq'
            '4e' + //'79s'
            '433' + //'jd'
            '4' + //'Ou'
            'c9a' + /* 'x'//'x' */ '' + //'VJ'
            '8' + //'b'
            '7' + //'PV0'
            'c78' + //'t'
            'ea' + //'V'
            '3' + //'K'
            'dd5',
            _z12 = [];

        for (var i = 0; i < _z12.length; i++) {
            _7POs = _7POs.substring(0, _z12[i][0]) + _7POs.substring(_z12[i][1]);
        }

        return _7POs;
    })();;
})(window);

var lock = {
    type: "",
    text: '',
    table: {
        "ban_post": [1, "\u4f60\u5df2\u7ecf\u88ab\u7981\u8a00, \u65e0\u6cd5\u8fdb\u884c\u6b64\u64cd\u4f5c, \u5982\u6709\u7591\u4e49\u8bf7\u63d0\u4ea4\u7533\u8bc9, \u6216\u8005\u53d1\u90ae\u4ef6\u5230pr@segmentfault.com"]
    }
};
    </script>
</html>