<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>普宁档案信息网-服务预约</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="static/css/total.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script language="JavaScript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <style>
        .h2{
            font-family: "幼圆", "华文细黑";
            font-size: 24px;
            font-weight: 600;
            margin: 22px auto;
            text-align: center;
        }
        .text_ie{
            line-height: 52px;
            float: left;
            margin-top: -269px;
            margin-left: -401px;
            display: none;
        }
    </style>
  </head>
  
  <body>
    <jsp:include page="../head.jsp"></jsp:include>
	<div class="content">
		<div class="local">
			<span>当前位置：<a href="app_index/goindex">普宁档案</a>>><a href="app_index/goserviceinformation">公共服务</a><span>>>服务预约</span></span>
		</div>
		<div class="details">
			<div class="navBox">
				<h2>公共服务</h2>
				<ul class="nav_option">
					<li><a href="app_index/goserviceinformation">查档服务指南</a></li>
					<li><a href="app_index/goserviceappointment" class="active">服务预约</a></li>
					<li><a href="http://zwgk.puning.gd.cn/zwgk/showDeptType.action" target=_blank>政府信息公开</a></li>
				</ul>
			</div>
			<div class="catalogBox">
				<div class="appointment">
					<p class="h2">服务预约</p>
					<div class="input_text">
						<input type="text" id="name" class="form-control"
							placeholder="姓名:" required="required"> 
						<input type="text"id="phone" class="form-control" 
							placeholder="手机号码:"required="required"> 
						<input type="text" id="email"class="form-control" 
							placeholder="E-mail:" required="required">
						<input type="text" id="type" class="form-control"
							placeholder="证件类型:" required="required"> 
						<input type="text" id="ID" class="form-control" 
							placeholder="证件号码:" required="required">
						<textarea rows="7" id="text_box" placeholder="请输入预约内容..."></textarea>
						<div class="text_ie">
                        <p>姓名:</p>
                        <p>手机号码:</p>
                        <p>E-mail:</p>
                        <p>证件类型:</p>
                        <p>证件号码:</p>
                   		 </div>
						<button type="submit" id="sub">提交</button>
                    	<button type="reset" id="rest">重置</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script type="text/javascript">
		window.onload=function() {
        if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
            //alert("IE 7.0");
            $(".text_ie").css({"display":"inline"});
        }
        else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0") {
            //alert("IE 8.0");
            $(".text_ie").css({"display":"inline"});
        }
        else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE9.0") {
            //alert("IE 9.0");
            $(".text_ie").css({"display":"inline"});
        }
        actions();
        ex();
        $(".close").click(function(){
            $(".edam").css({display:"none"});
        })
    }
    /*判断填写内容是否为空*/
    function actions(){
        $("#sub").click(function(){
            if_null();
        });
        $("#rest").click(function(){
            $("#name").val("");
            $("#phone").val("");
            $("#email").val("");
            $("#type").val("");
            $("#ID").val("");
            $("#text_box").val("");
        })
    }
    var phoneif = true;
    var emailif = true;
    var isok;
    var reg;
    function if_null() {
        var NAME = $("#name").val();
        var PHONE = $("#phone").val();
        var EMAIL = $("#email").val();
        var TYPE = $("#type").val();
        var ID = $("#ID").val();
        var TEXT = $("#text_box").val();
        if (EMAIL != "") {
            reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            isok= reg.test(EMAIL);
            if (!isok) {
                emailif=false;
            }
        }
        if (PHONE != ""){
            phoneif = !isNaN(PHONE);
        }
        if (NAME == "" && EMAIL == "" && PHONE == "" && TYPE == "" && TEXT == "" && ID == "") {
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>没有填入任何信息!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#text_box,#name,#phone,#type,#ID,#email").css({"border":"solid 1px #ff5566"});
                att=false;
            }
        }
        else if (NAME == "") {
            /*alert("姓名为空！");*/
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>姓名为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#name").css({"border":"solid 1px #ff5566"});
                att=false;
            }
        }
        else if (PHONE == "") {
            /*alert("电话为空！");*/
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>电话为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#phone").css({border:"solid 1px #ff5566"});
                att=false;
            }
        }
        else if (EMAIL == "") {
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>E-mail为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#email").css({"border":"solid 1px #ff5566"});
                att=false;
            }
        }
        else if (TYPE == "") {
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>证件类型为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#type").css({"border":"solid 1px #ff5566"});
                att=false;
            }
        }
        else if (ID == "") {
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>ID为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#ID").css({border:"solid 1px #ff5566"});
                att=false;
            }
        }
        else if (TEXT == "") {
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>留言为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#text_box").css({border:"solid 1px #ff5566"});
                att=false;
            }
        }
        else if(phoneif==false){
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>电话格式不正确!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#phone").css({"border":"solid 1px #ff5566"});
                att=false;
            }
        }
        else if(emailif==false){
            if(att==true){
                $("#rest").after("<div class='edam edam_bg'><strong>邮箱格式不正确!</strong><button type='button' class='close'><span>&times;</span></button></div>");
                $(".edam").fadeOut(5000);
                $("#email").css({"border":"solid 1px #ff5566"});
                att=false;
            }
        }
        else {
            $("#rest").after("<div class='edam edam_su'><strong>留言成功</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#name").val("");
            $("#phone").val("");
            $("#email").val("");
            $("#type").val("");
            $("#ID").val("");
            $("#text_box").val("");
        }
    }

    /*恢复空框焦点*/
    var att = true;
    function ex(){
        $("#text_box").focus(function (){
            $("#text_box").css({"border":"solid 1px #b7b7b7"});
            att=true;
        });
        $("#name").focus(function (){
            $("#name").css({"border":"solid 1px #b7b7b7"});
            att=true;
        });
        $("#phone").focus(function (){
            $("#phone").css({"border":"solid 1px #b7b7b7"});
            att=true;
        });
        $("#ID").focus(function (){
            $("#ID").css({"border":"solid 1px #b7b7b7"});
            att=true;
        });
        $("#type").focus(function (){
            $("#type").css({"border":"solid 1px #b7b7b7"});
            att=true;
        });
        $("#email").focus(function (){
            $("#email").css({"border":"solid 1px #b7b7b7"});
            emailif = true;
            att=true;
        });
    }
//     app_reservation/save.do
     
      $("#sub").click(function(){
          var PERSON_NAME = $("#name").val();
          var PHONE_NUMBER = $("#phone").val();
          var MAILBOX = $("#email").val();
          var ID_TYPE = $("#type").val();
          var ID_NUMBER = $("#ID").val();
          var TEXT = $("#text_box").val();
          $.ajax({
	       type: "POST",
				url: '<%=basePath%>app_reservation/save.do',
				data:{
				"PERSON_NAME":PERSON_NAME,
				"PHONE_NUMBER":PHONE_NUMBER,
				"MAILBOX":MAILBOX,
				"ID_TYPE":ID_TYPE,
				"ID_NUMBER":ID_NUMBER,
				"TEXT":TEXT
				},
				dataType:'jason',
				cache: false,
				success:function(data){
// 				   alert(data);
				}
   		  });
      });
    
	</script>
  </body>
</html>
