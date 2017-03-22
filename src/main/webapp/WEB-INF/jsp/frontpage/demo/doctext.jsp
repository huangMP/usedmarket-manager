<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";



%>

<!-- 首页网站链接 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'linktest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="static/js/jquery-1.7.2.js"></script>
    <script>
    	var type=${doc.TYPE };
    	console.log(type);
    	if(type==1){
    		console.log(领导班子);
    	}
    </script>
  </head>
  
  <body>
  <div>
  	标题：${doc.TITLE }
  </div>
  <div>
  时间：${doc.ADD_TIME }
  </div>
  <div>
  来源：${doc.ORIGIN }
  </div>
  <div>
  阅读次数：${doc.BROWSING_TIMES }
  </div>
  <div>
  图片：<img style="height: 300px;" src="${pageContext.request.contextPath}${doc.IMG_PATH }"/>
  </div>
  <div>
正文：${doc.TEXT }
  </div>
  
  </body>
</html>
