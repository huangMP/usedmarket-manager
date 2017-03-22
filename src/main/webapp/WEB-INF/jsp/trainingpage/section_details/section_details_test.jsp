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
    <title>章节详情-章节练习</title>
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
                <button class="top_land_butt text_land" >文档</button>
                <button class="top_land_butt exercise_land" style="background: #5cb85c">章节练习</button>
            </div>
            <input hidden="hidden" value="${LESSON_ID}" name="LESSON_ID" id="LESSON_ID">
			<c:choose>
				<c:when test="${PATH_NUM == 0}">
					<div class="section_details_cont">
						
						<div class="none" style="margin-left:215px">
                	<p class="none_tit tital">该章节没有练习题</p>
                	<img src="static/image/image-train/none4.png" class="none_pag">
            	</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="section_details_cont section_test">
						<div class="topic">
							<p class="tital">题目</p>
							<div class="test_content">
								<iframe id="myframe" src="<%=basePath%>${fileHtmlPath}" width="600px" height="948px"></iframe>
								<input hidden="hidden" id="answerPath" value="${answerHtmlPath}"/>
							</div>
						</div>
							
						<div class="answer_sheet">
							<p class="tital">答题卡</p>
							<div class="answei_box">
								<p class="second_tital">单选题</p>
								<div class="single">
									<c:forEach begin="1" end="${PATH_NUM}" var="var">
										<div class="answer_box">${var}.<input type="text"></div>
									</c:forEach>                   
								</div>
								<input type="submit" value="提交" class="up_test" id="testSubmit" >
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
        </div>
    </div>
</div>
<div class="clear"></div>
<script>
    $(".top2").addClass("font_size");
    

    $("#testSubmit").click(function(){
    	var answerHtmlPath = $("#answerPath").val();
    	$("#myframe").attr("src" , answerHtmlPath );
   	});
</script>
</body>
</html>
