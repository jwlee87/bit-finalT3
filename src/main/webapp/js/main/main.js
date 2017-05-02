/**
 * 
*/

$(function(){
	// iframe resize
	function autoResize(i) {
	    var iframeHeight=
	    (i).contentWindow.document.body.scrollHeight;
	    (i).height=iframeHeight+20;
	}
	
	new WOW().init();
	
	
	$.ajax({
		url: "retrieveCard.do",
		dataType:"json",
		type:"POST"
		
	}).done(printCardList);
	
	$.ajax({
		url: "retrieveQuiz.do",
		dataType:"json",
		type:"POST"
		
	}).done(printQuizList);
	
});


function printCardList (result) {
	
	var cardHtml = ""; 
		cardHtml += "<colgroup>             ";
		cardHtml += "	<col width='40%'/>  ";
		cardHtml += "	<col width='30%'/>  ";
		cardHtml += "	<col width='30%'/>  ";
		cardHtml += "</colgroup>            ";
		
		cardHtml += "<tr>                   ";
		cardHtml += "	<th>내용</th>        ";
		cardHtml += "	<th>글쓴이</th>       ";
		cardHtml += "	<th>등록일자</th>     ";
		cardHtml += "</tr>                  ";
	
	if(result.length == 0) {
		
		return false;
	}
	
	
	for(var i = 0; i < result.length; i++) {
		var cardItem = result[i];
		cardHtml += "<tr>";
		cardHtml += "	<td>"+cardItem.cardContent+"</td>";
		cardHtml += "	<td>"+cardItem.userNickName+"</td>";
		cardHtml += "	<td>"+cardItem.cardRegDate+"</td>";
		cardHtml += "</tr>";
	}
	
	$("#cardList").html(cardHtml);
}

function printQuizList (result) {
	
	var quizHtml = "";
	quizHtml += "<colgroup>             ";
	quizHtml += "	<col width='40%'/>  ";
	quizHtml += "	<col width='30%'/>  ";
	quizHtml += "	<col width='30%'/>  ";
	quizHtml += "</colgroup>            ";
	
	quizHtml += "<tr>                   ";
	quizHtml += "	<th>내용</th>        ";
	quizHtml += "	<th>글쓴이</th>       ";
	quizHtml += "	<th>등록일자</th>     ";
	quizHtml += "</tr>                  ";
	
	if(result.length == 0) {
		
		return false;
	}
	
	for(var i = 0; i < result.length; i++) {
		var quizItem = result[i];
		
		quizHtml += "<tr>";
		quizHtml += "	<td>"+quizItem.quizTitle+"</td>";
		quizHtml += "	<td>"+quizItem.userNickName+"</td>";
		quizHtml += "	<td>"+quizItem.quizRegDate+"</td>";
		quizHtml += "</tr>";
	}
	
	$("#quizList").html(quizHtml);
		
}
