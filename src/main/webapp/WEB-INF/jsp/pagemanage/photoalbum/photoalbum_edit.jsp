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
					
					<form action="photoalbum/edit.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PHOTOALBUM_ID" id="PHOTOALBUM_ID" value="${pd.PHOTOALBUM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
						    <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">类型:</td>
								<td>
									<select class="chosen-select form-control" name="TYPE" id="TYPE" data-placeholder="请选择文档类型" style="vertical-align:top;width: 200px;">
											<option value="1">局馆风貌</option>
											<option value="2">局馆荣誉</option>
											<option value="3">领导关怀</option>
									 </select>
								 </td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源:</td>
								<td><input type="text" name="ORIGIN" id="ORIGIN" value="${pd.ORIGIN}" maxlength="255" placeholder="这里输入来源" title="来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片:</td>
								
								<td id="pictureList">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									<br/>
								<input type="text" name="IMAGE_ID_COLLECTION" id="IMAGE_ID_COLLECTION" maxlength="6000" placeholder="这里输入图片id集合" title="图片id集合" style="display:none;width:98%;"/>
								</td>
							 		
							 	</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">浏览次数:</td>
								<td><input type="number" name="BROWSING_TIMES" id="BROWSING_TIMES" value="${pd.BROWSING_TIMES}" maxlength="32" placeholder="这里输入浏览次数" title="浏览次数" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
								<td><input type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="255" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input type="text" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" maxlength="255" placeholder="这里输入添加时间" title="添加时间" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">优先数:</td>
								<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}" maxlength="32" placeholder="这里输入优先数" title="优先数" style="width:98%;"/></td>
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
 			if($("#IMAGE_ID_COLLECTION").val()==""){
				$("#IMAGE_ID_COLLECTION").tips({
					side:3,
		            msg:'请添加图片',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IMAGE_ID_COLLECTION").focus();
			return false;
			} 
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
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
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>pictures/goAdd.do';
			 diag.Width = 800;
			 diag.Height = 490;
			 diag.CancelEvent = function(){ //关闭事件
			 
				 getPicturesPathAndShow();
				 
				diag.close();
			 };
			 diag.show();
		}		
		
		//获取所有图片的路径，并且展示出来
		function getPicturesPathAndShow(){
			$.ajax({
	            async: false,
	            url: '<%=basePath%>photoalbum/getPicturesName.do',
	            success: function (data) {
	            	
	            	deleteAllPicture();
	            	
    				$("#IMAGE_ID_COLLECTION").val(data);
            		
            		if(data==""){
            			//data为空，也就是没有图片
            		}else{
        				
    	            	var strs= new Array(); //定义一数组
    	            	strs=data.split(","); //字符分割
            			for (var i=0;i<strs.length ;i++ ) { 
	            			var li1=$("<img width='100' name='addPicture' src='<%=basePath%>"+strs[i]+"'>"); 
	            			var li2 = $("<a name='addPictureImg' class='btn btn-xs btn-danger' value='"+strs[i]+"'><i class='ace-icon fa fa-trash-o bigger-120' title='删除'></i></a>");
	            			$("#pictureList").append(li1);
	            			$("#pictureList").append(li2);
	            		} 
	        			$("[name='addPictureImg']").click(function(){ //动态添加单击事件
	        				var deletePicturePath = $(this).attr("value");
	        				deleteOnePicture( deletePicturePath );
	        				getPicturesPathAndShow();
	        			});
            		}
	            }
	  		});
		}
		//删除某张图片，传入图片的路径
		function deleteOnePicture(picturePath){
			$.ajax({
	            async: false,
	            url: '<%=basePath%>photoalbum/deleteOnePicture.do',
	            data: "pictureName=" + picturePath ,
	            success: function (data) {
	            }
			});
		}
		//移除所有图片的展示
		function deleteAllPicture(){
    		$("[name='addPicture']").remove(); 
    		$("[name='addPictureImg']").remove(); 
		}
		
		//自动运行该方法:获取所有图片的路径，并且展示出来
		getPicturesPathAndShow();
		</script>
</body>
</html>