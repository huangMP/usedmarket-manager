<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";



%>

<!-- 首页网站链接 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>documentTrends</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="static/js/jquery-1.7.2.js"></script>
  </head>
  
  <body>
              这是DocumentTrens页面. 
     <hr>            
     <table>
     	<tr><td>
     	
     	<button onclick="typeDoc('7')">工作动态</button>
     	<button onclick="typeDoc('8')">通知公告</button>
     	<button onclick="typeDoc('9')">他山之石</button>
     	</td></tr>
     </table>  
     <table>
	     <thead>
	     	<tr>
	     		<th>标题</th>
	     		<th>来源</th>
	     		<th>时间</th>
	     		<th>浏览次数</th>
	     	</tr>
	     </thead>
	     <tbody id="TBODY">
	     	<!-- <tr>
		     	<td><a >工作动态</a></td>
		     	<td><a>通知公告</a></td>
		     	<td><a>他山之石</a></td>
		     	<td><a>他山之石</a></td>
	     	</tr> -->
	     	
	     </tbody>
     </table>  
     <input type="hidden" id="type_num"/>
     <table id="page" align="center">
	 </table>
  </body>
  <script type="text/javascript">
  	function typeDoc(typeId){
			$("#type_num").val(typeId);
			var type = $("#type_num").val();
    		console.log(type);
			$.ajax({
				type: "POST",
				url: '<%=basePath%>app_documentTrends/list.do?type='+type+'&tm='+new Date().getTime()+'&currentPage=1&showCount=15',
		    	data: {},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#TBODY").empty();
					$("#page").empty();
						for(var i=0;i<data.pds.length;i++){
							
							$("#TBODY").append("<tr>"+
											     	"<td><a href='<%=basePath%>app_documentTrends/getDoc.do?DOCUMENT_ID="+data.pds[i].DOCUMENT_ID+"&BROWSING_TIMES="+data.pds[i].BROWSING_TIMES+"'>"+data.pds[i].TITLE+"</a></td>"+
											     	"<td><a>"+data.pds[i].ORIGIN+"</a></td>"+
											     	"<td><a>"+data.pds[i].ADD_TIME+"</a></td>"+
											     	"<td><a>"+data.pds[i].BROWSING_TIMES+"</a></td>"+
										     	"</tr>");
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
  	
    $().ready(function(){
    	
        $.ajax({
			type: "POST",
			url: '<%=basePath%>app_documentTrends/list.do?tm='+new Date().getTime()+'&currentPage=1&showCount=15',
	    	data: {},
			dataType:'json',
			cache: false,
			success: function(data){
				$("#TBODY").empty();
					for(var i=0;i<data.pds.length;i++){
						
						$("#TBODY").append("<tr>"+
										     	"<td><a href='<%=basePath%>app_documentTrends/getDoc.do?DOCUMENT_ID="+data.pds[i].DOCUMENT_ID+"&BROWSING_TIMES="+data.pds[i].BROWSING_TIMES+"'>"+data.pds[i].TITLE+"</a></td>"+
										     	"<td><a>"+data.pds[i].ORIGIN+"</a></td>"+
										     	"<td><a>"+data.pds[i].ADD_TIME+"</a></td>"+
										     	"<td><a>"+data.pds[i].BROWSING_TIMES+"</a></td>"+
									     	"</tr>");
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
    		var type = $("#type_num").val();
    		console.log(type);
	    	$.ajax({
				type: "POST",
				url: '<%=basePath%>app_documentTrends/list.do?type='+type+'&tm='+new Date().getTime()+'&currentPage='+page+'&showCount=15',
				contentType:'application/json;charset=utf-8',
				data : {},
				cache : false,
				success : function(data) {
					$("#TBODY").empty();
					$("#page").empty();
					for(var i=0;i<data.pds.length;i++){
						
						$("#TBODY").append("<tr>"+
										     	"<td><a href='<%=basePath%>app_documentTrends/getDoc.do?DOCUMENT_ID="+data.pds[i].DOCUMENT_ID+"&BROWSING_TIMES="+data.pds[i].BROWSING_TIMES+"'>"+data.pds[i].TITLE+"</a></td>"+
										     	"<td><a>"+data.pds[i].ORIGIN+"</a></td>"+
										     	"<td><a>"+data.pds[i].ADD_TIME+"</a></td>"+
										     	"<td><a>"+data.pds[i].BROWSING_TIMES+"</a></td>"+
									     	"</tr>");
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
    
    function redirecting(selected){
       if(selected.value!="") window.open(selected.value);      
    }
  </script>
</html>
