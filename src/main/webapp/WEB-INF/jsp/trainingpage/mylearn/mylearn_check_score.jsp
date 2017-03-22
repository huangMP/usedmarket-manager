<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我的学习-成绩查询</title>
    <link href="static/css/train_total.css" type="text/css" rel="stylesheet">
    <link href="static/css/train_allclass.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/train_alljs.js"></script>
</head>
<body>
<jsp:include page="../train_head.jsp"></jsp:include>
<div class="content">
    <div class="text_box">
        <div class="content_bag">
            <a href="javascript:history.back(-1)" class="return_butt">返回</a>
            <div class="score_box">
                <h2>选择题</h2>
                <p>题目总分：<span>${paperPd.CHOICE_GRADE + paperPd.CHOICE_DOUBLE_GRADE}</span></p>
                <p>您的得分：<span>${pd.CHOICE_GRADE }</span></p>
            </div>
            <div class="score_box">
                <h2>填空题</h2>
                <p>题目总分：<span>${paperPd.FILL_GRADE}</span></p>
                <p>您的得分：<span>${pd.FILL_GRADE }</span></p>
            </div>
            <div class="score_box">
                <h2>简答题</h2>
                <p>题目总分：<span>${paperPd.SUBJECTIVE_GRADE}</span></p>
                <p>您的得分：<span>${pd.SUBJECTIVE_GRADE }</span></p>
            </div>
            <div class="score_box">
                <h3>获得总分：</h3>
                <span>${pd.TOTLE_GRADE}
                	<c:if test="${pd.STATUS==3 || pd.STATUS==7}">
                	(不合格)
                	</c:if>
                	<c:if test="${pd.STATUS==2 || pd.STATUS==6}">
                	(合格)
                	</c:if>
                </span>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<script>
    $(".top2").addClass("font_size");
</script>
</body>
</html>
</html>
