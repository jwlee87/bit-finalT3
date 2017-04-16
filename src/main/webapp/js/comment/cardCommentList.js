function makeCommentList(result) {
	$("#count").text(result.pageResult.count);
	
	console.log(result);
	
	var html = "";
	
	for (var i = 0; i < result.list.length; i++) {
		var board = result.commentList[i];
	
		html += '<tr>';
		html += '	<td>' + comment.cardCommentNo + '</td>';
		html += '	<td><a href="javascript:detail('+comment.cardCommentNo+');">' + coment.title + '</a></td>';
		html += '	<td>' + comment.cardCommentContent + '</td>';
		html += '	<td>' + comment.cardCommentUserNo + '</td>';
		
		var date = new Date(comment.cardCommentRegDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + date.getHours() + ":"
		         + date.getMinutes() + ":"
		         + date.getSeconds();
		html += '<td>' + time + '</td>';  
		html += '</tr>';
		
	}
	
	if (!result.commentList.length) {
		html += '<tr><td colspan="4">게시물이 존재하지 않습니다.</td></tr>';
	}
	
	$("#pageTable").html(html);
	
	makeCommentLink(result.pageResult);
}

function makeCommentLink(comm) {
	var html = "";
	if (comm.count != 0) {
		var clz = "";
		if (comm.prev == false) {
			clz = "disabled";
		}
		html += '<li class="' + clz + '">';
		
		var fn = "";
		
		if (comm.prev == true) {
			fn = "javascript:commentList(" + (comm.beginPage - 1) + ");";
		}
		html += '<a href="' + fn + '" aria-label="Previous">';
		html += '<span aria-hidden="true">&laquo;</span>';
		html += '</a>';
	    html += '</li>';
		
	    for (var i = comm.beginPage; i <= comm.endPage; i++) {
	    	if (i == comm.pageNo) {
			    html += '<li class="active"><a href="#1">' + i + '</a></li>';
	    	}
	    	else {
	    		html += '<li><a href="javascript:commentList(' + i + ');">' + i + '</a></li>';
	    	}
	    }
	    
		clz = "";
		if (comm.next == false) {
			clz = "disabled";
		}
		html += '<li class="' + clz + '">';
		
		fn = "";
		
		if (comm.next == true) {
			fn = "javascript:commentList(" + (comm.endPage + 1) + ");";
		}
		html += '<a href="' + fn + '" aria-label="Next">';
		html += '<span aria-hidden="true">&raquo;</span>';
		html += '</a>';
	    html += '</li>';
	}
	
	$("nav > ul.pagination").html(html);
}

function commentList(pageNo) {
	console.log(result);
	 
	if (pageNo === undefined) {
		pageNo = 1;
	}
	$.ajax({
		url: "/bit-finalT3/comment/commentList.do",
		dataType: "json",
		data: {pageNo:pageNo
}
	})
	.done(makeCommentList);
}
  
/*function reviewComment() {
	$("div#content").load("commentList.html");
	commentList();
}*/