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
					<form action="special/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="SPECIAL_ID" id="SPECIAL_ID" value="${pd.SPECIAL_ID}"/>
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
											<img style="height: 300px;" src="${pageContext.request.contextPath}${pd.IMG_PATH}"/></br></br>
											<span style="padding-left: 20px">
											   <input class="btn btn-primary"  type="button" name="newImg" id="newImg" value="重新选择"/>
											</span>
										</c:when>
										<c:otherwise>
										   <input type="file" id="image" name="image"/>
										</c:otherwise>
									</c:choose>	
									<input value="(建议图片比例为 1590:1080)" readonly="readonly"  class="form-control" style="width:210px;border: none;" />
								 </td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">简介:</td>
								<td>
									<textarea rows="27" cols="" placeholder="这里输入简介(不超过280字)" type="text" name="BRIEF_INTRO"
										id="BRIEF_INTRO" title="简介" style="width:98%;">${pd.BRIEF_INTRO}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">原卷:</td>
								<input type="text" name="originalPaper" id="originalPaper"
									value="${pd.ORIGINAL_PAPER}" hidden="hidden" />  
								<td><select class="chosen-select form-control"
									name="ORIGINAL_PAPER" id="ORIGINAL_PAPER" data-placeholder="c"
									style="vertical-align:top;width: 200px;">
										<option value="" disabled selected hidden>请选择原卷</option>
										<c:forEach items="${mypaper }" var="paper">
											<option value="${paper.PAPER_ID }">${paper.TITLE }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">补卷:</td>
								<input type="text" name="anotherPaper" id="anotherPaper"
									value="${pd.ANOTHER_PAPER}" hidden="hidden" />
								<td><select class="chosen-select form-control"
									name="ANOTHER_PAPER" id="ANOTHER_PAPER" data-placeholder="请选择补卷"
									style="vertical-align:top;width: 200px;">
										<option value="" disabled selected hidden>请选择补卷</option>
										<c:forEach items="${mypaper }" var="paper">
											<option value="${paper.PAPER_ID }">${paper.TITLE }</option>
										</c:forEach>
								</select></td>
							</tr>
							<input hidden="hidden" type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" />
							<input hidden="hidden" class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" />
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
		
		$(function() {
			var originalPaper = $("#originalPaper").val();
			var anotherPaper = $("#anotherPaper").val();
			if (originalPaper != "" ) {
				console.log("${pd.ORIGINAL_PAPER}");
				$("#ORIGINAL_PAPER").val(originalPaper)
			}
			if (anotherPaper != "" ) {
				console.log("${pd.ANOTHER_PAPER}");
				$("#ANOTHER_PAPER").val(anotherPaper)
			}
		});
		
		//保存
		function save(){
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
			if($("#IMG_PATH").val()==""){
				$("#IMG_PATH").tips({
					side:3,
		            msg:'请输入图片路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IMG_PATH").focus();
			return false;
			}
			if($("#image").val()!=""&&$("#image").val()!=null){
				//检测图片格式是否正确
				var imageName = $("#image").val();
				//获取"."所在的位置
				var imageId = imageName.lastIndexOf(".");
				if( imageId != -1 ){
					//获取文件的后缀名,并将后缀名变成小写
					var imageExt = imageName.substr(imageId+1).toUpperCase().toLowerCase( );
					if(imageExt != 'jpg' && imageExt != 'png' && imageExt != 'jpeg' && imageExt != 'gif' && imageExt != 'bmp' ){
						$("#image").tips({
							side:3,
				            msg:'上传的图片格式错误',
				            bg:'#AE81FF',
				            time:2
				        });
						return false;
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
			if($("#BRIEF_INTRO").val()==""){
				$("#BRIEF_INTRO").tips({
					side:3,
		            msg:'请输入简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BRIEF_INTRO").focus();
			return false;
			}
			/* if($("#ORIGINAL_PAPER").val()==null){
				$("#ORIGINAL_PAPER").tips({
					side:3,
		            msg:'请输入原卷',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORIGINAL_PAPER").focus();
			return false;
			}
			if($("#ANOTHER_PAPER").val()==null){
				$("#ANOTHER_PAPER").tips({
					side:3,
		            msg:'请输入补卷',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANOTHER_PAPER").focus();
			return false;
			} */
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
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