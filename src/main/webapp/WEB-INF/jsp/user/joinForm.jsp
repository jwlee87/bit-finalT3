<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/jquery.magnific-popup.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Custom CSS-->
	
	 <!-- Owl-Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/user.css"> 
    <link href="${pageContext.request.contextPath}/css/comm/general.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/comm/custom.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/comm/owl.theme.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/animate.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/sweetalert.css" rel="stylesheet">



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">
</script>

</head>
<body>
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="signup-tab"><a class="active" href="#signup-tab-content">Sign Up</a></h3>
		</div><!--.tabs-->

		<div class="tabs-content">
			<div id="signup-tab-content" class="active">
				<form name="joinForm" id="joinForm" class="signup-form">
					<input type="text" class="input" name="userEmail" id="email" placeholder="Email">
					<span id="emailResult"></span>
					<input type="text" class="input" name="userNickName" id="nickName" placeholder="nickName">
					<span id="nickNameResult"></span>
					<input type="password" class="input" name="userPsw" id="password" placeholder="Password">
					<button class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="btn" type="button"><span class="network-name">Next</span></button>
				</form><!--.login-form-->
				<div class="help-text">
					<p>By signing up, you agree to our</p>
					<p><a href="#">Terms of service</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>

</body>
</html>