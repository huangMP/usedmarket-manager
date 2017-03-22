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
    
    <title>documentTrends</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="static/js/jquery-1.7.2.js"></script>
  </head>
  
  <body>
              这是DocumentTrensDoc页面. 
     <hr>             
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
		
		<c:if text="${pd.IMG_PATH!=null}">
	     	<img id="IMG" src="${pageContext.request.contextPath}${pd.IMG_PATH}"/>
	     </c:if>
	     <div>正文 ：${pd.TEXT}</div>
		
		</div>
     
     
  </body>
  <script type="text/javascript">

  </script>
</html>
