<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>查档服务指南正文页面</title>
	<script src="static/js/jquery-1.7.2.js"></script>
</head>
	
	<body>
		<h1 align="center">
			标题：	${pd.TITLE}
		</h1>	
		<div>
			<div align="center">
				时间：${pd.ADDTIME}
			</div>
		</div>
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
		<script language=javascript src="static/js/CuSunPlay/action.js" type=text/javascript></script>
	
	</body>
</html>
