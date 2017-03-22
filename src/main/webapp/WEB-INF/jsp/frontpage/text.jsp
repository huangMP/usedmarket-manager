<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <title>详情</title>
    <link href="static/css/total.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script>
    $(function(){
    	var type=${doc.TYPE };
    	console.log(type);
    	if(type==1 || type==2 || type==14){
    		$("#local1").append("<a href='app_index/goArchiveIntroduction'>局馆介绍</a>");
    		if(type==1){
    			$("#local2").append("<a href='app_index/goLeadershipRanks'>领导班子</a>");
    		}
    		if(type==2){
    			$("#local2").append("<a href='app_index/goMechanismFunction'>机构职能</a>");
    		}
    		if(type==14){
    			$("#local2").append("<a href='app_index/goMechanismFunction'>局馆介绍</a>");
    		}
    	}
    	if(type==3){
    		$("#local1").append("<a href='app_index/goserviceinformation'>公共服务</a>");
    		$("#local2").append("<a href='app_index/goserviceinformation'>查档服务指南</a>");
    		
    	}  
    	if(type==4 || type==5 || type==6){
    		$("#local1").append("<a href='app_index/goregulations'>法规与标准</a>");
    		if(type==4){
    			$("#local2").append("<a href='app_index/goregulations'>法规</a>");
    		}
    		if(type==5){
    			$("#local2").append("<a href='app_index/gostandards'>标准</a>");
    		}
    		if(type==2){
    			$("#local2").append("<a href='app_index/gorelateddocuments'>相关文件</a>");
    		}
    		
    	} 
    	if(type==7 || type==8 || type==9){
    		$("#local1").append("<a href='app_index/goWorkDynamics'>档案动态</a>");
    		if(type==7){
    			$("#local2").append("<a href='app_index/goWorkDynamics'>工作动态</a>");
    		}
    		if(type==8){
    			$("#local2").append("<a href='app_index/goNotice'>通知公告</a>");
    		}
    		if(type==9){
    			$("#local2").append("<a href='app_index/goOtherInformation'>他山之石</a>");
    		}
    		
    	} 	
    	if(type==10){
    		$("#local1").append("<a href='app_index/goBusinessGuide'>业务指导</a>");
			$("#local2").append("<a href='app_index/goBusinessGuide'>业务指南</a>");  		
    	}
    	if(type==11 || type==12 || type==13){
    		$("#local1").append("<a href='app_index/goelearchives'>利用中心</a>");
    		if(type==11){
    			$("#local2").append("<a href='app_index/goelearchives'>电子档案</a>");
    		}
    		if(type==12){
    			$("#local2").append("<a href='app_index/goopendirectory'>开放目录</a>");
    		}
    		if(type==13){
    			$("#local2").append("<a href='app_index/gousecase'>利用实例</a>");
    		}
    		
    	}
 	  	var ifimg="${doc.IMG_PATH }"
    	console.log(ifimg);
    	if(ifimg!=""){
    	    //将原图文件名最后的下划线去掉，就是原图路径了
     		 var ifimg = ifimg.replace("_.jpg", ".jpg")
				.replace("_.png", ".png")
				.replace("_.gif", ".gif")
				.replace("_.jpeg", ".jpeg")
				.replace("_.bmp", ".bmp") ;
    		$(".text_img").append("<img src='${pageContext.request.contextPath}"+ifimg+"'/>")
    	}
    	
    	
    });
    	
    </script>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="content">
    <div class="local">
        <span>当前位置：<a href="app_index/goindex">普宁档案</a>>><span class="local_a" id="local1"></span>>><span class="local_a" id="local2"></span>>>详情</span>
    </div>
    <div class="text_box">
        <div class="text_header">
            <h2>${doc.TITLE }</h2>
            <div class="back">
                <a href="javascript:history.back(-1)">返回上页</a>
            </div>
            <div class="informal">
                发布时间：<span class="time"></span>
                来源：<span>${doc.ORIGIN }</span>
                浏览次数：<span>${doc.BROWSING_TIMES }</span>
            </div>
            <div class="take_down">
                <img src="static/image/img/printer.png" height="26px" width="26px">
                <button onclick="window.print();">打印文本</button>
            </div>
        </div>
        <div class="text_img"></div>
        <div class="text_content">
            ${doc.TEXT }
        </div>
        

    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
window.onload=function(){
	if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0")
    {
        //alert("IE 7.0");
        /*联系我们*/
        $(".back").css({"margin-left":"-486px"});
        $(".take_down").css({"left":"422px"});
    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE8.0")
    {
        //alert("IE 8.0");
        /*联系我们*/
        $("#name").before("<span class='text_ie1'>姓名：</span><span class='text_ie2'>电话：</span><span class='text_ie3'>E-mail：</span>")
    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE9.0")
    {
        //alert("IE 9.0");
        /*联系我们*/
        $("#name").before("<span class='text_ie1'>姓名：</span><span class='text_ie2'>电话：</span><span class='text_ie3'>E-mail：</span>")

    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE10.0")
    {
        //alert("IE 10.0");
    }
    var time = "${doc.ADD_TIME }";
	time = time.substring(0, 16);
	$(".time").append("<span>"+time+"</span>");
	
}
</script>

</body>
</html>

