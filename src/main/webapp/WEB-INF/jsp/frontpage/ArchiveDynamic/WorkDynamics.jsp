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
    <title>普宁档案信息网-工作动态</title>
    <link href="static/css/total.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="content">
    <div class="local">
        <span>当前位置：<a href="app_index/goindex">普宁档案</a>>><a href="app_index/goWorkDynamics">档案动态</a><span>>>工作动态</span></span>
    </div>
    <div class="details">
        <div class="navBox">
            <h2>档案动态</h2>
            <ul class="nav_option">
                <li><a href="app_index/goWorkDynamics" class="active">工作动态</a></li>
                <li><a href="app_index/goNotice">通知公告</a></li>
                <li><a href="app_index/goOtherInformation">他山之石</a></li>
            </ul>
        </div>
        <div class="catalogBox">
            <div class="catalog">
                <ul id="box2">
                   
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
			url: '<%=basePath%>app_doc/getDocList.do?type=7&tm='+new Date().getTime()+'&currentPage=1&showCount=15',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			success : function(data) {
				$(".catalog>ul").empty();
				for(var i=0;i<data.pds.length;i++){
					var time = data.pds[i].ADD_TIME;
					 time = time.substring(5, 10);
					$(".catalog>ul").append(
							  "<li><p>"+time+"</p><img src='static/image/img/ico3.gif' class='text_tital_pag'><a href='<%=basePath%>app_doc/getDocText.do?id="+data.pds[i].DOCUMENT_ID+"&tm="+new Date().getTime()+"'>"+data.pds[i].TITLE+"</a>"+"</li>"
							  );
				}
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				$(".paging").empty();
				$(".paging").append("<input  type='button' id='7"+"' value='首页' onclick='switchPage(1)'>");
				$(".paging").append("<input type='button' id='7"+"' value='上页' onclick='switchPage("+previousPage+")'>");
				$(".paging").append("<font color='red'>"+data.currentPage+"</font>"
						+"/"+data.totalPage);
				$(".paging").append("<input type='button' id='7"+"' value='下页' onclick='switchPage("+nextPage+")'>");
				$(".paging").append("<input type='button' id='7"+"' value='尾页' onclick='switchPage("+data.totalPage+")'>");
			}
		});
  });

    function switchPage(page){
   	 $.ajax({
			type: "POST",
			url: '<%=basePath%>app_doc/getDocList.do?type=7'+'&tm='+new Date().getTime()+'&currentPage='+page+'&showCount=15',
	    	data: {},
			dataType:'json',
			cache: false,
			success: function(data){
				console.log(data);
				$("#dynamicPanel").empty();
				for(var i=0;i<data.pds.length;i++){
				   $(".catalog>ul").empty();
				for(var i=0;i<data.pds.length;i++){
					var time = data.pds[i].ADD_TIME;
					 time = time.substring(5, 10);
					$(".catalog>ul").append(
							  "<li><p>"+time+"</p><img src='static/image/img/ico3.gif' class='text_tital_pag'><a href='<%=basePath%>app_doc/getDocText.do?id="+data.pds[i].DOCUMENT_ID+"&tm="+new Date().getTime()+"'>"+data.pds[i].TITLE+"</a>"+"</li>"
					);
				}
				}
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				$(".paging").empty();
				$(".paging").append("<input  type='button' id='7"+"' value='首页' onclick='switchPage(1)'>");
				$(".paging").append("<input type='button' id='7"+"' value='上页' onclick='switchPage("+previousPage+")'>");
				$(".paging").append("<font color='red'>"+data.currentPage+"</font>"
						+"/"+data.totalPage);
				$(".paging").append("<input type='button' id='7"+"' value='下页' onclick='switchPage("+nextPage+")'>");
				$(".paging").append("<input type='button' id='7"+"' value='尾页' onclick='switchPage("+data.totalPage+")'>");
			}
		});
	}
  </script>
</html>
</html>

