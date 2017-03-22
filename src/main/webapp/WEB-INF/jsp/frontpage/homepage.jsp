<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>普宁档案信息网</title>
    <link href="static/css/total.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="static/css/Main_content.css"/>
    <script src="static/js/frontjs/jquery-1.9.1.min.js" type="text/javascript"></script>
    <style type="text/css">
    	.text_long{
    		width:300px;
    	}
    	#noticesList{
    		margin-top:6px;
    	}
    	#dynamicsList{
    		margin-top:3px;
    	}
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="content">
    <div class="section section-one">
        <div class="dynamic">
            <div class="carousel" id="img-carousel">
                <ul class="img" id="specialImg">
                    
                </ul>
               <ul class="num"></ul>
            </div>
            <div class="dynamic_directory">
                <p class="clear"></p>
                <div class="directory_header">
                    <a href="app_index/goWorkDynamics">更多>></a><span>工作动态</span>
                </div>
                <p class="clear" style="margin-top:0;margin-bottom:0"></p>
                <div class="directory">
                    <ul id="dynamicsList">
                       
                    </ul>
                </div>
                <p class="clear"></p>
            </div>
        </div>
        <div class="box_margin">
            <div class="directory_header directory_header_small">
                <a href="app_index/goNotice">更多>></a><img src="static/image/tital_leg.jpg"><span>通知公告</span>
            </div>
            <p class="clear" style="margin-top:0;margin-bottom:0"></p>
            <div class="directory">
                <ul id="noticesList">
                   
                </ul>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="clear"></div>
        <div class="label">
            <div class="butt" id="news"><img src="static/image/tag/newspaper-o.png"/><span>政府信息公开</span></div>
            <div class="butt" id="atom"><img src="static/image/tag/atom.png"/><span>服务预约</span></div>
            <div class="butt" id="books"><img src="static/image/tag/books.png"/><span>业务指导</span></div>
            <div class="butt" id="user"><img src="static/image/tag/user-tie.png"/><span>人员培训</span></div>
        </div>
        <div class="box_centre">
            <div class="directory_header directory_header_small dir_hug">
                <a href="app_index/goArchiveIntroduction">更多>></a><span>局馆介绍</span>
            </div>
            <div class="directory dir_text" >
                <div class="clear"></div>
                <img src="static/image/main1.jpg"/>
                <div class="text_con" id="archives_intro">
                </div>
 
            </div>
        </div>
        <div class="box_margin">
            <div class="directory_header directory_header_small">
                <a href="app_index/gousecase">更多>></a><img src="static/image/tital_leg.jpg"><span>利用实例</span>
            </div>
            <div class="directory directory_small">
                <ul id="casesList">
                    
                </ul>
            </div>
        </div>
    </div>
    <div class="section">
        <div class="clear"></div>
        <div class="box_margin">
            <div class="directory_header directory_header_small">
                <a href="app_index/goexhition">更多>></a><img src="static/image/tital_leg.jpg"><span>网上展厅</span>
            </div>
            <div class="clear"></div>
            <div class="directory directory_small">
                <ul id="exhibitionList">
                  
                </ul>
            </div>
        </div>
        <div class="box_centre">
            <div class="directory_header directory_header_small dir_hug">
                <a href="app_index/goregulations">更多>></a><span>法规与标准</span>
            </div>
            <div class="clear"></div>
            <div class="directory directory_small">
                <ul id="lowAndStandList">
                    
                </ul>
            </div>
        </div>
        <div class="box_margin">
            <div class="directory_header directory_header_small">
                <a href="app_index/goOtherInformation">更多>></a><img src="static/image/tital_leg.jpg"><span>他山之石</span>
            </div>
            <div class="clear"></div>
            <div class="directory directory_small">
                <ul id="otherInfList">
                    
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="section-two">
        <div class="link_top"><img src="static/image/tag/globe.png"><span>友情链接</span></div>
        <div class="clear"></div>
        <div class="link">
            <div class="link_type">
                <p><span class="fr">&or;</span>==普宁相关网站==</p>
                <div class="link_directory hide">
                    <p>==普宁相关网站==</p>
                     <ul id="puning">
                         
                     </ul>
                </div>
            </div>
            <div class="link_type">
                <p><span class="fr">&or;</span>==国内档案网站==</p>
                <div class="link_directory hide">
                    <p>==国内档案网站==</p>
                    <ul id="domestic">
                        
                    </ul>
                </div>
            </div>
            <div class="link_type">
                <p><span class="fr">&or;</span>==国外档案网站==</p>
                <div class="link_directory hide">
                    <p>==国外档案网站==</p>
                    <ul id="abroad">
                    
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
$().ready(function(){
  loadDynImg();
  loadDocList();
  loadExhibition();
  loadLinkList();

 });
 
function loadDynImg(){
     //轮播图
     $.ajax({
			type: "POST",
			url: '<%=basePath%>app_documentTrends/listSpecial.do',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			dataType:'json',
			success : function(data) {
			   for(var i=data.varList.length-1;i>=0;i--){
			     $("#specialImg").append("<li><a href='<%=basePath%>app_doc/getDocText.do?id="+data.varList[i].DOCUMENT_ID+"&tm="+new Date().getTime()+"'><img src='${pageContext.request.contextPath}"+data.varList[i].IMG_PATH+"'/></a></li>");
			     $("#img-carousel").append("<a class='hide' href='<%=basePath%>app_doc/getDocText.do?id="+data.varList[i].DOCUMENT_ID+"&tm="+new Date().getTime()+"'><div class='text_small'>"+data.varList[i].TITLE+"</div></a>");
			  }
			  main();
			}
	});
}
function loadExhibition(){
    //网上展厅
     $.ajax({
			type: "POST",
			url: '<%=basePath%>app_exhibition/getListToHome.do',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			dataType:'json',
			success : function(data) {
			  for(var i=0;i<data.length;i++){
 			     var time = data[i].ADD_TIME;
 			     time = time.substring(5, 10);
			     $("#exhibitionList").append("<li><img src='static/image/img/ico3.gif' class='leg_img'><a href='"+data[i].LINK
			     +"' target='_blank'><div class='text_small'>"+data[i].TITLE+"</div></a><span>"+time+"</span></li>");
			  }
			}
	});
}
function loadDocList(){
   //工作动态
     $.ajax({
			type: "POST",
			url: '<%=basePath%>app_homepage/list.do',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			dataType:'json',
			success : function(data) {
			//工作动态
			 for(var i=0;i<data[0].dynamicsList.length;i++){
			     var time = data[0].dynamicsList[i].ADD_TIME;
			     time = time.substring(5, 10);                              
			     $("#dynamicsList").append("<li><img src='static/image/img/ico3.gif' class='leg_img'><a href='<%=basePath%>app_doc/getDocText.do?id="+data[0].dynamicsList[i].DOCUMENT_ID+"&tm="+new Date().getTime()
			     +"'><div class='text_small text_long'>"+data[0].dynamicsList[i].TITLE+"</div></a><span>"+time+"</span></li>");
			  }
			  //通知公告
			  for(var i=0;i<data[0].noticesList.length;i++){
 			     var time = data[0].noticesList[i].ADD_TIME;
 			     time = time.substring(5, 10);
			      $("#noticesList").append("<li><img src='static/image/img/ico3.gif' class='leg_img'><a href='<%=basePath%>app_doc/getDocText.do?id="+data[0].noticesList[i].DOCUMENT_ID+"&tm="+new Date().getTime()
			     +"'><div class='text_small'>"+data[0].noticesList[i].TITLE+"</div></a><span>"+time+"</span></li>");
			  }
			   for(var i=0;i<data[0].casesList.length;i++){
 			     var time = data[0].casesList[i].ADD_TIME;
 			     time = time.substring(5, 10);
			     $("#casesList").append("<li><img src='static/image/img/ico3.gif' class='leg_img'><a href='<%=basePath%>app_doc/getDocText.do?id="+data[0].casesList[i].DOCUMENT_ID+"&tm="+new Date().getTime()
			     +"'><div class='text_small'>"+data[0].casesList[i].TITLE+"</div></a><span>"+time+"</span></li>");
			  }
			  for(var i=0;i<data[0].lowAndStandList.length;i++){
 			     var time = data[0].lowAndStandList[i].ADD_TIME;
 			     time = time.substring(5, 10);
			      $("#lowAndStandList").append("<li><img src='static/image/img/ico3.gif' class='leg_img'><a href='<%=basePath%>app_doc/getDocText.do?id="+data[0].lowAndStandList[i].DOCUMENT_ID+"&tm="+new Date().getTime()
			     +"'><div class='text_small text_long'>"+data[0].lowAndStandList[i].TITLE+"</div></a><span>"+time+"</span></li>");
			  }
			  for(var i=0;i<data[0].otherInfList.length;i++){
 			     var time = data[0].otherInfList[i].ADD_TIME;
 			     time = time.substring(5, 10);
			     $("#otherInfList").append("<li><img src='static/image/img/ico3.gif' class='leg_img'><a href='<%=basePath%>app_doc/getDocText.do?id="+data[0].otherInfList[i].DOCUMENT_ID+"&tm="+new Date().getTime()
			     +"'><div class='text_small'>"+data[0].otherInfList[i].TITLE+"</div></a><span>"+time+"</span></li>");
			  }
			  $("#archives_intro").append(data[0].introList[0].TEXT);
			}
	});
}
function loadLinkList(){
    //推荐链接
     $.ajax({
			type: "POST",
			url: '<%=basePath%>/app_link/list.do',
			contentType:'application/json;charset=utf-8',
			data : {},
			cache : false,
			dataType:'json',
			success : function(data) {
			  for(var i=0;i<data.length;i++){
				  if(data[i].TYPE==1){
				    $("#puning").append("<li><a target='_blank' href='"+data[i].URL+"'>"+data[i].TITLE+"</a></li>");
				  }else if(data[i].TYPE==2){
				    $("#domestic").append("<li><a target='_blank' href='"+data[i].URL+"'>"+data[i].TITLE+"</a></li>");
				  }
				  else if(data[i].TYPE==3){
				    $("#abroad").append("<li><a target='_blank' href='"+data[i].URL+"'>"+data[i].TITLE+"</a></li>");
				  }
		       }
			}
	});
}
function main() {
  if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
 	        //alert("IE 7.0");
 	        /*联系我们*/
 	        $(".carousel > P").css({"top":"212px"});
 	        $(".text_con").css({"margin-top":"0px","width":"300px"})
 	    }
 	    else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0") {
 	        //alert("IE 8.0");
 	    }
 	    else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE9.0") {
 	        //alert("IE 9.0");
 	    }
 	    
 	    Carousel();
 	    Menu();
 	    resouse();
 	}

 	function Carousel(){
 	    var i = 0;
 	    var clone = $(".img>li").first().clone();
 	    var title=$("#img-carousel>a").first().clone();
 	    $(".img").append(clone);
 	    $("#img-carousel").append(title);
 	    var img_num = $(".img>li").length;
 	    for (var j = 0; j < img_num - 1; j++) {
 	        $(".num").append("<li>" + (j + 1) + "</li>")
 	    }
 	    $(".num>li").first().addClass("active");
 	    $("#img-carousel>a").eq(0).show();
 	    /*圆点划入*/
 	    $(".num>li").hover(function () {
 	        var index = $(this).index();
 	        i = index;
 	        $(".img").stop().animate({left: -300 * index}, 500)
 	        $(this).addClass("active").siblings().removeClass("active");
 	        $("#img-carousel>a").hide().eq(i).show();
 	    })

 	    /*自动轮播*/
 	    var time = setInterval(function () {
 	        i++;
 	        move()
 	    }, 3000);

 	    /*对banner定时器的操作*/
 	    $(".carousel").hover(function () {
 	        clearInterval(time);
 	    }, function () {
 	        time = setInterval(function () {
 	            i++;
 	            move();
 	        }, 3000);
 	    });

 	    function move() {
 	        if (i == -1) {
 	            $(".img").css({left: -300 * (img_num - 1)});
 	            i = img_num - 2;
 	        }
 	        if (i == img_num) {
 	            $(".img").css({left: 0});
 	            i = 1;
 	        }
 	        $(".img").stop().animate({left: -300 * i}, 300)
 	        if (i == img_num - 1) {
 	            $(".num>li").eq(0).addClass("active").siblings().removeClass("active");
 	            $("#img-carousel>a").hide().eq(0).show();
 	        }
 	        $("#img-carousel>a").hide().eq(i).show();
 	        $(".num>li").eq(i).addClass("active").siblings().removeClass("active");
 	    }
 	}

 	function Menu(){
 	    var link_type=$('.link_type').children('p');
 	    var link_directory=$('.link_type').children('.link_directory');
 	    link_type.each(function(i){
 	        $(this).on('click',function(event){
 	            var directory_height=link_directory.eq(i).height();
 	            if(directory_height>=160){
 	                link_directory.eq(i).css({
 	                    bottom:-172+'px'
 	                })
 	            }
 	            link_directory.hide().eq(i).show();
 	            $(document).one('click',function(){
 	                link_directory.hide();
 	            });
 	            event.stopImmediatePropagation();
 	        });
 	        link_directory.click(function (event) {
 	            event.stopImmediatePropagation();
 	        });
 	    });
 	}

 	function resouse(){
 	    $("#news").click(function(){
 	        window.open("http://zwgk.puning.gd.cn/zwgk/showDeptType.action");
 	    });
 	    $("#atom").click(function(){
 	        window.location.href="app_index/goserviceappointment";
 	    });
 	    $("#books").click(function(){
 	        window.location.href="app_index/goBusinessGuide";
 	    });
 	    $("#user").click(function(){
 	    	window.open("train_toLogin");
 	    });
 	}
</script>
</body>
</html>

