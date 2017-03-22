/**
 * Created by Administrator on 2016/8/19 0019.
 */
window.onload=function() {
    if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0") {
        //alert("IE 6.0");
    }
    else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
        //alert("IE 7.0");
        /*联系我们*/
        $(".carousel > P").css({"top":"212px"});
       $(".dynamic .directory").css({"margin-top":"5px"});
        $(".section .box_margin:first .directory").css({"margin-top":"5px"});
        $(".text_con").css({"margin-top":"0px","width":"300px"})
    }
    else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0") {
        //alert("IE 8.0");
        /*联系我们*/

    }
    else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE9.0") {
        //alert("IE 9.0");
        /*联系我们*/


    }
    else if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE10.0") {
        //alert("IE 10.0");
    }

    Carousel();
    Menu();
    resouse();
}

function Carousel(){
    var i = 0;
    var clone = $(".img>li").first().clone();
    $(".img").append(clone);
    var img_num = $(".img>li").length;
    for (var j = 0; j < img_num - 1; j++) {
        $(".num").append("<li>" + (j + 1) + "</li>")
    }
    $(".num>li").first().addClass("active");
    /*圆点划入*/
    $(".num>li").hover(function () {
        var index = $(this).index();
        i = index;
        $(".img").stop().animate({left: -300 * index}, 500)
        $(this).addClass("active").siblings().removeClass("active");
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
        }
        $(".num>li").eq(i).addClass("active").siblings().removeClass("active");
    }
}

function Menu(){
    var link_type=$('.link_type').children('p');
    var link_directory=$('.link_type').children('.link_directory');
    link_type.each(function(i){
        $(this).on('click',function(event){
            var directory_height=link_directory.eq(i).height();
            if(directory_height>=210){
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
        window.location.href="http://zwgk.puning.gd.cn/zwgk/showDeptType.action";
    });
    $("#atom").click(function(){
        window.location.href="app_index/goserviceappointment";
    });
    $("#books").click(function(){
        window.location.href="app_index/goBusinessGuide";
    });
    $("#user").click(function(){
        window.location.href="#";
    });
}
