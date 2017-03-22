<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	这是Link页面.
	<hr>
	<select id="puning" onchange="redirecting(this);">
		<option value="" selected="selected">=普宁相关站点=</option>
	</select>
	<select id="domestic" onchange="redirecting(this);">
		<option value="" selected="selected">=国内相关站点=</option>
	</select>
	<select id="abroad" onchange="redirecting(this);">
		<option value="" selected="selected">=国外相关站点=</option>
	</select>
	<hr>
	<div id="menu"></div>

	<div id="intro">By calling the nicEditors.allTextareas() function
		the below example replaces all 3 textareas on the page with
		nicEditors. NicEditors will match the size of the editor window with
		the size of the textarea it replaced.</div>
	<br />

		<script type="text/javascript" src="static/js/nicEdit.js"></script>
		<script type="text/javascript">
	       bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
        </script>
		<textarea name="area3" style="width: 700px; height: 100px;">
        </textarea>
</body>
<script type="text/javascript">
    $().ready(function(){
        $.ajax({
			type: "POST",
			url: '<%=basePath%>app_link/list.do?tm='
							+ new Date().getTime(),
					data : {},
					dataType : 'json',
					cache : false,
					success : function(data) {
						for (var i = 0; i < data.length; i++) {
							if (data[i].TYPE == 1) {
								$("#puning").append(
										"<option value='"+data[i].URL+"'>"
												+ data[i].TITLE + "</option>");
							} else if (data[i].TYPE == 2) {
								$("#domestic").append(
										"<option value='"+data[i].URL+"'>"
												+ data[i].TITLE + "</option>");
							} else if (data[i].TYPE == 3) {
								$("#abroad").append(
										"<option value='"+data[i].URL+"'>"
												+ data[i].TITLE + "</option>");
							}
						}
					}
				});
			});

	function redirecting(selected) {
		if (selected.value != "")
			window.open(selected.value);
	}
</script>
</html>
