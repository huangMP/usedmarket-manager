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
					
					
					<form action="filltoblanks/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="FILLTOBLANKS_ID" id="FILLTOBLANKS_ID" value="${pd.FILLTOBLANKS_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">填空题:</td>
								<%-- <td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="500" placeholder="这里输入填空题" title="填空题" style="width:98%;"/></td> --%>
								<td><textarea rows="6" cols="" placeholder="这里输入填空题(不超过500字)" type="text" name="TITLE" title="填空题"
													id="TITLE" style="width:98%;">${pd.TITLE}</textarea></td>
							</tr>
							
						
							<tr id="ANSWER_TR_1">
								<td style="width:75px;text-align: right;padding-top: 13px;">答案1:</td>
								<td><input type="text" name="ANSWER_1" id="ANSWER_1" value="${pd.ANSWER_1}" maxlength="100" placeholder="这里输入答案1" title="答案1" style="width:98%;"/></td>
							</tr>
							<tr id="ANSWER_TR_2">
								<td style="width:75px;text-align: right;padding-top: 13px;">答案2:</td>
								<td><input type="text" name="ANSWER_2" id="ANSWER_2" value="${pd.ANSWER_2}" maxlength="100" placeholder="这里输入答案2" title="答案2" style="width:98%;"/></td>
							</tr>
							<tr id="ANSWER_TR_3">
								<td style="width:75px;text-align: right;padding-top: 13px;">答案3:</td>
								<td><input type="text" name="ANSWER_3" id="ANSWER_3" value="${pd.ANSWER_3}" maxlength="100" placeholder="这里输入答案3" title="答案3" style="width:98%;"/></td>
							</tr>
							
							<tr id="FILL_TR">
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="fill();">添加填空</a>
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
		            msg:'请输入填空题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if(fillAnswer > 1){
				if($("#ANSWER_1").val()==""){
				$("#ANSWER_1").tips({
					side:3,
		            msg:'请输入答案1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER_1").focus();
				return false;
				}
			}
			if(fillAnswer > 2){
				if($("#ANSWER_2").val()==""){
				$("#ANSWER_2").tips({
					side:3,
		            msg:'请输入答案2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER_2").focus();
				return false;
				}
			}
			if(fillAnswer > 3){
				if($("#ANSWER_3").val()==""){
				$("#ANSWER_3").tips({
					side:3,
		            msg:'请输入答案3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ANSWER_3").focus();
				return false;
				}
			}
			
      		
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		(function($){
		     $.fn.extend({
		         insertAtCaret: function(myValue){
		             var $t=$(this)[0];
		             if (document.selection) {
		                 this.focus();
		                 sel = document.selection.createRange();
		                 sel.text = myValue;
		                 this.focus();
		             }
		             else
		                 if ($t.selectionStart || $t.selectionStart == '0') {
		                     var startPos = $t.selectionStart;
		                     var endPos = $t.selectionEnd;
		                     var scrollTop = $t.scrollTop;
		                     $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
		                     this.focus();
		                     $t.selectionStart = startPos + myValue.length;
		                     $t.selectionEnd = startPos + myValue.length;
		                     $t.scrollTop = scrollTop;
		                 }
		                 else {
		                     this.value += myValue;
		                     this.focus();
		                 }
		         }
		     })  
		 })(jQuery);
		
		var fillAnswer = 1;
		function fill(){
			if(fillAnswer <= 3){
				var text = $("#TITLE").val();
				//console.log(text);
				//$("#TITLE").val(text + "__("+fillAnswer+")__");
				
				$("#TITLE").insertAtCaret("__("+fillAnswer+")__");
				
				$("#ADD_ANSWER").append("<tr>"+
								"<td style='width:75px;text-align: right;padding-top: 13px;'>答案"+fillAnswer+":</td>"+
								"<td><input type='text' name='ANSWER' id='ANSWER_"+fillAnswer+"' maxlength='100' placeholder='这里输入("+fillAnswer+")答案' title='答案("+fillAnswer+")' style='width:98%;'/></td>"+
								"</tr>"); 
					
					
				$("#ANSWER_TR_"+fillAnswer).show();
				$("#ANSWER_"+fillAnswer).focus();
				fillAnswer++;
				
			}else{
				$("#TITLE").tips({
					side:3,
		            msg:'答案填空位置超过3个',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			}
			}
			
			function hideAnswer(){
				for(var i = fillAnswer;i<4;i++){
					$("#ANSWER_TR_"+i).hide();
				}
			}
			
			window.onload = hideAnswer;
		</script>
</body>
</html>