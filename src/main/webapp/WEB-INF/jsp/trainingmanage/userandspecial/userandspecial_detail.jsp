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
					
					<form action="userandspecial/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名:</td>
								<td><input disabled="disabled" type="text" value="${pd.USERNAME}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属专题:</td>
								<td><input disabled="disabled" type="text" value="${pd.SPECAIL_TITLE}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择题答案:</td>
								<td><input disabled="disabled" type="text" value="${pd.CHOICE_ANSWER}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择题分数:</td>
								<td><input disabled="disabled" type="text" value="${pd.CHOICE_GRADE}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题答案:</td>
								<td><input disabled="disabled" type="text" value="${pd.FILL_ANSWER}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题分数:</td>
								<td><input disabled="disabled" type="text" value="${pd.FILL_GRADE}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题答案:</td>
								<td><input disabled="disabled" type="text" value="${pd.SUBJECTIVE_ANSWER}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题分数:</td>
								<td><input disabled="disabled" type="text" value="${pd.SUBJECTIVE_GRADE}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">总分:</td>
								<td><input disabled="disabled" type="text" value="${pd.TOTLE_GRADE}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">情况:</td>
								<td><input disabled="disabled" type="text" value="${pd.STATUS_SHOW}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">提交时间:</td>
								<td><input disabled="disabled" value="${pd.SUBMIT_TIME}" type="text" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
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
			if($("#USERANDSPECIAL_ID").val()==""){
				$("#USERANDSPECIAL_ID").tips({
					side:3,
		            msg:'请输入人员专题表ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERANDSPECIAL_ID").focus();
			return false;
			}
			if($("#USER_ID").val()==""){
				$("#USER_ID").tips({
					side:3,
		            msg:'请输入用户ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_ID").focus();
			return false;
			}
			if($("#SPECIAL_ID").val()==""){
				$("#SPECIAL_ID").tips({
					side:3,
		            msg:'请输入专题ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SPECIAL_ID").focus();
			return false;
			}
			if($("#CHOICE_ANSWER").val()==""){
				$("#CHOICE_ANSWER").tips({
					side:3,
		            msg:'请输入选择题答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHOICE_ANSWER").focus();
			return false;
			}
			if($("#CHOICE_GRADE").val()==""){
				$("#CHOICE_GRADE").tips({
					side:3,
		            msg:'请输入选择题分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHOICE_GRADE").focus();
			return false;
			}
			if($("#FILL_ANSWER").val()==""){
				$("#FILL_ANSWER").tips({
					side:3,
		            msg:'请输入填空题答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILL_ANSWER").focus();
			return false;
			}
			if($("#FILL_GRADE").val()==""){
				$("#FILL_GRADE").tips({
					side:3,
		            msg:'请输入填空题分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILL_GRADE").focus();
			return false;
			}
			if($("#SUBJECTIVE_ANSWER").val()==""){
				$("#SUBJECTIVE_ANSWER").tips({
					side:3,
		            msg:'请输入主观题答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECTIVE_ANSWER").focus();
			return false;
			}
			if($("#SUBJECTIVE_GRADE").val()==""){
				$("#SUBJECTIVE_GRADE").tips({
					side:3,
		            msg:'请输入主观题分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECTIVE_GRADE").focus();
			return false;
			}
			if($("#TOTLE_GRADE").val()==""){
				$("#TOTLE_GRADE").tips({
					side:3,
		            msg:'请输入总分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TOTLE_GRADE").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入情况',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#SUBMIT_TIME").val()==""){
				$("#SUBMIT_TIME").tips({
					side:3,
		            msg:'请输入提交时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBMIT_TIME").focus();
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