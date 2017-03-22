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
							<div id="zhongxin" style="padding-top: 13px;">
								<table id="table_report"
									class="table table-striped table-bordered table-hover">
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
										<td><input disabled="disabled" type="text" name="TITLE" 
											id="TITLE" value="${pd.TITLE}" maxlength="100"
											placeholder="这里输入标题" title="标题" style="width:98%;" /></td>
									</tr>
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">来源:</td>
										<td><input disabled="disabled" type="text" name="ORIGIN"
											id="ORIGIN" value="${pd.ORIGIN}" maxlength="100"
											placeholder="这里输入来源" title="来源" style="width:98%;" /></td>
									</tr>
									
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">图片:</td>
										<td>
											<div style="width:98%%;padding: 10px;border: 1px solid #ccc;">
												<img style="height: 300px;" src="${pageContext.request.contextPath}${pd.IMG_PATH}"/>
											</div>
										</td>
									</tr>
									
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">正文:</td>
										<td><div disabled="disabled"
												name="TEXT" id="TEXT" placeholder="无内容"
												title="正文" style="width:98%;padding: 10px;border: 1px solid #ccc;">${pd.TEXT}</div>
												
										</td>
										</td>
									</tr>
									
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">浏览次数:</td>
										<td><input disabled="disabled" type="number"
											name="BROWSING_TIMES" id="BROWSING_TIMES"
											value="${pd.BROWSING_TIMES}" maxlength="32"
											placeholder="这里输入浏览次数" title="浏览次数" style="width:98%;" /></td>
									</tr>
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
										<td><input disabled="disabled" type="text"
											name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}"
											maxlength="100" placeholder="这里输入添加人" title="添加人"
											style="width:98%;" /></td>
									</tr>
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
										<td><input disabled="disabled" class="span10 date-picker"
											name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}"
											type="text" data-date-format="yyyy-mm-dd" readonly="readonly"
											placeholder="添加时间" title="添加时间" style="width:98%;" /></td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan="10"><a
											class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
										</td>
									</tr>
								</table>
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
	</script>
</body>
</html>