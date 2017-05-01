/**
 * 
 */

	function clickLike(no) {	
		swal({
			title: "보관함에서 삭제하시겠습니까?",
	    	type: "warning",
	    	showCancelButton: true,
	    	confirmButtonColor: "#DD6B55",
	    	confirmButtonText: "삭제",
	    	closeOnConfirm: false
	    	},
	    function(){
	    	$.ajax ({
	    		url: "../favorite/favoriteDelete.do",
	    		type: "POST",
	    		data: {"cardNo" : no},	
	    		dataType: "json"
	    	}).done(function(result){
	    		swal({
	    			title: "보관함 삭제 완료",
	    			type: "success"	
	    		})
	    	})
	    	$("#"+no).removeClass('heart2');
	    	location.href = "../favorite/favoriteList.do";
	    });
	};
	
	function share(no) {
		
		var chk = $("input[type=radio]").is(":checked");
		if (chk) {
			var no = $("input[type=radio]:checked").val(); 
		}
		console.log(no);
		
		$.ajax({
			url: "../favorite/favoriteSend.do",
			type: "post",
			dataType:"json",
			data: {"cardNo": no}
		}).done(function(result){
			console.log(result);
			if(result == "ok"){
				swal({
					title: "메일 전송 완료",
					type: "success"	
				})
			}
		});
	};