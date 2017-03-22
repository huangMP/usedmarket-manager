<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
							<div id="zhongxin" style="padding-top: 13px;">
								<div class="close_light_bg" id="close_light_bg"></div>
								<!--极酷播放器/代码开始-->
								<script type="text/javascript" src="static/js/CuSunPlay/swfobject.js"></script>
								<div class="video" id="CuPlayer"><b><img src="static/images/loading.gif"  /> 网页视频播放器加载中，请稍后...</b></div>
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
							</div>
						</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
	</script>
</body>
</html>