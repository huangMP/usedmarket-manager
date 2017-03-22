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
					<form action="documentguide/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DOCUMENT_ID" id="DOCUMENT_ID" value="${pd.DOCUMENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<input type="hidden" name="TYPE" id="TYPE" value="${pd.TYPE}"/>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="100" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源:</td>
								<td><input type="text" name="ORIGIN" id="ORIGIN" value="${pd.ORIGIN}" maxlength="100" placeholder="这里输入来源" title="来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">正文:</td>
								<td>
								    <script type="text/javascript" src="static/js/nicEdit.js"></script>
									<script type="text/javascript">
								       bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
							        </script>
								    <textarea rows="27" cols="" placeholder="这里输入正文(不超过3000字)" type="text" name="TEXTAREA"
										title="正文" style="width:98%;">${pd.TEXT}</textarea>
				                    <input id="TEXT" id="TEXT" type="hidden" class="form-control" name="TEXT" value="">
								</td>
							</tr>
							<input type="hidden" name="BROWSING_TIMES" id="BROWSING_TIMES" value="${pd.BROWSING_TIMES}"/>
							<input type="hidden" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}"/>
							<input name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="hidden"/>
							<input type="hidden" name="SORT" id="SORT" value="${pd.SORT}"/></td>
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
		    $("#TEXT").val($(".nicEdit-main").html());
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
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