/**
 * 
 */

	function clickLike(no) {	
		swal({
			title: "삭제하시겠습니까?",
			text: "보관함에 보관된 카드를 삭제하시겠습니까?",
	    	type: "warning",
	    	showCancelButton: true,
	    	cancelButtonText: "취소",
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
	    			title: "삭제 완료",
	    			text: "보관한 카드가 삭제되었습니다.",
	    			confirmButtonText: "확인",
	    			type: "success"	
	    		},
	    		function (isConfirm) {
	    			if(isConfirm) {
	    				$("#"+no).removeClass('heart2');
	    				location.href = "../favorite/favoriteList.do";
	    			}
	    		})
	    	})
	    });
	};
	
	function share(no) {
		
		var chk = $("input[type=radio]").is(":checked");
		if (chk) {
			var no = $("input[type=radio]:checked").val(); 
		}
		console.log(no);
		
		swal({
			title: "메일로 전송하시겠습니까??",
			showCancelButton: true,
			cancelButtonText: "취소",
			type: "info",
			confirmButtonText: "전송",
			closeOnConfirm: false
		},
		function(){
			$.ajax({
				url: "../favorite/favoriteSend.do",
				type: "post",
				dataType:"json",
				data: {"cardNo": no}
			}).done(function(result){
				console.log(result);
				if(result == "ok"){
					swal({
						title: "전송 완료",
						text: "메일이 전송되었습니다.",
						type: "success"	
					})
				}
			});
		});
	};