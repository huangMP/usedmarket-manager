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
					<form action="businesstraining/${msg}.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="VIDEO_ID" id="VIDEO_ID" value="${pd.VIDEO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: center;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="100" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: center;padding-top: 13px;">视频路径:（mp4,flv）</td>
								<td id="videocontext">
									<c:choose>  
										<c:when test="${pd.PATH!=null}">
											<div>
												<input style="width:98%;" maxlength="100" name="PATHNAME" id="PATHNAME" value="${pd.PATH}" type="text" disabled="disabled">
											</div>
											<div style="padding-top: 20px;">
												<span>
													<input class="btn btn-primary"  type="button" name="newVideo" id="newVideo" value="重新选择"/>
												</span>
											</div>
										</c:when>
										<c:otherwise>
											<input style="padding-top: 14px" type="file" id="PATH" name="PATH" value="${pd.PATH}"/>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片</td>
								<td id="imgcontext">
										<c:choose>  
										   <c:when test="${pd.IMG_PATH!=null}">
												<img style="height: 300px;" src="${pageContext.request.contextPath}${pd.IMG_PATH}"/></br></br>
												<span style="padding-top: 20px">
												   <input class="btn btn-primary"  type="button" name="newImg" id="newImg" value="重新选择"/>
												</span>
											</c:when>
											<c:otherwise>
											   <input type="file" id="image" name="image"/>
											</c:otherwise>
										</c:choose>	
								  </td>
							</tr>
							<input type="hidden" name="ADDUSER" id="ADDUSER" value="${pd.ADDUSER}"/>
							<input name="ADDTIME" id="ADDTIME" value="${pd.ADDTIME}" type="hidden"/>
							<input name="SORT" id="SORT" value="${pd.SORT}" type="hidden"/>
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
			if($("#PATH").val()==""){
				$("#PATH").tips({
					side:3,
		            msg:'请选择要上传的视频',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PATH").focus();
				return false;
			}
			if($("#PATH").val()!=""&&$("#PATH").val()!=null){
				//判断视频格式是否正确
				var videoName = $("#PATH").val();	//获取文件名
				var videoId = videoName.lastIndexOf(".");	//获取最后一个"."的位置
				//如果存在
				if( videoId != -1 ){
					//获取文件的后缀名,并将后缀名变成小写
					var videoExt = videoName.substr(videoId+1).toUpperCase().toLowerCase( );
					if(videoExt != 'flv' && videoExt != 'mp4'){
						$("#PATH").tips({
							side:3,
				            msg:'上传的视频格式错误',
				            bg:'#AE81FF',
				            time:2
				        });
						return false;
					}
				}else{
					$("#PATH").tips({
						side:3,
			            msg:'上传的视频格式错误',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				}
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
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		$("#newImg").click(function(){
			$("#imgcontext").empty();
			$("#imgcontext").append(" <input type='file' id='image' name='image'/>"+
				"<input  type='text' hidden='hidden' name='imgChange' id='imgChange' value='true'/>");
		});
		
        $("#newVideo").click(function(){
        	$("#videocontext").empty();
         	$("#videocontext").append("<input style='padding-top: 14px' type='file' id='PATH' name='PATH' />"+
         			"<input  type='text' hidden='hidden' name='videoChange' id='videoChange' value='true'/>");
      	});
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>