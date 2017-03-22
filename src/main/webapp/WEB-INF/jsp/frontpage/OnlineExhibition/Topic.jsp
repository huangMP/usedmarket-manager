<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>普宁档案信息网-网上展厅</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="static/css/total.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script language="JavaScript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>

  </head>
  
  <body>
    <jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<div class="local">
			<span>当前位置：<a href="app_index/goindex">普宁档案</a><span>>>网上展厅</span></span>
		</div>
		<div class="details">
			<div class="navBox">
				<h2>网上展厅</h2>
				<ul class="nav_option" id="navigation">
				</ul>
			</div>
			<div class="catalogBox">
				<div class="video_catalog">
					<ul class="video_box">
						
					</ul>
				</div>
				<div class="paging">
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	 <script type="text/javascript">
    $().ready(function(){
        $.ajax({
			type: "POST",
			url: '<%=basePath%>app_exhibition/getSubjectsList.do?tm='+new Date().getTime(),
	    	data: {},
			dataType:'json',
			cache: false,
			success: function(data){
			
				for(var i=0;i<data.length;i++){
				   var str = "<li onclick='getExhibition(\""+data[i].SUBJECT_ID+"\");' str='你好one' id='"+data[i].SUBJECT_ID+"'><a>"+data[i].SUBJECT_NAME+"</a></li>";
				   $("#navigation").append(str);  
				}	
			  getExhibition(data[0].SUBJECT_ID);
			}
		});
		
    });
    
     function getExhibition(suject_id){
    	 $(".video_catalog>ul").children().remove();
		 	$(".paging").children().remove();
    	$.ajax({
			type: "POST",
			url: '<%=basePath%>app_exhibition/getExhibitionList.do?type='+suject_id+'&tm='+new Date().getTime()+'&currentPage=1&showCount=8',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			success : function(data) {
				$(".video_catalog>ul").empty();
				for(var i=0;i<data.pds.length;i++){
					var time = new Date(data.pds[i].ADD_TIME);
					time = time.toLocaleString().substring(0, 10).toString();
					$(".video_catalog>ul").append("<li>"
							+"<a href='"+data.pds[i].LINK+"'><img src='${pageContext.request.contextPath}"+data.pds[i].IMG_PATH+"'/></a>"
							+"<a href='"+data.pds[i].LINK+"'class='title'>"+data.pds[i].TITLE+"</a>"+"</li>"
						);
				}
				$(".paging").empty();
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				
				$(".paging").append("<input type='button' id='"+suject_id+"' value='首页' onclick='switchPage(this,1)'>");
				$(".paging").append("<input type='button' id='"+suject_id+"' value='上一页' onclick='switchPage(this,"+previousPage+")'>");
				$(".paging").append("<span><font color='red'>"+data.currentPage+"</font>"
						+"/"+data.totalPage+"<\span>");
				$(".paging").append("<input type='button' id='"+suject_id+"' value='下一页' onclick='switchPage(this,"+nextPage+")'>");
				$(".paging").append("<input type='button' id='"+suject_id+"'  value='尾页' onclick='switchPage(this,"+data.totalPage+")'>"); 
			}
		});   
    };
    function switchPage(button,page){
      	 $.ajax({
   			type: "POST",
   			url: '<%=basePath%>app_exhibition/getExhibitionList.do?type='+suject_id+'&tm='+new Date().getTime()+'&currentPage='+page+'&showCount=8',
   	    	data: {},
   			dataType:'json',
   			cache: false,
   			success: function(data){
   			 	$(".video_catalog>ul").children().remove();
   			 	$(".paging").children().remove();
   				for(var i=0;i<data.pds.length;i++){
   					var time = new Date(data.pds[i].ADD_TIME);
   					time = time.toLocaleString().substring(0, 10).toString();
   					$(".video_catalog>ul").append("<li>"
							+"<a href='"+data.pds[i].LINK+"'><img src='"+data.pds[i].IMG_PATH+"'/></a>"
							+"<a href='"+data.pds[i].LINK+"'>"+data.pds[i].TITLE+"</a>"+"</li>"
						);
   				}
   				if(data.currentPage>1){
   					var previousPage = data.currentPage-1;
				}
				if(data.currentPage<data.totalPage){
	   				var nextPage = data.currentPage+1;
				}
   				
   				$(".paging").append("<input type='button' id='"+suject_id+"' value='首页' onclick='switchPage(this,1)'>");
				$(".paging").append("<input type='button' id='"+suject_id+"' value='上一页' onclick='switchPage(this,"+previousPage+")'>");
				$(".paging").append("<span><font color='red'>"+data.currentPage+"</font>"
						+"/"+data.totalPage+"<\span>");
				$(".paging").append("<input type='button' id='"+suject_id+"' value='下一页' onclick='switchPage(this,"+nextPage+")'>");
				$(".paging").append("<input type='button' id='"+suject_id+"'  value='尾页' onclick='switchPage(this,"+data.totalPage+")'>"); 
   			}
   		});
      } 
  </script>
  </body>
</html>
