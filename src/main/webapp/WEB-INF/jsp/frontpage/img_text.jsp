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
    <title>详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="static/css/total.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="static/css/content.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
  </head>
  
  <body>
    <jsp:include page="head.jsp"></jsp:include>
	<div class="content">
	<input id="PHOTOALBUM_ID" name="PHOTOALBUM_ID" value="${PHOTOALBUM_ID }" style="display: none;"/>
		<div class="local">
			<span>当前位置：<a href="app_index/goindex">普宁档案</a>>><a href="app_index/goArchiveIntroduction">局馆介绍</a>>>详情
			</span>
		</div>
		<div class="text_box">
			<div class="text_header">
				<h2></h2>
				<div class="back">
					<a href="javascript:history.back(-1)">返回上页</a>
				</div>
			</div>
			<div class="img_box">
				<div class="img_show">
					<div class="show_box">
						<div class="image">
							
						</div>
						<div class="btn btn_l">&lt;</div>
						<div class="btn btn_r">&gt;</div>
					</div>
				</div>
				<div class="img_catalog">
					<div class="catalog_box">
						<div class="image">
							
						</div>
						<div class="btn btn_l">&lt;</div>
						<div class="btn btn_r">&gt;</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
  <script type="text/javascript">
	//页面加载完成自动从后台取数据
	$(document).ready(function(){
		var PHOTOALBUM_ID_val = $("#PHOTOALBUM_ID").val();
		$.ajax({
			type: "post",
            url: "<%=basePath%>app_photoalbum/getDetail.do"+"?PHOTOALBUM_ID="+PHOTOALBUM_ID_val+"",
            //data: {},
            contentType: "application/json;charset=utf-8",
            dataType:'json',
            success: function (data) {
            	$(".text_header").val();
        		var title = "<span>"+data[0].TITLE+"</span>";
        		$(".text_header>h2").append(title);
            	for( var i=0;i<data[0].IMAGE_ID_COLLECTION.length;i++ ){
            		var img = "<img src='"+data[0].IMAGE_ID_COLLECTION[i]+"'/>";
            		$(".catalog_box>.image").append(img);
            		
            		//将原图文件名最后的下划线去掉，就是原图路径了
            		 var originalImgPath = data[0].IMAGE_ID_COLLECTION[i].replace("_.jpg", ".jpg")
											.replace("_.png", ".png")
											.replace("_.gif", ".gif")
											.replace("_.jpeg", ".jpeg")
											.replace("_.bmp", ".bmp") ;
            		
        			var originalImg = "<img src='"+originalImgPath+"'/>";
        			$(".show_box>.image").append(originalImg);
            	}
            	img_text();
            }
		});
		/**
		 * Created by Administrator on 2016/8/25 0025.
		 */
		function img_text(){
		    var i=0;//一张
		    var j=0;//一列
		    var imageBox=$(".catalog_box .image");
		    var img=imageBox.children("img");
		    
		    /*大图--左右按钮*/
		    $(".show_box>.btn_l").click(function(){
		        if(i>0) {
		            i--;
		        }
		        move();
		    });
		    $(".show_box>.btn_r").click(function(){
		        if(i<img.length-1) {
		            i++;
		        }
		        move();
		    });

		    /*列表--左右按钮*/
		    $(".catalog_box>.btn_l").click(function(){
		        if(j>0) {
		            j--;
		        }
		        move();
		    });
		    $(".catalog_box>.btn_r").click(function(){
		        var catalog_num=Math.ceil(img.length/4);
		        if(j<catalog_num-1) {
		            j++;
		        }
		        move();
		    });

		    /*列表点击*/
		    img.click(function(){
		        var num=$(this).index();
		        console.log(num);
		        i=num;
		        img.removeClass("img_active").eq(i).addClass("img_active");
		        move();
		    });

		    function move(){
		        $(".show_box>.image").stop().animate({left:-780*i});
		        $(".catalog_box>.image").stop().animate({left:-884*j});
		    }
		}
	});
	</script>
  </body>
</html>
