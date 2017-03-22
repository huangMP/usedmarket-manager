/**
 * Created by Administrator on 2016/8/25 0025.
 */
$(function(){
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
});