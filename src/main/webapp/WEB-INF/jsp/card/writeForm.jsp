<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<head>
<meta Charset="UTF-8">
<title>Insert title</title>
</head>
<body>
	<!-- 폼태그를 만들어서 카드가 들어가는 내용을 입력해준다. -->
	<form>
		<input id="aaa" type="text" name="cardContent">
		<button id="btn">버튼</button>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">
	$("#btn").click(function() {
		
		
		$.ajax({
			url: "write.do",
			type:"POST",
			dataType:"json",
			data: {cardContent:$("#aaa").val()}
		}).done(function(result){
			alert("dfdffd");
			console.log(result)
		})
	});
	
	</script>
</body>
</html>