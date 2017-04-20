$(function(){

	$("#detailNone").css("display", "none")
	$("#detailNoneButton").css("display","none")
	// 상세 페이지 로딩시 댓글 목록 조회 ajax 호출
	
	/*카드 글 수정*/
$("#detailBolck").click(function () {
	// 	alert("글수정 입니다")
		$("#detailNone").css("display", "block")
		$("#detailBolck").css("display", "none")
		$("#detailNoneButton").css("display", "block")
		
		$("#detailNoneButton").click(function() {
		
			if($("#detailNone").val() == ""){
	// 		 	alert("글 내용을 입력하세욧")
	// 			return false;
				
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
})		
	


	
	
	
	// 댓글 목록 만드는 공통 함수
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
	

	
	// 댓글 등록 처리
	$("#reg").click(function () {
		$.ajax({
			url: "commentRegist.do",
			type: "POST",
			data: {
				cardNo: $('#cardNo').val(), 
				cardCommentContent: $("#rForm input[name=commentContent]").val() 
			},
			dataType: "json"
		})
		.done(function (result) {
			console.dir(result)
			$("#rForm input[name=commentContent]").val("");
			
			makeCommentList(result);
		});
		// 서브밋 이벤트 중지시킴
		
		return false;
	});
	




	function commentUpdateForm(cardCommentNo) {
		
		$("#commentList tr[id^=row]").show();
		$("#commentList tr[id^=modRow]").remove();
		
		var modId = $("#row" + cardCommentNo + " > td:eq(0)").text();
		var modContent = $("#row" + cardCommentNo + " > td:eq(1)").text();
		
		var html = '';
		html += '<tr id="modRow' + cardCommentNo + '">';
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
	}
	
	function commentUpdate(cardCommentNo) {
		$.ajax({
			url: "commentUpdate.do",
			type: "POST",
			data: {
				cardNo: $('#cardNo').val(), 
				CardCommentContent: $("#modRow" + cardCommentNo + " input[name=CardCommentContent]").val(), 
				cardCommentNo: cardCommentNo
			},
			dataType: "json"
		})
		.done(function (result) {
			makeCommentList(result);
		});
		
		function commentCancel(cardCommentNo) {
			$("#row" + cardCommentNo).show();
			$("#modRow" + cardCommentNo).remove();
		}
	}
	
	function commentDelete(cardCommentNo) {
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
	
