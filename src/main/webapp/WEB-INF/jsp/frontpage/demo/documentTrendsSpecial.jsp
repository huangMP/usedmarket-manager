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
              这是DocumentTrensSpecial页面. 
     <hr>             
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
	     	<tr id="PAGE"><td>${varList.page.pageStr}</td></tr>
	     </tbody>
     	
     </table>  
  </body>
  <script type="text/javascript">
  	
    $().ready(function(){
        $.ajax({
			type: "POST",
			url: '<%=basePath%>app_documentTrends/listSpecial.do?tm='+new Date().getTime(),
	    	data: {},
			dataType:'json',
			cache: false,
			success: function(data){
				
				for(var i=0;i<data.varList.length;i++){
					$("#TBODY").append("<tr>"+
									     	"<td><a href='<%=basePath%>app_documentTrends/getDoc.do?DOCUMENT_ID="+data.varList[i].DOCUMENT_ID+"&BROWSING_TIMES="+data.varList[i].BROWSING_TIMES+"'>"+data.varList[i].TITLE+"</a></td>"+
									     	"<td><a>"+data.varList[i].ORIGIN+"</a></td>"+
									     	"<td><a>"+data.varList[i].ADD_TIME+"</a></td>"+
									     	"<td><a>"+data.varList[i].BROWSING_TIMES+"</a></td>"+
								     	"</tr>");
				}
			}
		});
    });
    
    function getDoc(Id){
    	console.log(Id);
    }
    
    function redirecting(selected){
       if(selected.value!="") window.open(selected.value);      
    }
  </script>
</html>
