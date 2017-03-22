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
					
					<form action="homepagepics/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="HOMEPAGEPICS_ID" id="HOMEPAGEPICS_ID" value="${pd.HOMEPAGEPICS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片:</td>
									<td id="pictureList">
										<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									<br/>
								<input type="text" name="IMG_PATH" id="IMG_PATH" maxlength="6000" placeholder="这里添加图片" title="图片" style="display:none;width:98%;"/></td>
							 		
							</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">优先数:</td>
								<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}" maxlength="32" placeholder="这里输入优先数" title="优先数" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
								<td><input type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="50" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
							</tr>
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加时间" title="添加时间" style="width:98%;"/></td>
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
			 diag.URL = '<%=basePath%>homepagepics/addHomepagePicture.do';
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
	            url: '<%=basePath%>homepagepics/getPicturesName.do',
	            success: function (data) {
	            	
	            	deleteAllPicture();

    				$("#IMG_PATH").val(data);
            		
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
		
		</script>
</body>
</html>