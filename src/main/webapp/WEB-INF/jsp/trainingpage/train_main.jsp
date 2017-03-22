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
    <title>普宁市人员培训</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="static/css/train_main.css"/>
    <link rel="stylesheet" href="static/css/train_total.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <style type="text/css">
    	.ad{
    		padding-top:80px;
    	}
    </style>
  </head>
  
  <body>
  <jsp:include page="train_head.jsp"></jsp:include>
   <div class="content ">
    <div class="ad">
        <div class="ad_img">
        
        </div>
    </div>
    <div class="exhibition">
        <p><img src="static/image/re.png" alt=""/>站内推荐</p>
        <ul class="ex_list" id="insiderecommended">
            
        </ul>
    </div>
    <div class="exhibition">
        <p><img src="static/image/books.png" alt=""/>政策法规</p>
        <ul class="ex_list" id="lowandstandard">
            
        </ul>
    </div>
</div>
<script src="static/js/frontjs/train_main.js"></script>
  </body>
  <script src="static/js/frontjs/jquery-1.9.1.min.js"></script>
  <script type="text/javascript">
  		//展示轮播图
  		function showHomepagepics(){
  			$.ajax({
  				url:'<%=basePath%>train_homepagepics/list',
  				success:function(data){
  					var num = data.pds.length >= 5 ? 5: data.pds.length;
  					$(".ad_img").empty();
  					for(var i=0;i<num;i++){
  						$(".ad_img").append("<img src='"+data.pds[i].IMG_PATH+"' alt=''/>")
  					}
  					ad_img();
  				}
  				
  			});
  			function ad_img(){
  			    var i = 0;
  			    var imgNum=$(".ad_img").children("img").length;
  			    $(".ad_img>img").hide();
  			    move_img();
  			    var t = setInterval(move_img, 6000);
  			    function move_img() {
  			        if (i < imgNum) {
  			            $(".ad_img>img").eq(i).fadeIn(3000).siblings().fadeOut(600);
  			            i++;
  			        }
  			        else {
  			            i = 0;
  			            $(".ad_img>img").eq(0).fadeIn(3000).siblings().fadeOut(600);
  			        }
  			    }
  			}
  			
  		}
  		
  		//站内推荐
  		function showInsiderecommended(){
  			$.ajax({
  				url:'<%=basePath%>train_insiderecommended/list',
  				success:function(data){
  					var num = data.varList.length >= 4 ? 4: data.varList.length;
  					$("#insiderecommended").empty();
  					for(var i=0;i<num;i++){
  						$("#insiderecommended").append("<li><p></p>"+
  								"<a href='"+data.varList[i].LINK+"'><img src='<%=basePath%>"+data.imgList[i]+"' alt=''/></a>"+
  								"<a href='"+data.varList[i].LINK+"' class='list_test'>"+data.titleList[i]+"</a></li>")
  					}
  					
  				}
  				
  			});
  			
  		}
  		
  		//政策法规
  		function showLowandstandard(){
  			$.ajax({
  				url:'<%=basePath%>train_lowandstandard/list',
  				success:function(data){
  					var num = data.varList.length >= 4 ? 4: data.varList.length;
  					$("#lowandstandard").empty();
  					for(var i=0;i<num;i++){
  						$("#lowandstandard").append("<li><p></p>"+
  								"<a href='"+data.varList[i].TEXT+"' target='_blank'><img src='<%=basePath%>"+data.varList[i].IMG_PATH+"' alt=''/></a>"+
  								"<a href='"+data.varList[i].TEXT+"' class='list_test' target='_blank'>"+data.varList[i].TITLE+"</a></li>")
  					}
  					
  				}
  				
  			});
  			
  		}
  
  		window.onload = function(){
  			showHomepagepics();
  			showInsiderecommended();
  			showLowandstandard();
  		};
  </script>
  
</html>
