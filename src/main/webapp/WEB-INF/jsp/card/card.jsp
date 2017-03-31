<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>Insert title</title>
</head>
<body>


	전체 <span id="count"></span>건
	
	
	<table id="cardList">
	
	
	</table>
	
	카드 리스트좀 보여줘..
	
	<script src="${pageContext.request.contextPath}/js/card/card.js"></script>
	
	<script>
	$("#btn").click(function() {
		$.ajax({
			url: "list.do",
			dataType:"json"
		}).done(function(result){
			console.log(result)
		})
	});
	</script>
</body>
</html>