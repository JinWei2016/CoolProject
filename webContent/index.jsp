<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>高考志愿咨询</title> 
</head>
<%-- html --%>
<body>
<div class="header1">
<jsp:include  page="navigator.jsp" />
</div>
  <div id="dowebok">  
    <div class="max-frame section active" id="section1" style="background-image:url('image/index/p2.jpg');">
      <%-- 主体  --%>
      <div class="center-block text-1">
        <h1 align="center">高考查询</h1>
          <p align="center">为你找到你最心仪的学校</p>
      </div>
    </div>
  
  <%-- 第二屏 --%>
  <div class="frame-2 section" id="section2" style="background-image: url('image/index/pictures4.jpg');">
    <div class="boxInner">
      <div class="boxCtn">
        <div class="b2_txt_box">
          <div class="b2_txt b2_txt01" id="b2_txt-01">数据展示</div>
            <div class="b2_txt b2_txt02" id="b2_txt-02">添加说明</div>
            <div class="b2_txt b2_txt03" id="b2_txt-03">添加说明</div>
            <button class="btn btn-lg btn-primary" onclick="location='showdata.jsp'">进入</button>
         </div>
      <div>
      <div><img class="report"></img> </div>
      </div>
   </div>
  </div>
  </div>
    <div class="frame-3 section" id="section3" style="background-image:url('image/index/cover1.gif')">
    <div class="bigbox_3">
      <div class="f3_header">
        
      </div>
      <center>
    <div class="f3_list">

      <h2 align="center">这里输入标题</h2>
      <div class="img3">
       <a target="_blank" href="klematis_big.htm"><img src="<%=request.getContextPath() %>/image/index/pic16.jpg" alt="kinsfolk" ></a>
       <div class="desc3">添加描述</div>
     </div>
      <div class="img3">
     <a target="_blank" href="klematis2_big.htm" ><img src="<%=request.getContextPath() %>/image/index/pic16.jpg" alt="news" ></a>
        <div class="desc3">添加描述</div>
      </div>
    <div class="img3">
    <a target="_blank" href="klematis3_big.htm"><img src="<%=request.getContextPath() %>/image/index/pic16.jpg" alt="search" ></a>
     <div class="desc3">添加描述</div>
   </div>
     <div class="img3">
    <a target="_blank" href="klematis4_big.htm"><img src="<%=request.getContextPath() %>/image/index/pic16.jpg" alt="news" ></a>
      <div class="desc3">添加描述</div>
    </div>

  <div  class="button button3_1" onclick="">进入</div>
  </div>
  </center>  
    </div>
  </div>  
    
   <div class="frame-4 section" id="section4" style="background-image:url('image/index/page4.jpg')">
     <div class="bigbox_3">
      
      <center>
    <div class="f4_list">
     
      <h2 align="center">这里输入标题</h2>
      <div class="img4">
       <a target="_blank" href="klematis_big.htm" class="a4_1"><img src="<%=request.getContextPath() %>/image/index/kinsfolk.png" alt="kinsfolk" ></a>

     </div>
     <div class="space4"></div>
      <div class="img4">
     <a target="_blank" href="klematis2_big.htm" class="a4_2"><img src="<%=request.getContextPath() %>/image/index/news.png" alt="news" ></a>

      </div>
      <div class="space4"></div>
    <div class="img4">
    <a target="_blank" href="klematis3_big.htm" class="a4_3"><img src="<%=request.getContextPath() %>/image/index/search.png" alt="search" ></a>

   </div>
   <div class="space4"></div>
     <div class="img4">
    <a target="_blank" href="klematis4_big.htm" class="a4_4"><img src="<%=request.getContextPath() %>/image/index/news.png" alt="news" ></a>

    </div>
 
  <div  class="button button4_1" onclick="">进入</div>

  </div>
  </center>  
    </div>
   </div>   
</div>
</body>
<link href="<%=request.getContextPath() %>/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/jquery.fullPage.css">
<script src="js/jquery.fullPage.min.js"></script>
<%-- java  --%>
<script>
$(function() {
    $("#dowebok").fullpage({
        navigation: "true",
        anchors: ['page1', 'page2','page3','page4'],
        menu:'#menu'
    });
});

</script>

</html>