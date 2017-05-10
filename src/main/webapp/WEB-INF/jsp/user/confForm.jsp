<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<jsp:include  page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include>
<link href="${pageContext.request.contextPath}/css/user/user.css" rel="stylesheet" > 
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>
<script src="${pageContext.request.contextPath}/js/user/confForm.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/general2.css">
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
    <input type="text" class="mat-input" maxlength="4" placeholder="숫자만 입력하세요"  align="center" style="font-size: 50px" id="passNo" name="passNo">
  </div>
    <button style="text-align: center; margin: 50px 90px;" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" type="button" id="startBtn">coliy 시작하기</button>
</div>


	
	
	
<!-- 	jQuery(document).ready(function(){ -->
<!-- 			         jQuery("#passNo").numeric();   //이렇게 하면 영문은 입력안되고 숫자만 입력된다(단, 한글도 입력된다는거) -->
<!-- 			         jQuery("#passNo").css("ime-mode", "disabled");  //요렇게 하면 한글도 잡아준다 -->
<!-- 			   } -->
<!-- 			); -->



</body>
</html>