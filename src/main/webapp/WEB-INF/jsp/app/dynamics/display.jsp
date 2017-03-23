<%--
  Created by IntelliJ IDEA.
  User: huangMP
  Date: 2016/11/18
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en">
<![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8" lang="en">
<![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <base href="<%=basePath%>">
    <title>校园动态</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <meta charset="UTF-8">

    <!-- CSS Bootstrap & Custom -->
    <link href="<%=basePath%>static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>static/css/templatemo_style.css" rel="stylesheet" media="screen">

    <!-- Favicons -->
    <link rel="shortcut icon" href="<%=basePath%>static/images/ico/favicon.ico">

</head>
<body>


<div class="overlay-bg"></div>


<div class="main-content">
    <div class="container">
        <div class="row">


            <div class="content-inner">
                <div class="row">
                    <!-- <div class="col-md-12 col-sm-12"> -->
                    <div>
                        <div class="team-member">
                            <div class="member-infos">

                                <div style="color:black;" >
                                    <h2>${dynamics.title }</h2>
                                    <div style="text-align: right">${dynamics.addDate}</div>
                                    <hr/>
                                    ${dynamics.text }
                                </div>

                            </div>
                        </div>
                    </div> <!-- /.col-md-4 -->

                </div> <!-- /.row -->


            </div> <!-- /.content-inner -->


        </div> <!-- /.row -->

    </div>
</div> <!-- /.container -->
</div> <!-- /.main-content -->

<!-- JavaScripts -->
<script src="<%=basePath%>static/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>static/js/modernizr.js"></script>
<script src="<%=basePath%>static/js/bootstrap.min.js"></script>
<script src="<%=basePath%>static/jquery.mixitup.min.js"></script>
<script src="<%=basePath%>static/jquery.nicescroll.min.js"></script>
<script src="<%=basePath%>static/jquery.lightbox.js"></script>
<script src="<%=basePath%>static/js/templatemo_custom.js"></script>

<script type="text/javascript">

    $(top.hangge());//关闭加载状态

</script>


</body>
</html>
