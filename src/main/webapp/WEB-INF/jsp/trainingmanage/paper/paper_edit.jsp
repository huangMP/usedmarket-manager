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
					<form action="paper/edit.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="PAPER_ID" id="PAPER_ID" value="${pd.PAPER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">试卷名称:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="100" placeholder="这里输入试卷名称" title="试卷名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属专题:</td>
								<input type="text" name="specialID" id="specialID" value="${pd.SPECIAL_ID}" hidden="hidden"/>
								<td>
									<select style="width:98%;" class="chosen-select form-control" 
										name="SPECIAL_ID" id="SPECIAL_ID" data-placeholder="c"
										style="vertical-align:top;width: 200px;">
										<option value="" disabled selected hidden>请选择专题</option>
										<c:forEach items="${specialList}" var="var">
											<option value="${var.SPECIAL_ID}">${var.TITLE}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加试卷:</td>
								<td id="filecontext">
									<c:choose>  
									   <c:when test="${pd.FILE_PATH!=null}">
											<input type="text" value="${pd.FILE_PATH}" disabled="disabled" style="width:98%;"/></br></br>
											<span style="padding-top: 20px">
											   <input class="btn btn-primary"  type="button" name="newFile" id="newFile" value="重新选择"/>
											</span>
										</c:when>
										<c:otherwise>
										   <input type="file" id="File" name="File"/>
										</c:otherwise>
									</c:choose>	
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单选题个数:</td>
								<td><input type="number" name="CHOICE_NUM" id="CHOICE_NUM" value="${pd.CHOICE_NUM}" maxlength="32" onblur="choiceAnswer()" placeholder="这里输入单选题个数" title="选择题个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单选题分数:</td>
								<td><input type="text" name="CHOICE_GRADE" id="CHOICE_GRADE" value="${pd.CHOICE_GRADE}" maxlength="50" placeholder="这里输入单选题分数" title="选择题分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单选题答案:</td>
								<td id="choice_td">	
									<div id="choice_answer">
										<c:forEach items="${choice_answer}" var="var" varStatus="vs">
											<span style="margin-right: 5px">${vs.index+1}.</span><input value="${var}" style="width:15%;margin-right: 20px" type="text" name="choice_${vs.index+1}" id="choice_${vs.index+1}"/>
										</c:forEach>
									</div>
								</td>
 								<input type="hidden" name="CHOICE_ANSWER" id="CHOICE_ANSWER" value="${pd.CHOICE_ANSWER}"/>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">多选题个数:</td>
								<td><input type="number" name="CHOICE_DOUBLE_NUM" id="CHOICE_DOUBLE_NUM" value="${pd.CHOICE_DOUBLE_NUM}" maxlength="32" onblur="choiceDoubleAnswer()" placeholder="这里输入多选题个数" title="选择题个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">多选题分数:</td>
								<td><input type="text" name="CHOICE_DOUBLE_GRADE" id="CHOICE_DOUBLE_GRADE" value="${pd.CHOICE_DOUBLE_GRADE}" maxlength="50" placeholder="这里输入多选题分数" title="选择题分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">多选题答案:</td>
								<td id="choice_double_td">	
									<div id="choice_double_answer">
										<c:forEach items="${choice_double_answer}" var="var" varStatus="vs">
											<span style="margin-right: 5px">${vs.index+1}.</span><input value="${var}" style="width:15%;margin-right: 20px" type="text" name="choice_${vs.index+1}" id="choice_${vs.index+1}"/>
										</c:forEach>
									</div>
								</td>
 								<input type="hidden" name="CHOICE_DOUBLE_ANSWER" id="CHOICE_DOUBLE_ANSWER" value="${pd.CHOICE_DOUBLE_ANSWER}"/>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题个数:</td>
								<td><input type="number" name="FILL_NUM" id="FILL_NUM" value="${pd.FILL_NUM}" maxlength="32" onblur="fillAnswer()" placeholder="这里输入填空题个数" title="填空题个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题分数:</td>
								<td><input type="text" name="FILL_GRADE" id="FILL_GRADE" value="${pd.FILL_GRADE}" maxlength="50" placeholder="这里输入填空题分数" title="填空题分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题答案:</td>
								<td id="fill_td">	
									<div id="fill_answer">
										<c:forEach items="${fill_answer}" var="var" varStatus="vs">
											<span style="margin-right: 5px">${vs.index+1}.</span><input value="${var}" style="width:15%;margin-right: 20px" type="text" name="choice_${vs.index+1}" id="choice_${vs.index+1}"/>
										</c:forEach>
									</div>
								</td>
								<input type="hidden" name="FILL_ANSWER" id="FILL_ANSWER" value="${pd.FILL_ANSWER}"/>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题个数:</td>
								<td><input type="number" name="SUBJECTIVE_NUM" id="SUBJECTIVE_NUM" value="${pd.SUBJECTIVE_NUM}" maxlength="32" onblur="subjectiveAnswer()" placeholder="这里输入主观题个数" title="主观题个数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题分数:</td>
								<td><input type="text" name="SUBJECTIVE_GRADE" id="SUBJECTIVE_GRADE" value="${pd.SUBJECTIVE_GRADE}" maxlength="50" placeholder="这里输入主观题分数" title="主观题分数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主观题答案:</td>
								<td id="subjective_td">	
									<div id="subjective_answer">
										<c:forEach items="${subjective_answer}" var="var" varStatus="vs">
											<span style="margin-right: 5px">${vs.index+1}.</span><textarea rows="5" cols="" id="subjective_${vs.index+1}" placeholder="这里输入主观题答案" title="主观题答案" style="width:98%;">${var}</textarea>
										</c:forEach>
									</div>
								</td>
								<textarea hidden="hidden" rows="5" cols=""  name="SUBJECTIVE_ANSWER" id="SUBJECTIVE_ANSWER">${pd.SUBJECTIVE_ANSWER}</textarea>
							</tr>
							<input type="hidden" name="TOTLE_GRADE" id="TOTLE_GRADE" value="${pd.TOTLE_GRADE}"/>
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
						<div id="zhongxin2" class="center" style="display:none;"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
			var specialID = $("#specialID").val();
			if (specialID != "" ) {
				$("#SPECIAL_ID").val(specialID);
			}
			
			
		});
		
		//选择题失去焦点，将输入框进行改变
		function choiceAnswer(){
			var choice_num = $("#CHOICE_NUM").val();
			if(choice_num<=0) {
				$("#CHOICE_NUM").val(0);
			}
			$("#choice_input_td").hide();
			$("#choice_td").show();
			$("#choice_answer").empty();
			for(var i=1;i<=choice_num;i++){
				$("#choice_answer").append("<span style='margin-right: 5px'>"+i+".</span><input style='width:15%;margin-right: 20px' type='text' name='choice_"+i+"' id='choice_"+i+"'/>");
				if(i%4 == 0)
					$("#choice_answer").append("<br><br>");
			}		
		}
		
		//多选题失去焦点，将输入框进行改变
		function choiceDoubleAnswer(){
			var choice_double_num = $("#CHOICE_DOUBLE_NUM").val();
			if(choice_double_num<=0) {
				$("#CHOICE_DOUBLE_NUM").val(0);
			}
			$("#choice_input_double_td").hide();
			$("#choice_double_td").show();
			$("#choice_double_answer").empty();
			for(var i=1;i<=choice_double_num;i++){
				$("#choice_double_answer").append("<span style='margin-right: 5px'>"+i+".</span><input style='width:15%;margin-right: 20px' type='text' name='choice_double"+i+"' id='choice_double"+i+"'/>");
				if(i%4 == 0)
					$("#choice_double_answer").append("<br><br>");
			}		
		}
		
		//填空题失去焦点，将输入框进行改变
		function fillAnswer(){
			var fill_num = $("#FILL_NUM").val();
			if(fill_num<=0) {
				$("#FILL_NUM").val(0);
			}
			$("#fill_input_td").hide();
			$("#fill_td").show();
			$("#fill_answer").empty();
			for(var i=1;i<=fill_num;i++){
				$("#fill_answer").append("<span style='margin-right: 5px'>"+i+".</span><input style='width:35%;margin-right: 20px' type='text' name='fill_"+i+"' id='fill_"+i+"'/>");
				if(i%2 == 0)
					$("#fill_answer").append("<br><br>");
			}		
		}
		
		//主观题失去焦点，将输入框进行改变
		function subjectiveAnswer(){
			var subjective_num = $("#SUBJECTIVE_NUM").val();
			if(subjective_num<=0) {
				$("#SUBJECTIVE_NUM").val(0);
			}
			$("#subjective_textarea_td").hide();
			$("#subjective_td").show();
			$("#subjective_answer").empty();
			for(var i=1;i<=subjective_num;i++){
				$("#subjective_answer").append("<span style='margin-right: 5px'>"+i+".</span><textarea rows='5' cols='' id='subjective_"+i+"' placeholder='这里输入主观题答案' title='主观题答案' style='width:98%;'>${pd.SUBJECTIVE_ANSWER}</textarea>");
				$("#subjective_answer").append("<br><br>");
			}		
		}
		
		//保存
		function save(){
			var choice_num = $("#CHOICE_NUM").val();
			var fill_num = $("#FILL_NUM").val();
			var choice_double_num = $("#CHOICE_DOUBLE_NUM").val();
			var subjective_num = $("#SUBJECTIVE_NUM").val();
			
			var $choice_input = $("#choice_answer").children("input");
			var $fill_input = $("#fill_answer").children("input");
			var $choice_double_input = $("#choice_double_answer").children("input");
			var $subjective_textarea = $("#subjective_answer").children("textarea");
			
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入试卷名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#SPECIAL_ID").val()==""){
				$("#SPECIAL_ID").tips({
					side:3,
		            msg:'请输入所属专题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SPECIAL_ID").focus();
			return false;
			}
			if($("#File").val()==""){
				$("#File").tips({
					side:3,
		            msg:'请加入文件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILE_PATH").focus();
			return false;
			}
			if($("#CHOICE_NUM").val()==""){
				$("#CHOICE_NUM").tips({
					side:3,
		            msg:'请输入单选题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHOICE_NUM").focus();
			return false;
			}
			if($("#CHOICE_GRADE").val()==""){
				$("#CHOICE_GRADE").tips({
					side:3,
		            msg:'请输入单选题分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHOICE_GRADE").focus();
			return false;
			}
			var choice_answer_str = "";
			for(var i=0;i<choice_num;i++){
				if($choice_input[i].value == ""){
					var id = "#"+$choice_input[i].id;
					$(id).tips({
						side:3,
			            msg:'请输入单选题答案',
			            bg:'#AE81FF',
			            time:2
			        });
					$(id).focus();
					return false;
				}
				choice_answer_str += $choice_input[i].value+"|";
			}
			$("#CHOICE_ANSWER").val(choice_answer_str);
			
			if($("#CHOICE_DOUBLE_NUM").val()==""){
				$("#CHOICE_DOUBLE_NUM").tips({
					side:3,
		            msg:'请输入多选题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHOICE_DOUBLE_NUM").focus();
			return false;
			}
			if($("#CHOICE_DOUBLE_GRADE").val()==""){
				$("#CHOICE_DOUBLE_GRADE").tips({
					side:3,
		            msg:'请输入多选题分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHOICE_DOUBLE_GRADE").focus();
			return false;
			}
			var choice_answer_double_str = "";
			for(var i=0;i<choice_double_num;i++){
				if($choice_double_input[i].value == ""){
					var id = "#"+$choice_double_input[i].id;
					$(id).tips({
						side:3,
			            msg:'请输入多选题答案',
			            bg:'#AE81FF',
			            time:2
			        });
					$(id).focus();
					return false;
				}
				choice_answer_double_str += $choice_double_input[i].value+"|";
			}
			$("#CHOICE_DOUBLE_ANSWER").val(choice_answer_double_str);
			
			if($("#FILL_NUM").val()==""){
				$("#FILL_NUM").tips({
					side:3,
		            msg:'请输入填空题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILL_NUM").focus();
			return false;
			}
			if($("#FILL_GRADE").val()==""){
				$("#FILL_GRADE").tips({
					side:3,
		            msg:'请输入填空题分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILL_GRADE").focus();
			return false;
			}
			var fill_answer_str = "";
			for(var i=0;i<fill_num;i++){
				if($fill_input[i].value == ""){
					var id = "#"+$fill_input[i].id;
					$(id).tips({
						side:3,
			            msg:'请输入填空题答案',
			            bg:'#AE81FF',
			            time:2
			        });
					$(id).focus();
					return false;
				}
				fill_answer_str += $fill_input[i].value+"|";
			}
			$("#FILL_ANSWER").val(fill_answer_str);
			
			if($("#SUBJECTIVE_NUM").val()==""){
				$("#SUBJECTIVE_NUM").tips({
					side:3,
		            msg:'请输入主观题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECTIVE_NUM").focus();
			return false;
			}
			if($("#SUBJECTIVE_GRADE").val()==""){
				$("#SUBJECTIVE_GRADE").tips({
					side:3,
		            msg:'请输入主观题分数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECTIVE_GRADE").focus();
			return false;
			}
			
			var subjective_answer_str = "";
			for(var i=0;i<subjective_num;i++){
				if($subjective_textarea[i].value == ""){
					var id = "#"+$subjective_textarea[i].id;
					$(id).tips({
						side:3,
			            msg:'请输入主观题答案',
			            bg:'#AE81FF',
			            time:2
			        });
					$(id).focus();
					return false;
				}
				subjective_answer_str += $subjective_textarea[i].value+"|";
			}
			$("#SUBJECTIVE_ANSWER").val(subjective_answer_str);

			if($("#File").val()!=""&&$("#File").val()!=null){
				return fileChange();
			}
			
			$("#choice_answer").empty();
			$("#choice_double_answer").empty();
			$("#fill_answer").empty();
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		function fileChange(){  
			//检测上传文件的类型 
			var videoName = $("#File").val();
			//获取"."所在的位置
			var idx = videoName.lastIndexOf(".");
			if( idx != -1 ){
				//获取文件的后缀名
				var ext = videoName.substr(idx+1).toUpperCase();
				//将后缀名变成小写
				ext = ext.toLowerCase( );
				if(ext != 'docx' && ext != 'doc'){
					$("#File").tips({
						side:3,
			            msg:'上传的文件格式错误',
			            bg:'#AE81FF',
			            time:2
			        });
					return false;
				} else {
					$("#Form").submit();
				}
			} else {
				$("#File").tips({
					side:3,
		            msg:'上传的文件格式错误',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
		}
		
        $("#newFile").click(function(){
        	$("#filecontext").empty();
         	$("#filecontext").append("<input style='padding-top: 14px' type='file' id='File' name='File' />"+
         			"<input  type='text' hidden='hidden' name='fileChange' id='fileChange' value='true'/>");
      	});
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>