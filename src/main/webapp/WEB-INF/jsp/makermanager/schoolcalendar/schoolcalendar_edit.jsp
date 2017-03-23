<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css"/>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp" %>
    <!-- 具体日期框 -->
    <link rel="stylesheet" href="static/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" media="screen"/>
    <link rel="stylesheet" href="static/bootstrap-datetimepicker/bootstrap/css/bootstrap.min.css" media="screen"/>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">

                        <form action="schoolcalendar/${msg }.do" name="Form" id="Form" method="post">
                            <input type="hidden" name="SCHOOLCALENDAR_ID" id="SCHOOLCALENDAR_ID"
                                   value="${pd.SCHOOLCALENDAR_ID}"/>
                            <div id="zhongxin" style="padding-top: 13px;">
                                <table id="table_report" class="table table-striped table-bordered table-hover">
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">概要:</td>
                                        <td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}"
                                                   maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">概要:</td>
                                        <td><input type="text" name="BRIEF" id="BRIEF" value="${pd.BRIEF}"
                                                   maxlength="255" placeholder="这里输入概要" title="概要" style="width:98%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">地点:</td>
                                        <td><input type="text" name="LOCATION" id="LOCATION" value="${pd.LOCATION}"
                                                   maxlength="255" placeholder="这里输入地点" title="地点" style="width:98%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:75px;text-align: right;padding-top: 13px;">活动时间:</td>
                                        <td><input class="input-group datetimepicker" name="ACTIVITY_TIME"
                                                   id="ACTIVITY_TIME"
                                                   value="${pd.ACTIVITY_TIME}" type="text" readonly="readonly"
                                                   placeholder="活动时间" title="活动时间"
                                                   style="width:98%;"/></td>
                                    </tr>
                                    <input type="text" name="ADD_USER" hidden="hidden" id="ADD_USER"
                                           value="${pd.ADD_USER}"
                                           maxlength="255" title="添加人"
                                           style="width:98%;"/>
                                    <input class="span10 date-picker" hidden="hidden" name="ADD_DATE" id="ADD_DATE"
                                           value="${pd.ADD_DATE}" type="text" data-date-format="yyyy-mm-dd"
                                           readonly="readonly" title="添加时间"
                                           style="width:98%;"/>
                                    <tr>
                                        <td style="text-align: center;" colspan="10">
                                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                                            <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img
                                    src="static/images/jiazai.gif"/><br/><h4 class="lighter block green">提交中...</h4>
                            </div>
                        </form>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->
</div>
<!-- /.main-container -->


<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp" %>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 具体日期框 -->
<script src="static/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script src="static/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="static/bootstrap-datetimepicker/bootstrap/js/bootstrap.min.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());
    //保存
    function save() {
        if ($("#BRIEF").val() == "") {
            $("#BRIEF").tips({
                side: 3,
                msg: '请输入概要',
                bg: '#AE81FF',
                time: 2
            });
            $("#BRIEF").focus();
            return false;
        }
        if ($("#TITLE").val() == "") {
            $("#TITLE").tips({
                side: 3,
                msg: '请输入标题',
                bg: '#AE81FF',
                time: 2
            });
            $("#BRIEF").focus();
            return false;
        }
        if ($("#LOCATION").val() == "") {
            $("#LOCATION").tips({
                side: 3,
                msg: '请输入地点',
                bg: '#AE81FF',
                time: 2
            });
            $("#LOCATION").focus();
            return false;
        }
        if ($("#ACTIVITY_TIME").val() == "") {
            $("#ACTIVITY_TIME").tips({
                side: 3,
                msg: '请输入活动时间',
                bg: '#AE81FF',
                time: 2
            });
            $("#ACTIVITY_TIME").focus();
            return false;
        }
        $("#Form").submit();
        $("#zhongxin").hide();
        $("#zhongxin2").show();
    }

    $(function () {
        //日期框
        $('#ACTIVITY_TIME').datetimepicker({
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1,
            format: 'yyyy-mm-dd hh:ii'
        });
    });
</script>
</body>
</html>