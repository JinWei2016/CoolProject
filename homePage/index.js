     $(function() {
            $("#dowebok").fullpage({
                navigation: "true",
                //navigationColor:"#33CCCC",
                //navigationPosition:"right"
                //anchors: ['page1', 'page2', 'page3'],
                anchors: ['page1', 'page2','page3','page4'],
                menu: '#menu'
            });
        });
function page2(){
  setTimeout(function(){
    document.getElementById("b2_txt-01").innerHTML="数据展示";
  }, 500);
         setTimeout(function(){
    document.getElementById("b2_txt-02").innerHTML="这里添加说明";
  }, 500);
         setTimeout(function(){
    document.getElementById("b2_txt-03").innerHTML="这里添加说明";
  }, 500);
                  setTimeout(function(){
    document.getElementById("testimage").innerHTML="<img style='opacity:1;' class='m-phone' src='imgs/paris.jpg'> </img>";
  }, 3000);   
    setTimeout(function(){
    document.getElementById("b2_btn_1").innerHTML="<button class='button button1' >进入</button>";
  }, 1000);
}
         
    /* <svg   xmlns="http://www.w3.org/2000/svg" width="270" height="130" version="1.1" class="svg">
          <path d="M 65 10 A 55 55, 0, 1, 0, 65 120 H 205 A 55 55, 0, 1, 0, 205 10 H 65"/>
        </svg>
       /*  function checkBrowserForVersion4(){
var x=navigator.appVersion;
y=x.substring(0,4);
if(y>=4) Effect();}
var isNav=(navigator.appName.indexOf("Netscape")!=-1);
var colors=new Array
("FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","FFFFFF","F9F9F9","F1F1F1","E9E9E9","E1E1E1","D9D9D9","D1D1D1","C9C9C9","C1C1C1","B9B9B9","B1B1B1","A9A9A9","A1A1A1","999999","919191","898989","818181","797979","717171","696969","616161","595959","515151","494949","414141","393939","313131","292929","212121","191919","111111","090909","000000")
a=0,b=1
function Effect(){
color=colors[a];
//改改下面的文字内容即可,可使用HTML语法，但是注意引号不要混用。双引号内是单引号。
aa="<font color="+color+">Save page and Get Code !<p>Enjoy All These Free Javascripts ......</font></font></font>"
if(isNav) {document.object1.document.write(aa);document.object1.document.close();}
else object1.innerHTML=aa
a+=b;if (a==38) b-=2;if (a==0) b+=2;xx=setTimeout("Effect()",10);}
/*
function showimage() {
    
}
*/
  /*sandra0 = new Image();
sandra0.src = "imgs/paris.jpg";

var i_strngth=1;
var i_image=0;
 

 var image ="imgs/paris.jpg";

//imageurl[1] ="图片名称2.gif"
//imageurl[2] ="图片名称3.gif"
function showimage() { 

if (i_strngth <=110) {


i_strngth=i_strngth+10
setTimeout("showimage()",100)
}


}*/
//-->


