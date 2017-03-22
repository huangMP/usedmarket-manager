<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>普宁档案信息网-业务培训</title>
    <link href="static/css/total.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="content">
    <div class="local">
        <span>当前位置：<a href="app_index/goindex">普宁档案</a>>><a href="app_index/goBusinessGuide">业务指导</a><span>>>业务培训</span></span>
    </div>
    <div class="details">
        <div class="navBox">
            <h2>业务指导</h2>
            <ul class="nav_option">
                <li><a href="app_index/goBusinessGuide">业务指南</a></li>
                <li><a href="app_index/goOnlineRegistration">在线报名</a></li>
                <li><a href="app_index/goBusinessTraining" class="active">业务培训</a></li>
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
</body>
<script type="text/javascript">
	    $().ready(function(){
	        $.ajax({
				type: "POST",
				url: '<%=basePath%>app_businesstraining/list.do?tm='+new Date().getTime()+'&currentPage=1&showCount=8',
				contentType:'application/json;charset=utf-8',
				data : {},
				cache : false,
				success : function(data) {
					$(".video_catalog>ul").empty();
					for(var i=0;i<data.pds.length;i++){
						var time = new Date(data.pds[i].ADD_TIME);
						time = time.toLocaleString().substring(0, 10).toString();
						$(".video_catalog>ul").append(
								  "<li>"
								  +"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'>"
									+"<img src='"+data.pds[i].IMG_PATH+"'/></a>"
									+"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'class='title'>"
									+data.pds[i].TITLE+"</a>"
									+"</li>"
								  );
						
					}
					var previousPage = data.currentPage-1;
					var nextPage = data.currentPage+1;
					
					$(".paging").append("<input type='button' value='首页' onclick='nextPage(1)'>");
					$(".paging").append("<input type='button' value='上页' onclick='nextPage("+previousPage+")'>");
					$(".paging").append("<font color='red'>"+data.currentPage+"</font>"
							+"/"+data.totalPage);
					$(".paging").append("<input type='button' value='下页' onclick='nextPage("+nextPage+")'>");
					$(".paging").append("<input type='button' value='尾页' onclick='nextPage("+data.totalPage+")'>"); 
				}
			});
		});
	    
	     function nextPage(page){ 
	    	$.ajax({
				type: "POST",
				url: '<%=basePath%>app_businesstraining/list.do?tm='+new Date().getTime()+'&currentPage='+page+'&showCount=8',
				contentType:'application/json;charset=utf-8',
				data : {},
				cache : false,
				success : function(data) {
					$(".video_catalog>ul").empty();
					for(var i=0;i<data.pds.length;i++){
						var time = new Date(data.pds[i].ADD_TIME);
						time = time.toLocaleString().substring(0, 10).toString();
						$(".video_catalog>ul").append(
								  "<li>"
								  +"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'>"
									+"<img src='"+data.pds[i].IMG_PATH+"'/></a>"
									+"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'>"
									+data.pds[i].TITLE+"</a>"
									+"</li>"
								  );
						
					}
					if(data.currentPage>1){
						var previousPage = data.currentPage-1;
					}
					if(data.currentPage<data.totalPage){
						var nextPage = data.currentPage+1;
					}
					$(".paging").empty();
					$(".paging").append("<input type='button' value='首页' onclick='nextPage(1)'>");
					$(".paging").append("<input type='button' value='上页' onclick='nextPage("+previousPage+")'>");
					$(".paging").append("<font color='red'>"+data.currentPage+"</font>"
							+"/"+data.totalPage);
					$(".paging").append("<input type='button' value='下页' onclick='nextPage("+nextPage+")'>");
					
					$(".paging").append("<input type='button' value='尾页' onclick='nextPage("+data.totalPage+")'>");
				}
			});
	   	}

	</script>
</html>
