<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="head">
    <div class="nav_top">
        <img src="static/image/image-train/top_tag.png" class="head_img">
        <nav>
            <ul class="header_nav">
                <li><a href="train_app/gotrain" class="top1">培训首页</a></li>
                <li><a href="train_app/gomylearn_notice" class="top2">我的学习</a></li>
                <li><a href="train_app/gowholeclass_main" class="top3">全部课程</a></li>
                <li class="use"><a  class="land"><span><%=request.getSession().getAttribute("TRAIN_USER_NAME") %></span><i class="arrow-icon"></i></a>
                    <div class="second_nav hide">
                        <span id="main_exit">退出登录</span>
                        <span id="chg_pass">修改密码</span>
                    </div>
                </li>
            </ul>
            <div class="mask hide"></div>
            <div class="chgPassword hide">
                <img class="exit" src="static/image/exit.png"/>
                <span>修改密码</span>
                <div class="chg_input">
                    <div  id="old_Pass"><p>原&ensp;密&ensp;码</p>
                        <input type="password" id="oldPass" placeholder="请输入原密码..." required>
                    </div>
                    <div  id="new_Pass"><p>新&ensp;密&ensp;码</p>
                        <input type="password" id="newPass" placeholder="请输入新密码..." required>
                    </div>
                    <div  id="re_Pass"><p>确认密码</p>
                        <input type="password" id="rePass" placeholder="请确认密码..." required>
                    </div>
                </div>
				<div class="tooltip hide">
					<p></p>
					<span></span>
				</div>
				<button type="submit" class="btn" id="sum" >确认修改</button>
            </div>
        </nav>
        <div class="clear"></div>
    </div>
</div>
<script src="static/js/frontjs/train_main.js"></script>
<script src="static/js/frontjs/jquery-1.9.1.min.js"></script>
<script>
$(function(){
    var tooltip=$('.tooltip');
    // 登录验证
    $(".btn").click(function(event){
        // 做表单输入校验
        var oldPass = $("#oldPass");
        var newPass = $("#newPass");
        var rePass = $("#rePass");
        
        var new_pass = $("#newPass").val();
		var re_pass = $("#rePass").val();
        var msg = "";
        if ($.trim(oldPass.val()) == ""){
            msg = "请输入原密码";
            oldPass.focus();
        }else if ($.trim(newPass.val()) == ""){
            msg = "请输入新密码";
            newPass.focus();
        }else if ($.trim(rePass.val()) == ""){
            msg = "请确认密码";
            rePass.focus();
        }else if (new_pass!=re_pass){
            msg = "密码和确认密码不一样";
        }
        
        if (msg != ""){
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
        	
        	$.post("<%=basePath%>train_revise",
      		{
   				newPaw:new_pass,
   				oldPaw:oldPass.val(),
      			tm:new Date().getTime()
      		},
      		function(data){
  				
  				if(data === "success"){
  					console.log("success");
  					window.location.href="<%=basePath%>train_logout";	
  				}else{
  					msg = "原密码错误";
  					
  					tooltip.show();
  		            $(document).one('click',function(){
  		                tooltip.hide();
  		            });
  		            event.stopImmediatePropagation();
  		            tooltip.click(function (event) {
  		                event.stopImmediatePropagation();
  		            });
  		            $(".tooltip>p").html(msg);
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

	$("#main_exit").click(function(){
		$.ajax({
			url:'<%=basePath%>train_logout',
			success:function(data){
				setTimeout('window.location.href=\"<%=basePath%>train_toLogin\"',1000);
					
			}
			
		})
		
	})
</script>


