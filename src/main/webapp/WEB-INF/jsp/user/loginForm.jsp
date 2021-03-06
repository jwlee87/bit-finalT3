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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/general2.css">
<!-- Custom CSS-->
<link href="${pageContext.request.contextPath}/css/user/user.css" rel="stylesheet" > 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
input::-webkit-input-placeholder {
	color: #405467;
	font-size: 16px;
	opacity: 0.7; 
}
.sweet-alert p {
    color: #000000;
    font-size: 16px;
    text-align: center;
    font-weight: 600;
    position: relative;
    text-align: inherit;
    float: none;
    margin: 0;
    padding: 0;
    line-height: normal;
}
</style>

<title>coily 로그인</title>
</head>
<body onload="getLogin()">
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="login-tab"><a class="active" href="#login-tab-content">로그인</a></h3>
		</div><!--.tabs-->
		<div class="tabs-content">
			<div id="login-tab-content" class="active">
				<form name="loginForm" class="login-form" action="" method="post">
					<input type="text" class="input" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요">
					<input type="password" class="input" id="userPsw" name="userPsw" placeholder="비밀번호를 입력하세요">
					<input type="checkbox" class="checkbox" id="remember_me" name="remember_me" onclick="confirmSave(this)">
					<label for="remember_me">사용자 정보 기억</label>
					<input style="text-align: center;" type="button" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="loginBtn" value="로그인">
				</form>
				<div class="help-text">
					<p><a href="javascript:goFindPassword();">비밀번호를 잊어버리셨나요?</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	


</body>
</html>