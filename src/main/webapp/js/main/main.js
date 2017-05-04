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
	
	
	var str=[" Saurish Kar . "," a Web Developer ."," an Anime Freak !"];
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
	
	var cardHtml = "<center><h4>스터디 게시판</h4></center>"; 
	cardHtml += "<p>";
	cardHtml += " 내용";
	cardHtml += " 글쓴이";
	cardHtml += " 등록일자";
	cardHtml += "</p>";
	
	if(result.length == 0) return false;

	for(var i = 0; i < result.length; i++) {
		var cardItem = result[i];
		cardHtml += "<p>";
		cardHtml += " " + cardItem.cardContent;
		cardHtml += " " + cardItem.userNickName;
		cardHtml += " " + cardItem.cardRegDate;
		cardHtml += "</p>";
	}
	
	$("#cardList").html(cardHtml);
}

function printQuizList (result) {
	
	var quizHtml = "<h4>퀴즈 게시판</h4>";
	quizHtml += "<p>";
	quizHtml += "	내용";
	quizHtml += "	글쓴이";
	quizHtml += "	등록일자";
	quizHtml += "</p>";
	
	if(result.length == 0) {
		
		return false;
	}
	
	for(var i = 0; i < result.length; i++) {
		var quizItem = result[i];
		
		quizHtml += "<p>";
		quizHtml += " " + quizItem.quizTitle;
		quizHtml += " " + quizItem.userNickName;
		quizHtml += " " + quizItem.quizRegDate;
		quizHtml += "</p>";
	}
	
	$("#quizList").html(quizHtml);
		
}
