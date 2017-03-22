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
    <title>全部课程-课程详情-目录</title>
    <link href="static/css/train_allclass.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/train_total.css"/>    
    <script type="text/javascript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/frontjs/train_alljs.js"></script>
</head>
<body>
<jsp:include page="../train_head.jsp"></jsp:include>
<div class="content">
    <div class="text_box">
        <div class="details_box">
            <img src="<%=basePath%>${specialPd.IMG_PATH}">
            <p>${specialPd.TITLE}</p>
            <input hidden="hidden" value="${specialPd.SPECIAL_ID}" name="SPECIAL_ID" id="SPECIAL_ID">
            <p class="text_info">${specialPd.BRIEF_INTRO}</p>
            <div class="clear"></div>
            <div class="local_land">
                <button class="land_butt fonze" id="main_land">目录</button>
                <button class="land_butt" id="talk_land">讨论区</button>
            </div>
        </div>
        <div class="mess_box">
            <h3>目录</h3>
            <c:forEach var="chapter" items="${chapterList }" varStatus="vs">
	            <div class="section">
	                <div class="section_tital">
	                    <h3>章节</h3>
	                    <div class="circle1">${vs.index+1 }</div>
	                    <span>${chapter.TITLE }</span>
	                </div>
	                <c:forEach var="lessonList" items="${chapter.lessonList}" varStatus="vi">
		                <div class="section_cont">
		                    <span>课时${vi.index+1 }</span>
		                    <a href="train_lesson/goVideo?LESSON_ID=${lessonList.LESSON_ID}" target="_blank">${lessonList.TITLE }</a>
		                </div>
		            </c:forEach>
	            </div>
            </c:forEach>
        </div>
    </div>
</div>
<div class="clear"></div>
<script type="text/javascript">
    $(".top3").addClass("font_size");
   
</script>
</body>
</html>
