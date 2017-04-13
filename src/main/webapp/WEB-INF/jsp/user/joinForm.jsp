<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include  page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include>
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>
<!-- Custom CSS-->
 <!-- Owl-Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/user.css"> 

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
					<button style="text-align: center; margin: 30px 95px;" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="btn" type="button"><span class="network-name">Next</span></button>
				</form><!--.login-form-->
				<div class="help-text">
					<p>By signing up, you agree to our</p>
					<p><a href="#">Terms of service</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	


</body>
</html>