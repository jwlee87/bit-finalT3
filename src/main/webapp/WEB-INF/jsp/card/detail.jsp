<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>상세 조회</title>
<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp"></jsp:include>
<%-- <script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/card/detail.js"></script>
<link href="${pageContext.request.contextPath}/css/card/detail.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="page-wrapper">
  		<ul id="messages"></ul>
  		
		<div>
			<c:out value="${detail.userNickName}"></c:out>
		</div>	
		
		<div id="detailBolck">
<%-- 			<c:out value="${detail.cardContent}"></c:out> --%>
			${detail.cardContent}	
		</div>
	
	<div id="page-comment">
		<div>
			
<%-- 			<c:out value="${detail.cardCommentContent}"></c:out> --%>

		</div>
	</div>	
		
		
		
		
<!-- 		<div> -->
<%-- 			<c:out value="${detail.userNo}"></c:out> --%>
<!-- 		</div> -->
			<input type="hidden" id="cardNo" value="${param.cardNo}" />
			<input type="hidden" id="userNo" value="${detail.userNo}"/>
<%-- 			<input type="hidden" id="fileNo" value="${detail.fileNo}"/> --%>
			
			<textarea id="detailNone" name="cardContent" required></textarea>
			
			<button id="detailNoneButton">수정</button>
	</div>
	
	<hr>
	<hr>
	
	
	
	<form id="commentWrite" action="#" method="post">
				
		<c:import url="../file/fileForm.jsp"></c:import>
		
		<textarea id="Commentcontent" name="cardCommentContent" placeholder="내용을 작성하세요" required
		></textarea>
		
		<input type="button" id="btn1" value="댓글 등록" />
		
		<div id="commentList">
				
		</div>
		
		<br>
	</form>
	
	</div>	
</body>
</html>