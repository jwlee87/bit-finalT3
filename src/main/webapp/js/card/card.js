	
	
	
	/* 좋아요 누를 때 이벤트 */
	
	function clickLike(no) {
	    if ($("#"+no).hasClass("heart2") || $("#"+no).hasClass("heart")) {
	    	swal({
	    		title: "",
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
	    			data: {
	    				"cardNo" : no
	    			},	
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
	    		    		$("#"+no).removeClass('heart');
	    				}
	    			})
	    		})
	    		
	    	});
	    }
	    else {
	    	$.ajax({
	        	url: "../favorite/favoriteInsert.do",
	        	data: {
	        		"cardNo" : no
	        	},
	        	dataType: "json",
	        	method: "post"
	        }).done(function(result){
	        	$("#"+no).toggleClass('heart');
	        	swal({
	    			title: "등록 완료",
	    			text: "보관함에 카드가 등록되었습니다.",
    				confirmButtonText: "확인",
	    			type: "success"	
	    		},
	    		function (isConfirm) {
	    			if(isConfirm) {
	    				location.href="list.do";
	    			}
	    		})
	        });
	    }
	}
	


	/* 페이징 */
	function pageList(pageNo) {
		if (pageNo === undefined ) {
			pageNo = 1;
		}
		
		$.ajax({
			url: "cardList.do",
			dataType:"json",
			method:"post",
			data: {pageNo:pageNo}
		})
		.done(makePageList);
	}

	function makePageList(result) {
		
		var html = $("#appendList").html();
		
		if (result.list.length == 0) {
			html += '<h3>카드를 등록해보세요!</h3>';
		}
		
		for (var i = 0; i < result.list.length; i++) {
			html += '<figure class="cardList">';
				
			if (result.list[i].likeChk == 1) {
				html += '<div class="like heart2" id="'+result.list[i].cardNo+'" onclick="clickLike('+result.list[i].cardNo+');">';
				html += '</div>';
			}
			else {
				html += '<div class="like" id="'+result.list[i].cardNo+'" onclick="clickLike('+result.list[i].cardNo+');">';
				html += '</div>';
			}
			
			html += '<div class="profile-image">';
			html += '<img src="'+result.list[i].userImgPath+'" />';
			html += '</div>';
			html += '<figcaption>';
			html += '<h5>'+result.list[i].userNickName+'</h5>';
			html += '<h3 title="'+result.list[i].cardContent+'"><a class="detailF" href="detail.do?cardNo='+result.list[i].cardNo+'">'+result.list[i].cardContent+'</a></h3>';
			html += '</figcaption>';
			html += '</figure>';
			
		}
		$("#appendList").html(html);
		$(".detailF").colorbox({iframe:true, width:"580px", height:"880px"});
	}

	$(document).ready(function(){
		
		pageList();
		
	});
	
//	$(function() {  
		//스크롤 이벤트 시작
		var lastScrollTop = 0;
		$(window).scroll(function(){	
		//top값
		var currentScrollTop = $(window).scrollTop();
//		console.log(currentScrollTop);
		if(currentScrollTop - lastScrollTop > 0) {
			if($(window).scrollTop()+1 >= ($(document).height() - $(window).height())) {
				var lastCardNo = $(".like:last").attr("id")
//				console.log("data" + lastCardNo);
				if(lastCardNo != "") {
					$.ajax({
						url : "cardScrollDown.do",
						type : "POST",
						dataType : "JSON",
						data : {"cardNo": lastCardNo
						},
					})
					.done(function(result){
						var html = "";
						for(var i = 0; i < result.length; i++){
							var list = result[i];
							html+= '<figure class="cardList">';
							
							if (list.likeChk == 1) {
								html += '<div class="like heart2" id="'+list.cardNo+'" onclick="clickLike('+list.cardNo+');">';
								html += '</div>';
							}
							else {
								html += '<div class="like" id="'+list.cardNo+'" onclick="clickLike('+list.cardNo+');">';
								html += '</div>';
							}
							html+= '<div class="profile-image">';
							html+= '<img src ="'+list.userImgPath+'">'; 		
							html+= '</div>';	
							html+= '<figcaption>';
							html+= '<h5>'+list.userNickName+'</h5>';
							html+= '<h3 title="'+list.cardContent+'"><a class="detailF" href="detail.do?cardNo='+list.cardNo+'">'+list.cardContent+'</a></h3>';
							html+= '</figcaption>';
							html+= '</figure>';
							
						}
//						if(result.length == 0) {
//							swal("", "마지막 데이터 입니다.", "info");
//							return false;
//						}
						$("#appendList").append(html);
						$(".detailF").colorbox({iframe:true, width:"580px", height:"880px"});
					})
				}
			}
		  }
		})
//	})
		
