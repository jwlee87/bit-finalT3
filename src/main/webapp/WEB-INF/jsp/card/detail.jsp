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
<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/card/detail.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="page-wrapper">
  		<ul id="messages"></ul>
  		
		<div>
			<c:out value="${detail.userNickName}"></c:out>
		</div>	
		
		<div id="detailBolck">
			<c:out value="${detail.cardContent}"></c:out>
		</div>
		
		
		
<!-- 		<div> -->
<%-- 			<c:out value="${detail.userNo}"></c:out> --%>
<!-- 		</div> -->
		
			<textarea id="detailNone" name="cardContent" required></textarea>
			<button id="detailNoneButton">수정</button>
	</div>
		
</body>

<script type="text/javascript">


$("#detailbolck").click(function () {
	alert("내용을 보이게하자")
})

$("#detailNoneButton").click(function() {
	alert("내용을 숨기자")
})




</script>
</html>