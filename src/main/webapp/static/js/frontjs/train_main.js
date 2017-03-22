/**
 * Created by Administrator on 2016/8/29 0029.
 */
$(function(){
    chg_pass();
    Menu();
});

function Menu(){
    var use=$('.use');
    var second_nav=$('.use').children('.second_nav');
    use.hover(function(){
        second_nav.show();
    },function(){
        second_nav.hide();
    });
}

function chg_pass(){
    $('.second_nav>#chg_pass').on('click',function(){
        $('.mask').show();
        $('.chgPassword').show();
        $('html').css('overflow','hidden');
    })
    $('.chgPassword>.exit').on('click',function(){
        $('.mask').hide();
        $('.chgPassword').hide();
        $('html').css('overflow','scroll');
    })
    $('.mask').on('click',function(){
        $('.mask').hide();
        $('.chgPassword').hide();
        $('html').css('overflow','scroll');
    })
}
