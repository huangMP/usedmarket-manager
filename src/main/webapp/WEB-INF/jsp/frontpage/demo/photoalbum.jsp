<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>
<!DOCTYPE html>
<html lang="en">
<head>

<base href="<%=basePath%>">
<title>图集管理</title>

</head>
<body class="no-skin">
	<h1>图集管理</h1>
    <button onclick="onClickView();">局馆风貌</button>
    <button onclick="onClickHonor();">局馆荣誉</button>
    <button onclick="onClickCaringLeadership();">领导关怀</button>
    
	<table >
		<tr>
			<th class="center">标题</th>
			<th class="center">添加时间</th>
		</tr>
		<tbody id="showTable">

		</tbody>
	</table>
	<table >
		<tr>
			<td >
				<div id="pageStr" ></div>
			</td>
		</tr>
	</table>

	<script src="static/js/jquery-1.7.2.js"></script>
     
    
	<script type="text/javascript">
	
	//用来存放后台传过来的pageBean
	var pageBean = "";
	//初始化默认当前页面为第一页
	var currentPage_val = 1;
	//初始化默认每页显示信息条数为15
	var showCount_val = 15;
	//检索条件:1是局馆风貌，2是局馆荣誉,3是领导关怀
	var keyword = 1;
	
	//得到pageBean信息
	function getPageData(){
		//清空现有数据
	    $("#showTable").children().remove();
		$("#pageStr").children().remove();
		$.ajax({
			type: "post",
            url: "<%=basePath%>app_photoalbum/list.do"+"?showCount="+showCount_val+"&currentPage="+currentPage_val+"&keywords="+keyword+"",
            //data: {},
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
    		var begin = "<tr>";
    		var TITLE = "<td name='photoAlbum_TITLE' value='"+pageBean.pds[i].PHOTOALBUM_ID+"'>"+pageBean.pds[i].TITLE+"</td>";
    		var ADD_TIME = "<td>"+pageBean.pds[i].ADD_TIME+"</td>";
    		var ending = "</tr>";
			$("#showTable").append(begin);
			$("#showTable").append(TITLE);
			$("#showTable").append(ADD_TIME);
			$("#showTable").append(ending);
    	} 
    	//标题_点击事件
		$("[name='photoAlbum_TITLE']").click(function(){ 
			var PHOTOALBUM_ID_val=$(this).attr("value");
			location.href = "<%=basePath%>app_photoalbum/goDetailPage.do?PHOTOALBUM_ID="+PHOTOALBUM_ID_val;	//location.href实现客户端页面的跳转  
		});
	}
	
	//显示导航条信息(上一页，下一页，共几页……那一栏)
	function showNavigationBars(){
		var totalResult ="<input id='totalResult' type='button' value='总结果数:"+pageBean.totalResult+"' >";
		var currentResult ="<input id='currentResult' type='button' value='当页结果数:"+pageBean.pds.length+"' >";
		var previousPage ="<input id='previousPage' type='button' value='上一页' >";
		var nextPage ="<input id='nextPage' type='button' value='下一页' >";
		var allPage = "<input id='allPage' type='button' value='共"+pageBean.totalPage+"页' >";
		var gotoPage = "<input id='gotoPage' type='button' value='跳转' >";
		
		var gotoPageInput = "<select id='gotoPageInput'>";
		gotoPageInput = gotoPageInput+"<option value='"+pageBean.currentPage+"'>"+pageBean.currentPage+"</option>";
		for(var i=1;i<=pageBean.totalPage;i++){
			gotoPageInput = gotoPageInput+"<option value='"+i+"'>"+i+"</option>";
		}
		gotoPageInput = gotoPageInput + "</select>";
		
		var showCount = "<select id='showCount'>";
		showCount = showCount + "	<option value='"+pageBean.showCount+"'>当前每页信息数:"+pageBean.showCount+"</option>";
		showCount = showCount + "	<option value='10'>10</option>";
		showCount = showCount + "	<option value='20'>20</option>";
		showCount = showCount + "	<option value='30'>30</option>";
		showCount = showCount + "	<option value='40'>40</option>";
		showCount = showCount + "	<option value='50'>50</option>";
		showCount = showCount + "	<option value='60'>60</option>";
		showCount = showCount + "	<option value='70'>70</option>";
		showCount = showCount + "	<option value='80'>80</option>";
		showCount = showCount + "	<option value='90'>90</option>";
		showCount = showCount + "	<option value='99'>99</option>";
		showCount = showCount + "	</select>";

		$("#pageStr").append(currentResult);
		$("#pageStr").append(totalResult);
		$("#pageStr").append(previousPage);
		$("#pageStr").append(nextPage);
		$("#pageStr").append(allPage);
		$("#pageStr").append(gotoPage);
		$("#pageStr").append(gotoPageInput);
		$("#pageStr").append(showCount);

		//跳转_点击事件
		$("#gotoPage").click(function(){ 
			currentPage_val = $("#gotoPageInput").val();
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
		
		//每页显示条数_change事件
		$("#showCount").change(function(){ 
			currentPage_val = 1;
			showCount_val = this.value;
			getPageData();
		});
	}
	
	//修改检索条件 keyword ，并从后台获取新的pageBean数据   （检索条件:1是局馆风貌，2是局馆荣誉,3是领导关怀）
	function onClickView(){
		keyword = 1;
		getPageData();
	}
	
	//修改检索条件 keyword ，并从后台获取新的pageBean数据   （检索条件:1是局馆风貌，2是局馆荣誉,3是领导关怀）
	function onClickHonor(){
		keyword = 2;
		getPageData();
	}
	
	//修改检索条件 keyword ，并从后台获取新的pageBean数据   （检索条件:1是局馆风貌，2是局馆荣誉,3是领导关怀）
	function onClickCaringLeadership(){
		keyword = 3;
		getPageData();
	}
		
	</script>
</body>
</html>