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
			<input type="hidden" id="cardNo" value="${param.cardNo}" />
			<input type="hidden" id="userNo" value="${detail.userNo}"/>
			
			<textarea id="detailNone" name="cardContent" required></textarea>
			<button id="detailNoneButton">수정</button>
	</div>
		
</body>

<script type="text/javascript">
$(function(){
	$("#detailNone").css("display", "none")
	$("#detailNoneButton").css("display","none")
})

$("#detailBolck").click(function () {
// 	alert("글수정 입니다")
	$("#detailNone").css("display", "block")
	$("#detailBolck").css("display", "none")
	$("#detailNoneButton").css("display", "block")
	
	$("#detailNoneButton").click(function() {
		
		
		$.ajax({
			url: "update.do",
			type:"POST",
			dataType:"json",
			data: {cardContent:$("#detailNone").val(),
				   cardNo:$("#cardNo").val(),
				   userNo:$("#userNo").val()
				   },
		}).done(function(result){
			alert("수정 완료염");
			self.close()
			opener.location.reload()
		})
	});
})





</script>
</html>