/**
 * Created by Administrator on 2016/8/17 0017.
 */
window.onload=function(){
    if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE6.0")
    {
        //alert("IE 6.0");
    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0")
    {
        //alert("IE 7.0");
        /*联系我们*/
        $(".nav_option>p").css({"background": "rgb(206, 224, 242)"}).hover(function(){
            $(this).css({"background":" rgb(186,204,222)"})
        },function(){
            $(this).css({"background": "rgb(206, 224, 242)"})
        });

    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE8.0") {
        //alert("IE 8.0");
        /*联系我们*/
        $(".nav_option>p").css({"background": "rgb(206, 224, 242)"}).hover(function(){
            $(this).css({"background":" rgb(186,204,222)"})
        },function(){
            $(this).css({"background": "rgb(206, 224, 242)"})
        });

    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE9.0")
    {
        //alert("IE 9.0");
        /*联系我们*/


    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE10.0")
    {
        //alert("IE 10.0");
    }

    var nav_option=$(".nav_option").children('p');
    var box=$(".details").children('.catalogBox');
    nav_option.each(function(i){
        $(this).on("click",function(){
            box.hide().eq(i).show();
        })
    });
    /*判断数据总数*/
    var text_num;
    text_num=$("#box1>li").length;
    $("#box1_num").append("共"+text_num+"条");
    text_num=$("#box2>li").length;
    $("#box2_num").append("共"+text_num+"条");
    text_num=$("#box3>li").length;
    $("#box3_num").append("共"+text_num+"条");
    text_num=$("#box4>li").length;
    $("#box4_num").append("共"+text_num+"条");
    text_num=$("#box5>li").length;
    $("#box5_num").append("共"+text_num+"条");
    text_num=$("#box6>li").length;
    $("#box6_num").append("共"+text_num+"条");
}
