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
					<form action="lowandstandard/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="LOWANDSTANDARD_ID" id="LOWANDSTANDARD_ID" value="${pd.LOWANDSTANDARD_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="50" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片</td>
								<td id="imgcontext">
										<c:choose>  
										   <c:when test="${pd.IMG_PATH!=null}">
												<img style="height: 200px;" src="${pageContext.request.contextPath}${pd.IMG_PATH}"/></br></br>
												<span style="padding-top: 20px">
												   <input class="btn btn-primary"  type="button" name="newImg" id="newImg" value="重新选择"/>
												</span>
											</c:when>
											<c:otherwise>
											   <input type="file" id="image" name="image"/>
											</c:otherwise>
										</c:choose>	
										<input value="(建议图片比例为 1:1)" readonly="readonly"  class="form-control" style="width:150px;border: none;" />
								  </td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">链接:</td>
								<td>
									<input type="text" name="TEXT" id="TEXT" value="${pd.TEXT}" maxlength="255" placeholder="这里输入链接" title="链接" style="width:98%;"/>
								</td>
							</tr>
							<input type="hidden" name="SORT" id="SORT" value="${pd.SORT}"/>
							<input type="hidden" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}"/>
							<input type="hidden" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}"/>
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
			if ($("#image").val() == "") {
				$("#image").tips({
					side : 3,
					msg : '请选择图片',
					bg : '#AE81FF',
					time : 2
				});
				$("#image").focus();
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
			if($("#image").val()!=""&&$("#image").val()!=null){
				return fileChange();
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		function fileChange(){  
			//检测上传文件的类型 
			var videoName = $("#image").val();
			//获取"."所在的位置
			var idx = videoName.lastIndexOf(".");
			if( idx != -1 ){
				//获取文件的后缀名
				var ext = videoName.substr(idx+1).toUpperCase();
				//将后缀名变成小写
				ext = ext.toLowerCase( );
				if(ext != 'jpg' && ext != 'png' && ext != 'jpeg' && ext != 'gif' && ext != 'bmp'){
					$("#image").tips({
						side:3,
			            msg:'上传的图片格式错误',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				} else {
					$("#Form").submit();
				}
			} else {
				$("#image").tips({
					side:3,
		            msg:'上传的图片格式错误',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
		}
		$("#newImg").click(function(){
        	$("#imgcontext").empty();
          	$("#imgcontext").append(" <input type='file' id='image' name='image'/>"+
          			"<input  type='text' hidden='hidden' name='imgChange' id='imgChange' value='true'/>");
       	});
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>