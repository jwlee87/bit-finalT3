<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<jsp:include  page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include>

<!-- javaScript  -->
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>
<script src="${pageContext.request.contextPath}/js/user/loginForm.js"></script>
<script src="${pageContext.request.contextPath}/js/user/goFindPsw.js"></script>
<!-- Custom CSS-->
<link href="${pageContext.request.contextPath}/css/user/user.css" rel="stylesheet" > 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body onload="getLogin()">
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="login-tab"><a class="active" href="#login-tab-content">Login</a></h3>
		</div><!--.tabs-->
		<div class="tabs-content">
			<div id="login-tab-content" class="active">
				<form name="loginForm" class="login-form" action="" method="post">
					<input type="text" class="input" id="userEmail" name="userEmail" placeholder="Email">
					<input type="password" class="input" id="userPsw" name="userPsw" placeholder="psw">
					<input type="checkbox" class="checkbox" id="remember_me" name="remember_me" onclick="confirmSave(this)">
					<label for="remember_me">Remember me</label>
					<input style="text-align: center;" type="button" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="loginBtn" value="Login">
				</form>
				<div class="help-text">
					<p><a href="javascript:goFindPassword();">Forget your password?</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	


</body>
</html>