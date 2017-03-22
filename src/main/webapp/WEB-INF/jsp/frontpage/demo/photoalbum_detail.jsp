<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

</head>
<body>
	<!-- 用来存放图集的id -->
	<input id="PHOTOALBUM_ID" name="PHOTOALBUM_ID" value="${PHOTOALBUM_ID }" style="display: none;"/>
	
	<table id="showTable">
		
	</table>

    <script src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
	
	//页面加载完成自动从后台取数据
	$(document).ready(function(){
		var PHOTOALBUM_ID_val = $("#PHOTOALBUM_ID").val();
		$.ajax({
			type: "post",
            url: "<%=basePath%>app_photoalbum/getDetail.do"+"?PHOTOALBUM_ID="+PHOTOALBUM_ID_val+"",
            //data: {},
            contentType: "application/json;charset=utf-8",
            dataType:'json',
            success: function (data) {
            	
            	$("#showTable").val();
            	
        		var title = "<tr><td><label> 图集标题:"+data[0].TITLE+"</label></td></tr>";
        		$("#showTable").append(title);
            	
            	for( var i=0;i<data[0].IMAGE_ID_COLLECTION.length;i++ ){
            		var imgPath = "<tr><td><label> 缩略图路径:"+data[0].IMAGE_ID_COLLECTION[i]+"</label></td></tr>";
            		$("#showTable").append(imgPath);
            	}
        		var originalImgPath = "<tr><td><label> 原图路径:就是缩略图路径去掉下划线</label></td></tr>";
        		$("#showTable").append(originalImgPath);
            }
		});
	});
		
	</script>
</body>
</html>