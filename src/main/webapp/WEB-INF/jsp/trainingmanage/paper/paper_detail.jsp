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
					
					<form action="paper/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PAPER_ID" id="PAPER_ID" value="${pd.PAPER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">专题ID:</td>
								<td><input type="text" name="SPECIAL_ID" id="SPECIAL_ID" value="${pd.SPECIAL_ID}" maxlength="100" placeholder="这里输入专题ID" title="专题ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文件路径:</td>
								<td><input type="text" name="FILE_PATH" id="FILE_PATH" value="${pd.FILE_PATH}" maxlength="50" placeholder="这里输入文件路径" title="文件路径" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择题个数:</td>
								<td><input type="number" name="CHOICE_NUM" id="CHOICE_NUM" value="${pd.CHOICE_NUM}" maxlength="32" placeholder="这里输入选择题个数" title="选择题个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择题分数:</td>
								<td><input type="text" name="CHOICE_GRADE" id="CHOICE_GRADE" value="${pd.CHOICE_GRADE}" maxlength="50" placeholder="这里输入选择题分数" title="选择题分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择题答案:</td>
								<td><input type="text" name="CHOICE_ANSWER" id="CHOICE_ANSWER" value="${pd.CHOICE_ANSWER}" maxlength="200" placeholder="这里输入选择题答案" title="选择题答案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题个数:</td>
								<td><input type="number" name="FILL_NUM" id="FILL_NUM" value="${pd.FILL_NUM}" maxlength="32" placeholder="这里输入填空题个数" title="填空题个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题答案:</td>
								<td><input type="text" name="FILL_ANSWER" id="FILL_ANSWER" value="${pd.FILL_ANSWER}" maxlength="200" placeholder="这里输入填空题答案" title="填空题答案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题分数:</td>
								<td><input type="text" name="FILL_GRADE" id="FILL_GRADE" value="${pd.FILL_GRADE}" maxlength="50" placeholder="这里输入填空题分数" title="填空题分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题个数:</td>
								<td><input type="number" name="SUBJECTIVE_NUM" id="SUBJECTIVE_NUM" value="${pd.SUBJECTIVE_NUM}" maxlength="32" placeholder="这里输入主观题个数" title="主观题个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题答案:</td>
								<td><input type="text" name="SUBJECTIVE_ANSWER" id="SUBJECTIVE_ANSWER" value="${pd.SUBJECTIVE_ANSWER}" maxlength="255" placeholder="这里输入主观题答案" title="主观题答案" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题分数:</td>
								<td><input type="text" name="SUBJECTIVE_GRADE" id="SUBJECTIVE_GRADE" value="${pd.SUBJECTIVE_GRADE}" maxlength="50" placeholder="这里输入主观题分数" title="主观题分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">总分:</td>
								<td><input type="text" name="TOTLE_GRADE" id="TOTLE_GRADE" value="${pd.TOTLE_GRADE}" maxlength="50" placeholder="这里输入总分" title="总分" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
								<td><input type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="50" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加时间" title="添加时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">试卷名称:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="100" placeholder="这里输入试卷名称" title="试卷名称" style="width:98%;"/></td>
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
			if($("#FILE_PATH").val()==""){
				$("#FILE_PATH").tips({
					side:3,
		            msg:'请输入文件路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILE_PATH").focus();
			return false;
			}
			if($("#CHOICE_NUM").val()==""){
				$("#CHOICE_NUM").tips({
					side:3,
		            msg:'请输入选择题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHOICE_NUM").focus();
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
			if($("#FILL_NUM").val()==""){
				$("#FILL_NUM").tips({
					side:3,
		            msg:'请输入填空题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILL_NUM").focus();
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
			if($("#SUBJECTIVE_NUM").val()==""){
				$("#SUBJECTIVE_NUM").tips({
					side:3,
		            msg:'请输入主观题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECTIVE_NUM").focus();
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
			}
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入试卷名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
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