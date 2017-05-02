<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include  page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include>
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>
<!-- Custom CSS-->
 <!-- Owl-Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/joinForm.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/general3.css"> 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

</head>
<body>
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="signup-tab"><a class="active" href="#signup-tab-content">회원가입</a></h3>
		</div><!--.tabs-->

		<div class="tabs-content login-form">
			<div id="signup-tab-content" class="active">
				<form name="joinForm" id="joinForm" class="signup-form">
					<input type="text" class="input" name="userEmail" id="email" placeholder="이메일을 입력하세요">
					<span id="emailResult"></span>
					<input type="text" class="input" name="userNickName" id="nickName" placeholder="별명을 입력하세요">
					<span id="nickNameResult"></span>
					<input type="password" class="input" name="userPsw" id="password" maxlength="17" placeholder="비밀번호를 입력하세요">
					<button style="text-align: center; margin: 45px 0px 0px 115px;" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="btn" type="button"><span class="network-name">다 음</span></button>
				</form><!--.login-form-->
				
			</div><!--.signup-tab-content-->

		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	


</body>
</html>