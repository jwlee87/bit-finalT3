<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/user.css"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">
</script>

</head>
<body>
	<div id="nextPage"></div>
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="signup-tab"><a class="active" href="#signup-tab-content">Sign Up</a></h3>
			<h3 class="login-tab"><a href="#login-tab-content">Login</a></h3>
		</div><!--.tabs-->

		<div class="tabs-content">
			<div id="signup-tab-content" class="active">
				<form name="joinForm" id="joinForm" class="signup-form" action="" method="post">
					<input type="text" class="input" name="email" id="email" placeholder="Email">
					<span id="emailResult"></span>
					<input type="text" class="input" name="nickName" id="nickName" placeholder="nickName">
					<span id="nickNameResult"></span>
					<input type="password" class="input" name="password" id="password" placeholder="Password">
					<button class="button" name="btn" id="btn" >Next</button>
				</form><!--.login-form-->
				<div class="help-text">
					<p>By signing up, you agree to our</p>
					<p><a href="#">Terms of service</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

			<div id="login-tab-content">
				<form class="login-form" action="" method="post">
					<input type="text" class="input" id="user_login" placeholder="Email or Username">
					<input type="password" class="input" id="password1" placeholder="Password">
					<input type="checkbox" class="checkbox" id="remember_me">
					<label for="remember_me">Remember me</label>
					<input type="submit" class="button" value="Login">
				</form><!--.login-form-->
				<div class="help-text">
					<p><a href="#">Forget your password?</a></p>
				</div><!--.help-text-->
			</div><!--.login-tab-content-->
		</div><!--.tabs-content-->
	</div><!--.form-wrap-->

<script type="text/javascript">
	tab = $('.tabs h3 a');
	
	tab.on('click', function(event) {
		event.preventDefault();
		tab.removeClass('active');
		$(this).addClass('active');
	
		tab_content = $(this).attr('href');
		$('div[id$="tab-content"]').removeClass('active');
		$(tab_content).addClass('active');
	});

	/* jQuery(document).ready(function($) {
		
		alert("!!!!!")
		console.log("ready");		
		
		tab = $('.tabs h3 a');

		tab.on('click', function(event) {
			event.preventDefault();
			tab.removeClass('active');
			$(this).addClass('active');

			tab_content = $(this).attr('href');
			$('div[id$="tab-content"]').removeClass('active');
			$(tab_content).addClass('active');
		});
	}); */
	
	 $("#email").on("keyup", function(){
		var jf = document.joinForm;
		console.log("찍히나");
		$.ajax({
			url : "/bit-finalT3/user/emailCheck.do",
			type : "POST",
			data : {email : $("input[name=email]").val()},
			dataType : "json"
		}).done(function (result){
			if(result.emailChk) {
				$("#emailResult").css("color", "red").html("사용 불가능한 이메일 입니다.");
// 				$("#btn").css("background", "tomato").attr("disabled", true); 
			} else {
				$("#emailResult").css("color", "green").html("사용가능한 이메일 입니다.");
// 				$("#btn").css("background", "#93E1D8").attr("disabled", false);
			}			
		})
	}) 
	

	$("#nickName").on("keyup", function() {
		$.ajax({
			url : "/bit-finalT3/user/nickNameCheck.do",
			type : "POST",
			data : {nickName : $("input[name=nickName]").val()},
			dataType : "json"
		}).done(function(result){
			if(result.nickNameChk) {
				$("#nickNameResult").css("color", "red").html("사용 불가능한 별명입니다.");
				$("#nickName").attr("id", "reNickName");
// 				$("#btn").css("background", "tomato"); 
				/* 
				 if(document.joinForm.submit()) {
					console.log("오냐오냐");
					return false;
				}  */
			} else {
				$("#nickNameResult").css("color", "green").html("사용가능한 별명입니다.");
				$("#reNickName").attr("id", "nickName");
// 				$("#btn").css("background", "#93E1D8");
			}
		})
	})
	
	 
	
	
/* 	$("#passwordCheck").on("keyup", function(){
		var user = $("#joinForm").serialize();
		
		$.ajax({
			url : "/test/user/pswCheck.do",
			type : "POST",
			data : user,
			dataType : "json"
		}).done(function (result){
			if(result.pswChk) {
				$("#pswCheck").css("color", "red").html("비밀번호가 일치하지 않습니다.");
				return false;
			}else {
				$("#pswCheck").css("color", "green").html("비밀번호가 일치합니다.");
				$("#btn").attr("disabled", false);
			}
		})
	}) */
	
	
// 	$(document).ready(function(){
		$("#btn").on("click", function () {
			
			var jf = document.joinForm;
			
			if(jf.email.value == "") {
				alert("메일을 입력하세요");
				jf.email.focus();
				return false;
			}
			
			if($("#reNickName").val() != null) {
				alert("사용 불가능한 별명입니다.");
				jf.nickName.focus();
				return false;
			}
			
			if(jf.nickName.value == "") {
				alert("별명을 입력하세요");
				jf.nickName.focus();
				return false;
			}
			
			if(jf.password.value == "") {
				alert("비밀번호를 입력하세요");
				jf.password.focus();
				return false;
			}
			
		/* 	if(jf.passwordCheck.value == "") {
				alert("비밀번호를 확인해주세요");
				jf.passwordCheck.focus();
				return false;
			}
			
			if(jf.passwordCheck.value != jf.password.value) {
				alert("비밀번호를 제대로 입력해주세요");
				jf.passwordCheck.focus();
				return false;
			} */
		
		
		
			var user = $("#joinForm").serialize();
			console.log("ddsd" + user);
		
			$.ajax({
				url : "/bit-finalT3/user/join.do",
				type : "POST",
				data : user,
				dataType : "json"
			}).done(function (result){
				goPage(result);
				
				/* location.href="${pageContext.request.contextPath}/user/confForm.do"	 */	
	// 			location.href="${pageContext.request.contextPath}/jsp/member/confForm.jsp"
			})
			
		})

// 		})
		
	 function goPage(result){
		 console.log("여와라");
// 		 alert("오나");
// 		 location.href="${pageContext.request.contextPath}/user/confForm.do";
		 location.href="confForm.do";
	 }
		
		
	</script>

</body>
</html>