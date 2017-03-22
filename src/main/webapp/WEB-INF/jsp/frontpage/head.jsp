<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="head">
    <div class="top_box">  
    <div class="top_page">
    <img src="static/image/top2/top_text.png" class="top_text">
        <ul class="img2">
           
        </ul>
    </div>
    </div>
    <div class="address">
    
        <ul class="top_nav">
            <li><a href="app_index/goindex" class="aline">首页</a></li>
            <li><a href="app_index/goArchiveIntroduction" class="aline">局馆介绍</a>
                <div class="att"></div>
                <ul class="next_nav">
                    <li><a href="app_index/goArchiveIntroduction" class="aline2">局馆介绍</a><div class="att"></div></li>
                    <li><a href="app_index/goLeadershipRanks" class="aline2">领导班子</a><div class="att"></div></li>
                    <li><a href="app_index/goMechanismFunction" class="aline2">机构职能</a><div class="att"></div></li>
                    <li><a href="app_index/goArchiveScene" class="aline2">局馆风貌</a><div class="att"></div></li>
                    <li><a href="app_index/goArchiveHonor" class="aline2">局馆荣誉</a><div class="att"></div></li>
                    <li><a href="app_index/goLeadershipConcern" class="aline2">领导关怀</a><div class="att"></div></li>
                </ul>
            </li>
            <li><a href="app_index/goserviceinformation" class="aline">公共服务</a>
                <div class="att"></div>
                <ul class="next_nav">
                    <li><a href="app_index/goserviceinformation" class="aline2">查档服务指南</a><div class="att"></div></li>
                    <li><a href="app_index/goserviceappointment" class="aline2">服务预约</a><div class="att"></div></li>
                    <li><a href="http://zwgk.puning.gd.cn/zwgk/showDeptType.action" class="aline2" target=_blank>政府信息公开</a><div class="att"></div></li>
                </ul>
            </li>
            <li><a href="app_index/goregulations" class="aline">法规与标准</a>
                <div class="att"></div>
                <ul class="next_nav">
                    <li><a href="app_index/goregulations" class="aline2">法规</a><div class="att"></div></li>
                    <li><a href="app_index/gostandards" class="aline2">标准</a><div class="att"></div></li>
                    <li><a href="app_index/gorelateddocuments" class="aline2">相关文件</a><div class="att"></div></li>
                </ul>
            </li>
            <li><a href="app_index/goWorkDynamics" class="aline">档案动态</a>
                <div class="att"></div>
                <ul class="next_nav">
                    <li><a href="app_index/goWorkDynamics" class="aline2">工作动态</a><div class="att"></div></li>
                    <li><a href="app_index/goNotice" class="aline2">通知公告</a><div class="att"></div></li>
                    <li><a href="app_index/goOtherInformation" class="aline2">他山之石</a><div class="att"></div></li>
                </ul>
            </li>
            <li><a href="app_index/goBusinessGuide" class="aline">业务指导</a>
                <div class="att"></div>
                <ul class="next_nav">
                    <li><a href="app_index/goBusinessGuide" class="aline2">业务指南</a><div class="att"></div></li>
                    <li><a href="app_index/goOnlineRegistration" class="aline2">在线报名</a><div class="att"></div></li>
                    <li><a href="app_index/goBusinessTraining" class="aline2">业务培训</a><div class="att"></div></li>
                </ul>
            </li>
            <li><a href="app_index/goelearchives" class="aline">利用中心</a>
                <div class="att"></div>
                <ul class="next_nav">
                    <li><a href="app_index/goelearchives" class="aline2">电子档案</a><div class="att"></div><div class="att"></div></li>
                    <li><a href="app_index/goopendirectory" class="aline2">开放目录</a><div class="att"></div><div class="att"></div></li>
                    <li><a href="app_index/gousecase" class="aline2">利用实例</a><div class="att"></div><div class="att"></div></li>
                </ul>
            </li>
            <li><a href="app_index/goexhition" class="aline">网上展厅</a></li>
            <li><a href="app_index/goconnection" class="aline">联系我们</a></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<script>
    $(function(){
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        var s;
        (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
        (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
        (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
        (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
        
    if (Sys.ie=="7.0") {       
        $(".img2").empty().append("<li><img src='static/image/top2/13.png' style='height:230px'></li>").css({"height":"230px","width":"555px"});
    }
    else{
    	$(".img2").append("<li><img src='static/image/top2/13.png'></li><li><img src='static/image/top2/1.png'></li><li><img src='static/image/top2/10.png'></li><li><img src='static/image/top2/14.png'></li>")
    	var i=0;
    	$(".top_page>.img2>li").hide();
    	moveimg();
        var t=setInterval(moveimg,5000);
        function moveimg(){
            if (i<4){
                $(".top_page>.img2>li").eq(i).fadeIn(3000).siblings('li').fadeOut(600);
                i++;
            }
            else {
                i=0;
                $(".top_page>.img2>li").eq(0).fadeIn(3000).siblings('li').fadeOut(1300); 
                
            }
        }
    }
    
    
        
    });

</script>



