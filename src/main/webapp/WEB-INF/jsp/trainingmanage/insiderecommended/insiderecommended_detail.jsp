<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
							<input type="hidden" name="EXHIBITION_ID" id="EXHIBITION_ID"
								value="${pd.EXHIBITION_ID}" />
							<div id="zhongxin" style="padding-top: 13px;">
								<table id="table_report"
									class="table table-striped table-bordered table-hover">
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">所属专题:</td>
										<input type="text" name="edit_type" id="edit_type"
											value="${pd.SPECIAL_ID}" hidden="hidden" />
										<td><select class="chosen-select form-control"
											name="SPECIAL_ID" id="SPECIAL_ID" disabled="disabled"
											style="vertical-align:top;width: 200px;">
												<option value="" disabled selected hidden>请选择专题</option>
												<c:forEach items="${myspecial }" var="special">
													<option value="${special.SPECIAL_ID }">${special.TITLE }</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">链接:</td>
										<td><textarea name="LINK" id="LINK" disabled="disabled"
												rows="2" cols="" placeholder="无内容" title="正文"
												style="width:98%">${pd.LINK}</textarea></td>
									</tr>
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
										<td><input type="text" name="ADD_USER" id="ADD_USER"
											disabled="disabled" value="${pd.ADD_USER}" maxlength="50"
											placeholder="这里输入添加人" title="添加人" style="width:98%;" /></td>
									</tr>
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
										<td><input class="span10 date-picker" name="ADD_TIME"
											disabled="disabled" id="ADD_TIME" value="${pd.ADD_TIME}"
											type="text" data-date-format="yyyy-mm-dd" readonly="readonly"
											placeholder="添加时间" title="添加时间" style="width:98%;" /></td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="10"><a
											class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a></td>
									</tr>
								</table>
							</div>
							<div id="zhongxin2" class="center" style="display:none">
								<br /> <br /> <br /> <br /> <br /> <img
									src="static/images/jiazai.gif" /><br />
								<h4 class="lighter block green">提交中...</h4>
							</div>
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
		$(function() {

			var editType = $("#edit_type").val();
			if (editType != "") {
				$("#SPECIAL_ID").val(editType)
			}

		});
	</script>
</body>
</html>