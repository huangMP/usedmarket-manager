<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我的学习-培训公告</title>
    <link href="static/css/train_allclass.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/train_total.css"/>    
    <script type="text/javascript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/frontjs/train_alljs.js"></script>
</head>
<body>
<jsp:include page="../train_head.jsp"></jsp:include>
<div class="content">
    <div class="text_box">
        <div class="left_box left_box_ex">
            <div class="land_box">
                <img src="static/image/image-train/tag/library2.png">
                <span class="lab_col">培训公告</span>
            </div>
            <div class="land_box">
                <img src="static/image/image-train/tag/book2.png">
                <span>我的课程</span>
            </div>
            <div class="land_box">
                <img src="static/image/image-train/tag/profile2.png">
                <span>我的考试</span>
            </div>

        </div>
        <div class="right_box right_box_ex">
            <h2>培训公告</h2>
            <div class="text_all">
            <p id="trainingnotice_text"></p>
                <div class="text_mess">
                    <p id="trainingnotice_time"></p>
                    <p id="trainingnotice_orgin"></p>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<script>
    $(".top2").addClass("font_size");
    
</script>
</body>

<script type="text/javascript">
	function show(){
		$.ajax({
			url:'<%=basePath%>train_trainingnotice/list',
			success: function(data){
				//console.log(data.varList.ORIGIN);
				
				//console.log(data.specialList[0]);
				$("#trainingnotice_text").empty();
				$("#trainingnotice_text").append(data.varList.TEXT);
				
				//console.log(data.specialList[0]);
				$("#trainingnotice_time").empty();
				$("#trainingnotice_time").append(data.varList.ADD_TIME);
				
				//console.log(data.specialList[0]);
				$("#trainingnotice_orgin").empty();
				$("#trainingnotice_orgin").append(data.varList.ORIGIN);
			}			
		})
	}
	
	window.onload = show;
</script>
</html>

