	function makeCommentList(result) {

		var html = "";
		html += '<table class="table table-hover table-bordered">';
		html += '	<colgroup>'; 
		html += '		<col width="7%">'; 
		html += '		<col width="*">'; 
		html += '		<col width="14%">'; 
		html += '		<col width="10%">'; 
		html += '	</colgroup>'; 
		  
		for (var i = 0; i < result.length; i++) {
			var comment = result[i];
			html += '<tr id="row' + comment.cardCommentNo + '">';
			html += '	<td>' + comment.userNickName + '</td>';
			html += '	<td>' + comment.cardCommentContent + '</td>';
			var date = new Date(comment.cardCommentRegDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '	<td>' + time + '</td>';  
			html += '	<td>';    
			html += '		<a href="javascript:commentUpdateForm(' + comment.cardCommentNo + ')" class="btn btn-success btn-sm" role="button">수정</a>';    
			html += '		<a href="javascript:commentDelete(' + comment.cardCommentNo + ')" class="btn btn-danger btn-sm" role="button">삭제</a>';    
			html += '	</td>';    
			html += '</tr>';
		}
		if (result.length == 0) {
			html += '<td colspan="4">댓글이 존재하지 않습니다.</td>';
		}
		$("#commentList").html(html);
	}
	
	// 댓글 목록 조회
	function commentList() {
		
//		var comNo = ${CommentVO.cardCommentNo}
		$.ajax({
			url: "commentList.do",
			data: {cardNo: $("#cardNo").val()},
			dataType: "json"
		})
		.done(makeCommentList);
	}
	
	// 상세 페이지 로딩시 댓글 목록 조회 ajax 호출
	commentList();
	



