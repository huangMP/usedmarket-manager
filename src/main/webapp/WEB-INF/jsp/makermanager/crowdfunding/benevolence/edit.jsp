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
	<%@ include file="../../../system/index/top.jsp"%>
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
					
					<form action="MakerBenevolenceCrowdfunding/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CROWDFUNDING_ID" id="CROWDFUNDING_ID" value="${pd.CROWDFUNDING_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr hidden="hidden">
								<td style="width:75px;text-align: right;padding-top: 13px;">类别(1.创意众筹 2.爱心众筹):</td>
								<td><input type="number" name="CROWDFUNDING_TYPE" id="CROWDFUNDING_TYPE" value="${pd.CROWDFUNDING_TYPE}" maxlength="32" placeholder="这里输入类别(1.创意众筹 2.爱心众筹)" title="类别(1.创意众筹 2.爱心众筹)" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">图片:</td>
								<td id="pictureList">
									<a class="btn btn-sm btn-success" onclick="addPictures_( '${pd.CROWDFUNDING_ID}' );">新增</a>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题" title="标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源:</td>
								<td><input type="text" name="ORIGIN" id="ORIGIN" value="${pd.ORIGIN}" maxlength="255" placeholder="这里输入来源" title="来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">目标金额:</td>
								<td><input type="text" name="TARGET_AMOUNT" id="TARGET_AMOUNT" value="${pd.TARGET_AMOUNT}" maxlength="255" placeholder="这里输入目标金额" title="目标金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">已筹金额:</td>
								<td><input type="text" name="NOW_AMOUNT" id="NOW_AMOUNT" value="${pd.NOW_AMOUNT}" maxlength="255" placeholder="这里输入已筹金额" title="已筹金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支持人数:</td>
								<td><input type="number" name="SUPPORT_NUM" id="SUPPORT_NUM" value="${pd.SUPPORT_NUM}" maxlength="32" placeholder="这里输入支持人数" title="支持人数" style="width:98%;"/></td>
							</tr>
							<tr hidden="hidden">
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
								<td><input type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="255" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
							</tr>
							<tr hidden="hidden">
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input class="span10 date-picker" name="ADD_DATE" id="ADD_DATE" value="${pd.ADD_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加时间" title="添加时间" style="width:98%;"/></td>
							</tr>
							<tr hidden="hidden">
								<td style="width:75px;text-align: right;padding-top: 13px;">是否有动态：2，没有；1有:</td>
								<td><input type="number" name="HAS_DYNAMICS" id="HAS_DYNAMICS" value="${pd.HAS_DYNAMICS}" maxlength="32" placeholder="这里输入是否有动态：0，没有；1有" title="是否有动态：0，没有；1有" style="width:98%;"/></td>
							</tr>
							<tr hidden="hidden">
								<td style="width:75px;text-align: right;padding-top: 13px;">动态id:</td>
								<td><input type="text" name="DYNAMICS_ID" id="DYNAMICS_ID" value="${pd.DYNAMICS_ID}" maxlength="255" placeholder="这里输入动态id" title="动态id" style="width:98%;"/></td>
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
	<%@ include file="../../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
			$(top.hangge());//关闭加载状态

			$(function () {
                var contentId_ =  $("#CROWDFUNDING_ID").attr("value");
                getPictureListAndShow_( contentId_ );
            });

            //弹出新增图片弹框
            function addPictures_(contentId){
                top.jzts();
                var diag = new top.Dialog();
                diag.Drag=true;
                diag.Title ="新增";
                diag.URL = '<%=basePath%>pictures/goAdd.do?contentId=' + contentId;
                diag.Width = 800;
                diag.Height = 490;
                diag.CancelEvent = function(){ //关闭事件
                    getPictureListAndShow_( contentId );
                    diag.close();
                };
                diag.show();
            }
            //通过 contentId 获取图片集合，并且展示出来
            function getPictureListAndShow_( contentId ){
                $.ajax({
                    async: false,
                    url: '<%=basePath%>pictures/getPictureList.do',
                    data: "contentId=" + contentId ,
                    success: function (data) {
                        deleteAllPicture_();
                        if(data==""){
                            //data为空，也就是没有图片
                        }else{
                            for (var i=0;i<data.length ;i++ ) {
                                var li1=$("<img height='80' name='addPicture' src='<%=basePath%>static/images/"+data[i].PATH+"'>");
                                var li2 = $("<a name='addPictureImg' class='btn btn-xs btn-danger' value='"+data[i].PICTURES_ID+"' pathValue='"+data[i].PATH+"' ><i class='ace-icon fa fa-trash-o bigger-120' title='删除'></i></a>");
                                $("#pictureList").append(li1);
                                $("#pictureList").append(li2);
                            }
                            $("[name='addPictureImg']").click(function(){ //动态添加单击事件
                                var deletePictureId = $(this).attr("value");
                                var deletePicturePath = $(this).attr("pathValue");
                                deleteOnePicture_( deletePictureId ,deletePicturePath );
                                getPictureListAndShow_(contentId);
                            });
                        }
                    }
                });
            }
            //通过 图片id，图片存放路径 删除 新增图片的某一张图片
            function deleteOnePicture_(Id,PATH){
                $.ajax({
                    async: false,
                    url: '<%=basePath%>pictures/delete.do',
                    data: "PICTURES_ID=" + Id +"&PATH="+PATH+"&tm="+new Date().getTime() ,
                    success: function (data) {}
                });
            }
            //移除所有图片的展示
            function deleteAllPicture_(){
                $("[name='addPicture']").remove();
                $("[name='addPictureImg']").remove();
            }

		//保存
		function save(){

            if(0 == $("[name='addPictureImg']").length ){
                $("#addPicturesButton_").tips({
                    side:3,
                    msg:'请添加图片',
                    bg:'#AE81FF',
                    time:2
                });
                $("#addPicturesButton_").focus();
                return false;
            }

			/*if($("#CROWDFUNDING_TYPE").val()==""){
				$("#CROWDFUNDING_TYPE").tips({
					side:3,
		            msg:'请输入类别(1.创意众筹 2.爱心众筹)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CROWDFUNDING_TYPE").focus();
			return false;
			}*/
			if($("#IMAGES").val()==""){
				$("#IMAGES").tips({
					side:3,
		            msg:'请输入图片url',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IMAGES").focus();
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
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
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
			if($("#TARGET_AMOUNT").val()==""){
				$("#TARGET_AMOUNT").tips({
					side:3,
		            msg:'请输入目标金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TARGET_AMOUNT").focus();
			return false;
			}
			if($("#NOW_AMOUNT").val()==""){
				$("#NOW_AMOUNT").tips({
					side:3,
		            msg:'请输入已筹金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NOW_AMOUNT").focus();
			return false;
			}
			if($("#SUPPORT_NUM").val()==""){
				$("#SUPPORT_NUM").tips({
					side:3,
		            msg:'请输入支持人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUPPORT_NUM").focus();
			return false;
			}
			/*if($("#ADD_USER").val()==""){
				$("#ADD_USER").tips({
					side:3,
		            msg:'请输入添加人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_USER").focus();
			return false;
			}*/
			/*if($("#ADD_DATE").val()==""){
				$("#ADD_DATE").tips({
					side:3,
		            msg:'请输入添加时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_DATE").focus();
			return false;
			}*/
			/*if($("#HAS_DYNAMICS").val()==""){
				$("#HAS_DYNAMICS").tips({
					side:3,
		            msg:'请输入是否有动态：0，没有；1有',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HAS_DYNAMICS").focus();
			return false;
			}*/
			/*if($("#DYNAMICS_ID").val()==""){
				$("#DYNAMICS_ID").tips({
					side:3,
		            msg:'请输入动态id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DYNAMICS_ID").focus();
			return false;
			}*/
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