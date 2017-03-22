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
    <title>人员培训登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="static/css/SignIn.css" rel="stylesheet"/>
  </head>
  
  <body>
  	<div class="sign_in">
		<span>用户登录</span>
		<div class="sign_input">
			<div id="use_name">
				<img src="static/image/user.png" alt="用户名" /> <input type="text"
					id="name" placeholder="请输入用户名..." required/>
			</div>
			<div id="use_pass">
				<img src="static/image/lock.png" alt="密码" /> <input type="password"
					id="password" placeholder="请输入密码..." required/>
			</div>
		</div>
		<div class="tooltip hide">
			<p></p>
			<span></span>
		</div>
		<button class="btn" id="sum" name="sum">登录</button>
	</div>
</body>
<script src="static/js/frontjs/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
    var tooltip=$('.tooltip');
    // 登录验证
    $(".btn").click(function(event){
        // 做表单输入校验
        var name = $("#name");
        var password = $("#password");
        var msg = "";
        if ($.trim(name.val()) == ""){
            msg = "请输入用户名";
            name.focus();
        }else if ($.trim(password.val()) == ""){
            msg = "请输入密码";
            password.focus();
        }if (msg != ""){
            tooltip.show();
            $(document).one('click',function(){
                tooltip.hide();
            });
            event.stopImmediatePropagation();
            tooltip.click(function (event) {
                event.stopImmediatePropagation();
            });
            $(".tooltip>p").html(msg);
        }else{
    		var loginname = $("#name").val();
    		var password = $("#password").val();
    		var code  = loginname + "," + password;	
    		$.post("<%=basePath%>training_login.do",
    		{
    			KEYDATA:code,
    			tm:new Date().getTime()
    		},
    		function(data){
    			if(data==="error"){
    				msg = "账号或密码错误";
    				tooltip.show();
    	            $(document).one('click',function(){
    	                tooltip.hide();
    	            });
    	            event.stopImmediatePropagation();
    	            tooltip.click(function (event) {
    	                event.stopImmediatePropagation();
    	            });
    	            $(".tooltip>p").html(msg);
    		 	}else{
    		 		window.location.href="<%=basePath%>train_main";	
    		 	}
    	  	});
        }
    });
    // 为document绑定onkeydown事件监听是否按了回车键
    $(document).keydown(function(event){
        if (event.keyCode === 13){ // 按了回车键
            $(".btn").trigger("click");
        }
    });
});
</script>
</html>
