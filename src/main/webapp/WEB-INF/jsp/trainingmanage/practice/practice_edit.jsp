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
					
					<form action="practice/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="PRACTICE_ID" id="PRACTICE_ID" value="${pd.PRACTICE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;"> 
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属专题:</td>
								<td>
									<select style="width:98%;" class="chosen-select" name="SPECIAL_ID" id="SPECIAL_ID" data-placeholder="c" style="vertical-align:top;width: 200px;">
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
									<select style="width:98%;" class="chosen-select form-control" name="CHAPTER_ID" id="CHAPTER_ID" data-placeholder="c" style="vertical-align:top;width: 200px;">
										<c:choose>  
										   <c:when test="${pd.CHAPTER_ID!=null}">
												<option value="${pd.CHAPTER_ID}" selected>${pd.CHAPTER_TITLE}</option>
											</c:when>
											<c:otherwise>
												<option value="" disabled selected hidden>请选择章节</option>
											</c:otherwise>
										</c:choose>	
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">文件路径:</td>
								
								<td id="practiceFileContext">
										<c:choose>  
										   <c:when test="${pd.FILE_PATH!=null}">
												<input type="text" value="${pd.FILE_PATH}" disabled="disabled" style="width:98%;"/></br></br>
												<span style="padding-top: 20px">
												   <input class="btn btn-primary"  type="button" name="newPracticeFile" id="newPracticeFile" value="重新选择"/>
												</span>
											</c:when>
											<c:otherwise>
											   <input type="file" id="practiceFile" name="practiceFile"/>
											</c:otherwise>
										</c:choose>	
								  </td>
								
								
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">答案路径:</td>
								
								<td id="answerFileContext">
										<c:choose>  
										   <c:when test="${pd.ANSWER_PATH!=null}">
												<input type="text" value="${pd.ANSWER_PATH}" disabled="disabled" style="width:98%;"/></br></br>
												<span style="padding-top: 20px">
												   <input class="btn btn-primary"  type="button" name="newAnswerFile" id="newAnswerFile" value="重新选择"/>
												</span>
											</c:when>
											<c:otherwise>
											   <input type="file" id="answerFile" name="answerFile"/>
											</c:otherwise>
										</c:choose>	
								  </td>
							</tr>
							
							
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单选题个数:</td>
								<td><input type="number" name="CHOICE_NUM" id="CHOICE_NUM" value="${pd.CHOICE_NUM}" maxlength="32" onblur="choiceAnswer()" placeholder="这里输入单选题个数" title="选择题个数" style="width:98%;"/></td>
							</tr>
							
							
							<tr style="display: none;">
								<td style="width:75px;text-align: right;padding-top: 13px;">添加人:</td>
								<td><input type="text" name="ADD_USER" id="ADD_USER" value="${pd.ADD_USER}" maxlength="255" placeholder="这里输入添加人" title="添加人" style="width:98%;"/></td>
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
			
			if($("#CHOICE_NUM").val()=="" || null == $("#CHOICE_NUM").val() ){
				$("#CHOICE_NUM").tips({
					side:3,
		            msg:'请输入单选题个数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHAPTER_ID").focus();
			return false;
			}
			if($("#CHAPTER_ID").val()=="" || null == $("#CHAPTER_ID").val() ){
				$("#CHAPTER_ID").tips({
					side:3,
		            msg:'请输入章节id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHAPTER_ID").focus();
			return false;
			}
			if($("#practiceFile").val()==""){
				$("#practiceFile").tips({
					side:3,
		            msg:'请加入文件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILE_PATH").focus();
			return false;
			}
			if($("#answerFile").val()==""){
				$("#answerFile").tips({
					side:3,
		            msg:'请加入文件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER_PATH").focus();
			return false;
			}
			if($("#practiceFile").val()!=""&&$("#practiceFile").val()!=null){
				return PracticeFileChange();
			}
			if($("#answerFile").val()!=""&&$("#answerFile").val()!=null){
				return AnswerFileChange();
			}
			
			
			
			
			
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		

		
		function PracticeFileChange(){  
			//检测上传文件的类型 
			var videoName = $("#practiceFile").val();
			//获取"."所在的位置
			var idx = videoName.lastIndexOf(".");
			if( idx != -1 ){
				//获取文件的后缀名
				var ext = videoName.substr(idx+1).toUpperCase();
				//将后缀名变成小写
				ext = ext.toLowerCase( );
				if(ext != 'docx' && ext != 'doc'){
					$("#practiceFile").tips({
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
				$("#practiceFile").tips({
					side:3,
		            msg:'上传的文件格式错误',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
		}
		function AnswerFileChange(){  
			//检测上传文件的类型 
			var videoName = $("#answerFile").val();
			//获取"."所在的位置
			var idx = videoName.lastIndexOf(".");
			if( idx != -1 ){
				//获取文件的后缀名
				var ext = videoName.substr(idx+1).toUpperCase();
				//将后缀名变成小写
				ext = ext.toLowerCase( );
				if(ext != 'docx' && ext != 'doc'){
					$("#answerFile").tips({
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
				$("#answerFile").tips({
					side:3,
		            msg:'上传的文件格式错误',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
		}
		
        $("#newPracticeFile").click(function(){
        	$("#practiceFileContext").empty();
         	$("#practiceFileContext").append("<input style='padding-top: 14px' type='file' id='practiceFile' name='practiceFile' />"+
         			"<input  type='text' hidden='hidden' name='practiceFileChange' id='practiceFileChange' value='true'/>");
      	});
		
        $("#newAnswerFile").click(function(){
        	$("#answerFileContext").empty();
         	$("#answerFileContext").append("<input style='padding-top: 14px' type='file' id='answerFile' name='answerFile' />"+
         			"<input  type='text' hidden='hidden' name='answerFileChange' id='answerFileChange' value='true'/>");
      	});
		
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		$("#SPECIAL_ID").change(function(){ 
			//alert( $(this).val() );
			var SPECIAL_ID_val = $(this).val();
			$.ajax({
				type: "post",
	            url: "<%=basePath%>practice/findChapterBySpecialId.do"+"?SPECIAL_ID="+SPECIAL_ID_val+"",
	            contentType: "application/json;charset=utf-8",
	            dataType:'json',
	            success: function (data) {

	    			$("#CHAPTER_ID").empty();
	    			
	    			if(data.length == "0"){
 	            		var optionStr = "<option value=''>该专题没有下级章节</option>";
 		            	$("#CHAPTER_ID").append( optionStr );
	    			}else{
	 	            	for(var i=0 ;i<data.length ;i++){
	 	            		var optionStr = "<option value="+data[i].CHAPTER_ID+">"+data[i].TITLE+"</option>";
	 		            	$("#CHAPTER_ID").append( optionStr );
		            	}
	    			}
	            }
			});
		
		});
		
		
		//选择题失去焦点，将输入框进行改变
		function choiceAnswer(){
			var choice_num = $("#CHOICE_NUM").val();
			if(choice_num<=0)
				return;
			$("#choice_input_td").hide();
			$("#choice_td").show();
			$("#choice_answer").empty();
			for(var i=1;i<=choice_num;i++){
				$("#choice_answer").append("<span style='margin-right: 5px'>"+i+".</span><input style='width:15%;margin-right: 20px' type='text' name='choice_"+i+"' id='choice_"+i+"'/>");
				if(i%4 == 0)
					$("#choice_answer").append("<br><br>");
			}		
		}
		</script>
</body>
</html>