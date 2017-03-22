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
    <title>普宁档案信息网-局馆荣誉</title>
    <link href="static/css/total.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="content">
    <div class="local">
        <span>当前位置：<a href="app_index/goindex">普宁档案</a>>><a href="app_index/goArchiveIntroduction">局馆介绍</a><span>>>局馆荣誉</span></span>
    </div>
    <div class="details">
        <div class="navBox">
            <h2>局馆介绍</h2>
            <ul class="nav_option">
                <li><a href="app_index/goArchiveIntroduction">局馆介绍</a></li>
                <li><a href="app_index/goLeadershipRanks">领导班子</a></li>
                <li><a href="app_index/goMechanismFunction">机构职能</a></li>
                <li><a href="app_index/goArchiveScene">局馆风貌</a></li>
                <li><a href="app_index/goArchiveHonor" class="active">局馆荣誉</a></li>
                <li><a href="app_index/goLeadershipConcern">领导关怀</a></li>
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
	//用来存放后台传过来的pageBean
	var pageBean = "";
	//初始化默认当前页面为第一页
	var currentPage_val = 1;
	//初始化默认每页显示信息条数为15
	var showCount_val = 15;
	
	//得到pageBean信息
	$(document).ready(function(){
		getPageData();
		function getPageData(){
			//清空现有数据
		    $(".catalog>ul").children().remove();
			$(".paging").children().remove();
			$.ajax({
				type: "post",
            	url: "<%=basePath%>app_photoalbum/list.do"+"?showCount="+showCount_val+"&currentPage="+currentPage_val+"&keywords=2",
            	contentType: "application/json;charset=utf-8",
            	dataType:'json',
            	success: function (data) {
             		pageBean = data[0] ;
             		showPageData();
             		showNavigationBars();
            	}
			});
		}
		//显示后台返回的列表数据
		function showPageData(){
    		for(var i = 0;i<pageBean.pds.length;i++){
		          var time = pageBean.pds[i].ADD_TIME;
	              time = time.substring(5, 10);
				$(".catalog>ul").append(
					  "<li><p>"+time+"</p><img src='static/image/img/ico3.gif' class='text_tital_pag'><a href='<%=basePath%>app_photoalbum/goDetailPage.do?PHOTOALBUM_ID="+pageBean.pds[i].PHOTOALBUM_ID+"'>"+pageBean.pds[i].TITLE+"</a>"+"</li>"
				);
			} 
		}
		//显示导航条信息(上一页，下一页，共几页……那一栏)
		function showNavigationBars(){
			$(".paging").empty();
			$(".paging").append("<input  type='button' id='homepage"+"' value='首页'>");
			$(".paging").append("<input type='button' id='previousPage"+"' value='上页'>");
			$(".paging").append("<font color='red'>"+pageBean.currentPage+"</font>"
					+"/"+pageBean.totalPage);
			$(".paging").append("<input type='button' id='nextPage"+"' value='下页'>");
			$(".paging").append("<input type='button' id='tailpage"+"' value='尾页'>");
	
			//首页_点击事件
			$("#homepage").click(function(){ 
				currentPage_val = 1;
				getPageData();
			});
			//尾页_点击事件
			$("#tailpage").click(function(){ 
				currentPage_val = pageBean.totalPage;
				getPageData();
			});
		
			if( currentPage_val > 1 ){
				//上一页_点击事件
				$("#previousPage").click(function(){ 
					currentPage_val = currentPage_val - 1;
					getPageData();
				});
			}
		
			if( currentPage_val < pageBean.totalPage ){
				//下一页_点击事件
				$("#nextPage").click(function(){ 
					currentPage_val = currentPage_val + 1;
					getPageData();
				});
			}
		}	
	});
	</script>
</html>

