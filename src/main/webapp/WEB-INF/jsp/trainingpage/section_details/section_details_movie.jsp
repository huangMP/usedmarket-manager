<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>章节详情-视频</title>
    <link href="static/css/train_allclass.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/train_total.css"/>    
    <script type="text/javascript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/frontjs/train_alljs.js"></script>
</head>
<body>
<jsp:include page="../train_head.jsp"></jsp:include>
<div class="content">
    <div class="text_box">
        <div class="content_bag">
            <div class="top_land">
                <button class="top_land_butt movie_land" style="background: #5cb85c">视频</button>
                <button class="top_land_butt text_land">文档</button>
                <button class="top_land_butt exercise_land">章节练习</button>
            </div>
            <input hidden="hidden" value="${LESSON_ID}" name="LESSON_ID" id="LESSON_ID">
            <div class="section_details_cont">
            	<c:if test="${pd.IMG_PATH!=null}">
                	<div class="image" id="image" align="center">
                		<a onclick="showVideo()"><img style="width: 600px" src="<%=basePath %>${pd.IMG_PATH}" class="movie_box"></a>
                	</div>
                	<script type="text/javascript" src="static/js/CuSunPlay/swfobject.js"></script>
					<div hidden="hidden" align="center" class="CuPlayer" id="CuPlayer"><b><img src="static/images/loading.gif"/> 网页视频播放器加载中，请稍后...</b></div>
					<script type="text/javascript">
						var so = new SWFObject("static/CuSunPlayer/player.swf","ply","600","410","9","#000000");
						so.addParam("allowfullscreen","true");
						so.addParam("allowscriptaccess","always");
						so.addParam("wmode","opaque");
						so.addParam("quality","high");
						so.addParam("salign","lt");
						//播放器设置文件-----------------------------
						so.addVariable("JcScpFile","static/CuSunPlayer/CuSunV2set.xml");
						//视频文件及略缩图--------------------------
						//so.addVariable("JcScpServer","rtmp://www.yoursite.com/vod");
						so.addVariable("JcScpVideoPath","${pageContext.request.contextPath}${pd.FILE_PATH}"); 
						so.write("CuPlayer");
					</script>
					<script src="static/js/CuSunPlay/action.js" type=text/javascript></script> 
                </c:if>
                <c:if test="${pd.IMG_PATH==null}">
                	
                	<div class="none" style="margin-left:215px">
                	<p class="none_tit tital">该课时没有视频</p>
                	<img src="static/image/image-train/none4.png" class="none_pag">
            	</div>
                </c:if>
            </div>

        </div>
    </div>
</div>
<div class="clear"></div>
<script>
    $(".top2").addClass("font_size");
    
    function showVideo(){
    	$("#image").hide();
    	$("#CuPlayer").show();
    }
    

</script>
</body>
</html>
