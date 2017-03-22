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
					
					<form action="WebDonation/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DONATION_ID" id="DONATION_ID" value="${pd.DONATION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">捐赠者的用户Id:</td>
								<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="255" placeholder="这里输入捐赠者的用户Id" title="捐赠者的用户Id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">捐赠物品名称:</td>
								<td><input type="text" name="DONATION_NAME" id="DONATION_NAME" value="${pd.DONATION_NAME}" maxlength="255" placeholder="这里输入捐赠物品名称" title="捐赠物品名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">分类:</td>
								<td><input type="text" name="CATEGORY" id="CATEGORY" value="${pd.CATEGORY}" maxlength="255" placeholder="这里输入分类" title="分类" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数量:</td>
								<td><input type="number" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入数量" title="数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">定位:</td>
								<td><input type="text" name="LOCATION" id="LOCATION" value="${pd.LOCATION}" maxlength="255" placeholder="这里输入定位" title="定位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发布该捐赠的日期:</td>
								<td><input class="span10 date-picker" name="DONATION_DATE" id="DONATION_DATE" value="${pd.DONATION_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="发布该捐赠的日期" title="发布该捐赠的日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态</td>
								<td>

									<select value="${pd.STATUS}" id="STATUS" name="STATUS" type="number" class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
										<c:if test="${pd.STATUS == 0}">
											<option value="0">现在:未收取</option>
										</c:if>
										<c:if test="${pd.STATUS == 1}">
											<option value="1">现在:已收取</option>
										</c:if>
										<c:if test="${pd.STATUS == 2}">
											<option value="2">现在:已送出</option>
										</c:if>
										<c:if test="${pd.STATUS == 3}">
											<option value="3">现在:已下架</option>
										</c:if>
										<option value="0">未收取</option>
										<option value="1">已收取</option>
										<option value="2">已送出</option>
										<option value="3">已下架</option>
									</select>

							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">捐赠者联系电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入捐赠者联系电话" title="捐赠者联系电话" style="width:98%;"/></td>
							</tr>
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
			if($("#USER_ID").val()==""){
				$("#USER_ID").tips({
					side:3,
		            msg:'请输入捐赠者的用户Id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_ID").focus();
			return false;
			}
			if($("#DONATION_NAME").val()==""){
				$("#DONATION_NAME").tips({
					side:3,
		            msg:'请输入捐赠物品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DONATION_NAME").focus();
			return false;
			}
			if($("#CATEGORY").val()==""){
				$("#CATEGORY").tips({
					side:3,
		            msg:'请输入分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CATEGORY").focus();
			return false;
			}
			if($("#AMOUNT").val()==""){
				$("#AMOUNT").tips({
					side:3,
		            msg:'请输入数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AMOUNT").focus();
			return false;
			}
			if($("#LOCATION").val()==""){
				$("#LOCATION").tips({
					side:3,
		            msg:'请输入定位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOCATION").focus();
			return false;
			}
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
			return false;
			}
			if($("#DONATION_DATE").val()==""){
				$("#DONATION_DATE").tips({
					side:3,
		            msg:'请输入发布该捐赠的日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DONATION_DATE").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入状态：0.未收取；1.已收取；；2.已送出；3.已下架',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入捐赠者联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
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