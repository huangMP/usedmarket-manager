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
    <title>普宁档案信息网-业务培训</title>
    <link href="static/css/total.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
    <style type="text/css">
    .video_catalog{
    	position:relative;
    }
    	.video_catalog>h3{
    		margin-left:60px;
    		font-size:20px;
    		font-family:"华文隶书";
    		 margin-top: 80px;
    		margin-bottom: 20px;
    	}
    	
    	.video_catalog>button {
    		position: absolute;
    		top: 8px;
    		padding: 4px 10px;
    		margin-bottom: 0;
    		font-size: 14px;
    		font-weight: 400;
    		line-height: 1.42857143;
    		text-align: center;
    		cursor: pointer;
    		border: 1px solid transparent;
    		border-radius: 4px;
    		background: #65b236;
    		color: whitesmoke;
		}
		.video_catalog>button:hover{
			background: #337ab7;
		}
    </style>
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="content">
    <div class="local">
        <span>当前位置：<a href="app_index/goindex">普宁档案</a>>><a href="app_index/goBusinessGuide">业务指导</a><span>>>业务培训</span><span>——在线视屏</span></span>
    </div>
    <div class="details">
        <div class="navBox">
            <h2>业务指导</h2>
            <ul class="nav_option">
                <li><a href="app_index/goBusinessGuide">业务指南</a></li>
                <li><a href="app_index/goOnlineRegistration">在线报名</a></li>
                <li><a href="app_index/goBusinessTraining" class="active">业务培训</a></li>
            </ul>
        </div>
        <div class="catalogBox">
            <div class="video_catalog">
            <button>返回上页</button>
            	<h3>在线视屏：${pd.TITLE}</h1>	
			<!--极酷播放器/代码开始-->
			<script type="text/javascript" src="static/js/CuSunPlay/swfobject.js"></script>
			<div align="center" class="video" id="CuPlayer"><b><img src="static/images/loading.gif"  /> 网页视频播放器加载中，请稍后...</b></div>
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
				so.addVariable("JcScpVideoPath","${pageContext.request.contextPath}${pd.PATH}"); 
				so.write("CuPlayer");
			</script>
			<script src="static/js/CuSunPlay/action.js" type=text/javascript></script>          
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script type=text/javascript>
	$(function(){
		$(".video_catalog>button").click(function(){
			window.location.href="app_index/goBusinessTraining";
		});
	})
</script>
</body>
</html>
