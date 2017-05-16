/**
 * 
 */

	function clickLike(no) {	
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
			title: "",
			text: "메일로 전송하시겠습니까?",
			showCancelButton: true,
			cancelButtonText: "취소",
			type: "info",
			confirmButtonText: "전송",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		},
		function(){
			$.ajax({
				url: "../favorite/favoriteSend.do",
				type: "post",
				dataType:"json",
				data: {"cardNo": no}
			}).done(function(result){
				if(result == "ok"){
					swal( "전송 완료","메일이 전송되었습니다.","success");
				}
			});
		});
	};
	
	$(function(){
		//스크롤 이벤트 시작
		var lastScrollTop = 0;
		$(window).scroll(function(){	
		//top값
		var currentScrollTop = $(window).scrollTop();
		if(currentScrollTop - lastScrollTop > 0) {
			if($(window).scrollTop()+1 >= ($(document).height() - $(window).height())) {
				var lastFavoriteNo = $(".profile-image input:last").val();
				if(lastFavoriteNo != "") {
					$.ajax({
						url : "favoriteScroll.do",
						type : "POST",
						dataType : "JSON",
						data : {"favoriteNo": lastFavoriteNo},
						async : false
					})
					.done(function(result){
						var html = "";
						for(var i = 0; i < result.length; i++){
							var list = result[i];
							html+= '<figure class="cardList">';
							html+= '<div class="custom-radio">';
							html+= '<input type="radio" name="sendCard" id="radio'+list.cardNo+'" value="'+list.cardNo+'"/>';
							html+= '<label for="radio'+list.cardNo+'"><span></span></label>';
							html+= '</div>';
							html+= '<div class="like heart2" id="'+list.cardNo+'" onclick="clickLike('+list.cardNo+');">';
							html+= '</div>';
							html+= '<div class="profile-image">';
							html+= '<img src ="'+list.userImgPath+'">'; 		
							html+= '<input type="hidden" value="'+list.favoriteNo+'">';
							html+= '</div>';	
							html+= '<figcaption>';
							html+= '<h5>'+list.userNickName+'</h5>';
							html+= '<h3 title="'+list.cardContent+'"><a class="detailF" href="detail.do?cardNo='+list.cardNo+'">'+list.cardContent+'</a></h3>';
							html+= '<h6 style="float: right; font-weight: bold; color: #4a90be; ">from.'+list.groupHeaderName+'</h6>';
							html+= '</figcaption>';
							html+= '</figure>';
							
						}
						if(result.length == 0) {
							swal("", "마지막 데이터 입니다.", "info");
							return false;
						}
						$("#cardPage").append(html);
						$(".detailF").colorbox({iframe:true, width:"580px", height:"880px"});
					})
				}
			}
		  }
		})
	
	});