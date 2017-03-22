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
					<form action="video/${msg}.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="msg" id="msg" value="${msg}"/>
						<input type="hidden" name="VIDEO_ID" id="VIDEO_ID" value="${pd.VIDEO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属专题:</td>
								<td>
									<select style="width:98%;" class="chosen-select form-control" name="SPECIAL_ID" id="SPECIAL_ID" data-placeholder="c" style="width:98%;">
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
									<select style="width:98%;" class="chosen-select form-control" name="CHAPTER_ID" id="CHAPTER_ID" data-placeholder="c" style="width:98%;">
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
								<td style="width:75px;text-align: right;padding-top: 13px;">所属课时:</td>
								<td>
									<select style="width:98%;" class="chosen-select form-control" name="LESSON_ID" id="LESSON_ID" data-placeholder="c" style="width:98%;">
										<c:choose>  
										   <c:when test="${pd.LESSON_ID!=null}">
												<option value="${pd.LESSON_ID}" selected="selected" >${pd.LESSON_TITLE}</option>
											</c:when>
											<c:otherwise>
												<option value="" disabled selected hidden>请选择课时</option>
											</c:otherwise>
										</c:choose>	
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">视频路径:（mp4,flv）:</td>
								<td id="videocontext">
									<c:choose>  
										<c:when test="${pd.FILE_PATH!=null}">
											<div>
												<input style="width:98%;" maxlength="100" name="FILE_PATH" id="FILE_PATH" value="${pd.FILE_PATH}" type="text" disabled="disabled">
											</div>
											<div style="padding-top: 20px;">
												<span>
													<input class="btn btn-primary"  type="button" name="newVideo" id="newVideo" value="重新选择"/>
												</span>
											</div>
										</c:when>
										<c:otherwise>
											<input style="padding-top: 14px" type="file" id="video" name="video"/>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">视频封面:</td>
								<td id="imgcontext">
									<c:choose>  
										<c:when test="${pd.IMG_PATH!=null}">
											<img style="height: 250px;" src="${pageContext.request.contextPath}${pd.IMG_PATH}"/></br></br>
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
							<input type="hidden" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}"/>
							<input name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="hidden"/>
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
			var msg = $("#msg").val()
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
			if($("#LESSON_ID").val()==""){
				$("#LESSON_ID").tips({
					side:3,
		            msg:'请添加所属课时',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LESSON_ID").focus();
				return false;
			}
			if($("#video").val()==""){
				$("#video").tips({
					side:3,
		            msg:'请添加视频文件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#video").focus();
				return false;
			}
			if($("#video").val()!=""&&$("#video").val()!=null){
				//判断视频格式是否正确
				var videoName = $("#video").val();	//获取文件名
				var videoId = videoName.lastIndexOf(".");	//获取最后一个"."的位置
				//如果存在
				if( videoId != -1 ){
					//获取文件的后缀名,并将后缀名变成小写
					var videoExt = videoName.substr(videoId+1).toUpperCase().toLowerCase( );
					if(videoExt != 'flv' && videoExt != 'mp4'){
						$("#video").tips({
							side:3,
				            msg:'上传的视频格式错误',
				            bg:'#AE81FF',
				            time:2
				        });
						return false;
					}
				}else{
					$("#video").tips({
						side:3,
			            msg:'上传的视频格式错误',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				}
			}
			if($("#image").val()==""){
				$("#image").tips({
					side:3,
		            msg:'请添加视频封面',
		            bg:'#AE81FF',
		            time:2
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
         	$("#videocontext").append("<input style='padding-top: 14px' type='file' id='video' name='video' />"+
         			"<input  type='text' hidden='hidden' name='videoChange' id='videoChange' value='true'/>");
      	});
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		
		
		$("#SPECIAL_ID").change(function(){ 
			var SPECIAL_ID_val = $(this).val();
			$.ajax({
				type: "post",
	            url: "<%=basePath%>video/findChapterBySpecialId.do"+"?SPECIAL_ID="+SPECIAL_ID_val+"",
	            contentType: "application/json;charset=utf-8",
	            dataType:'json',
	            success: function (data) {

	    			$("#CHAPTER_ID").empty();
	    			$("#LESSON_ID").empty();
	    			
	    			if(data.length == "0"){
 	            		var optionStr = "<option value=''>该专题没有下级章节</option>";
 		            	$("#CHAPTER_ID").append( optionStr );
	    			}else{
 	            		var optionStr = "<option value='' disabled selected hidden>请选择章节</option>";
 		            	$("#CHAPTER_ID").append( optionStr );
	 	            	for(var i=0 ;i<data.length ;i++){
	 	            		var optionStr = "<option value="+data[i].CHAPTER_ID+">"+data[i].TITLE+"</option>";
	 		            	$("#CHAPTER_ID").append( optionStr );
		            	}
	    			}
	    			
	    			$("#LESSON_ID").append( "<option value=''>请选择课时</option>" );
	            }
			});
		});
		
		$("#CHAPTER_ID").change(function(){ 
			var CHAPTER_ID_val = $(this).val();
			$.ajax({
				type: "post",
	            url: "<%=basePath%>video/findLessonListByChapterId.do"+"?CHAPTER_ID="+CHAPTER_ID_val+"",
	            contentType: "application/json;charset=utf-8",
	            dataType:'json',
	            success: function (data) {
	            	
	    			$("#LESSON_ID").empty();
	    			
	    			if(data.length == "0"){
 	            		var optionStr = "<option value=''>该章节没有下级课时</option>";
 		            	$("#LESSON_ID").append( optionStr );
	    			}else{
	 	            	for(var i=0 ;i<data.length ;i++){
	 	            		var optionStr = "<option value="+data[i].LESSON_ID+">"+data[i].TITLE+"</option>";
	 		            	$("#LESSON_ID").append( optionStr );
		            	}
	    			}
	            }
			});
		});
		</script>
</body>
</html>