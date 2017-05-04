$(function(){

//	$("#detailNone").css("display", "none")
	$("#detailNoneButton").css("display","none")
	// 상세 페이지 로딩시 댓글 목록 조회 ajax 호출
	
	/*카드 글 수정*/
$("#divDetail").click(function () {
	
		if($("#userNo").val() != $("#loginUserNo").val()) {
			return false;
		}
		
	// 	alert("글수정 입니다")
		
		var html = '<textarea name="cardContent" id="detailNone">'+$("#content").val()+'</textarea>';
		$("#printDetail").html(html);
		
		$("#detailNoneButton").css("display", "block");
		
		$("#detailNoneButton").click(function() {
		
			if($("#detailNone").val() == ""){
	// 		 	alert("글 내용을 입력하세욧")
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
				},function(){
					window.open('/bit-finalT3/card/list.do','_parent').parent.close();
			})
		});
	})
	})
/*카드 글 수정*/	
	
	commentList();
	
	// 댓글 등록 처리
	$("#reg").click(function () {
		
		if($(".add-post-textarea").val() == ""){
			// 		 	alert("글 내용을 입력하세욧")
		 	 swal({
				title:"댓글을 입력해주세요",
				type:"warning"
			})
			return false;
		}
		
		$.ajax({
			url: "commentRegist.do",
			type: "POST",
			data: {
				cardNo: $('#cardNo').val(), 
				cardCommentContent: $(".add-post-textarea").val() 
			},
			dataType: "json"
		})
		.done(function (result) {
			console.dir(result)
			$("#commentContent").val("");
			
			makeCommentList(result);
		});
		// 서브밋 이벤트 중지시킴
		
		return false ;
	});
	
	
	
	
	//90
	$("#commentContent").keydown(function(e) {
		var len = $("#commentContent").val()
		if(len.length == 29) {
			$("#commentContent").val($("#commentContent").val() + '\n')
		}
		if(len.length == 59) {
			$("#commentContent").val($("#commentContent").val() + '\n')
		}
		if(len.length == 89) {
			$("#commentContent").val($("#commentContent").val() + '\n')
		}
	});
	
	
	
	
});
	
// 댓글 목록 만드는 공통 함수
function makeCommentList(result) {

	var html = "";
	  
	for (var i = 0; i < result.length; i++) {
		
		var comment = result[i];
		
//		html += '<ol class="posts' + comment.cardCommentNo + '">';
//		html += '	<li>' + comment.userNickName + '</li>';
//		html += '	<li>' + comment.cardCommentContent + '</li>';
		var date = new Date(comment.cardCommentRegDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + date.getHours() + ":"
		         + date.getMinutes() + ":"
		         + date.getSeconds();
		
//		html += '<li class="post">';
//		html += '';
		html += '<div class="post-content" id="postList' + comment.cardCommentNo + '">';
		html += '<a class="post-author-username"';
		html += '   href="">' + comment.userNickName + '</a>';
		
		html += '';
		html += '    <div class="post-body"><pre>' + comment.cardCommentContent + '</pre></div>';
		html += '';
		html += '	<ol class="post-actions">';
		html += '   		<li><a href="javascript:commentUpdateForm(' + comment.cardCommentNo + ', ' + comment.userNo + ')">수정</a></li>';
		html += '   		<li><a href="javascript:commentDelete(' + comment.cardCommentNo + ', ' + comment.userNo + ')">삭제</a></li>';
//		html += '   		<li>'+time+'</li>';
		html += '<span class="post-timedelta">'+time+'</span>';
		html += '   		<div class="clearfix"></div>';
		html += '    	</ol>';
		html += '	</div>';
		html += '</li>';
		
	}
	if (result.length == 0) {
		html += '댓글이 존재하지 않습니다.';
	}
	$("#commentList").html(html);
}
	
	// 댓글 목록 조회
	function commentList() {
		$.ajax({
			url: "commentList.do",
			data: {cardNo: $("#cardNo").val()},
			dataType: "json"
		})
		.done(makeCommentList);
	}

/*댓글 수정폼*/
	
	function commentUpdateForm(cardCommentNo, commentUserNo) {
//		alert("g")
//		if(commentUserNo != $("#loginUserNo").val()){
//			alert("수정은 자신것만 가능합니다")
//			return false;
//		}
	
		$("#commentList div[id^=postList]").show();
		$("#commentList div[id^=modPost]").remove();
		
		
		var modId = $("#postList" + cardCommentNo + " > a:eq(0)").text();
		var modDate = $("#postList" + cardCommentNo + " > span:eq(0)").text();
		var modContent = $("#postList" + cardCommentNo + " > div:eq(0)").text();
		
		var html = '';
//		html += '<ol class="modPost">                                                        ';
//		html += '                                                                         ';
		html += '<div class="post-content" id="modPost' + cardCommentNo + '">                                               ';
		html += '<a class="post-author-username"                                          ';
		html += '   href="">' + modId + '</a>                                                    ';
		html += '<span class="post-timedelta">'+ modDate +'</span>                                ';
		html += '                                                                         ';
		html += '    <div class="post-body">';
		html += '		 <textarea id="updateArea' + cardCommentNo + '" name="CardCommentContent" class="add-post-textarea">'+ modContent + '</textarea>';
		html += '    </div>';                                  
		html += '	<ol class="post-actions">                                             ';
		html += '   		<li><a href="javascript:commentUpdate(' + cardCommentNo + ')">수정</a></li> ';
		html += '   		<li><a href="javascript:commentCancel(' + cardCommentNo + ')">취소</a></li> ';
//		html += '   		<li>'+time+'</li>                                     ';
		html += '   		<div class="clearfix"></div>                                  ';
		html += '    	</ol>                                                             ';
		html += '	</div>                                                                ';
		html += '</li>   ';
		$("#postList" + cardCommentNo).after(html);	
		$("#postList" + cardCommentNo).hide();
	}
	
//새로운 댓글 수정폼
                                                 
	
	
	/*	html += '<tr id="modRow' + cardCommentNo + '">';
		html += '	<td>' + modId + '</td>';
		html += '	<td>';
		html += '		<div class="form-group">';
		html += '			<input type="text" name="CardCommentContent" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td colspan="2">'; 
		html += '		<a href="javascript:commentUpdate(' + cardCommentNo + ');" class="btn btn-success btn-sm" role="button">수정</a>';
		html += '		<a href="javascript:commentCancel(' + cardCommentNo + ');" class="btn btn-warning btn-sm" role="button">취소</a>';
		html += '	</td>';
		html += '</tr>';
		$("#row" + cardCommentNo).after(html);	
		$("#row" + cardCommentNo).hide();
	*/
	
	
	/*댓글 수정 하는중*/
	
	function commentUpdate(cardCommentNo) {
//		alert("dd")
//		alert($("#updateArea" + cardCommentNo).val())
		$.ajax({
			url: "commentUpdate.do",
			type: "POST",
			data: {
				cardNo: $('#cardNo').val(), 
				CardCommentContent: $("#updateArea" + cardCommentNo).val(), 
				cardCommentNo: cardCommentNo
			},
			dataType: "json"
		})
		.done(function (result) {
			makeCommentList(result);
		});
		
	}
	
	function commentCancel(cardCommentNo) {
		$(".posts" + cardCommentNo).show();
		$(".modPosts" + cardCommentNo).remove();
	}
	
/*댓글 수정폼*/
	
	
/*댓글 삭제*/	
	function commentDelete(cardCommentNo, commentUserNo) {
		if(commentUserNo != $("#loginUserNo").val()){
				//		     	commentUserNo
			alert("자신의 댓글만 삭제 가능합니다@")
			return false;
		}
		
		$.ajax({
			url: "commentDelete.do",
			data: {
				cardNo: $('#cardNo').val(), 
				cardCommentNo: cardCommentNo
			},
			dataType: "json"
		})
		.done(makeCommentList);	
	}

/*댓글 삭제*/	
