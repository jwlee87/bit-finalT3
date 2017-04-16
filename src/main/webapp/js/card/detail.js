$(document).ready(function () {
	
	$.ajax({
		url: "commentList.do",
		type: "POST",
		dataType:"json",
		data: {cardNo:$("#cardNo").val()},
	}).done(function(result){
		swal("댓글 리스트 조회");
		
		
		var commentList = "";
		for(var i=0; i<result.length; i++) {
			commentList += result[i].cardCommentContent;
			var date = new Date(result[i].cardCommentRegDate);
			commentList +=  date.getFullYear() + "-" 
	         + (date.getMonth() + 1) + "-" 
	         + date.getDate() + " "
	         + date.getHours() + ":"
	         + date.getMinutes() + ":"
	         + date.getSeconds();
			
			commentList += "<br />";
		}
		
		$("#commentList").html(commentList);
		
		
		
	});
})

$(window).load(function () {
	alert("2");
})

$(function(){

	$("#detailNone").css("display", "none")
	$("#detailNoneButton").css("display","none")
	
// 	consol.log("cardCommentNo");
	consol.log($("#cardCommentNo").val());
	
	


$("#detailBolck").click(function () {
	// 	alert("글수정 입니다")
		$("#detailNone").css("display", "block")
		$("#detailBolck").css("display", "none")
		$("#detailNoneButton").css("display", "block")
		
		$("#detailNoneButton").click(function() {
		
			if($("#detailNone").val() == ""){
	// 		 	alert("글 내용을 입력하세욧")
	// 			return false;
				
			 	 swal({
					title:"수정할 내용을 입력하세요",
					type:"warning"
				})
				return false;
				
			}
			$.ajax({
				url: "update.do",
				type:"POST",
				dataType:"json",
				data: {cardContent:$("#detailNone").val(),
					   cardNo:$("#cardNo").val(),
					   userNo:$("#userNo").val()
					   },
			}).done(function(result){
				swal({
					title:"상세 수정 완료염",
					type: "success"
				},
				function(){
					window.open('/bit-finalT3/card/list.do','_parent').parent.close();
			})
		});
	})
	})

})
