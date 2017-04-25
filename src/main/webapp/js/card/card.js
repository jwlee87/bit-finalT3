
// 1. load될때 ajax호출
// 2. 화면그려줌 (makePageList)

//$.ajax({
//	url:"/list.do",
//	dataType:"json",
//	method:"post",
//	data:{pageNo:2}
//}).done(makePageList)
	
	$(document).ready(function(){
		
		pageList(1);
		
		if($(".like").hasClass("heart")) {
			
		}
		
	});
	
	
	
	var lastScrollTop = 0;
    var easeEffect = 'easeInQuint';


	$("body").scroll(function(){
		var sh = $(window).scrollTop() + $(window).height();
		var dh = $(document).height();
		console.log(sh, dh);
		
		if (sh > dh - 10) {
			pageList(11);
		}
	});
	
	/* 좋아요 누를 때 이벤트 */
	function clickLike(no) {
	    $("#"+no).toggleClass('heart');
	    
	    if ($("#"+no).hasClass("heart")) {
		    $.ajax({
		    	url: "../favorite/favoriteInsert.do",
		    	data: {
		    		"cardNo" : no
		    	},
		    	dataType: "json",
		    	method: "post"
		    }).done(function(result){
		    	swal({
					title: "보관함 등록 완료",
					type: "success"	
				})
		    });
	    }
	    else {
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
	    			data: {
	    				"cardNo" : no
	    			},	
	    			dataType: "json"
	    		}).done(function(result){
	    			swal({
	    				title: "보관함 삭제 완료",
	    				type: "success"	
	    			})
	    		})
	    	});
	     }
	}
	
     
//
//	$(window).scroll(function(){ 
////	   if($(window).scrollTop() == $(document).height() - $(window).height()){ 
////		   pageList(1);
////	   } 
//		var height = $(document).scrollTop();
//		console.log(height);
//		
//	});


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
			html += '<div class="like" id="'+result.list[i].cardNo+'" onclick="clickLike('+result.list[i].cardNo+');">';
			html += '</div>';
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
		$(".detailF").colorbox({iframe:true, width:"800px", height:"880px"});
	}
	
	
	function makePageLink(data) {
		var html = "";
	
		if (data.count != 0) {
	
			var clz = "";
			if (data.prev == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			
			var fn = "";
			
			if (data.prev == true) {
				fn = "javascript:pageList(" + (data.beginPage - 1) + ");";
			}
			html += '<a href="' + fn + '" aria-label="Previous">';
			html += '<span aria-hidden="true">&laquo;</span>';
			html += '</a>';
		    html += '</li>';
	
		    for (var i = data.beginPage; i <= data.endPage; i++) {
		    	if (i == data.pageNo) {
				    html += '<li class="active"><a href="#1">' + i + '</a></li>';
		    	}
		    	else {
		    		html += '<li><a href="javascript:pageList(' + i + ');">' + i + '</a></li>';
		    	}
		    }
	
			clz = "";
			if (data.next == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			
			fn = "";
			
			if (data.next == true) {
				fn = "javascript:pageList(" + (data.endPage + 1) + ");";
			}
			html += '<a href="' + fn + '" aria-label="Next">';
			html += '<span aria-hidden="true">&raquo;</span>';
			html += '</a>';
		    html += '</li>';
		}
		
		$("nav > ul.pagination").html(html);
	}
	
