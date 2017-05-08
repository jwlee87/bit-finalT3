$(function(){
	$("#btn1").click(function(){
		if($("#title1").val() == "") {
			swal({
				title: "제목을 입력하세요.",
				type: "warning"
			})
			return false;
		}
		if($("#content").val() == "") {
			swal({
				title: "내용을 입력하세요.",
				type: "warning"
			})
			return false;
		}
		if($("#answer1").val() == "") {
			swal({
				title: "정답을 입력하세요.",
				type: "warning"
			})
			return false;
		}
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
			swal({
				title: "등록되었습니다.",
				type: "success"	
			},
			function(){
				window.open('/bit-finalT3/quiz/list.do','_parent').parent.close();
			})
//			swal("등록되었습니다.", "", "success")
//			clo = setTimeout(closeAlert, 3000)
//			parent.jQuery.colorbox.close();
//			parent.location.reload();
//			window.open('/bit-finalT3/quiz/list.do','_parent').parent.close();
		})
	})
	
		$("#btn2").click(function(){
			if($("#title2").val() == "") {
				swal({
					title: "제목을 입력하세요.",
					type: "warning"
				})
				return false;
			}
			if($("#url").val() == "") {
				swal({
					title: "url을 입력하세요.",
					type: "warning"
				})
				return false;
			}
			if($("#answer2").val() == "") {
				swal({
					title: "정답을 입력하세요.",
					type: "warning"
				})
				return false;
			}
			if(!$("[name=urlType]:checked").val()) {
				swal({
					title: "url을 선택하세요.",
					type: "warning"
				})
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
			swal({
				title: "등록되었습니다.",
				type: "success"	
			},
			function(){
				window.open('/bit-finalT3/quiz/list.do','_parent').parent.close();
			})
//			swal("등록되었습니다.", "", "success")
//			clo = setTimeout(closeAlert, 3000)
//			parent.jQuery.colorbox.close();
//			parent.location.reload();
// 			location.href="${pageContext.request.contextPath}/quiz/list.do"
//			window.open('/bit-finalT3/quiz/list.do','_parent').parent.close();
		})
	})
	
});
