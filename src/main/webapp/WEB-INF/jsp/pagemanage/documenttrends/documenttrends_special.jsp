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
					
					<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
						<thead>
							<tr>
							<th class="center" style="width:50px;">序号</th>
							<th class="center" >标题</th>
							<th class="center" >操作</th>
							</tr>
						</thead>
						<tbody id="TBODY">
							
							<c:choose>
								<c:when test="${not empty varList}">
									<input hidden="hidden" type="number" name="VERLIST_SIZE" id="VERLIST_SIZE" value="${varList}.length" />
									<c:forEach items="${varList}" var="var" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class='center'>${var.TITLE}</td>
												<td class='center'>
													<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-danger" onclick="delSpecial('${var.DOCUMENT_ID}');">
															<i class="ace-icon fa fa-trash-o bigger-120" title="删除特殊展示"></i>
														</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									
								</c:when>
							</c:choose>
						</tbody>
					
					</table>
					
					<form action="documenttrends/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="DOCUMENT_ID" id="DOCUMENT_ID" value="${pd.DOCUMENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							
							<tr class="center">新增特殊展示</tr>
							
							<tr>
								
								<td>标题 ： </td>
								<td><input type="text" name="TITLE" id="TITLE"
												value="${pd.TITLE}" maxlength="100" placeholder="这里输入标题"
												title="标题" style="width:98%;" disabled="true"/></td>
								
							</tr>
										
								<input hidden="hidden" type="number" name="BROWSING_TIMES" id="BROWSING_TIMES" value="${pd.BROWSING_TIMES}" />
								<input hidden="hidden" type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" />
								<input hidden="hidden" class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" />
								<input hidden="hidden" type="text" name="SPECIAL" id="SPECIAL" value="${pd.SPECIAL}" />
							<tr>
								<td style="text-align: center;" colspan="10"><a
									class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
									class="btn btn-mini btn-danger"
									onclick="top.Dialog.close();">取消</a></td>
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
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
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
			if($("#ATTACHMENT_ID").val()==""){
				$("#ATTACHMENT_ID").tips({
					side:3,
		            msg:'请输入图片名字',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ATTACHMENT_ID").focus();
			return false;
			}
			
			var num = 0;
			$.ajax({
				url:'<%=basePath%>documenttrends/setSpecial.do',
				success:function(data){
					num=data.specail;
					//console.log(num);
					
					if(num<5){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					}else{
						$("#TITLE").tips({
							side:3,
				            msg:'特殊展示应小于5条！！',
				            bg:'#AE81FF',
				            time:3
				        });
						$("#TITLE").focus();
					}
				}
			});
			//console.log(num);
			
			
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
		});
		
		 $("#newImg").click(function(){
//            alert("重新选择");
           $("#imgcontext").empty();
           $("#imgcontext").append(" <input type='file' id='image' name='image'/>"+
           "<input  type='text' hidden='hidden' name='imgChange' id='imgChange' value='true'/>");
        });
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		function delSpecial(Id){
			window.location.reload();
			$.ajax({
				url:'<%=basePath%>documenttrends/delSpecial.do?DOCUMENT_ID='+Id,
				success:function(data){
					//console.log("succss");
					/* $("#TBODY").empty();
					for(var i=0;i<data.varList.length;i++){
						var num = i+1;
						$("#TBODY").append("<tr>"+
									"<td class='center' style='width: 30px;'>"+num+"</td>"+
									"<td class='center'>"+data.varList[i].TITLE+"</td>"+
									"<td class='center'>"+
									"<a class='btn btn-xs btn-danger' onclick='delSpecial('033b39d52b1140899da89dd842bed66c');'>"+
									"<i class='ace-icon fa fa-trash-o bigger-120' title='删除特殊展示'></i>"+
									"</a>"+
									"</td>"+
									"</tr>");
					} */
				}
			})
			
		}
		
		<%-- function listSpecial(){
			$.ajax({
				url:'<%=basePath%>documenttrends/listSpecial.do',
				success:function(data){
					console.log(data.varList[0].TITLE);
					$("#TBODY").empty();
					for(var i=0;i<data.varList.length;i++){
						var num = i+1;
						$("#TBODY").append("<tr>"+
									"<td class='center' style='width: 30px;'>"+num+"</td>"+
									"<td class='center'>"+data.varList[i].TITLE+"</td>"+
									"<td class='center'>"+
									"<a class='btn btn-xs btn-danger' onclick='delSpecial("+data.varList[i].DOCUMENT_ID+");'>"+
									"<i class='ace-icon fa fa-trash-o bigger-120' title='删除特殊展示'></i>"+
									"</a>"+
									"</td>"+
									"</tr>");
					}
					
				}
			})
		}
		
		/* window.onload = listSpecial; */ --%>
		
		</script>
</body>
</html>