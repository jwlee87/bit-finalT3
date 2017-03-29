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

