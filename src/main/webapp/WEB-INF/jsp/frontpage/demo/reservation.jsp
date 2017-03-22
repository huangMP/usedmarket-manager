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
    
    <title>Reservation</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="static/js/jquery-1.7.2.js"></script>
  </head>
  
  <body>
              这是Reservation页面. 
     <hr>            
     <form action="app_reservation/save.do" id="Form" method="post">
     	<table>
     		<tr>
	     		<td>姓名</td>
	     		<td>
	     			<input type="text" name="PERSON_NAME" id="PERSON_NAME" maxlength="100" placeholder="这里输入姓名" title="姓名" style="width:98%;"/>
	     		</td>
     		</tr>
     		<tr>
	     		<td>证件类型</td>
	     		<td>
	     			<input type="text" name="ID_TYPE" id="ID_TYPE" maxlength="100" placeholder="这里输入证件类型" title="证件类型" style="width:98%;"/>
	     		</td>
     		</tr>
     		<tr>
	     		<td>证件号码</td>
	     		<td>
	     			<input type="text" name="ID_NUMBER" id="ID_NUMBER" maxlength="100" placeholder="这里输入证件号码" title="证件号码" style="width:98%;"/>
	     		</td>
     		</tr>
     		<tr>
	     		<td>手机号码</td>
	     		<td>
	     			<input type="text" name="PHONE_NUMBER" id="PHONE_NUMBER" maxlength="100" placeholder="这里输入手机号码" title="手机号码" style="width:98%;"/>
	     		</td>
     		</tr>
     		<tr>
	     		<td>联系邮箱</td>
	     		<td>
	     			<input type="text" name="MAILBOX" id="MAILBOX" maxlength="100" placeholder="这里输入联系邮箱" title="联系邮箱" style="width:98%;"/>
	     		</td>
     		</tr>
     		<tr>
	     		<td>预约内容</td>
	     		<td>
	     			<input type="text" name="TEXT" id="TEXT" maxlength="100" placeholder="这里输入预约内容" title="预约内容" style="width:98%;"/>
	     		</td>
     		</tr>
     		<tr>
				<td><input type="button" value="" class="btn2" onclick = "checkUser();" /></td>
				
			</tr>
     	</table>
     </form>   
  </body>
  <script type="text/javascript">
    function checkUser(){
	  $("#Form").submit();
	}
  </script>
</html>
