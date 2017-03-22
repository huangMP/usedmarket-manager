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
			<div align="left">
				来源： ${pd.ORIGIN}
			</div>
			<span>
				时间：${pd.ADD_TIME}
			</span>			
			<div align="right">
				浏览数：	${pd.BROWSING_TIMES}
			</div>
		</div>
		<div>
		正文 ：${pd.TEXT}
		</div>
	
	</body>
</html>
