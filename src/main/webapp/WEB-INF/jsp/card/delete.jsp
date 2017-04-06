<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>삭제</title>
<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/card/delete.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="delete">
		<c:out value="${delete.cardNo}"></c:out>
		<button id="reset">리스트로 돌아가기</button>
		
	</div>
</body>


<script type="text/javascript">
$("#reset").click(function() {
	
	
	$.ajax({
		url: "list.do",
		type:"POST",
		dataType:"json",
		data: {cardNo:$("#cardNo").val()
		
		},
	}).done(function(result){
		alert("삭제 완료");
		self.close()
		opener.location.reload()
	})
 });
</script>
</html>