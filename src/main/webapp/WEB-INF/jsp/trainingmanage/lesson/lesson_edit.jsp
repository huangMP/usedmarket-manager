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
					
					<form action="lesson/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="LESSON_ID" id="LESSON_ID" value="${pd.LESSON_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属专题:</td>
								<td>
									<select style="width:98%;" class="chosen-select form-control" name="SPECIAL_ID" id="SPECIAL_ID" data-placeholder="c" style="vertical-align:top;width: 200px;">
										<option value="" disabled selected hidden>请选择专题</option>
										<c:forEach items="${specialList}" var="var">
											<option value="${var.SPECIAL_ID}">${var.TITLE}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属章节:</td>
								<td>
									<select style="width:98%;" class="chosen-select form-control" name="CHAPTER_ID" id="CHAPTER_ID" data-placeholder="c" style="vertical-align:top;width: 200px;">
										<c:choose>  
										   <c:when test="${pd.CHAPTER_ID!=null}">
												<option value="${pd.CHAPTER_ID}" selected="selected" >${pd.CHAPTER_TITLE}</option>
											</c:when>
											<c:otherwise>
												<option value="" disabled selected hidden>请选择章节</option>
											</c:otherwise>
										</c:choose>	
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="50" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所在章节顺序:</td>
								<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}" maxlength="50" placeholder="数值越大，所在章节的顺序越靠前" title="所在章节顺序" style="width:98%;"/></td>
							</tr>
							<input type="text" hidden="hidden" name="ADD_USER"
											id="ADD_USER" value="${pd.ADD_USER}" />
							<input hidden="hidden" name="ADD_TIME" id="ADD_TIME"
								value="${pd.ADD_TIME}" type="text"
								data-date-format="yyyy-mm-dd" readonly="readonly" />
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
			if($("#CHAPTER_ID").val()==""){
				$("#CHAPTER_ID").tips({
					side:3,
		            msg:'请输入专题id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHAPTER_ID").focus();
			return false;
			}
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
			if($("#SORT").val()==""){
				$("#SORT").tips({
					side:3,
		            msg:'请输入数值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SORT").focus();
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
		
		$("#SPECIAL_ID").change(function(){ 
			//alert( $(this).val() );
			var SPECIAL_ID_val = $(this).val();
			$.ajax({
				type: "post",
	            url: "<%=basePath%>lesson/findChapterBySpecialId.do"+"?SPECIAL_ID="+SPECIAL_ID_val+"",
	            contentType: "application/json;charset=utf-8",
	            dataType:'json',
	            success: function (data) {

	    			$("#CHAPTER_ID").empty();
	    			
	    			if(data.length == "0"){
 	            		var optionStr = "<option value=''>该专题没有下级章节</option>";
 		            	$("#CHAPTER_ID").append( optionStr );
	    			}else{
	 	            	for(var i=0 ;i<data.length ;i++){
	 	            		var optionStr = "<option value="+data[i].CHAPTER_ID+">"+data[i].TITLE+"</option>";
	 		            	$("#CHAPTER_ID").append( optionStr );
		            	}
	    			}
	            }
			});
		
		});
		</script>
</body>
</html>