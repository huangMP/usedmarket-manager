/**
 * Created by skywalker on 2016/8/15.
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
        $(".circle1").css({left:"465px"});
        $(".lan").css({top:"-27px"});
        $(".close").css({"margin-top":"-22px"});
        $(".input_text").css({"margin-top":"22px"});
        $("#name").before("<span class='text_ie1_7'>姓名：</span><span class='text_ie2_7'>电话：</span><span class='text_ie3_7'>E-mail：</span>")
    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE8.0")
    {
        //alert("IE 8.0");
        /*联系我们*/
        $("#name").before("<span class='text_ie1'>姓名：</span><span class='text_ie2'>电话：</span><span class='text_ie3'>E-mail：</span>")
    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE9.0")
    {
        //alert("IE 9.0");
        /*联系我们*/
        $("#name").before("<span class='text_ie1'>姓名：</span><span class='text_ie2'>电话：</span><span class='text_ie3'>E-mail：</span>")

    }
    else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE10.0")
    {
        //alert("IE 10.0");
    }
    /*兼容placeholder标签*/

    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){
        map = new BMap.Map("map");
        map.centerAndZoom(new BMap.Point(116.172755,23.303786),19);
    }
    function setMapEvent(){
        map.enableScrollWheelZoom();
        map.enableKeyboard();
        map.enableDragging();
        map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
        target.addEventListener("click",function(){
            target.openInfoWindow(window);
        });
    }
    function addMapOverlay(){
        var markers = [
            {content:"",title:"",imageOffset: {width:0,height:3},position:{lat:23.303848,lng:116.172171}}
        ];
        for(var index = 0; index < markers.length; index++ ){
            var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
            var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
                imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
            })});
            var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
            var opts = {
                width: 200,
                title: markers[index].title,
                enableMessage: false
            };
            var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
            marker.setLabel(label);
            addClickHandler(marker,infoWindow);
            map.addOverlay(marker);
        };
    }
    //向地图添加控件
    function addMapControl(){
        var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
        map.addControl(scaleControl);
        var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(navControl);
        var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
        map.addControl(overviewControl);
    }
    var map;
    initMap();

    actions();
    ex();
    $(".close").click(function(){
        $(".edam").css({display:"none"});
    })
}

/*判断填写内容是否为空*/
function actions(){
    $(".btn").click(function(){
        if_null();
    })
}
var phoneif = true;
var emailif = true;
function if_null() {
    var text = $("#text_box").val();
    var name = $("#name").val();
    var phone = $("#phone").val();
    var email = $("#email").val();
    if (email != "") {
        var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        isok= reg.test(email);
        if (!isok) {
            emailif=false;
        }
    }
    if (phone != ""){
        phoneif = !isNaN(phone);
    }
    console.log(phoneif);
    console.log(text)
    if (text == "" && name == "" && phone == "" && email == "") {
        console.log(1)
        if(att==true){

            $("#sum").after("<div class='edam edam_bg'><strong>没有填入任何信息!</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#text_box,#name,#phone,#email").css({"border":"solid 1px #ff5566"});
            att=false;
        }
    }
    else if (text == "") {
        /*alert("留言栏为空！");*/
        if(att==true){
            $("#sum").after("<div class='edam edam_bg'><strong>留言栏为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#text_box").css({"border":"solid 1px #ff5566"});
            att=false;
        }
    }
    else if (name == "") {
        /*alert("姓名为空！");*/
        if(att==true){
            $("#sum").after("<div class='edam edam_bg'><strong>姓名为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#name").css({"border":"solid 1px #ff5566"});
            att=false;
        }

    }
    else if (phone == "") {
        /*alert("电话为空！");*/
        if(att==true){
            $("#sum").after("<div class='edam edam_bg'><strong>电话为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#phone").css({border:"solid 1px #ff5566"});
            att=false;
        }

    }
    else if (email == "") {
        /*alert("邮箱为空！");*/
        if(att==true){
            $("#sum").after("<div class='edam edam_bg'><strong>邮箱为空!</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#email").css({"border":"solid 1px #ff5566"});
            att=false;
        }

    }
    else if(phoneif==false){
        if(att==true){
            $("#sum").after("<div class='edam edam_bg'><strong>电话格式不正确!</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#phone").css({"border":"solid 1px #ff5566"});
            att=false;
        }
    }
    else if(emailif==false){
        if(att==true){
            $("#sum").after("<div class='edam edam_bg'><strong>邮箱格式不正确!</strong><button type='button' class='close'><span>&times;</span></button></div>");
            $(".edam").fadeOut(5000);
            $("#email").css({"border":"solid 1px #ff5566"});
            att=false;
        }
    }
    else {
        $("#sum").after("<div class='edam edam_su'><strong>留言成功</strong><button type='button' class='close'><span>&times;</span></button></div>");
        $(".edam").fadeOut(5000);
        $("#text_box").val("");
        $("#name").val("");
        $("#phone").val("");
        $("#email").val("");
    }
}

/*恢复空框焦点*/
var att = true;
function ex(){
    $("#text_box").focus(function (){
        $("#text_box").css({"border":"solid 1px #b7b7b7"});
        att=true;
    });
    $("#name").focus(function (){
        $("#name").css({"border":"solid 1px #b7b7b7"});
        att=true;
    });
    $("#phone").focus(function (){
        $("#phone").css({"border":"solid 1px #b7b7b7"});
        att=true;
    });
    $("#email").focus(function (){
        $("#email").css({"border":"solid 1px #b7b7b7"});
        emailif = true;
        att=true;
    });
}


