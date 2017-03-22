<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>查档服务指南列表页面</title>
	<script src="static/js/jquery-1.7.2.js"></script>
</head>
	
	<body>
		<table id="showTable" border="1" width="500" height="200" align="center">
			
		</table>
		<table id="page" align="center">
			
		</table>
	</body>
	<script type="text/javascript">
	    $().ready(function(){
	        $.ajax({
				type: "POST",
				url: '<%=basePath%>app_documentguide/list.do?type=3&tm='+new Date().getTime()+'&currentPage=1&showCount=15',
				contentType:'application/json;charset=utf-8',
				data : {},
				cache : false,
				success : function(data) {
					for(var i=0;i<data.pds.length;i++){
						var temp = i + 1 ;
						$("#showTable").append("<tr>"
								+"<td>"+temp+"</td>"
								+"<td>"
								+"<a href='<%=basePath%>app_documentguide/goDetail.do?DOCUMENT_ID="+data.pds[i].DOCUMENT_ID+"'>"+data.pds[i].TITLE+"</a></td>"
								+"<td>"+data.pds[i].BROWSING_TIMES+"</td>"
								+"<td>"+data.pds[i].ORIGIN+"</td>"
								+"<td>"+data.pds[i].ADD_TIME+"</td></tr>");
					}
					var previousPage = data.currentPage-1;
					var nextPage = data.currentPage+1;
					$("#page").append("<tr><td colspan='4'>");
					$("#page").append("<input type='button' value='首页' onclick='nextPage(1)'>");
					$("#page").append("<input type='button' value='上一页' onclick='nextPage("+previousPage+")'>");
					$("#page").append("总记录数:"
							+"<font color='red'>"+data.totalResult+"</font>总页数:"
							+"<font color='red'>"+data.totalPage+"</font>当前页数:"
							+"<font color='red'>"+data.currentPage+"</font>");
					$("#page").append("<input type='button' value='下一页' onclick='nextPage("+nextPage+")'>");
					$("#page").append("<input type='button' value='尾页' onclick='nextPage("+data.totalPage+")'></td></tr>");
				}
			});
		});
	    
	    function nextPage(page){ 
	    	$.ajax({
				type: "POST",
				url: '<%=basePath%>app_documentguide/list.do?type=3&tm='+new Date().getTime()+'&currentPage='+page+'&showCount=15',
				contentType:'application/json;charset=utf-8',
				data : {},
				cache : false,
				success : function(data) {
					$("#showTable").empty();
					$("#page").empty();
					for(var i=0;i<data.pds.length;i++){
						var temp = i + 1 ;
						$("#showTable").append("<tr>"
								+"<td>"+temp+"</td>"
								+"<td>"
								+"<a href='<%=basePath%>app_documentguide/goDetail.do?DOCUMENT_ID="+data.pds[i].DOCUMENT_ID+"'>"+data.pds[i].TITLE+"</a></td>"
								+"<td>"+data.pds[i].BROWSING_TIMES+"</td>"
								+"<td>"+data.pds[i].ORIGIN+"</td>"
								+"<td>"+data.pds[i].ADD_TIME+"</td></tr>");
					}
					var previousPage = data.currentPage-1;
					var nextPage = data.currentPage+1;
					$("#page").append("<tr><td colspan='4'>");
					$("#page").append("<input type='button' value='首页' onclick='nextPage(1)'>");
					$("#page").append("<input type='button' value='上一页' onclick='nextPage("+previousPage+")'>");
					$("#page").append("总记录数:"
							+"<font color='red'>"+data.totalResult+"</font>总页数:"
							+"<font color='red'>"+data.totalPage+"</font>当前页数:"
							+"<font color='red'>"+data.currentPage+"</font>");
					$("#page").append("<input type='button' value='下一页' onclick='nextPage("+nextPage+")'>");
					$("#page").append("<input type='button' value='尾页' onclick='nextPage("+data.totalPage+")'></td></tr>");
				}
			});
	   	}

	</script>
</html>
