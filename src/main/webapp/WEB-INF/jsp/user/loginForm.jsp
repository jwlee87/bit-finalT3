<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/sweetalert.min.js"></script>
<!-- Custom CSS-->
<link href="${pageContext.request.contextPath}/css/user/user.css" rel="stylesheet"> 
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
			<h3 class="login-tab"><a class="active" href="#login-tab-content">Login</a></h3>
		</div><!--.tabs-->

		<div class="tabs-content">
			<div id="login-tab-content" class="active">
				<form class="login-form" action="" method="post">
					<input type="text" class="input" id="userEmail" name="userEmail" placeholder="Email">
					<input type="password" class="input" id="userPsw" name="userPsw" placeholder="psw">
					<input type="checkbox" class="checkbox" id="remember_me">
					<label for="remember_me">Remember me</label>
					<input type="button" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="loginBtn" value="Login">
				</form>
				<div class="help-text">
					<p><a href="#">Forget your password?</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>

<script type="text/javascript">
	$("#loginBtn").click(function(){
		$.ajax({
			url : "/bit-finalT3/user/login.do",
			dataType : "json",
			type : "POST",
			data : {userEmail : $("#userEmail").val(),
					userPsw : $("#userPsw").val()}
		}).done(function(result){
			if(result.loginOk) {
				console.log(result.userNo);
				console.log(result.userEmail);
				console.log(result.userNickName);
				self.close();
				opener.location.href ="${pageContext.request.contextPath}/main/main.do";
			}else {
				   swal("로그인 실패", "회원정보가 올바르지 않습니다:)", "error");
			}
		})
	})
</script>



</body>
</html>