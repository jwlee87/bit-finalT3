	
	
	
	/* 좋아요 누를 때 이벤트 */
	
	function clickLike(no) {
	    if ($("#"+no).hasClass("heart2") || $("#"+no).hasClass("heart")) {
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
	
     
//
//	$(window).scroll(function(){ 
////	   if($(window).scrollTop() == $(document).height() - $(window).height()){ 
////		   pageList(1);
////	   } 
//		var height = $(document).scrollTop();
//		console.log(height);
//		
//	});


//	/* 페이징 */
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
//	
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
//	
//	
//	function makePageLink(data) {
//		var html = "";
//	
//		if (data.count != 0) {
//	
//			var clz = "";
//			if (data.prev == false) {
//				clz = "disabled";
//			}
//			html += '<li class="' + clz + '">';
//			
//			var fn = "";
//			
//			if (data.prev == true) {
//				fn = "javascript:pageList(" + (data.beginPage - 1) + ");";
//			}
//			html += '<a href="' + fn + '" aria-label="Previous">';
//			html += '<span aria-hidden="true">&laquo;</span>';
//			html += '</a>';
//		    html += '</li>';
//	
//		    for (var i = data.beginPage; i <= data.endPage; i++) {
//		    	if (i == data.pageNo) {
//				    html += '<li class="active"><a href="#1">' + i + '</a></li>';
//		    	}
//		    	else {
//		    		html += '<li><a href="javascript:pageList(' + i + ');">' + i + '</a></li>';
//		    	}
//		    }
//	
//			clz = "";
//			if (data.next == false) {
//				clz = "disabled";
//			}
//			html += '<li class="' + clz + '">';
//			
//			fn = "";
//			
//			if (data.next == true) {
//				fn = "javascript:pageList(" + (data.endPage + 1) + ");";
//			}
//			html += '<a href="' + fn + '" aria-label="Next">';
//			html += '<span aria-hidden="true">&raquo;</span>';
//			html += '</a>';
//		    html += '</li>';
//		}
//		
//		$("nav > ul.pagination").html(html);
//	}
//	
//	
	$(document).ready(function(){
		
		pageList(1);
		
	});
//
//	/*========================================================================*/
		
	
//	$(function() {  
		//스크롤 이벤트 시작
//		alert(1)
		var lastScrollTop = 0;
		$(window).scroll(function(){	
		//top값
		var currentScrollTop = $(window).scrollTop();
		console.log(currentScrollTop)
		if(currentScrollTop - lastScrollTop > 0) {
			if($(window).scrollTop()+1 >= ($(document).height() - $(window).height())) {
				var lastCardNo = $(".like:last").attr("id")
				console.log("data" + lastCardNo)
				if(lastCardNo != "") {
					$.ajax({
						url : "cardScrollDown.do",
						type : "POST",
						dataType : "JSON",
						data : {"cardNo": lastCardNo
						},
					})
					.done(function(result){
//						alert(1)
						var html = "";
						for(var i = 0; i < result.length; i++){
							var list = result[i];
							
							html+='	<figure class="cardList">                                         ';
							html+='		<div class="like" id="' + list.cardNo + '" onclick="clickLike(' + list.cardNo + ');"></div>';
							html+='		<div class="profile-image">'
							html+='		<img src ="' + list.userImgPath + '">' 		
							html+='		</div>'	
							html+='    	<figcaption>                                                             ';
							html+='     <h5>' + list.userNickName + '</h5>';
							html+='     <h3 title="' + list.cardContent + '">';
							html+='		<a class="detailF cboxElement" herf="detail.do?cardNo=' + list.cardNo + '">' + list.cardContent		
							html+='		</a>'
							html+='		</h3>'
							html+='	  	</figcaption>                                                            ';
							html+='	</figure>                                                                    ';
							
						}
						if(result.length == 0) {
							swal("마지막 데이터 입니다.", "", "info")
							return false;
						}
						$("#appendList").append(html)
						
//						//중복되는거....
//						$("textarea").css("display", "none")
//						$("[name=updateCon]").css("display", "none")
//						$("[name=cancel]").css("display", "none")
//						
//						$("#container-main").find("img").each(function(){
//							var imgCh= $(this).attr("src")
//							if($(this).attr("src").indexOf("http") == -1) {
//								if(imgCh.indexOf("png") == -1) {
//									$(this).attr("src", "http://euler.synap.co.kr" + imgCh)
//								} else if(imgCh.indexOf("gif") == -1) {
//									$(this).attr("src", "http://algospot.com" + imgCh)
//								}
//							}
//						})
					})
				}
			}
		  }
		})
//	})
		
		//스크롤 이벤트 종료
	/*========================================================================*/
