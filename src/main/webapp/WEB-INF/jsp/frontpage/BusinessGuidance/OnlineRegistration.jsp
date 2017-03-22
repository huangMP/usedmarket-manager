<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>普宁档案信息网-在线报名</title>
<link href="static/css/total.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/content.css" />
<script src="static/js/frontjs/jquery-1.9.1.min.js"
	type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<div class="local">
			<span>当前位置：<a href="app_index/goindex">普宁档案</a>>><a
				href="app_index/goBusinessGuide">业务指导</a><span>>>在线报名</span></span>
		</div>
		<div class="details">
			<div class="navBox">
				<h2>业务指导</h2>
				<ul class="nav_option">
					<li><a href="app_index/goBusinessGuide">业务指南</a></li>
					<li><a href="app_index/goOnlineRegistration" class="active">在线报名</a></li>
					<li><a href="app_index/goBusinessTraining">业务培训</a></li>
				</ul>
			</div>
			<div class="catalogBox">
				<div class="appointment">
					<span><h3>报名须知：</h3>请认真填写表格，敬请留下您的真实姓名、联系电话、邮箱和联系地址，以便更好地与您联系。</span>
					<div class="input_text">
						<span style="left: -40px">姓名:</span>
                    <input type="text" id="name" class="form-control" placeholder="姓名:"  required="required">
                    <input type="radio" name="sex" class="radio" value="1" checked="checked"/>男
                    <input type="radio" name="sex" class="radio" value="2"/>女
                    <span style="margin-top: 38px">所在单位:</span>
                    <input type="text" id="unit" class="form-control" placeholder="所在单位:" required="required">
                    <span>所在地址:</span>
                    <input type="text" id="place" class="form-control" placeholder="所在地址:" required="required">
                    <span>联系电话:</span>
                    <input type="text" id="phone" class="form-control" placeholder="联系电话:" required="required">
                     <select id="course" class="form-select">
							<c:forEach items="${varlist}" var="var" varStatus="vs">
								<option value="${var.COURSE_ID}">${var.COURSENAME}</option>
							</c:forEach>
						</select>
					<textarea rows="7" id="text_box" placeholder="请输入备注内容..."></textarea>
                    <button type="submit" id="sub">提交</button>
                    <button type="reset" id="rest">重置</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script type="text/javascript">
		window.onload = function() {
			if (navigator.appName == "Microsoft Internet Explorer"
					&& navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
				//alert("IE 7.0");
				$(".input_text>span").css({
					"display" : "inline"
				});
			} else if (navigator.appName == "Microsoft Internet Explorer"
					&& navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0") {
				//alert("IE 8.0");
				$(".input_text>span").css({
					"display" : "inline"
				});
			} else if (navigator.appName == "Microsoft Internet Explorer"
					&& navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE9.0") {
				//alert("IE 9.0");
				$(".input_text>span").css({
					"display" : "inline"
				});
			}
			actions();
			ex();
			$(".close").click(function() {
				$(".edam").css({
					display : "none"
				});
			})
		}
		/*判断填写内容是否为空*/
		function actions() {
			$("#sub").click(function() {
				if_null();
			});
			$("#rest").click(function() {
				$("#name").val("");
				$("#unit").val("");
				$("#place").val("");
				$("#phone").val("");
				$("#text_box").val("");
			})
		}
		var phoneif = true;
		var emailif = true;
		function if_null() {
			var NAME = $("#name").val();
			var PHONE = $("#phone").val();
			var ADDRESS = $("#place").val();
			var UNIT = $("#unit").val();
			var COURSE_ID = $("#course").val();
			var NOTE = $("#text_box").val();
			var radio = $('[name="sex"]');
			var SEX = null;
			for (var i = 0; i < radio.length; i++) {
				if (radio[i].checked == true) {
					SEX = radio[i].value;
					break;
				}
			}
			if (PHONE != "") {
				phoneif = !isNaN(PHONE);
			}
			if (NAME == "" && UNIT == "" && PHONE == "" && ADDRESS == ""
					&& NOTE == "") {
				if (att == true) {
					$("#rest").after("<div class='edam edam_bg'><strong>没有填入任何信息!</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#text_box,#name,#phone,#unit,#place").css({"border" : "solid 1px #ff5566"});
					att = false;
				}
			} else if (NAME == "") {
				/*alert("姓名为空！");*/
				if (att == true) {
					$("#rest").after("<div class='edam edam_bg'><strong>姓名为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#name").css({"border" : "solid 1px #ff5566"});
					att = false;
				}
			} else if (UNIT == "") {
				if (att == true) {
					$("#rest").after("<div class='edam edam_bg'><strong>所在单位为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#unit").css({"border" : "solid 1px #ff5566"});
					att = false;
				}
			} else if (ADDRESS == "") {
				if (att == true) {
					$("#rest").after("<div class='edam edam_bg'><strong>所在地址为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#place").css({"border" : "solid 1px #ff5566"});
					att = false;
				}
			} else if (PHONE == "") {
				/*alert("电话为空！");*/
				if (att == true) {
					$("#rest").after("<div class='edam edam_bg'><strong>电话为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#phone").css({border : "solid 1px #ff5566"});
					att = false;
				}
			} else if (NOTE == "") {
				if (att == true) {
					$("#rest").after("<div class='edam edam_bg'><strong>留言为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#text_box").css({border : "solid 1px #ff5566"});
					att = false;
				}
			} else if (phoneif == false) {
				if (att == true) {
					$("#rest").after("<div class='edam edam_bg'><strong>电话格式不正确!</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#phone").css({"border" : "solid 1px #ff5566"});
					att = false;
				}
			} else {
			
			$.ajax({
				type: "POST",
				url: '<%=basePath%>app_signup/setmessage.do',
				data : {
					"SEX" : SEX,
					"NAME" : NAME,
					"PHONE" : PHONE,
					"ADDRESS" : ADDRESS,
					"COURSE_ID" : COURSE_ID,
					"NOTE" : NOTE,
					"UNIT" : UNIT,
					"UNIT" : UNIT
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					
					}
				});
				$("#rest").after("<div class='edam edam_su'><strong>留言成功</strong><button type='button' class='close'><span>&times;</span></button></div>");
					$(".edam").fadeOut(5000);
					$("#name").val("");
					$("#unit").val("");
					$("#place").val("");
					$("#phone").val("");
					$("#text_box").val("");			
			}
			console.log(1233)
		}

		/*恢复空框焦点*/
		var att = true;
		function ex() {
			$("#text_box").focus(function() {
				$("#text_box").css({
					"border" : "solid 1px #b7b7b7"
				});
				att = true;
			});
			$("#name").focus(function() {
				$("#name").css({
					"border" : "solid 1px #b7b7b7"
				});
				att = true;
			});
			$("#phone").focus(function() {
				$("#phone").css({
					"border" : "solid 1px #b7b7b7"
				});
				att = true;
			});
			$("#unit").focus(function() {
				$("#unit").css({
					"border" : "solid 1px #b7b7b7"
				});
				att = true;
			});
			$("#place").focus(function() {
				$("#place").css({
					"border" : "solid 1px #b7b7b7"
				});
				att = true;
			});
		}
	</script>
</body>
</html>
