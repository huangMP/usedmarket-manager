<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
					
					<form action="makersubjecthead/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SUBJECT_HEAD_ID" id="SUBJECT_HEAD_ID" value="${pd.SUBJECT_HEAD_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">推荐标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入推荐标题" title="推荐标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">“更多”文字描述:</td>
								<td><input type="text" name="MORE_DES" id="MORE_DES" value="${pd.MORE_DES}" maxlength="255" placeholder="这里输入“更多”文字描述" title="“更多”文字描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类型:</td>
								<td><input type="number" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入类型" title="类型" style="width:98%;"/></td>
							</tr>
							<input type="text" hidden="hidden" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="255" title="添加人" style="width:98%;"/>
							<input class="span10 date-picker" hidden="hidden" name="ADD_DATE" id="ADD_DATE" value="${pd.ADD_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly"title="添加时间" style="width:98%;"/>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入推荐标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#MORE_DES").val()==""){
				$("#MORE_DES").tips({
					side:3,
		            msg:'请输入“更多”文字描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MORE_DES").focus();
			return false;
			}
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>