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
    
    <title>My JSP 'linktest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="static/js/jquery-1.7.2.js"></script>
  </head>
  
  <body>
              这是网上展厅页面. 
     <hr>
     <table id="subject">
     </table>
     <div>
     	<table id="dynamicPanel">
     	</table>
     </div>
     <table id="page">
     </table>           
  </body>
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
				   $("#subject").append("<tr><td><button onclick='getExhibition(this);' id='"+data[i].SUBJECT_ID+"'>"+data[i].SUBJECT_NAME+"</button></td></tr>");
				}
			}
		});
    });
    
    function getExhibition(button){
    	$.ajax({
			type: "POST",
			url: '<%=basePath%>app_exhibition/getExhibitionList.do?type='+button.id+'&tm='+new Date().getTime()+'&currentPage=1&showCount=2',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			success : function(data) {
				$("#dynamicPanel").empty();
				for(var i=0;i<data.pds.length;i++){
					var time = new Date(data.pds[i].ADD_TIME);
					time = time.toLocaleString().substring(0, 10).toString();
					$("#dynamicPanel").append(
									  "<tr>"+
										"<td>"+
										  "<a href='"+data.pds[i].LINK+"'>"+
										  	data.pds[i].TITLE+
										  "</a>"+
										"</td>"+
									  "</tr>"+
									  "<tr>"+
									    "<td>"+
									    	time+
									    "</td>"+
									    "<td>"+
									        data.pds[i].IMG_PATH+
									    "</td>"+
									  "</tr>"
							 			 );
				}
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				$("#page").empty();
				$("#page").append("<tr><td colspan='4'>");
				$("#page").append("<input type='button' id='"+button.id+"' value='首页' onclick='switchPage(this,1)'>");
				$("#page").append("<input type='button' id='"+button.id+"' value='上一页' onclick='switchPage(this,"+previousPage+")'>");
				$("#page").append("总记录数:"
						+"<font color='red'>"+data.totalResult+"</font>总页数:"
						+"<font color='red'>"+data.totalPage+"</font>当前页数:"
						+"<font color='red'>"+data.currentPage+"</font>");
				$("#page").append("<input type='button' id='"+button.id+"' value='下一页' onclick='switchPage(this,"+nextPage+")'>");
				$("#page").append("<input type='button' id='"+button.id+"' value='尾页' onclick='switchPage(this,"+data.totalPage+")'></td></tr>");
			}
		});   
    }
    function switchPage(button,page){
      	 $.ajax({
   			type: "POST",
   			url: '<%=basePath%>app_exhibition/getExhibitionList.do?type='+button.id+'&tm='+new Date().getTime()+'&currentPage='+page+'&showCount=2',
   	    	data: {},
   			dataType:'json',
   			cache: false,
   			success: function(data){
   				console.log(data);
   				$("#dynamicPanel").empty();
   				for(var i=0;i<data.pds.length;i++){
   					var time = new Date(data.pds[i].ADD_TIME);
   					time = time.toLocaleString().substring(0, 10).toString();
   					$("#dynamicPanel").append(
				   							"<tr>"+
											"<td>"+
											  "<a href='"+data.pds[i].LINK+"'>"+
											  	data.pds[i].TITLE+
											  "</a>"+
											"</td>"+
										  "</tr>"+
										  "<tr>"+
										    "<td>"+
										    	time+
										    "</td>"+
										    "<td>"+
										        data.pds[i].IMG_PATH+
										    "</td>"+
										  "</tr>"
   											 );
   				}
   				var previousPage = data.currentPage-1;
   				var nextPage = data.currentPage+1;
   				$("#page").empty();
   				$("#page").append("<tr><td colspan='4'>");
   				$("#page").append("<input type='button' id='"+button.id+"' value='首页' onclick='switchPage(this,1)'>");
   				$("#page").append("<input type='button' id='"+button.id+"' value='上一页' onclick='switchPage(this,"+previousPage+")'>");
   				$("#page").append("总记录数:"
   						+"<font color='red'>"+data.totalResult+"</font>总页数:"
   						+"<font color='red'>"+data.totalPage+"</font>当前页数:"
   						+"<font color='red'>"+data.currentPage+"</font>");
   				$("#page").append("<input type='button' id='"+button.id+"' value='下一页' onclick='switchPage(this,"+nextPage+")'>");
   				$("#page").append("<input type='button' id='"+button.id+"' value='尾页' onclick='switchPage(this,"+data.totalPage+")'></td></tr>");
   			}
   		});
      }
  </script>
</html>
