<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我的学习-我的考试</title>
    <link href="static/css/train_allclass.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/train_total.css"/>    
    <script type="text/javascript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/frontjs/train_alljs.js"></script>
    <style>
    	#showTest>li{
    		position:relative;
    	}
    	#showTest>li>span{
    		position:absolute;
    		margin-left:0;
    		left:320px;
    		top:-2px
    	}
    	#showTest>li>.text{
    		position:absolute;
    	}
    	#showTest>li>.gotest{
    		position:absolute;
    		margin-left:0;
    		left:660px;
    		top:-7px;
    	}
    
    </style>
</head>
<body>
<jsp:include page="../train_head.jsp"></jsp:include>
<div class="content">
    <div class="text_box">
        <div class="left_box left_box_ex">
            <div class="land_box">
                <img src="static/image/image-train/tag/library2.png">
                <span>培训公告</span>
            </div>
            <div class="land_box">
                <img src="static/image/image-train/tag/book2.png">
                <span>我的课程</span>
            </div>
            <div class="land_box">
                <img src="static/image/image-train/tag/profile2.png">
                <span class="lab_col">我的考试</span>
            </div>

        </div>
        
	        <div class="right_box right_box_ex">
	            <h3>我的考试</h3>
	            <ul class="test_nav" id="showTest">
	            
	            </ul>
	            <div class="change_page">
	            
	            </div>
	        </div>
	    
    </div>
</div>
<div class="clear"></div>
<script>
    $(".top2").addClass("font_size");
    

    
    function showGoTest(){
    	$.ajax({
			type: "POST",
			url: '<%=basePath%>train_special/goTest?currentPage=1&showCount=10',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			success : function(data) {
				for(var i=0;i<data.pds.length;i++){
					if(data.pds[i].STATUS == 0){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span class='no_finish'>未完成</span>"
						+"<a href='train_special/test?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest'>去考试</a></li>");
					}
					if(data.pds[i].STATUS == 1){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>已完成</span>"
						+"<a class='gotest' style='background:#aaa;cursor:default'>待审批</a></li>");
					}
					if(data.pds[i].STATUS == 2 || data.pds[i].STATUS == 3){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>已完成</span>"
						+"<a href='train_special/goCheck?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest check_score'>查成绩</a></li>");
					}
					
					if(data.pds[i].STATUS == 4){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span class='no_finish'>未通过(可补考)</span>"
						+"<a href='train_special/test?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest gotest_again'>去补考</a></li>");
					}
					if(data.pds[i].STATUS == 5){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>补考已完成</span>"
						+"<a class='gotest' style='background:#aaa;cursor:default'>待审批</a></li>");
					}
					if(data.pds[i].STATUS == 6 || data.pds[i].STATUS == 7){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>补考已完成</span>"
						+"<a href='train_special/goCheck?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest check_score'>查成绩</a></li>");
					}
				}
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				$(".change_page").append("<button onclick='nextPage("+previousPage+")'>上页</button>");
				$(".change_page").append("<span>页数："+data.currentPage+"/"+data.totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage("+nextPage+")'>下页</button>");

			}
		});
    }
    
     function nextPage(page){ 
    	
    	if(page === 0) return false;
    	
    	$.ajax({
			type: "POST",
			url: '<%=basePath%>train_special/goTest?currentPage='+page+'&showCount=10',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			success : function(data) {
				
				$("#showTest").empty();
				$(".change_page").empty();
				for(var i=0;i<data.pds.length;i++){
					if(data.pds[i].STATUS == 0){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span class='no_finish'>未完成</span>"
						+"<a href='train_special/test?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest'>去考试</a></li>");
					}
					if(data.pds[i].STATUS == 1){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>已完成</span>"
						+"<a class='gotest' style='background:#aaa;cursor:default'>待审批</a></li>");
					}
					if(data.pds[i].STATUS == 2 || data.pds[i].STATUS == 3){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>已完成</span>"
						+"<a href='train_special/goCheck?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest check_score'>查成绩</a></li>");
					}
					
					if(data.pds[i].STATUS == 4){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span class='no_finish'>未通过(可补考)</span>"
						+"<a href='train_special/test?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest gotest_again'>去补考</a></li>");
					}
					if(data.pds[i].STATUS == 5){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>补考已完成</span>"
						+"<a class='gotest' style='background:#aaa;cursor:default'>待审批</a></li>");
					}
					if(data.pds[i].STATUS == 6 || data.pds[i].STATUS == 7){
						$("#showTest").append("<li><img src='static/image/image-train/tag/ico3.png' class='tag_img'>"
						+"<div class='text'>"+data.pds[i].TITLE+"</div>"
						+"<span>补考已完成</span>"
						+"<a href='train_special/goCheck?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"&STATUS="+data.pds[i].STATUS+"' class='gotest check_score'>查成绩</a></li>");
					}
				}
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				$(".change_page").append("<button onclick='nextPage("+previousPage+")'>上页</button>");
				$(".change_page").append("<span>页数："+data.currentPage+"/"+data.totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage("+nextPage+")'>下页</button>");
				
			}
		});
   	} 
 
    
    window.onload=function(){
    	showGoTest();
    };
</script>
</body>
</html>
