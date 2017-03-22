<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>联系我们</title>
    
    <link href="static/css/total.css" rel="stylesheet"/>
    <link href="static/css/connect.css" rel="stylesheet"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=5bc3e62903c4f11eb7d9fe54c0fba97b"></script>
    <script type="text/javascript" src="static/js/frontjs/total.js"></script>
</head>
<body>
<div id="all">
<jsp:include page="head.jsp"></jsp:include>
<div class="body">
    <div class="local">
        <span>您当前的位置：<a href="app_index/goindex">普宁档案</a>>>联系我们</span>
    </div>
    <div>
        <div class="box">
            <div class="box">
                <div class="box2">
                    <h2>联系方式</h2>
                    <h4>Contact us</h4>
                    <div class="line"></div>
                    <p id="email2"></p>
                    <p id="phone2"></p>
                    <p id="fax2"></p>
                    <p id="address2"></p>
                </div>
            </div>
            <div id="map"></div>
            <div class="clear"></div><div class="att"></div>
        </div>
    </div>
    <div class="message">
        <div class="circle1"><div class="circle2"></div></div>
        <span>留言</span>
        <div class="lan">
            <div class="lan1"></div><div class="lan2"></div><div class="lan3"></div>
        </div>
        <div class="clear"></div>
        <textarea rows="13" cols="80" id="text_box" placeholder="请输入留言..."></textarea>
        <div class="input_text">
            <input type="text" id="name" class="form-control" placeholder="姓名:" style="margin-top: 20px" required="required">
            <input type="text" id="phone" class="form-control" placeholder="电话:" required="required">
            <input type="text" id="email" class="form-control" placeholder="E-mail:" required="required">
        </div>
        <button type="submit" class="btn" id="sum">提交</button>
        <div class="clear"></div>
    </div>


</div>
<jsp:include page="footer.jsp"></jsp:include>

</div>
<script type="text/javascript">
  //加载页面后去后台取联系方式信息
  $().ready(function(){
        $.ajax({
			type: "POST",
			url: '<%=basePath%>app_connection/find.do',
	    	data: {},
			dataType:'json',
			cache: false,
			success: function(data){
			    console.log(data[0].EMAIL);
			    $("#email2").text("E-mail: "+data[0].EMAIL);
			    $("#phone2").text("电话: "+data[0].PHONE);
			    $("#fax2").text("传真: "+data[0].FAX);
			    $("#address2").text("地址: "+data[0].ADDRESS);
			}
		});
  });
  $("#sum").click(function(){
    var MESSAGECONTENT = $("#text_box").val();
    var NAME = $("#name").val();
    var PHONE = $("#phone").val();
    var EMAIL = $("#email").val();
//     app_reservation/save.do
        $.ajax({
			type: "POST",
			url: '<%=basePath%>app_connection/setmessage.do',
	    	data: {
	    	  "MESSAGECONTENT":MESSAGECONTENT,
	    	  "NAME":NAME,
	    	  "PHONE":PHONE,
	    	  "EMAIL":EMAIL
	    	},
			dataType:'json',
			cache: false,
			success: function(data){
				
			}
		});
    });
</script>
</body>
</html>
