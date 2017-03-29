function makePageList(result) {
	$("#count").text(result.pageResult.count);
	
	var html = "";
	
	for (var i = 0; i < result.list.length; i++) {
		var board = result.list[i];
	
		html += '<tr>';
		html += '	<td>' + card.cardNo + '</td>';
		html += '	<td><a href="javascript:detail('+card.cardNo+');">' + card.content + '</a></td>';
//		html += '	<td>' + card.content + '</td>';
		html += '	<td>' + card.userNo + '</td>';
		
		var date = new Date(card.regDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + date.getHours() + ":"
		         + date.getMinutes() + ":"
		         + date.getSeconds();
		html += '<td>' + time + '</td>';  
		html += '</tr>';
		
	}
	
	if (!result.list.length) {
		html += '<tr><td colspan="4">게시물이 존재하지 않습니다.</td></tr>';
	}
	
	$("#pageTable").jsp(jsp);
	
	makePageLink(result.pageResult);
}


function makePageLink(data) {
	var html = "";
	/*
	<ul class="pagination">


	</ul>
	*/
	if (data.count != 0) {
		
		/*
		<li class="disabled">
			<a href="" aria-label="Previous">
		<span aria-hidden="true">«</span>
			</a>
		</li>
		*/
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
/*		<li class="active">
			<a href="#1">1</a>
		</li>
*/		
	    for (var i = data.beginPage; i <= data.endPage; i++) {
	    	if (i == data.pageNo) {
			    html += '<li class="active"><a href="#1">' + i + '</a></li>';
	    	}
	    	else {
	    		html += '<li><a href="javascript:pageList(' + i + ');">' + i + '</a></li>';
	    	}
	    }
/*		<li class="disabled">
		<a href="" aria-label="Next">
			<span aria-hidden="true">»</span>
		</a>
		</li>
*/
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

function pageList(pageNo) {
	if (pageNo === undefined) {
		pageNo = 1;
	}
	$.ajax({
		url: "/b90m2t2/board/list.do",
		dataType: "json",
		data: {pageNo:pageNo}
	})
	.done(makePageList);
}
  
function reviewBoard() {
	console.log("하핳")
	$("div#content").load(path+"board/list.html");
	pageList();
}
