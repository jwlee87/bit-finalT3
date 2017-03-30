<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/user.css"> 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증페이지</title>
</head>
<body>
<div onmouseover = "paperAnim();" onmouseout="paperAnimOut();" class="main-container">
  <div id="paper-container">
     <div class="lines-container">
		   <div class="line" id="line1"></div>
			 <div class="line" id="line2"></div>
			 <div class="line" id="line3"></div>
		</div>	
  </div>
  <div class="envelope-container">
    <div class="left-envelope-triangle">
    </div>
    <div class="right-envelope-triangle">
   
    </div> 
  </div>   
  
</div><br>
<div align="center"><h3>인증번호를 발송했습니다.<br>받으신 인증번호를 입력 해주세요.</h3>
</div>


<div class="wrap">
    <div class="mat-div">
    <label for="인증번호" class="mat-label">인증번호</label>
    <input type="text" class="mat-input" id="address">
  </div>
    <button>coliy 시작하기</button>
</div>

<script>
/*Derpin' around
*Mail icon with a hover animation
*/
alert("1");

function paperAnim(){
  var paper = document.getElementById("paper-container");
  paper.className = "move-up";
}
function paperAnimOut(){
  var paper = document.getElementById("paper-container");
  paper.className = "move-down";
}

$(".mat-input").focus(function(){
	  $(this).parent().addClass("is-active is-completed");
	});

	$(".mat-input").focusout(function(){
	  if($(this).val() === "")
	    $(this).parent().removeClass("is-completed");
	  $(this).parent().removeClass("is-active");
	})



</script>


</body>
</html>