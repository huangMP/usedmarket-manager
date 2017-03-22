/**
 * Created by skywalker on 2016/8/29.
 */
$(function(){
//	判断内核
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        var s;
        (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
        (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
        (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
        (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
        
        if (Sys.ie) {
//        ie内核
        	jump_ie();
        }
        else {
        	jump();
        }
	
	

    if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0")
    {
        //alert("IE 7.0");
    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE8.0")
    {
        //alert("IE 8.0");
    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE9.0")
    {
        //alert("IE 9.0");
    }
    var isChrome = window.navigator.userAgent.indexOf("Chrome") !== -1;
    if (isChrome) {
        $(".answei_box").css({"width":"355px"})
    }
    $(".names").css({"color":"#5ab25a"})
    
    function jump(){
    	   $('.land_box').eq(0).click(function(){
    	        window.location.href="train_app/gomylearn_notice"
    	    });
    	    $('.land_box').eq(1).click(function(){
    	        window.location.href="train_app/gomylearn_class"
    	    });
    	    $('.land_box').eq(2).click(function(){
    	        window.location.href="train_app/gomylearn_gotest"
    	    });

        
        /*课程详情*/
        $("#main_land").click(function(){
    		var special_id = $("#SPECIAL_ID").val();
        	window.location.href="train_special/goSpecial?SPECIAL_ID="+special_id
        })
        $("#talk_land").click(function(){
        	var special_id = $("#SPECIAL_ID").val();
            window.location.href="train_special/goDiscussion?SPECIAL_ID="+special_id
        });
        /*章节详情*/
        $('.top_land_butt').eq(0).click(function(){
        	var lesson_id = $("#LESSON_ID").val();
            window.location.href="train_lesson/goVideo?LESSON_ID="+lesson_id
        });
        $('.top_land_butt').eq(1).click(function(){
        	var lesson_id = $("#LESSON_ID").val();
            window.location.href="train_lesson/goDocument?LESSON_ID="+lesson_id
        });
        $('.top_land_butt').eq(2).click(function(){
        	var lesson_id = $("#LESSON_ID").val();
            window.location.href="train_lesson/goPractice?LESSON_ID="+lesson_id
        });
        
    }
    function jump_ie(){
        $('.land_box').eq(0).click(function(){
            window.location.href="gomylearn_notice"
        });
        $('.land_box').eq(1).click(function(){
            window.location.href="gomylearn_class"
        });
        $('.land_box').eq(2).click(function(){
            window.location.href="gomylearn_gotest"
        });

        /*课程详情*/
        $("#main_land").click(function(){
    		var special_id = $("#SPECIAL_ID").val();
        	window.location.href="goSpecial?SPECIAL_ID="+special_id
        })
        $("#talk_land").click(function(){
        	var special_id = $("#SPECIAL_ID").val();
            window.location.href="goDiscussion?SPECIAL_ID="+special_id
        });

        /*章节详情*/
        $('.top_land_butt').eq(0).click(function(){
        	var lesson_id = $("#LESSON_ID").val();
            window.location.href="goVideo?LESSON_ID="+lesson_id
        });
        $('.top_land_butt').eq(1).click(function(){
        	var lesson_id = $("#LESSON_ID").val();
            window.location.href="goDocument?LESSON_ID="+lesson_id
        });
        $('.top_land_butt').eq(2).click(function(){
        	var lesson_id = $("#LESSON_ID").val();
            window.location.href="goPractice?LESSON_ID="+lesson_id
        });
    }
})