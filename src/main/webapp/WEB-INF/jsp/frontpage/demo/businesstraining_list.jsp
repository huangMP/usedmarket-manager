<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
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
				url: '<%=basePath%>app_businesstraining/list.do?tm='+new Date().getTime()+'&currentPage=1&showCount=8',
				contentType:'application/json;charset=utf-8',
				data : {},
				cache : false,
				success : function(data) {
					$("#showTable").append("<tr><td>视频封面</td><td>标题</td><td>时间</td></tr>");
					for(var i=0;i<data.pds.length;i++){
						$("#showTable").append("<tr>"
								+"<td>"
								+"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'>"
								+"<img style='height: 80px;' src='"+data.pds[i].IMG_PATH+"'/></td></a>"
								+"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'>"
								+"<td>"+data.pds[i].TITLE+"</td></a>"
								+"<td>"+data.pds[i].ADDTIME+"</td></tr>");
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
				url: '<%=basePath%>app_businesstraining/list.do?tm='+new Date().getTime()+'&currentPage='+page+'&showCount=8',
				contentType:'application/json;charset=utf-8',
				data : {},
				cache : false,
				success : function(data) {
					$("#showTable").empty();
					$("#page").empty();
					$("#showTable").append("<tr><td>视频封面</td><td>标题</td><td>时间</td></tr>");
					for(var i=0;i<data.pds.length;i++){
						$("#showTable").append("<tr>"
								+"<td>"
								+"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'>"
								+"<img style='height: 80px;' src='"+data.pds[i].IMG_PATH+"'/></td></a>"
								+"<a href='<%=basePath%>app_businesstraining/goDetail.do?VIDEO_ID="+data.pds[i].VIDEO_ID+"&tm="+new Date().getTime()+"'>"
								+"<td>"+data.pds[i].TITLE+"</td></a>"
								+"<td>"+data.pds[i].ADDTIME+"</td></tr>");
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
