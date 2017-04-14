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
				   cardTitle:$("#title").val()
				
			},
		}).done(function(result){
			swal({
				title:"등록 완료염",
				type: "success"
			},
			function(){
				window.open('/bit-finalT3/card/list.do','_parent').parent.close();
//			opener.location.reload()
		})
	})
	})
});

//	 	$("#fileUpload").click(function () {
//	 		window.open("file.do", "", "width=700px; height=800px;" )
//	 	})


	/* $("").click(function(){
		if($("").val() == ""){
			return false;
		}
	}) */


