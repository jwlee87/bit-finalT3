<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>등록</title>
<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
<link href="${pageContext.request.contextPath}/css/card/write.css" rel="stylesheet" type="text/css">
<%-- <script src="${pageContext.request.contextPath}/js/card/write.js"></script> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<!-- 폼태그를 만들어서 카드가 들어가는 내용을 입력해준다. -->
<!-- 	<form enctype="multipart/form-data"> -->
	<div id="page-wrapper">
  		<ul id="messages"></ul>
  		
	<form id="write" action="#" method="post">
	
		<textarea id="content" name="cardContent" placeholder="내용을 작성하세요" required></textarea>
		
		<button type="button" id="btn">등록</button>
		<button type="button" id="close">취소</button>
		
	</form>
	</div>

	<script type="text/javascript">
	$("#btn").click(function() {
		
		
		$.ajax({
			url: "write.do",
			type:"POST",
			dataType:"json",
			data: {cardContent:$("#content").val(),
				   cardTitle:$("#title").val()
				
			},
		}).done(function(result){
			alert("등록 완료염");
			self.close()
			opener.location.reload()
		})
	});
	
	</script>
</body>
</html>