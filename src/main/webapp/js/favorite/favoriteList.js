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
	    });
	}