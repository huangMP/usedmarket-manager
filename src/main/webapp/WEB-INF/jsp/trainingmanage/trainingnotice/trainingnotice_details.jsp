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
					
					<form action="trainingnotice/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TRAININGNOTICE_ID" id="TRAININGNOTICE_ID" value="${pd.TRAININGNOTICE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr disabled="disabled" >
								<td style="width:75px;text-align: right;padding-top: 13px;">正文:</td>
								<td>
								<div disabled="disabled"
										name="TEXT" id="TEXT" placeholder="无内容"
										title="正文" style="width:98%;padding: 10px;border: 1px solid #ccc;">${pd.TEXT}</div>
										
								</td>
							</tr>		
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源:</td>
								<td><input disabled="disabled" type="text" name="ORIGIN" id="ORIGIN" value="${pd.ORIGIN}" maxlength="100" placeholder="这里输入来源" title="来源" style="width:98%;"/></td>
							</tr>
							
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">优先数:</td>
								<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}" maxlength="32" placeholder="这里输入优先数" title="优先数" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
								<td><input disabled="disabled" type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="50" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input disabled="disabled" class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加时间" title="添加时间" style="width:98%;"/></td>
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
			if($("#TEXT").val()==""){
				$("#TEXT").tips({
					side:3,
		            msg:'请输入正文',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEXT").focus();
			return false;
			}
			if($("#ORIGIN").val()==""){
				$("#ORIGIN").tips({
					side:3,
		            msg:'请输入来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORIGIN").focus();
			return false;
			}
			/* if($("#SORT").val()==""){
				$("#SORT").tips({
					side:3,
		            msg:'请输入优先数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SORT").focus();
			return false;
			}
			if($("#ADD_USER").val()==""){
				$("#ADD_USER").tips({
					side:3,
		            msg:'请输入添加人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_USER").focus();
			return false;
			}
			if($("#ADD_TIME").val()==""){
				$("#ADD_TIME").tips({
					side:3,
		            msg:'请输入添加时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_TIME").focus();
			return false;
			} */
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