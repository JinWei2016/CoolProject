<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="<%=request.getContextPath() %>/css/showData.css" rel="stylesheet">
<title>数据中心</title>
</head>
<body>
<jsp:include  page="navigator.jsp"/>
<%-- 左侧区域 --%>
<div id="leftData" class="leftData">
<%-- <button class="SclCardLable" id="SclCardLable">123123</button> --%>
<div class="biaoti" style="color:#FFF;text-align:center;overflow:hidden"><h2>数据</h2></div>

  <div class="biaoti2" style="color:#FFF;text-align:center;overflow:hidden"><h2>数据</h2></div>



    <div class="biaoge"></div>


    <div class="word orangebu" style="color:#FFF;text-align:right;overflow:hidden">
        <h3>
        这里是正文<br>
        xxxxxxxxxxxxxxxxxxxxxx<br>
        xxxxxxxxxxxxxxxxxxxxxxx<br>
        xxxxxxxxxxxxxxxxxxxxxxx</h3>
    </div>

 
    <div class="biaoge"></div> 
    <div class="button2">
    <button>btn</button>
    </div>

    <div class="button1">
    <button>btn</button>
    </div>

    <div class="word2 orangebu" style="color:#FFF;text-align:right;overflow:hidden">
        <h2>
        这里是第二段落<br>
        xxxxxxxxxxxxxxxxxxxxxx<br>
        xxxxxxxxxxxxxxxxxxxxxxx<br>
        xxxxxxxxxxxxxxxxxxxxxxx</h2>
    </div>



    <div class="lianjie" style="text-align:center">
       <a class="one" href="#" ><h2>lianjie1</h2></a>
    </div>

    <div class="lianjie2" style="text-align:center">
       <a class="one" href="#"><h2>lianjie2</h2></a>
    </div>
<button class="SclCardLable" id="SclCardLable">123123</button>
</div>
<%-- 右侧名片区域 --%> 
<div id="schoolCard">
    <div class="cardHeader">
        <img id="cardheaderPic" src="image/showdata/cardheader.jpg">
        <div class="hideCardArea">
            <img class="hideCard" src="image/showdata/hideCard.png">
            <%-- <span>收起</span>--%>
        </div>
        <div class="intro">高校名片</div>
        <hr class="Hr1">
        <div class="schoolName">东南大学</div>
        <div class="schoolHref"><a href="http://www.seu.edu.cn">www.seu.edu.cn</a></div>
    </div>
    <div class="cardContent">
        <p class="containPicP"><img id="LabelPic1" src="image/showdata/introLabel.jpg"></p>
        <div class="school_intro">
            东南大学（Southeast University），简称东大，坐落于南京市，是中央直管、教育部直属的副部级全国重点大学，中国著名的建筑老八校及原四大工学院之一，国家“211工程”、“985工程”首批重点建设的大学，是“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“2011计划”、“111计划”入选高校，“卓越大学联盟”、“中俄工科大学联盟”、“中欧工程教育平台”主要成员。
东南大学起源于1902年建校的三江师范学堂，1916年始设工科，后经历了国立第四中山大学工学院、国立中央大学工学院、南京大学工学院等历史时期。1952年全国院系调整，以原南京大学工学院为主体，在并入金陵大学、江南大学等校的有关系科后于国立中央大学本部原址建立了南京工学院。其后又有武汉大学、浙江大学、交通大学、复旦大学等校部分专业先后并入。后化学工程系、食品工业系、机械二系（农业机械工程系）整建制迁出，无线电工程系部分迁出。1988年5月，学校更名为东南大学。2000年4月，原东南大学、南京铁道医学院、南京交通高等专科学校合并，南京地质学校并入，组建新的东南大学。
截至2016年3月，东南大学占地面积5888亩，建有四牌楼、九龙湖、丁家桥等校区；设有29个院（系），拥有75个本科专业；有全日制在校生30000余人，其中研究生14440余人，在校留学生人数达到1813人。是一所以工科为主，理学、工学、医学、文学、法学、哲学、教育学、经济学、管理学等多学科协调发展的综合性研究型大学。
        </div>
        <p class="containPicP"><img id="LabelPic2" src="image/showdata/majorLabel.jpg"></p>
    </div>
    <div class="cardFoot">
    
    </div>
</div>

<%-- footer author 33 --%>


</body>
<%-- slide in --%>
 <script src="js/jquery-1.8.3.min.js"></script>
<script>
$(document).ready(function() {
    $("button.SclCardLable").click(function() {
        var idTopass = $("button.SclCardLable").attr('id');
        //alert(idTopass);
        // 需要servlet传递id
        $("#schoolCard").animate({
            left: '50.4%'
        }, "fast"); //移动的幅度需要根据div设置
        $("#leftData").animate({
            left: '-50%'
        }, "fast"); //移动的幅度需要根据div设置
    });
    $("img.hideCard").click(function() {
        $("#schoolCard").animate({
            left: '100.3%'
        }, "fast"); //移动的幅度需要根据div设置
        $("#leftData").animate({
            left: '0%'
        }, "fast"); //移动的幅度需要根据div设置
    });
});
</script>
</html>