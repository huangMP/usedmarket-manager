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
					
					<form action="makersentence/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SENTENCE_ID" id="SENTENCE_ID" value="${pd.SENTENCE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文字字段:</td>
								<td><input type="text" name="TEXT" id="TEXT" value="${pd.TEXT}" maxlength="255" placeholder="这里输入文字字段" title="文字字段" style="width:98%;"/></td>
							</tr>
							<tr>
								<input type="text" name="edit_type" id="edit_type"
									   value="${pd.TYPE}" hidden="hidden" />
								<td style="width:75px;text-align: right;padding-top: 13px;">类型:</td>
								<td>
									<select class="chosen-select form-control" name="TYPE" id="TYPE" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
										<option value="1">跑马条</option>
										<option value="2">推荐</option>
									</select>
								</td>
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

		$(function() {

			var editType = $("#edit_type").val();
			if (editType != "" ) {
				$("#TYPE").val(editType)
			}

		});

		//保存
		function save(){
			if($("#TEXT").val()==""){
				$("#TEXT").tips({
					side:3,
		            msg:'请输入文字字段',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEXT").focus();
			return false;
			}
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入类型（1：跑马条；2：推荐）',
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