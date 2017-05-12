$(document).ready(function() {
	
	$("#btn").click(function() {
		
		if($("#content").val() == ""){
			swal({
				title:"글을 입력하세요",
				type:"warning"
			})
			return false;
		}
			
		$.ajax({
			url: "write.do",
			type:"POST",
			dataType:"json",
			data: {cardContent:$("#content").val(),
				   userNo:$("#userNo").val()
			},
		}).done(function(result){
			swal({
				title:"등록 완료염",
				type: "success"
			},
			function(){
				window.open('/bit-finalT3/card/list.do','_parent').parent.close();
		})
	})
	})
	
	
	$("#attach").click(displayFile);
});

function displayFile () {
	
	if($("#displayFile").css("display") == "none") {
		$("#displayFile").css("display","block");
		return false;
	}
	
	if($("#displayFile").css("display") == "block")	{
		$("#displayFile").css("display", "none");
		return false;
	}
}