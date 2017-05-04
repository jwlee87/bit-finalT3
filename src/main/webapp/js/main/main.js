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
	
	
	var str=["AnyWhere .","AnyTime .","AnyPlace ."];
	var pos=0,a=0;
	var html="";
	  $(".headline h1").css("letterSpacing","0px");
	  function displayText(){
	  
	    //console.log("entered");
	    //$(".text-change").html(str[pos++]);  
	    if(pos>2)pos=0;
	    console.log(pos);
	    
	    console.log(str[pos].length);
	    
	        //console.log("entered loop")
	        if(a<str[pos].length)
	        {
	          html+=str[pos].charAt(a);
	          $(".text-change").html(html);
	          a++;
	        }
	    else {
	      a=0;
	      pos++;
	      html="";
	    }
	        //console.log("done"); 
	   }
	  
	setTimeout(setInterval(displayText,150),2000);

	  
	  $(".describe").hover(function(){
	   //mousenter
	$(this).addClass("hover"); 
	  },function(){
	   //mouseleave
	   $(this).removeClass("hover");
	  });
	
});


function printCardList (result) {
	
	var cardHtml = "<h4>스터디 게시판</h4>"; 
	cardHtml += "<table class='table table-hover table-bordered'>";
	cardHtml += "<colgroup>";
	cardHtml += "<col style='width:*' />";
	cardHtml += "<col style='width:30%' />";
	cardHtml += "<col style='width:25%' />";
	cardHtml += "</colgroup>";
	cardHtml += "<tr>";
	cardHtml += "<td>" + "내용" + "</td>";
	cardHtml += "<td>" + "글쓴이" + "</td>";
	cardHtml += "<td>" + "등록일자" + "</td>";
	cardHtml += "</tr>";
	
	if(result.length == 0) return false;

	for(var i = 0; i < result.length; i++) {
		var cardItem = result[i];
		cardHtml += "<tr>";
		cardHtml += "<td class='line'>" + cardItem.cardContent + "</td>";
		cardHtml += "<td>" + cardItem.userNickName + "</td>";
		cardHtml += "<td>" + cardItem.regDate + "</td>";
		cardHtml += "</tr>";
	}
	
	cardHtml += "</table>";
	cardHtml += '<a class="btn" href="/bit-finalT3/card/list.do" style="margin-left: 60%;">스터디 게시판 바로가기</a>';
	
	$("#cardList").html(cardHtml);
}

function printQuizList (result) {
	
	var quizHtml = "<h4>퀴즈 게시판</h4>";
	quizHtml += "<table class='table table-hover table-bordered'>";
	quizHtml += "<colgroup>";
	quizHtml += "<col style='width:45%' />";
	quizHtml += "<col style='width:30%' />";
	quizHtml += "<col style='width:25%' />";
	quizHtml += "</colgroup>";
	quizHtml += "<tr>";
	quizHtml += "<td>" + "내용" + "</td>";
	quizHtml += "<td>" + "글쓴이" + "</td>";
	quizHtml += "<td>" + "등록일자" + "</td>";
	quizHtml += "</tr>";
	
	if(result.length == 0) {
		
		return false;
	}
	
	for(var i = 0; i < result.length; i++) {
		var quizItem = result[i];
		
		quizHtml += "<tr>";
		quizHtml += "<td class='line'>" + quizItem.quizTitle + "</td>";
		quizHtml += "<td>" + quizItem.userNickName + "</td>";
		quizHtml += "<td>" + quizItem.regDate + "</td>";
		quizHtml += "</tr>";
	}
	
	quizHtml += "</table>";
	quizHtml += '<a class="btn" href="/bit-finalT3/quiz/list.do" style="margin-left: 60%;">퀴즈 게시판 바로가기</a>';
	
	$("#quizList").html(quizHtml);
		
}
