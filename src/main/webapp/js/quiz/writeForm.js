$(function(){

	$("#btn1").click(function(){
		$.ajax({
			url : "write.do",
			data : {"title": $("#title1").val(),
					"content": $("#content").val(),
					"answer": $("#answer1").val(),
					"writeType": $("[name=tabs-two]:checked").val(),
					},
			async: false,
			type : "POST"
		})
		.done(function(result){
			alert("등록되었습니다.")
			self.close();
			opener.location.reload();
// 			location.href="${pageContext.request.contextPath}/quiz/list.do"
		})
	})
	
		$("#btn2").click(function(){
			if(!$("[name=urlType]:checked").val()) {
				alert("체크 좀 해라")
				return false;
			}
		$.ajax({
			url : "write.do",
			data : {"title": $("#title2").val(),
					"writeType": $("[name=tabs-two]:checked").val(),
					"urlType": $("[name=urlType]:checked").val(),
					"url": $("[name=url]").val(),
					"answer": $("#answer2").val(),
					},
			async: false,
			type : "POST"
		})
		.done(function(result){
			alert("등록되었습니다.")
			self.close();
			opener.location.reload();
// 			location.href="${pageContext.request.contextPath}/quiz/list.do"
		})
	})
});




