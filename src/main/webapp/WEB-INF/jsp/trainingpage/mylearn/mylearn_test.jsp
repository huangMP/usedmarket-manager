<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我的学习-考试</title>
    <link href="static/css/train_allclass.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/train_total.css"/>    
    <script type="text/javascript" src="static/js/frontjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/js/frontjs/train_alljs.js"></script>
</head>
<body>
<jsp:include page="../train_head.jsp"></jsp:include>
<div class="content">
    <div class="text_box">
        <div class="content_bag">
            <a href="javascript:history.back(-1)" class="return_butt">返回</a>
            <div class="clear"></div>
            <c:if test="${pd.PAPER_ID==null or ''.equals(pd.PAPER_ID)}">
	          	<div class="none">
                	<p class="none_tit tital">该专题未设置试卷</p>
                	<img src="static/image/image-train/none4.png" class="none_pag">
            	</div>
            </c:if>
            <c:if test="${pd.PAPER_ID!=null and !''.equals(pd.PAPER_ID) }">
	            <div class="topic">
	                <p class="tital">题目</p>
	                <div class="test_content">
	                	<iframe id="myframe" src="<%=basePath%>${fileHtmlPath}" width="600px" height="948px"></iframe>
	                </div>
	            </div>
	            <form action="train_special/saveAnswer.do" id="Form" method="post">
	                <input hidden="hidden" type="text" name="CHOICE_ANSWER" id="CHOICE_ANSWER">
					<input hidden="hidden" type="text" name="FILL_ANSWER" id="FILL_ANSWER">
					<input hidden="hidden" type="text" name="SUBJECTIVE_ANSWER" id="SUBJECTIVE_ANSWER">
					<input hidden="hidden" type="text" name="CHOICE_DOUBLE_ANSWER" id="CHOICE_DOUBLE_ANSWER">
					<input hidden="hidden" type="text" name="STATUS" id="STATUS" value="${pd.STATUS }">
					<input hidden="hidden" type="text" name="SPECIAL_ID" id="SPECIAL_ID" value="${pd.SPECIAL_ID }">
					<input hidden="hidden" type="text" name="PAPER_ID" id="PAPER_ID" value="${pd.PAPER_ID }">
				</form>	
	            <div class="answer_sheet">
	                <p class="tital">答题卡</p>
	                <div class="answei_box">
	                	<p class="second_tital">一、单选题</p>
	                    <div class="single" id="single">
	                    	<c:forEach begin="1" end="${pd.CHOICE_NUM}" var="var">
	                        	<div class="answer_box">${var}.<input type="text" id="choice${var}"></div>
	                        </c:forEach>
	                    </div>
	                    <p class="second_tital">二、多选题</p>
	                    <div class="double" id="double">
                    		<c:forEach begin="1" end="${pd.CHOICE_DOUBLE_NUM}" var="var">
                        		<div class="answer_box">${var}.<input type="text" id="double${var}"></div>
                        	</c:forEach>
	                    </div>
	                    <p class="second_tital">三、填空题</p>
	                    <div class="double" id="fill">
                    		<c:forEach begin="1" end="${pd.FILL_NUM}" var="var">
                        		<div class="answer_box">${var}.<input type="text" id="fill${var}"></div>
                        	</c:forEach>
	                    </div>
	                    <p class="second_tital">四、简答题</p>
	                    <div class="short_answer" id="shortAnswer">
                    		<c:forEach begin="1" end="${pd.SUBJECTIVE_NUM}" var="var">
	                        	<div class="answer_box">${var}.<textarea id="subjective${var}" rows="7" cols="30" class="text_box_ans"></textarea></div>
                        	</c:forEach>
	                    </div>
	                    <input type="submit" id="Submit" value="提交" class="up_test">
	                </div>
	            </div>
            </c:if>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="clear"></div>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script>
    $(".top2").addClass("font_size");
	
    $("#Submit").click(function(){
	    var $singleInput = $("#single").children("div").children("input");
	    var $doubleInput = $("#double").children("div").children("input");
	    var $fillInput = $("#fill").children("div").children("input");
	    var $shortAnswerInput = $("#shortAnswer").children("div").children("textarea");
	    
	   	var singleNum = ${pd.CHOICE_NUM };
	   	var doubleNum = ${pd.CHOICE_DOUBLE_NUM };
	   	var fillNum = ${pd.FILL_NUM };
	   	var shortAnswerNum = ${pd.SUBJECTIVE_NUM };
	   	
	   	var answer_str = "";
	   	var reg = /^[A-Za-z]+$/;
	   	var reg01 = /^[a-zA-Z0-9\,\.\，\。\u4e00-\u9fa5]+$/;
		for(var i=0;i<singleNum;i++){
			if($singleInput[i].value.trim() == ""){
				var id = "#"+$singleInput[i].id;
				$(id).tips({
					side:3,
		            msg:'请填写单选题答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			if(!reg.test($singleInput[i].value.trim())){
				var id = "#"+$singleInput[i].id;
				$(id).tips({
					side:3,
		            msg:'请输入字母',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			answer_str += $singleInput[i].value.trim()+"|";
		}
		$("#CHOICE_ANSWER").val(answer_str);
		
		answer_str = "";
		for(var i=0;i<doubleNum;i++){
			if($doubleInput[i].value.trim() == ""){
				var id = "#"+$doubleInput[i].id;
				$(id).tips({
					side:3,
		            msg:'请填写多选题答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			if(!reg.test($doubleInput[i].value.trim())){
				var id = "#"+$doubleInput[i].id;
				$(id).tips({
					side:3,
		            msg:'请输入字母',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			answer_str += $doubleInput[i].value.trim()+"|";
		}
		$("#CHOICE_DOUBLE_ANSWER").val(answer_str);
		
		answer_str = "";
		for(var i=0;i<fillNum;i++){
			if($fillInput[i].value.trim() == ""){
				var id = "#"+$fillInput[i].id;
				$(id).tips({
					side:3,
		            msg:'请填写填空题答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			if(!reg01.test($fillInput[i].value.trim())){
				var id = "#"+$fillInput[i].id;
				$(id).tips({
					side:3,
		            msg:'您的输入存在非法字符',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			answer_str += $fillInput[i].value.trim()+"|";
		}
		$("#FILL_ANSWER").val(answer_str);
		
		answer_str = "";
		for(var i=0;i<shortAnswerNum;i++){
			if($shortAnswerInput[i].value.trim() == ""){
				var id = "#"+$shortAnswerInput[i].id;
				$(id).tips({
					side:3,
		            msg:'请填写主观题答案',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			if(!reg01.test($shortAnswerInput[i].value.trim())){
				var id = "#"+$shortAnswerInput[i].id;
				$(id).tips({
					side:3,
		            msg:'您的输入存在非法字符',
		            bg:'#AE81FF',
		            time:2
		        });
				$(id).focus();
				return false;
			}
			answer_str += $shortAnswerInput[i].value.trim()+"|";
		}
		$("#SUBJECTIVE_ANSWER").val(answer_str);
		$("#Form").submit();
		
    })
    
    
</script>
</body>
</html>


