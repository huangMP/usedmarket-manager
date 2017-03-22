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
					
					<form action="checkpaper/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名:</td>
								<td><input disabled="disabled" type="text" value="${pd.USERNAME}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属专题:</td>
								<td><input disabled="disabled" type="text" value="${pd.SPECIAL_TITLE}" style="width:98%;"/></td>
							</tr>
						</table>
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<td colspan="2" style="width:75px;text-align: center;padding-top: 13px;">填空题部分(每题${eachFillGrade }分,共${fillGrade }分)</td>
							</tr>
							<tr>
								<td style="width:50%;text-align: center;padding-top: 13px;">标准答案</td>
								<td style="width:50%;text-align: center;padding-top: 13px;">考生答案</td>
							</tr>
							<c:forEach begin="0" end="${fillNum-1 }" var="var">
								<tr>
									<td> ${var+1}. <input readonly="readonly" type="text" value="${standardFillAnswers[var]}" style="margin-left:10px;width:90%;"/></td>
									<td> ${var+1}. <input readonly="readonly" type="text" value="${userFillAnswers[var]}" style="margin-left:10px;width:90%;"/></td>
								</tr>
							</c:forEach>
							<tr>
								<td style="text-align: center;padding-top: 13px;">填空题部分得分：</td>
								<td><input placeholder="超出此部分总数按总分计入" type="number" id="FILL_GRADE" name="FILL_GRADE" style="margin-left:10%;text-align: center;width:80%;"/></td>
							</tr>
						</table>
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<td colspan="2" style="width:75px;text-align: center;padding-top: 13px;">主观题部分(每题${eachSubjectiveGrade }分,共${subjectiveGrade }分)</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: center;padding-top: 13px;">标准答案</td>
								<td style="width:75px;text-align: center;padding-top: 13px;">考生答案</td>
							</tr>
							<c:forEach begin="0" end="${subjectiveNum-1 }" var="var">
								<tr>
									<td><span style="display: flex;">${var+1}.</span><textarea readonly="readonly" type="text" cols="30%" rows="5">${standardSubjectiveAnswers[var]}</textarea></td>
									<td><span style="display: flex;">${var+1}.</span><textarea readonly="readonly" type="text" cols="30%" rows="5">${userSubjectiveAnswers[var]}</textarea></td>
								</tr>
							</c:forEach>
							<tr>
								<td style="text-align: center;padding-top: 13px;">主观题部分得分：</td>
								<td><input placeholder="超出此部分总数按总分计入" type="number" id="SUBJECTIVE_GRADE" name="SUBJECTIVE_GRADE" style="margin-left:10%;text-align: center;width:80%;"/></td>
							</tr>
						</table>
						<table class="table table-striped table-bordered table-hover">
							<!-- 主观题答案 -->
							<input hidden="hidden" type="text" value="${pd.SUBJECTIVE_ANSWER}" id="SUBJECTIVE_ANSWER" name="SUBJECTIVE_ANSWER" />
							<!-- 填空题答案 -->
							<input hidden="hidden" type="text" value="${pd.FILL_ANSWER}" id="FILL_ANSWER" name="FILL_ANSWER" />
							<!-- 选择题答案 -->
							<input hidden="hidden" type="text" value="${pd.CHOICE_ANSWER}" id="CHOICE_ANSWER" name="CHOICE_ANSWER" />
							<!-- 选择题分数 -->
							<input hidden="hidden" type="text" value="${pd.CHOICE_GRADE}" id="CHOICE_GRADE" name="CHOICE_GRADE" />
							<!-- 主观题总分 -->
							<input hidden="hidden" type="text" value="${subjectiveGrade}" id="STANDARD_SUBJECTIVE_GRADE" name="STANDARD_SUBJECTIVE_GRADE" />
							<!-- 填空题总分 -->
							<input hidden="hidden" type="text" value="${fillGrade}" id="STANDARD_FILL_GRADE" name="STANDARD_FILL_GRADE" />
							<!-- 试卷总分 -->
							<input hidden="hidden" type="text" value="${paperTotleGrade}" id="TOTLE_GRADE" name="TOTLE_GRADE" />
							<!-- 考试人员专题id -->
							<input hidden="hidden" type="text" value="${pd.USERANDSPECIAL_ID}" id="USERANDSPECIAL_ID" name="USERANDSPECIAL_ID" />
							<!-- 专题id -->
							<input hidden="hidden" type="text" value="${pd.SPECIAL_ID}" id="SPECIAL_ID" name="SPECIAL_ID" />
							<!-- 人员id -->
							<input hidden="hidden" type="text" value="${pd.USER_ID}" id="USER_ID" name="USER_ID" />
							<!-- 考卷id -->
							<input hidden="hidden" type="text" value="${pd.PAPER_ID}" id="PAPER_ID" name="PAPER_ID" />
							<!-- 考试情况 -->
							<input hidden="hidden" type="text" value="${pd.STATUS}" id="STATUS" name="STATUS" />
							<!-- 提交时间 -->
							<input hidden="hidden" value="${pd.SUBMIT_TIME}" type="text" id="SUBMIT_TIME" name="SUBMIT_TIME" />
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
			if($("#FILL_GRADE").val()==""){
				$("#FILL_GRADE").tips({
					side:3,
		            msg:'请输入填空题得分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILL_GRADE").focus();
			return false;
			}
			if($("#SUBJECTIVE_GRADE").val()==""){
				$("#SUBJECTIVE_GRADE").tips({
					side:3,
		            msg:'请输入主观题得分',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECTIVE_GRADE").focus();
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