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
				<form name="joinForm" id="joinForm" class="signup-form">
					<input type="text" class="input" name="userEmail" id="email" placeholder="Email">
					<span id="emailResult"></span>
					<input type="text" class="input" name="userNickName" id="nickName" placeholder="nickName">
					<span id="nickNameResult"></span>
					<input type="password" class="input" name="userPsw" id="password" placeholder="Password">
					<button class="button" id="btn" type="button">Next</button>
				</form><!--.login-form-->
				<div class="help-text">
					<p>By signing up, you agree to our</p>
					<p><a href="#">Terms of service</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

			<div id="login-tab-content">
				<!-- <form class="login-form" action="" method="post">
					<input type="text" class="input" id="user_login" placeholder="Email or Username">
					<input type="password" class="input" id="password1" placeholder="Password">
					<input type="checkbox" class="checkbox" id="remember_me">
					<label for="remember_me">Remember me</label>
					<input type="button" class="button" value="Login">
				</form>.login-form -->
				<div class="help-text">
					<p><a href="#">Forget your password?</a></p>
				</div><!--.help-text-->
			</div><!--.login-tab-content-->
		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>

</body>
</html>