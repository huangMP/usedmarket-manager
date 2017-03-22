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
					
					<form action="message/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MESSAGE_ID" id="MESSAGE_ID" value="${pd.MESSAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input disabled="disabled" type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="20" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机:</td>
								<td><input disabled="disabled" type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="20" title="手机" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮箱:</td>
								<td><input disabled="disabled" type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="30" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">留言内容:</td>
								<td><textarea rows="10" disabled="disabled" type="text" name="MESSAGECONTENT" id="MESSAGECONTENT"  maxlength="255" title="留言内容" style="width:98%;" >${pd.MESSAGECONTENT}</textarea></td>
<!-- 								<td><textarea rows="5" disabled="disabled" type="text" name="MESSAGECONTENT" id="MESSAGECONTENT"  text="${pd.MESSAGECONTENT}" maxlength="255" title="留言内容" style="width:98%;" ></textarea></td> -->
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否已处理:</td>
								<td><input disabled="disabled" type="number" name="ISHANDLED" id="ISHANDLED" value="${pd.ISHANDLED}" maxlength="32"title="是否已处理" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">处理人:</td>
								<td><input disabled="disabled" type="text" name="HANDLE_PERSON" id="HANDLE_PERSON" value="${pd.HANDLE_PERSON}" maxlength="32"title="处理人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">留言时间:</td>
								<td><input disabled="disabled" class="span10 date-picker" name="MESSAGETIME" id="MESSAGETIME" value="${pd.MESSAGETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="留言时间" title="留言时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
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
		
		</script>
</body>
</html>