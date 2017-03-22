<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>章节详情-文档</title>
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
                <button class="top_land_butt movie_land" >视频</button>
                <button class="top_land_butt text_land" style="background: #5cb85c">文档</button>
                <button class="top_land_butt exercise_land">章节练习</button>
            </div>
            <input hidden="hidden" value="${LESSON_ID}" name="LESSON_ID" id="LESSON_ID">
            <div class="section_details_cont">
            	<c:if test="${size == 0}">
	            	
	            	<div class="none" style="margin-left:215px">
                	<p class="none_tit tital">该专题没有文档</p>
                	<img src="static/image/image-train/none4.png" class="none_pag">
	            </c:if>
	            <c:if test="${size != 0}">
            	<c:forEach var="document" items="${documentList}">
	                <div class="cont_sect">
	                    <a href="<%=basePath1%>${document.FILE_PATH}" download="${document.TITLE_PATH_NAME }">${document.TITLE}</a>
	                    <span>${document.ADD_TIME}</span>
	                </div>
	            </c:forEach>
	            </c:if>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<script>
    $(".top2").addClass("font_size");
    

</script>
</body>
</html>

