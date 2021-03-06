<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>코일리 - 퀴즈</title>
<link href="${pageContext.request.contextPath}/css/quiz/list.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/quiz/quizList.js"></script>
<script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script>
<script src="https://cloud.tinymce.com/stable/plugins.min.js?apiKey=iuofftzqoh6hzo9eitfs6x1uw8zk5zwsp39id0t0wu45q89m"></script>
</head>
<body>
	
	<div id="container-main">
	<a id="add" href="/bit-finalT3/quiz/writeForm.do" data-wow-delay="0.8s">
	<div class="accordion-container">
  		<div class="accordion-titulo">
  			<div class="plus">+</div>
  		</div>
  	</div>
  	</a>
  	<c:forEach var="list" items="${qList}">
  	<div id="${list.quizNo}" class="accordion-container">
  		<input type="hidden" id="quizNo" value="${list.quizNo}"/>
		<a href="#" onclick="javascript:selectComment(${list.quizNo});" class="accordion-titulo"><c:out value="${list.quizTitle}"/><span class="toggle-icon"></span></a>
			<div class="accordion-content">
				<textarea name="updateText${list.quizNo}" rows="10" cols="100"></textarea>
				<div class="up" name="text${list.quizNo}">
					<c:choose>
						<c:when test="${list.quizWriteType eq 'u'}">
							${list.quizContent}
						</c:when>
						<c:otherwise>
							<p><c:out value="${list.quizContent}"/></p>
						</c:otherwise>
					</c:choose>
				</div>
				<br>
				<div class="row">
				<div class="col-md-8"></div>
				    <div class="col-md-4" style="padding-left: 12%; padding-right: 0px;">
						<a href="javascript:" name="answer" onclick="answer(${list.quizNo})" class="btn-sm btn-quiz">문제풀기</a>
						<a href="javascript:" name="update" onclick="update(${list.quizNo})" class="btn-sm btn-quiz">수정</a>
						<a href="javascript:" name="deleteQuiz" onclick="deleteQuiz(${list.quizNo})" class="btn-sm btn-quiz">삭제</a>
<%-- 						<a href='delete.do?no=${list.quizNo}' class="btn btn-danger">삭제</a> --%>
						<a href="javascript:" id="updateCon" name="updateCon" onclick="updateCon(${list.quizNo}, '${list.quizWriteType}')" class="btn-sm btn-quiz" style="margin-left: 35%;">확인</a>
						<button type="button" id="cancel" name="cancel" class="btn-sm btn-quiz">취소</button>
				   </div>
				</div>
				<br>
				<!--  댓글 -->
				<hr>
				<div id="commentList${list.quizNo}">
				
				</div>
			</div>
	</div>
	</c:forEach>
<%-- 	<navi:page data="${pageResult}" /> --%>
	
	</div>
</body>
</html>