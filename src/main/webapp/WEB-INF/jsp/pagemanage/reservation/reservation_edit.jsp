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
					
					<form action="reservation/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="RESERVATION_ID" id="RESERVATION_ID" value="${pd.RESERVATION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="PERSON_NAME" id="PERSON_NAME" value="${pd.PERSON_NAME}" maxlength="100" placeholder="这里输入姓名" title="姓名" style="width:98%;"
								<c:if test="${choice == 1 }">disabled="true"</c:if>
								/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">证件类型:</td>
								<td><input type="text" name="ID_TYPE" id="ID_TYPE" value="${pd.ID_TYPE}" maxlength="100" placeholder="这里输入证件类型" title="证件类型" style="width:98%;"
								<c:if test="${choice == 1 }">disabled="true"</c:if>
								/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">证件号码:</td>
								<td><input type="text" name="ID_NUMBER" id="ID_NUMBER" value="${pd.ID_NUMBER}" maxlength="100" placeholder="这里输入证件号码" title="证件号码" style="width:98%;"
								<c:if test="${choice == 1 }">disabled="true"</c:if>
								/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机号码:</td>
								<td><input type="text" name="PHONE_NUMBER" id="PHONE_NUMBER" value="${pd.PHONE_NUMBER}" maxlength="100" placeholder="这里输入手机号码" title="手机号码" style="width:98%;"
								<c:if test="${choice == 1 }">disabled="true"</c:if>
								/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系邮箱:</td>
								<td><input type="text" name="MAILBOX" id="MAILBOX" value="${pd.MAILBOX}" maxlength="100" placeholder="这里输入联系邮箱" title="联系邮箱" style="width:98%;"
								<c:if test="${choice == 1 }">disabled="true"</c:if>
								/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预约内容:</td>
								<td>
								<c:if test="${choice == 0 }">
								<input type="text" name="TEXT" id="TEXT" value="${pd.TEXT}" maxlength="100" placeholder="这里输入预约内容" title="预约内容" style="width:98%;"/>
								</c:if>
								<c:if test="${choice == 1 }">
								<textarea rows="10" disabled="disabled" type="text" name="TEXT" id="TEXT"  maxlength="255" title="预约内容" style="width:98%;" >${pd.TEXT}</textarea>
								
								</c:if>
								</td>
							</tr>
							<c:if test="${choice == 1 }">
							<tr>
							    <td style="width:75px;text-align: right;padding-top: 13px;">时间:</td>
								<td><input type="text" disabled="disabled" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" maxlength="100" title="时间" style="width:98%;"/><td>
							</tr>
							<tr>
							    <td style="width:75px;text-align: right;padding-top: 13px;">是否已处理:</td>
								<td><input type="text" disabled="disabled" name="HANDLED" id="HANDLED" value="${pd.HANDLED}" maxlength="100" title="是否已处理" style="width:98%;"/><td>
							</tr>
							<tr>
							    <td style="width:75px;text-align: right;padding-top: 13px;">处理人:</td>
								<td><input type="text" disabled="disabled" name="HANDLE_PERSON" id="HANDLE_PERSON" value="${pd.HANDLE_PERSON}" maxlength="100" title="是否已处理" style="width:98%;"/><td>
							</tr>
							</c:if>
							<tr>
								<td style="text-align: center;" colspan="10">
									<c:if test="${choice == 0 }">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									</c:if>
									
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
			if($("#PERSON_NAME").val()==""){
				$("#PERSON_NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PERSON_NAME").focus();
			return false;
			}
			if($("#ID_TYPE").val()==""){
				$("#ID_TYPE").tips({
					side:3,
		            msg:'请输入证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID_TYPE").focus();
			return false;
			}
			if($("#ID_NUMBER").val()==""){
				$("#ID_NUMBER").tips({
					side:3,
		            msg:'请输入证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID_NUMBER").focus();
			return false;
			}
			if($("#PHONE_NUMBER").val()==""){
				$("#PHONE_NUMBER").tips({
					side:3,
		            msg:'请输入手机号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE_NUMBER").focus();
			return false;
			}
			if($("#MAILBOX").val()==""){
				$("#MAILBOX").tips({
					side:3,
		            msg:'请输入联系邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAILBOX").focus();
			return false;
			}
			if($("#TEXT").val()==""){
				$("#TEXT").tips({
					side:3,
		            msg:'请输入预约内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEXT").focus();
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