<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>全部课程-课程详情-讨论区</title>
    <link href="static/css/train_allclass.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/train_total.css"/>    
    <script type="text/javascript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/frontjs/train_alljs.js"></script>
</head>
<body>
<jsp:include page="../train_head.jsp"></jsp:include>
<div class="content">
    <div class="text_box">
        <div class="details_box">
            <img src="<%=basePath1%>${specialPd.IMG_PATH}">
            <p>${specialPd.TITLE}</p>
            <input hidden="hidden" value="${specialPd.SPECIAL_ID}" name="SPECIAL_ID" id="SPECIAL_ID">
            <p class="text_info">${specialPd.BRIEF_INTRO}</p>
            <div class="clear"></div>
            <div class="local_land">
                <button class="land_butt" id="main_land">目录</button>
                <button class="land_butt fonze" id="talk_land">讨论区</button>
            </div>
        </div>
        <div class="mess_box">
            <div class="mess_top">
            <h2>讨论区</h2>
            <p>讨论区规则--用户在使用本社区的服务之前，应当仔细阅读本协议，并同意遵守本协议及所有社区规则后方可成为天涯用户，一旦用户注册成功，则用户与本社区之间自动形成协议关系，用户应当受本协议及所有社区规则的约束。用户在使用特殊的服务或产品时，应当同意接受相关协议后
                方能使用。未同意本协议内容的用户，无法在天涯社区发布任何内容，仅能使用浏览功能。</p>
            </div>
            <div id="discussion_list"> 

           </div>
           
            <div class="change_page">
  
            </div>
            
           <form action="train_discussion/save" method="POST" id="Save_Form">
	           <input hidden="hidden" value="${specialPd.SPECIAL_ID}" name="SPECIAL_ID" id="SPECIAL_ID">
	            <div class="report_box">
	                <h3>发表回复</h3>
	                <textarea rows="10" cols="56" class="report_box_ans" name="MESSAGE_DETAILS" id="MESSAGE_DETAILS"></textarea>
	                <button value="发布" class="report_butt" onclick="save()">发布</button>
	            </div>
        	</form>
        </div>
    </div>
<div class="clear"></div>
<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script>
    $(".top3").addClass("font_size");   
</script>
<script type="text/javascript">
	function showDiscussion(){
		$.ajax({
			url:'<%=basePath%>train_discussion/discussion_list?SPECIAL_ID=${specialPd.SPECIAL_ID}&tm='+new Date().getTime()+'&currentPage=1&showCount=8',
			success:function(data){			
				for(var i=0;i<data.pds.length;i++){
					/* console.log("success") */
					$("#discussion_list").append("<div class='mess_cont'>"+
			                "<span class='names'>"+data.pds[i].USER_ID+"</span>"+
			                "<span>"+data.pds[i].MESSAGE_TIME+"</span>"+
			                "<span class='ts_talk'>[综合讨论区]</span>"+
			                "<p>"+data.pds[i].MESSAGE_DETAILS+"</p>"+
			                "<div class='zan'>"+
			                    "<img src='static/image/image-train/tag/thumb_up1.png' class='zan1' onclick='setPraise(\""+data.pds[i].DISCUSSION_ID+"\")'>"+
			                    "<img src='static/image/image-train/tag/thumb_up2.png' class='zan2 dis_no'>"+
			                    "<span id='span_"+data.pds[i].DISCUSSION_ID+"'>("+data.pds[i].PRAISE_NUM+")</span>"+
			                "</div>"+
			            "</div>"+
			            "<div class='clear'></div>");		
				}
				
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				
				//console.log(totalPage);
				$(".change_page").empty();
				
				$(".change_page").append("<button  onclick='nextPage("+previousPage+")'>上一页</button>");
				$(".change_page").append("<span>"+data.currentPage+"/"+data.totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage("+nextPage+")'>下一页</button>");
				
			 	$(".zan1").click(function(){
            		$(this).addClass("dis_no");           
            		$(this).next().removeClass("dis_no");
        		});	 	
        					 
			}
			
		})
		
	}

	function nextPage(page){
		$.ajax({
			url:'<%=basePath%>train_discussion/discussion_list?SPECIAL_ID=${specialPd.SPECIAL_ID}&tm='+new Date().getTime()+'&currentPage='+page+'&showCount=8',
			success:function(data){
				
				$("#discussion_list").empty();
				
				for(var i=0;i<data.pds.length;i++){
					/* console.log("success") */
					$("#discussion_list").append("<div class='mess_cont'>"+
					
			                "<span class='names'>"+data.pds[i].USER_ID+"</span>"+
			                "<span>"+data.pds[i].MESSAGE_TIME+"</span>"+
			                "<span class='ts_talk'>[综合讨论区]</span>"+
			                "<p>"+data.pds[i].MESSAGE_DETAILS+"</p>"+
			                "<div class='zan'>"+
			                    "<img src='static/image/image-train/tag/thumb_up1.png' class='zan1' onclick='setPraise(\""+data.pds[i].DISCUSSION_ID+"\")'>"+
			                    "<img src='static/image/image-train/tag/thumb_up2.png' class='zan2 dis_no'>"+
			                    "<span id='span_"+data.pds[i].DISCUSSION_ID+"'>("+data.pds[i].PRAISE_NUM+")</span>"+
			                "</div>"+
			            "</div>"+
			            "<div class='clear'></div>");
					
				}
				
				var previousPage = data.currentPage-1;
				var nextPage = data.currentPage+1;
				
				//console.log(totalPage);
				$(".change_page").empty();
				
				$(".change_page").append("<button  onclick='nextPage("+previousPage+")'>上一页</button>");
				$(".change_page").append("<span>"+data.currentPage+"/"+data.totalPage+"</span>");
				$(".change_page").append("<button onclick='nextPage("+nextPage+")'>下一页</button>");
				$(".zan1").click(function(){
            		$(this).addClass("dis_no");           
            		$(this).next().removeClass("dis_no");
        		}); 	
			}
			
		})
		
	}
	
	function setPraise(id){
		$.ajax({
			url:'<%=basePath%>train_discussion/setPraise?DISCUSSION_ID='+id,
			success:function(data){
				/* console.log("success");
				 */
				 /* var t = $("#span_"+id).text();
				 console.log(t); */
				 if(data != null){
					 $("#span_"+id).text("("+data+")");	
					/*  console.log("#zan1_"+id)			 
            		$("#zan1_"+id).addClass("dis_no");
            		$("#zan1_"+id).next().removeClass("dis_no"); */
				 }
				 
				//window.location.reload();
			}
		})
	} 
	
	function save(){
		$("#Save_Form").submit();
		console.log("success");
		window.location.href="train_special/goDiscussion?SPECIAL_ID=${specialPd.SPECIAL_ID}"
	}
	
	window.onload = showDiscussion;
</script>
</body>
</html>
