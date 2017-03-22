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
    <title>全部课程-首页</title>
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
            <h5>全部课程</h5>
            <div class="img_box" >
            	<div class="class_box">
	                
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
    $(".top3").addClass("font_size");
</script>

<script type="text/javascript">
	function show(){
		$.ajax({
			url:'<%=basePath%>train_special/special_list?tm='+new Date().getTime()+'&currentPage=1&showCount=8',
			success:function(data){

				$(".class_box").empty();

				for(var i=0;i<data.pds.length;i++){
					$(".class_box").append("<div class='learn_box'>"+
		                    		"<a href='train_special/goSpecial?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"' target='_blank'>"+
		                   			"<img src='<%=basePath%>"+data.pds[i].IMG_PATH+"'></a>"+
		                    		"<p>"+data.pds[i].TITLE+"</p>"+
		                			"</div>"); 
				}
				
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				
				//console.log(totalPage);
				$(".change_page").empty();
				
				$(".change_page").append("<button  onclick='nextPage("+previousPage+")'>上一页</button>");
				$(".change_page").append("<span>"+data.currentPage+"/"+data.totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage("+nextPage+")'>下一页</button>");
				
			}
		})
	}
	
	function nextPage(page){ 
		
    	$.ajax({
			url: '<%=basePath%>train_special/special_list?tm='+new Date().getTime()+'&currentPage='+page+'&showCount=8',
			success : function(data) {
				
				$(".class_box").empty();
				
				for(var i=0;i<data.pds.length;i++){
					$(".class_box").append("<div class='learn_box'>"+
		                    		"<a href='train_special/goSpecial?SPECIAL_ID="+data.pds[i].SPECIAL_ID+"' target='_blank'>"+
		                   			"<img src='<%=basePath%>"+data.pds[i].IMG_PATH+"'></a>"+
		                    		"<p>"+data.pds[i].TITLE+"</p>"+
		                			"</div>"); 
				}
				
				
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				$(".change_page").empty();
				
				$(".change_page").append("<button  onclick='nextPage("+previousPage+")'>上一页</button>");
				$(".change_page").append("<span>"+data.currentPage+"/"+data.totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage("+nextPage+")'>下一页</button>");
			}
		});
   	}

	window.onload = show;
</script>

</body>
</html>
