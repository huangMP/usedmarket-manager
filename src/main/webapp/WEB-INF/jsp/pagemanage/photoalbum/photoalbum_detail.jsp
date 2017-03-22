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
					
					<form action="photoalbum/${msg }.do" name="Form" id="Form" method="post">
					    <tr>
							<td style="width:75px;text-align: right;padding-top: 13px;">类型:</td>
							<td>
								<select disabled="disabled" class="chosen-select form-control" name="TYPE" id="TYPE" data-placeholder="请选择文档类型" style="vertical-align:top;width:98%;">
										<option value="1">局馆风貌</option>
										<option value="2">局馆荣誉</option>
										<option value="3">领导关怀</option>
								 </select>
							 </td>
						</tr>
						<input type="hidden" name="PHOTOALBUM_ID" id="PHOTOALBUM_ID" value="${pd.PHOTOALBUM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input disabled="disabled" type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源:</td>
								<td><input disabled="disabled" type="text" name="ORIGIN" id="ORIGIN" value="${pd.ORIGIN}" maxlength="255" placeholder="这里输入来源" title="来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片id集合:</td>
								<td>
									<c:forEach items="${pd.IMAGE_ID_COLLECTION}" var="i">
										<img height="75" name="addPicture" src="<%=basePath%>${i}">
									</c:forEach></td>
							</tr>
							<tr >
								<td style="width:75px;text-align: right;padding-top: 13px;">浏览次数:</td>
								<td><input disabled="disabled" type="number" name="BROWSING_TIMES" id="BROWSING_TIMES" value="${pd.BROWSING_TIMES}" maxlength="32" placeholder="这里输入浏览次数" title="浏览次数" style="width:98%;"/></td>
							</tr>
							<tr >
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
								<td><input disabled="disabled" type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="255" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
							</tr>
							<tr >
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input disabled="disabled" type="text" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" maxlength="255" placeholder="这里输入添加时间" title="添加时间" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">优先数:</td>
								<td><input disabled="disabled" type="number" name="SORT" id="SORT" value="${pd.SORT}" maxlength="32" placeholder="这里输入优先数" title="优先数" style="width:98%;"/></td>
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
	
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());

		</script>
</body>
</html>