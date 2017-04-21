<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>등록</title>
<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/card/writeForm.js"></script>
<link href="${pageContext.request.contextPath}/css/card/write.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 폼태그를 만들어서 카드가 들어가는 내용을 입력해준다. -->
<!-- 	<form enctype="multipart/form-data"> -->
	<div id="page-wrapper">
  		<ul id="messages"></ul>
  		
	<form id="write" action="#" method="post">
		<input type="hidden" id="userNo" name="userNo" value="${user.userNo}">
		<textarea id="content" name="cardContent" placeholder="내용을 작성하세요" required
		></textarea>
		
		<c:import url="../file/fileForm.jsp"></c:import>
	
		<button type="button" id="btn">등록</button>
<!-- 		<button type="button" id="close">취소</button> -->
		<br>
	</form>
	</div>
</body>
</html>