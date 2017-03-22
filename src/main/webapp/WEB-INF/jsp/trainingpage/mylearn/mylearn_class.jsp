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
    <title>我的学习-我的课程</title>
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
                <span>培训公告</span>
            </div>
            <div class="land_box">
                <img src="static/image/image-train/tag/book2.png">
                <span class="lab_col">我的课程</span>
            </div>
            <div class="land_box">
                <img src="static/image/image-train/tag/profile2.png">
                <span>我的考试</span>
            </div>

        </div>
        <div class="right_box right_box_ex">
            <h3>我的课程</h3>
            <div class="img_box" >
            	<div id="myspecial">
	                
                </div>
                <div class="change_page">
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
			url:'<%=basePath%>train_special/myspecial_list',
			success:function(data){
				//console.log("success");
				$("#myspecial").empty();
				//console.log(data.pds.length);
				var num = data.pds.length >=6 ? 6 : data.pds.length;
				for(var i=0;i<num;i++){
					$("#myspecial").append("<div class='learn_box'>"+
		                    		"<a href='train_special/goSpecial?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"' target='_blank'>"+
		                   			"<img src='<%=basePath%>"+data.pds[i].IMG_PATH+"'></a>"+
		                    		"<p>"+data.pds[i].TITLE+"</p>"+
		                			"</div>"); 
				}
				
				var currentPage = 1;
				var previousPage = currentPage-1;
				var nextPage = currentPage+1;
				
				var totalPage =parseInt(data.pds.length/6)+1;
				
				//console.log(totalPage);
				$(".change_page").empty();
				
				$(".change_page").append("<button  onclick='nextPage(\""+previousPage+"\",\""+totalPage+"\")'>上一页</button>");
				$(".change_page").append("<span>"+currentPage+"/"+totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage(\""+nextPage+"\",\""+totalPage+"\")'>下一页</button>");
				
			}
		})
	}
	
	function nextPage(page,totalPage){ 
		
		var currentPage = 0;
		currentPage = parseInt(page);
		
		if(page == 1) {
			show();
			return false;
		}
		if(page > totalPage) return false;
		if(page <= 0) return false;
		
    	$.ajax({
			url: '<%=basePath%>train_special/myspecial_list',
			success : function(data) {
				
				$("#myspecial").empty();
				
				
				var num =  data.pds.length%6 >= 6 ? 6: data.pds.length%6;//取模
				var sum = (currentPage-1)*6 + num;
				//console.log(sum);
				for(var i=(currentPage-1)*6;i<sum;i++){
					$("#myspecial").append("<div class='learn_box'>"+
		                    		"<a href='train_special/goSpecial?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"' target='_blank'>"+
		                   			"<img src='<%=basePath%>"+data.pds[i].IMG_PATH+"'></a>"+
		                    		"<p>"+data.pds[i].TITLE+"</p>"+
		                			"</div>"); 
				}
				
				
				var previousPage = currentPage-1;
				var nextPage = currentPage+1;
				var totalPage =parseInt(data.pds.length/6)+1;
				$(".change_page").empty();
				
				$(".change_page").append("<button  onclick='nextPage(\""+previousPage+"\",\""+totalPage+"\")'>上一页</button>");
				$(".change_page").append("<span>"+currentPage+"/"+totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage(\""+nextPage+"\",\""+totalPage+"\")'>下一页</button>");
			}
		});
   	}

	window.onload = show;
</script>
</html>
