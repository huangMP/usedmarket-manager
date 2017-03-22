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
					
					<form action="classdetail/listSpecial.do" method="post" name="Form" id="Form">
					
					<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
						<thead>
							<tr>
							<th class="center" style="width:35px;">
							<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
							</th>
							<th class="center" style="width:50px;">序号</th>
							<th class="center" >姓名</th>
							<th class="center" >用户名</th>
							<th class="center" >年限</th>
							<th class="center" >操作</th>
							</tr>
						</thead>
						<tbody id="TBODY">
							
							<c:choose>
								<c:when test="${not empty varList}">
									<input hidden="hidden" type="number" name="VERLIST_SIZE" id="VERLIST_SIZE" value="${varList}.length" />
									<c:forEach items="${varList}" var="var" varStatus="vs">
											<tr>
												<td class='center'>
													<label class="pos-rel"><input type='checkbox' name='ids' value="${var.USER_ID}" class="ace" /><span class="lbl"></span></label>
												</td>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class='center'>${var.NAME}</td>
												<td class='center'>${var.USERNAME}</td>
												<td class='center'>${var.YEARS}</td>
												<td class='center'>
													<c:if test="${QX.edit == 1 }">
														<a class="btn btn-xs btn-success" onclick="addUser('${pd.CLASSDETAIL_ID}','${var.USER_ID}');">
															<i class="ace-icon glyphicon glyphicon-plus" title="添加学员"></i>
														</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					
					</table>
					<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-sm btn-success" onclick="addUserAll('${pd.CLASSDETAIL_ID}');">添加学员</a>
									</c:if>
									
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						
					</form>
					
					<form action="classdetail/${msg }.do" name="Form" id="Formss" method="post">
						<input type="hidden" name="CLASSDETAIL_ID" id="CLASSDETAIL_ID" value="${pd.CLASSDETAIL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<%-- <table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">班级名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">负责人:</td>
								<td><input type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="50" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加时间:</td>
								<td><input class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加时间" title="添加时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table> --%>
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
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入班级名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#ADD_USER").val()==""){
				$("#ADD_USER").tips({
					side:3,
		            msg:'请输入负责人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_USER").focus();
			return false;
			}
			if($("#ADD_TIME").val()==""){
				$("#ADD_TIME").tips({
					side:3,
		            msg:'请输入添加时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_TIME").focus();
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
		
		function addUser(clsId,uId){
			
			$.ajax({
				url:'<%=basePath%>classdetail/addUser.do?CLASSDETAIL_ID='+clsId+'&USER_ID='+uId,
				success:function(data){
					//console.log("succss");
					window.location.reload();
				}
			})
			
		}
		
		//批量操作
		function addUserAll(clsId){
			
			
			var str = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
			  if(document.getElementsByName('ids')[i].checked){
			  	if(str=='') str += document.getElementsByName('ids')[i].value;
			  	else str += ',' + document.getElementsByName('ids')[i].value;
			  }
			}
			if(str==''){
				$("#zcheckbox").tips({
						side:3,
			            msg:'点这里选择专题',
			            bg:'#AE81FF',
			            time:8
			        });
			}else{
				top.jzts();
				$.ajax({
					type: "POST",
					url: '<%=basePath%>classdetail/addUserAll.do?CLASSDETAIL_ID='+clsId+'&tm='+new Date().getTime(),
			    	data: {DATA_IDS:str},
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					success: function(data){
						 window.location.reload();
					}
				});
			}
			
			
		};
		</script>
</body>
</html>